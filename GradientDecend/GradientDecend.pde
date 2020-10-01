PVector[] data = new PVector[0];
float yIntercept = 0;
float slope = 0;
float lr = 0.03; // Learning rate


void setup(){
  size(800,800);
  //setRandomPoints(150);
}

void draw(){
  background(50);
  
  for(int i = 0; i < data.length;i++){
    
    float X = map(data[i].x,0,1,0,width);
    float Y = map(data[i].y,1,0,0,height);
    fill(255);
    noStroke();
    ellipse(X,Y,6,6);     
  }
  
  if(data.length > 1){
    println("X");
    gradientDecend();
    drawLine();
   // noLoop();
  }
  
  
}

void keyPressed(){
  
  if(keyCode == UP){   
    //while(true){
    //  if(data.length > 1){
    //  gradientDecend();
    //  drawLine();
    // // noLoop();
    //  }
    //}
  }
}

void drawLine(){
  float x1 = 0;
  float y1 = slope*x1 + yIntercept;
  
  float x2 = 1;
  float y2 = slope*x2 + yIntercept;
  
  float X1 = map(x1,0,1,0,width);
  float Y1 = map(y1,0,1,height,0);
  
  float X2 = map(x2,0,1,0,width);
  float Y2 = map(y2,0,1,height,0);
  
  fill(0,255,255);
  stroke(255,0,255);
  line(X1,Y1,X2,Y2);
  
  
}

void gradientDecend(){
  
  for(int i = 0;i < data.length;i++){
    
    float x = data[i].x;
    float y = data[i].y;
    
    float guess = slope*x + yIntercept;
    
    float error = y - guess;
    
    slope += (x*error  *lr);
    yIntercept += (error   *lr);
    
  
  
  }
  
}

//void LinearRegression(){
  
//  float Xsum = 0,Ysum = 0;
  
//  for(int i = 0; i < data.length;i++){
//    Xsum += data[i].x;
//    Ysum += data[i].y;  
//    //println();
//  }
  
//  float Xmean = Xsum/data.length;
//  float Ymean = Ysum/data.length;
  
//  float numr = 0; //Numerator
//  float den = 0;  // Denominator
  
//  for(int i = 0 ;i < data.length;i++){  
//    float varX = data[i].x;
//    float varY = data[i].y;
    
//    numr += (varX-Xmean)*(varY-Ymean);
    
//    den += (varX-Xmean)*(varX-Xmean);
    
//  }

//  slope = numr/den;
//  yIntercept = Ymean - slope*Xmean;
  
//  //println(Xmean,Ymean,slope,yIntercept);
  
  
//}

void setRandomPoints(int s){
  for(int i = 0;i < s;i++){
  float x = random(0,1);
  float y = random(0,1);
  PVector r = new PVector(x,y);
  
  data = (PVector[]) append(data,r);
  }
}

void mousePressed(){

  float x = map(mouseX,0,width,0,1);
  
  //See this step we arer inverting the Y axis by this.
  float y = map(mouseY,0,height,1,0);
  
  PVector r = new PVector(x,y);
  
  //Appending the new Vector is a complex process;
  data = (PVector[]) append(data,r);
}
