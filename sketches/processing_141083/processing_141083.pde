
float logistic(float a, float x){
  return a * x * (1 - x);
}

void setup(){
  int image_size = 600;
  background(256, 256, 256);
  size(image_size, image_size);
  
  int i, j;
  int iteration_num = 200;
  float step_size = 0.001;
  float initial_value = 0.1;
  float a = 0;
  float x;
  
  for(j = 0; j < (4.0 / step_size); j++){
    a += step_size;
    x = initial_value;
    
    for(i = 0; i < iteration_num; i++){
      x = logistic(a, x);
      if(i > 100 && a > 2){
        point(((a * (image_size / 4)) - (image_size / 2)) * 2,
              image_size - (x * image_size));
      }
    } 
  }
}
