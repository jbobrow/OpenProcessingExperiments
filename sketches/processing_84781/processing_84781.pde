
void setup(){
  size(410,410);
}
 
void draw(){
  background(219,213,197);
  
smooth();
translate(width/2, height/2); for (int i=0;i<360;i+=30){
rotate(radians(48));
quad(0, 0, 30, 15, 70, 60, 20, 60);
}
  
      // ellipse grise
  fill(#B4B3B2);
  noStroke();
  ellipse(26, 26, 26, 26);

  
  // ellipse grise
  fill(#B4B3B2);
  noStroke();
  ellipse(160, 160, 160, 160);
  ellipse(78, 78, 78, 78);
  ellipse(180, 180, 180, 180);
  
  // red rect vertical
  fill(162,0,11);
  noStroke();
  rect(60,80,10,170);
  
  // red rect vertical
  fill(162,0,11);

  noStroke();
  rect(60,80,10,120);
  
  
}


