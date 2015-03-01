

void setup(){
  size( 800,600);
  
  
  
  
}

void draw(){
  background (0);
  fill(255);
  
  textSize(55);
  text( " X =", width/8, height/2 -120);
  text( " Y =", width/1.5, height/2 -120);
  
  textSize(78);
  text( mouseX, width/8,height/2);
  text( mouseY, width/1.5,height/2);
  
  
  
  
  
}
