class ReadyPlayerOne{
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
  gas = 5;
  
  topBound = x  - 120;
  bottomBound = x + size - 120;
  leftBound = y + 120;
  rightBound = y + size + 120;
  
  movingLeft = false;
  movingRight = false;
  movingUp = false;
  movingDown = false;
 }
 
 //create player
 void render(){
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
      if(x+size < width){
      x = x + gas;
      
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
      if(x > 0){
      x = x - gas;
      
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
      if(y > 0){
      y = y - gas;
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
        if(y+size < height){
        y = y + gas;
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
