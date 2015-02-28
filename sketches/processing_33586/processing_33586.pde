
//this was done with a lot of help for Daniel Shiffman's Learning Processing

float[] xpos = new float[5]; 

void setup(){

 size(600,340);

for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 

}
}


void draw(){
  int dir=1;
  
  PImage cylon;
cylon = loadImage("bsg-cylon.jpg");
  image(cylon, 0, 0);
  
  if (mouseX>width/2){
     dir=dir*-1;
   }
  
  if((mouseX>205) && (mouseX<365)){
  
  for (int i = 0; i < xpos.length-1; i ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    xpos[i] = xpos[i+1];
    
  }
  
   xpos[xpos.length-1] = mouseX;
  
   for (int i = 0; i < xpos.length; i ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    fill(255-i*10,0,0,255-i*10);
    ellipse(xpos[i]+dir,150,10-i,10+i);
    
   }
   
}
else {
  float r=random(50);
  if(mouseX<205){
    fill(255-r,0,0);
    ellipse(205,150,7,10);
    
}

  if(mouseX>365){
    fill(255-r,0,0);
    ellipse(362,150,7,10);
  }
  println(mouseX);
}
}

