
float x,y, angle;
void setup(){

  size(600,600);
  smooth();
  colorMode(HSB,360,100,100,100);
  strokeWeight(.5);
}
void draw(){
  
  for(int i = 5;i<360;i++){
   float colorValue = map(i,5,width,0,360);
  }
  pushMatrix();
  frameRate (3);
  //background(255,255,255);
  popMatrix();
  frameRate(120);
  translate(300,300);
    x=cos(radians(angle))*60 +angle;
  y=sin(radians(angle))*60 + angle;
  for (int i=0; i<360;i++){ // i starts at 0 add 1 I every loop and stop i at 360
  line(mouseX,mouseY,1000,1000);
  rotate(radians(1));
  angle ++;

  noStroke();
  
  float glowLight = tan(radians(angle));
 glowLight= map(glowLight,-1 ,1,0,255);
  fill (glowLight);
  ellipse (mouseX, mouseY,10,10);
  angle+= 2000000;
  
    float glowLight2 = sin(radians(angle));
 glowLight= map(glowLight,-1 ,1,0,255);
  fill (glowLight);
  ellipse (mouseX, mouseY,6,6);
  angle+= 2000000;
  

  
  
  
  }
}

