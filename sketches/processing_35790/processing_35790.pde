
float L = 5;
float sx = 5;
float sy = 5;

float[] x = new float[500];

void setup(){
 size(700,400);
  smooth();
//float count = width/(L + sx);
 
  
}

void draw() {
  
  
  background(255);
   stroke(0, 100);
   

 float Ypos = sy;
  while(Ypos < height){
    
  float Xpos = sx;
  
  
    while(Xpos < width){
      if(dist(Xpos, Ypos, mouseX, mouseY) < 50 && mousePressed == true){
        float angle = atan2(mouseY - Ypos, mouseX - Xpos); 
       
        line(Xpos, Ypos, Xpos + cos(angle)*L, Ypos+ sin(angle)*L);
      
    }else{
        
        line(Xpos, Ypos, Xpos + L, Ypos);
      }
      Xpos = Xpos + (L + sx);
    
    }
    
    Ypos = Ypos + sy;
  
  
  
  
  
  
 
  
}
if(mousePressed == false){
  stroke(0);
}


}





