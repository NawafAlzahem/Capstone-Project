#include <WaspWIFI_PRO.h>

char ESSID[] = "Robby_1";
char PASSW[] = "nawaf123";

//char ESSID[] = "Students";
//char PASSW[] = "#UG2023";

//char ESSID[] = "D222";
//char PASSW[] = "$$123789$$";

uint8_t socket = SOCKET0;
uint8_t error;
uint8_t status;
unsigned long previous;

void setup(){
  USB.println(F("Start program"));  

  // 1. Switch ON the WiFi module
  error = WIFI_PRO.ON(socket);

  if (error == 0){    
    USB.println(F("1. WiFi switched ON"));
  }else{
    USB.println(F("1. WiFi did not initialize correctly"));
  }

  // 2. Reset to default values
  error = WIFI_PRO.resetValues();

  if (error == 0){    
    USB.println(F("2. WiFi reset to default"));
  }else{
    USB.println(F("2. WiFi reset to default ERROR"));
  }

  // 3. Set ESSID
  error = WIFI_PRO.setESSID(ESSID);

  if (error == 0){    
    USB.println(F("3. WiFi set ESSID OK"));
  }else{
    USB.println(F("3. WiFi set ESSID ERROR"));
  }

  // 4. Set password key (It takes a while to generate the key)
  // Authentication modes:
  //    OPEN: no security
  //    WEP64: WEP 64
  //    WEP128: WEP 128
  //    WPA: WPA-PSK with TKIP encryption
  //    WPA2: WPA2-PSK with TKIP or AES encryption
  //////////////////////////////////////////////////
  //error = WIFI_PRO.setPassword(WPA2, PASSW);
  error = WIFI_PRO.setPassword(WPA2, PASSW);
  if (error == 0){    
    USB.println(F("4. WiFi set AUTHKEY OK"));
  }else{
  USB.println(F("4. WiFi set AUTHKEY ERROR"));
  }

  // 5. Software Reset 
  // Parameters take effect following either a 
  // hardware or software reset
  error = WIFI_PRO.softReset();

  if (error == 0){    
    USB.println(F("5. WiFi softReset OK"));
  }else{
    USB.println(F("5. WiFi softReset ERROR"));
  }

  USB.println(F("*******************************************"));
  USB.println(F("Once the module is configured with ESSID"));
  USB.println(F("and PASSWORD, the module will attempt to "));
  USB.println(F("join the specified Access Point on power up"));
  USB.println(F("*******************************************\n"));

  error = WIFI_PRO.setTimeServer("time.google.com");
  if (error == 0){    
    USB.println(F("time set succesfully"));
  }else{
    USB.println(F("Time setting ERROR"));
  }  

  
  previous = millis();
}

void loop(){ 
  if (WIFI_PRO.isConnected() == true){    
    USB.print(F("WiFi is connected OK"));
    USB.print(F(" Time(ms):"));    
    USB.println(millis()-previous); 

    USB.println(F("\n*** Program stops ***"));
    while(1){
      
    }
  }else{
    USB.print(F("WiFi is connected ERROR")); 
    USB.print(F(" Time(ms):"));    
    USB.println(millis()-previous);  
  }
}


