
void setup (){
  size (800, 800);
  smooth();
  
}


void draw() {
  
  background (0, 0, 0);
  float strokeW = random (1,5);
  int lineHNumb = height/2 ; 
  int linewNumb = width/2 ; 
  int space = 10 ;
  
  for (int i = 0; i < lineHNumb ; i++) {
    for (int h = 0; h < linewNumb ; h++) {
      
      float position = mouseX ;
      
      float value1 = map (i, 1, lineHNumb/2, 0, 255);
      float value2 = map (i, 1, linewNumb/2, 0, 255);
      float value3 = random (0, 255);
      float value4 = random (0, 255);
      float value5 = random (0, 255);
      
      stroke (value1);
        line (0, i*space, width, i*space);
        stroke (value2);
        line (i*space, 0,i*space, height);
      
      
      if (position >= width/2){
        
        strokeWeight (strokeW);
        stroke(value3, position/4, value5, 40);
        line (0, i*space, width, i*space);
        strokeWeight (strokeW/2);
        stroke(value4, value5, position/4);
        line (i*space, 0, i*space, height);
       
      }
      
    }
  }
}                               
