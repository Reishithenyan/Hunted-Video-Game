ReadyPlayerOne go;
ReadyEnemy sit;

import processing.serial.*;
//port object
String portName = "COM3";
Serial port = new Serial(this, portName, 9600);

//first contact stuff
boolean firstContact = false;

String message = "10,20,30,40>";

int val1;
int val2;
int val3;
int val4;
//boolean boomer = false;

void setup(){
  size(800,600);
  go = new ReadyPlayerOne(width/2,height/2 - 20, 40, color(random(0,255),random(0,255),random(0,255)));
  sit = new ReadyEnemy(0, height/2 - 20, 40, color(255,255,255));

parseMessage();

}

void draw(){
  background(0);
  
  sit.render();
  
  go.render();
  go.playerZoomRight();
  go.playerZoomLeft();
  go.playerZoomUp();
  go.playerZoomDown();

  recieve();
  sendData();
  whatDaDogDoin();

}

//holds message from Arduino and saves it
//to the var "message"
void recieve(){
  
  char startChar = '<';
  char endChar = '>';
  
  //while something is on serial port
  while(port.available() > 0){
    char currentChar = port.readChar();
    
  //if char read matches startChar read message
  if(currentChar == startChar){
    message = port.readStringUntil(endChar);
    if(message != null){
       //println(message);
       parseMessage();
       println(val1, " ", val2, " ", val3, " ", val4);
    }
  }
  }
}

//parse function
void parseMessage(){
  
  //get index of first comma
  int commaIndex = message.indexOf(',');
  //get the subString
  String ourSubstring = message.substring(0,commaIndex);
  //convert string to int
  val1 = int(ourSubstring);
  //change message so no first number or comma
  message = message.substring(commaIndex+1);
  
  commaIndex = message.indexOf(',');
  //get the subString
  ourSubstring = message.substring(0,commaIndex);
  //convert string to int
  val2 = int(ourSubstring);
  //change message so no second number or comma
  message = message.substring(commaIndex+1);
  
  commaIndex = message.indexOf(',');
  //get the subString
  ourSubstring = message.substring(0,commaIndex);
  //convert string to int
  val3 = int(ourSubstring);
  //change message so no third number or comma
  message = message.substring(commaIndex+1);
  
  int endCharIndex = message.indexOf('>');
  //get the subString
  ourSubstring = message.substring(0,endCharIndex);
  //convert string to int
  val4 = int(ourSubstring);
  
}

//enemy reaction to proximity
void whatDaDogDoin(){
  if(val1 == 1){
    sit.c = color(255,0,0);
  }
  
  if(val2 == 1){
    sit.c = color(255,255,0);
  }
  
  if(val3 == 1){
    sit.c = color(0,255,0);
  }
  
  if(val4 == 1){ 
    sit.c = color(255,255,255);
  }
  
}

void sendData(){
  if(abs(((go.topBound+(go.size/2)) - (sit.bottomBound-(sit.size/2)))) < 100 && abs(((go.leftBound+(go.size/2)) - (sit.rightBound-(sit.size/2)))) < 100){
    port.write("?1!");
    println("DANGER");
  }
  
  else if(abs(((go.topBound+(go.size/2)) - (sit.bottomBound-(sit.size/2)))) < 200 && abs(((go.leftBound+(go.size/2)) - (sit.rightBound-(sit.size/2)))) < 200){
    port.write("?2!");
    println("WARNING");
  }
  
  else if(abs(((go.topBound+(go.size/2)) - (sit.bottomBound-(sit.size/2)))) < 300 && abs(((go.leftBound+(go.size/2)) - (sit.rightBound-(sit.size/2)))) < 300){
    port.write("?3!");
    println("IS GOOD");
  }
  
  else if(abs(((go.topBound+(go.size/2)) - (sit.bottomBound-(sit.size/2)))) < 800 && abs(((go.leftBound+(go.size/2)) - (sit.rightBound-(sit.size/2)))) < 800){
    port.write("?4!");
    println("GONE");
  }
}

void keyPressed(){
  if(key == 'w'){
    go.movingUp = true;
  }
  
  if(key == 's'){
    go.movingDown = true;
  }
  
  if(key == 'a'){
    go.movingLeft = true;
  }
  
  if(key == 'd'){
    go.movingRight = true;
  }
}

void keyReleased(){
  if(key == 'w'){
    go.movingUp = false;
  }
  
  if(key == 's'){
    go.movingDown = false;
  }
  
  if(key == 'a'){
    go.movingLeft = false;
  }
  
  if(key == 'd'){
    go.movingRight = false;
  }
  
}
