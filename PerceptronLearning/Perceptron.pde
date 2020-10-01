class Perceptron{
  
  int number_of_weights = 2;
  float[] weights = new float[number_of_weights];
  float lr = 0.01;//learning rate
  //Constructor
  Perceptron(){
  
    //assign random weights
    for(int i = 0 ; i < weights.length;i++){
      weights[i] = random(-1,1);
    }
  }
  
  int guess(float[] inputs){
    
    float sum = 0;
    for(int i = 0;i < weights.length ;i++){
      sum += inputs[i]*weights[i];
    }
    return sign(sum);
  }
  
  void train(float[] inputs ,int target){
 
     int guess = guess(inputs);
     int error = target-guess;
       
       for(int i = 0; i  < weights.length;i++){
         weights[i] += error*inputs[i]*lr;
       }
  
  }
  
  int sign(float x){
    if(x>0){
      return 1;
    }else{
      return -1;
    }
  }

}
