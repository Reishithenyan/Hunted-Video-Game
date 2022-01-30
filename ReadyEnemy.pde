class ReadyEnemy{
  //vars
  int x;
  int y;
  int size;
  color c;
  
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
    
  topBound = x + 280;
  bottomBound = x + size + 280;
  leftBound = y - 280;
  rightBound = y + size - 280;
  }
  
  void render(){
    fill(c);
    square(x,y,size);
    
    //println("topbound " +topBound);
    //println("bottombound " +bottomBound);
    //println("rightbound " +rightBound);
    //println("leftbound " +leftBound);
  }
}
