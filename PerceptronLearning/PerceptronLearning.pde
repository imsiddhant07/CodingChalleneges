Perceptron brain;

int count = 1500;

Point[] points = new Point[count];

void setup(){
  
  brain  = new Perceptron();
  size(800,800);
  
  for(int i = 0;i < count;i++){
    points[i] = new Point();
    
  }
    
}

void draw(){
  background(255);
  stroke(0);
  line(0,0,width,height);   
    
  for(int i = 0;i < count;i++){
    points[i].show();
    
  }
  for(int i = 0;i < count;i++){
    float[] inputs = {points[i].x,points[i].y};
    int target =points[i].label;
    //brain.train(inputs,target);
    
    int guess = brain.guess(inputs);
    
    if(guess == target){
      fill(0,255,0);
    }else{
      fill(255,0,0);
    }
    ellipse(points[i].x,points[i].y,6,6);
    
  }

}

//int j = 0;

void mouseClicked(){
  
  //int i = j%count;
  
  for(int i = 0;i < count;i++){
    float[] inputs = {points[i].x,points[i].y};
    
   // println("index : ",i," :  weight X : ",brain.weights[0]," weight Y : ",brain.weights[1]);
   
    int target =points[i].label;
    brain.train(inputs,target); 
    
    //j++;
  }
    
  }
