
float xpos = 350;
float ypos = 250;
int R = 0;
int F = 0;

void setup(){
  size(700,500);
  smooth();
  
}

void draw(){
  
  
   if (mousePressed == true) {
    stroke(R);
    
    R = R + 3;
    
    if (R > 255){
      R = 255;
    }
    
  } else {
    stroke(R);
    R = R - 3;
    
    if(R < 0){
      R = 0;
    }
    
  }
  
    
  

  
  line(mouseX,mouseY,xpos,ypos);
  line(mouseX,mouseY,ypos,xpos);
  rotate(PI/random(10));
  xpos = xpos + (mouseX - xpos)/35.0;
  ypos = ypos + (mouseY - ypos)/35.0;
 
  
}

