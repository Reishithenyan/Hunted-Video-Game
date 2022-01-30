class ReadyEnemy{
  //vars
  int x;
  int y;
  int size;
  color c;
  
  int speedX;
  int speedY;
  
  //boundaries
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;
  
  //constructor
  ReadyEnemy(int xPos, int yPos, int pSize, color pColor){
    x = xPos;
    y = yPos;
    size = pSize;
    c = pColor;
    
    speedX = 1;
    speedY = 1;
    
  topBound = x;
  bottomBound = x + size;
  leftBound = y;
  rightBound = y + size;
  }
  
  void render(){
    fill(c);
    square(x,y,size);
    
    println("enemytopbound " +topBound);
    println("enemybottombound " +bottomBound);
    println("enemyrightbound " +rightBound);
    println("enemyleftbound " +leftBound);
  }
  
  void hunt(){
    x = x + speedX;
    y = y + speedY;
    
    topBound += speedX;
    bottomBound += speedX;
    rightBound += speedY;
    leftBound += speedY;
  }
}
