
float yoff = 0.0;
float yoff_2 = 0.0;
float yoff_3 = 0.0;
float znoise = 0;
float z = 0;
float w = 10; // x change
float wind = 0; // wind effect
float faceX, faceY; // human face
float sharkX, sharkY;
boolean meet = false; // shark and human meet

void setup() {
  size(720, 480,P3D);
}

void draw() {
  if(meet == false)
  background(#95E7EA);
  
  else background(#DE777D);
  
  
  
  
  
  ////////////////////////////// draw sun ///////////////////////////////////////////////
  pushMatrix();
  translate(50,50);
  rotateZ(z);
  if(meet == false)
  fill(#F25138);
  else fill(0);
  smooth();
  float radius = 1.0;
  for (int deg =0; deg < 360*6; deg += 13) {
    float angle = radians(deg);
    float x = (cos(angle) * radius);
    float y = (sin(angle) * radius);
    ellipse(x,y,4,4);
    radius = radius + 0.3; 
    
  }
  z += 0.01;
  popMatrix();
  
  
  
  ///////////////////////////////// wave 1 ////////////////////////////////////////////
  noStroke();
  if(meet == false)
  fill(#3585D3);
  else fill(#D6636B);
  beginShape(); 
  
  float xoff = yoff; 
  
  for (float x = 0; x <= width; x += w) {
    float y = map(noise(xoff, yoff), 0, 1, 250,300);
    vertex(x, y); 
    xoff += 0.05;
  }
  yoff += 0.01 + wind;
  vertex(width+200, height);
  vertex(0, height);
  endShape(CLOSE);
  
  
  /////////////////////////////////// wave 2 ///////////////////////////////////
  
  noStroke();
  if(meet == false)
  fill(#237ACE);
  else fill(#BF4F56);
  beginShape(); 
  
  float xoff_2 = yoff_2; 
  
  for (float x = 0; x <= width; x += w) {
    float y = map(noise(xoff_2, yoff_2), 0, 1, 300,350); 
    vertex(x, y); 
    xoff_2 += 0.075;
  }
  yoff_2 += 0.015 + wind;
  vertex(width+200, height);
  vertex(0, height);
  endShape(CLOSE);
  
  
  
  ///////////////////////// draw face //////////////////////////////////////
  
  
  noStroke();
  fill(#E3DAB9);
  if(meet == false){
  faceX = width/3 * 2;
  faceY = map(noise(yoff_2),0,1,height/5 *3.9, height/5 *4.2); 
  ellipse(faceX,faceY,45,45);
  }
  
  /////////////////////// draw sharks //////////////////////////////////
  
  pushMatrix();
  noStroke();
  fill(#838383);
  sharkY = map(noise(yoff_3),0,1,0,20);
  translate(50 + sharkX, 330 - sharkY); 
  beginShape();
  vertex(30, 20);
  bezierVertex(100, 0, 100, 90, 50, 90);
  bezierVertex(50, 100, 70, 50, 30, 20);
  endShape();
  popMatrix();
  
  
  //////////////////////////////////// wave 3 //////////////////////////////////////
  
  noStroke();
  if(meet == false)
  fill(#1A73C9);
  else fill(#C13740);
  beginShape(); 
  
  float xoff_3 = yoff_3; 
  
  for (float x = 0; x <= width; x += w) {
    float y = map(noise(xoff_3, yoff_3), 0, 1, 350,400); 
    vertex(x, y); 
    xoff_3 += 0.1;
  }
  yoff_3 += 0.02 + wind;
  vertex(width+200, height);
  vertex(0, height);
  endShape(CLOSE);
  
  
  if (sharkX > 350) meet = true;
  
}

void keyPressed(){
 
 if (key == 'w') {
   w -= 1;
   wind += 0.025;
   if ( w < 2){
     w = 2; 
   }
 }
 else if (key == 's'){
   w += 1; 
   wind -= 0.025;
 }
 
 if (keyCode == RIGHT) {
   sharkX += 3;
 }
 
 else if (keyCode == LEFT){
  sharkX -= 3; 
 }
  
}
