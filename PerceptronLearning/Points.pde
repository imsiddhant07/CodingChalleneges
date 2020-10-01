class Point{
  float x;
  float y;
  
  int label;
  
  //Constructor
  Point(){
    
    x = random(width);
    y = random(height);
  
    if(x > y){
      label = 1;
    }else{
      label = -1;
    }
    
  }
  
  void show(){
    if(x>y){
      stroke(255);
    }else{
      stroke(0);
    }
    //fill(0,0,255);
    ellipse(x,y,10,10);
  }

}
