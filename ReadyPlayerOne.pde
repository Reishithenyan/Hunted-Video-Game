class ReadyPlayerOne{
  
  //background image
  PImage backgroundImage;
  
  //vars
  int x;
  int y;
  int size;
  color c;
  int gas;
  
  boolean movingLeft;
  boolean movingRight;
  boolean movingUp;
  boolean movingDown;
  
  //boundaries
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;
  
  //constructor
  ReadyPlayerOne(int xPos, int yPos, int pSize, color pColor){
  x = xPos;
  y = yPos;
  size = pSize;
  c = pColor;
  gas = 10;
  
  //load it in
    backgroundImage = loadImage("ActualBackground.png");
  
  topBound = x;
  bottomBound = x + size;
  leftBound = y;
  rightBound = y + size;
  
  movingLeft = false;
  movingRight = false;
  movingUp = false;
  movingDown = false;
 }
 
 //create player
 void render(){
   //create the background image
   image(backgroundImage, (-1000 - leftBound), -600 - topBound, 3600, 3600);
  
   fill(c);
   square(x,y,size);
   
    println("topbound " +topBound);
    println("bottombound " +bottomBound);
    println("rightbound " +rightBound);
    println("leftbound " +leftBound);
 }
 
 //moves player in direction stated by the boolean
  void playerZoomRight(){
    if(movingRight == true){
      if(rightBound < 2190){
      //x = x + gas;
      
      topBound += 0;
      bottomBound += 0;
      println("topbound " +topBound);
       println("bottombound " +bottomBound);
      
      rightBound += gas;
      leftBound += gas;
      println("rightbound " +rightBound);
       println("leftbound " +leftBound);
       
      }
    }
  }
  void playerZoomLeft(){
    if(movingLeft == true){
      if(leftBound > -1370){
      //x = x - gas;
      
      topBound += 0;
      bottomBound += 0;
      println("topbound " +topBound);
       println("bottombound " +bottomBound);
      
      leftBound -= gas;
      rightBound -= gas;
      println("rightbound " +rightBound);
       println("leftbound " +leftBound);
       
      }
    }
  }
  void playerZoomUp(){
    if(movingUp == true){
      if(topBound > -860){
      //y = y - gas;
      topBound -= gas;
      bottomBound -= gas;
      println("topbound " +topBound);
       println("bottombound " +bottomBound);
       
      leftBound += 0;
      rightBound += 0;
      println("rightbound " +rightBound);
       println("leftbound " +leftBound);
       
      }
    }
  }
   void playerZoomDown(){
      if(movingDown == true){
        if(bottomBound < 2700){
        //y = y + gas;
        topBound += gas;
        bottomBound += gas;
        println("topbound " +topBound);
         println("bottombound " +bottomBound);
         
        leftBound += 0;
        rightBound += 0;
        println("rightbound " +rightBound);
         println("leftbound " +leftBound);
         
        }
      }
    }
 
}
