
void setup(){
  size(640, 480);
  background(0);
  smooth();
  noStroke();
}
float eyeWhiteSize = 230;
 
float eyeBlackSizeMax = 100;
float eyeBlackSizeMin = 10;
 
int LeyeX = 170;
int LeyeY = 150;
int ReyeX = 470;
int ReyeY = 150;
 
float ld = dist(mouseX, mouseY, LeyeX, LeyeY);
float rd = dist(mouseX, mouseY, ReyeX, ReyeY);
 
float distL, distR;
 
void draw(){
   
  background(100, 200, 0);
   
  fill(0);
   
  ld = constrain(ld, 0, 30);
  float a = atan2(mouseY-LeyeY, mouseX-LeyeX);
  float lx = LeyeX + cos(a) * ld;
  float ly = LeyeY + sin(a) * ld;
  distL = dist(lx, ly, mouseX, mouseY) / 3;

  fill(255);
 
 //Left Eye
  if(distL >= eyeBlackSizeMax){
    distL = eyeBlackSizeMax;
    ellipse(LeyeX, LeyeY, eyeWhiteSize, eyeWhiteSize); 
  }else
  {
    ellipse(LeyeX, LeyeY, eyeWhiteSize, eyeWhiteSize);  
  }
   
  if(mousePressed && mouseX < width/2){ 
  fill(200,255,20);}
  else{fill(200);}
  ellipse(lx,ly,distL + 50,distL + 50);//left iris
  fill(0);
  ellipse(lx, ly, distL, distL);  //left pupil

   
  rd = constrain(rd, 0, 20);
  float ra = atan2(mouseY-ReyeY, mouseX-ReyeX);
  float rX = ReyeX + cos(ra) * rd;
  float rY = ReyeY + sin(ra) * rd;
  distR = dist(rX, rY, mouseX, mouseY) / 2;
  
  fill(255);
  
  //Right Eye
  if(distR >= eyeBlackSizeMax){
    distR = eyeBlackSizeMax;
    ellipse(ReyeX, ReyeY, eyeWhiteSize, eyeWhiteSize); 
     
  }else{
    ellipse(ReyeX, ReyeY, eyeWhiteSize, eyeWhiteSize);  
  }
   
   if(mousePressed && mouseX > width/2)
   {fill(150,20,200);
   }else{fill(200);}
   
   ellipse(rX,rY,distR * 1.5,distR * 1.5);//right iris
   fill(0);
   ellipse(rX, rY, distR, distR);  //right pupil

}


