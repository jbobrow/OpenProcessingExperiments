
void setup(){
  size(500,500);
  
}

void draw(){
  /*
  background(22);
  
  pushMatrix();
  
  translate(width/2,height/2);
  rotate(frameCount*.1);
  rect(0,0,100,100);
  
  popMatrix();
  */
  
  float speed =.05;
  float amp = 200;
  float myNoise = noise(frameCount*.7) * 20; //.7, 45, 100
  float x = cos(frameCount*speed)*sin(frameCount*speed)*amp+width/2 + myNoise;
  float y = sin(frameCount*speed*.5)*sin(frameCount*speed)*amp+height/2 + myNoise;
  ellipse(x,y,10,10);

  
  pushMatrix();
  
  translate(width/2,height/2);
  rotate(frameCount*speed);
  ellipse(amp,0,20,20);
  
  popMatrix();
  
  
  /* figure 8??
  float speed = .05;
  float amp = 200;
  float x = cos(frameCount*speed)*sin(frameCount*speed)*amp+width/2;
  float y = sin(frameCount*speed)*amp+height/2;
  ellipse(x,y,20,20);
  
  */
  

}
