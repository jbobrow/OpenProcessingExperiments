
int Y_AXIS = 1;
int X_AXIS = 2;
float rx = 180;

void setup(){
  size(500, 500);
  smooth();
  background(255);
  for(int m = 0; m <= width; m+=10){
    for(int j = 0; j <= height; j+=10){
      stroke(100);
  //    line(m,j,m,j);
    }
  }
}

void draw(){
  color b1 = color(#EBD8CE,mouseX);
  color b2 = color(#C4A39A,mouseY);
  noStroke();
  //ellipse(250,250,30,30);
  fill(255);
//  rect(135,85,210,310);
  setGradient(140 ,90, 200, 300, b1, b2, Y_AXIS);
  stroke(255);
  strokeWeight(1);
  for(int i = 180; i <= 300; i+=10){
   for(int j = 180; j<=300; j+=10){
   line(i,j,j,i);
   float mx = constrain(mouseX,180,300);
   float my = constrain(mouseY,180,300);
   line(mx,j,j,my);
   
  } 
  }
  

}


void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);

  // choose axis
  if(axis == Y_AXIS){
    /*nested for loops set pixels
     in a basic table structure */
    // column
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }  
  }  
  else if(axis == X_AXIS){
    // column 
    for (int i=y; i<=(y+h); i++){
      // row
      for (int j = x; j<=(x+w); j++){
        color c = color(
        (red(c1)+(j-x)*(deltaR/h)),
        (green(c1)+(j-x)*(deltaG/h)),
        (blue(c1)+(j-x)*(deltaB/h)) 
          );
        set(j, i, c);
      }
    }  
  }
}               
