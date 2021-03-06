//to include library
#include <Adafruit_NeoPixel.h>
//how many pixels in strip and what pin
Adafruit_NeoPixel strip(60,9);

String inMessage;

int q;

int isHunting = 0;
int isSearching = 0;
int isDocile = 0;
int isVibing = 0;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);

strip.begin();
strip.setBrightness(20);
strip.clear();
strip.show();
}

void loop() {
  // put your main code here, to run repeatedly:

//strip.setPixelColor(0,147,198,174);
//strip.show();

sendData();

recieve();
rainbow();
}

//recieve function
void recieve(){
  char startChar = '?';
  char endChar = '!';

//check serial port for anything
  if(Serial.available() > 0){
    char currentChar = Serial.read();

//if char read is same as start 
    //Serial.println(currentChar); //testing
    if(currentChar == startChar){
      inMessage = Serial.readStringUntil(endChar);

//if message not equal to null string
    if(inMessage != "\0"){
      //Serial.println(inMessage);
      parseMessage();
      //inMessage = "\0";
    } 
    //Serial.println(inMessage);
  }
 }
}

void parseMessage(){
  //int commaIndex = inMessage.indexOf(',');
  q = inMessage.toInt();
  //.substring(0, commaIndex).toInt();
Serial.println(q);
}

void rainbow(){
 if(q == 1){
for(int i = 0; i < strip.numPixels(); i++){
    strip.setPixelColor(i,255,0,0);
  }
  isHunting = 1;
  isSearching = 0;
  isDocile = 0;
  isVibing = 0;
  strip.show();
  }

 if(q == 2){
for(int i = 0; i < strip.numPixels(); i++){
    strip.setPixelColor(i,255,255,0);
  }
  isHunting = 0;
  isSearching = 1;
  isDocile = 0;
  isVibing = 0;
  strip.show();
  }

 if(q == 3){
for(int i = 0; i < strip.numPixels(); i++){
    strip.setPixelColor(i,0,255,0);
  }
  isHunting = 0;
  isSearching = 0;
  isDocile = 1;
  isVibing = 0;
  strip.show();
  }

 if(q == 4){
for(int i = 0; i < strip.numPixels(); i++){
    strip.setPixelColor(i,0,0,0);
  }
  isHunting = 0;
  isSearching = 0;
  isDocile = 0;
  isVibing = 1;
  strip.show();
  }

}


void sendData(){
//turn vars into strings to be sent over
String hunt = String(isHunting);
String sear = String(isSearching);
String doci = String(isDocile);
String vibe = String(isVibing);

//stupid translations?
Serial.print("<");
Serial.print(hunt);
Serial.print(",");
Serial.print(sear);
Serial.print(",");
Serial.print(doci);
Serial.print(",");
Serial.print(vibe);
Serial.print(">");

}
