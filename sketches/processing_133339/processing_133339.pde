
float colorR, colorG, colorB;
void setup(){
  size(600,600);
}
void draw(){
  float r1 = random(255), g1= random(255), b1= random(255);
  float mil=millis()*.001;
  float r=350*cos(mil*5)*noise(mil);
  stroke(#ff69b4,200);
  strokeWeight(10);
  if(mil<1)
  {background(255);}
  point(width/2+r*sin(mil),height/2+r*cos(mil));
  
  paint();
}
void paint(){
  if (mousePressed && (mouseButton == LEFT)) {
    colorR = 255;
    colorG = 255;
    colorB = 255;
  }else{
    colorR = map((mouseX+mouseY),0,width+height,0,255);
    colorG = 145;
    colorB = 28;
  }
    stroke(colorR,colorG,colorB);
    if(pmouseX!=0 && pmouseY!=0)
      {line(mouseX, mouseY, pmouseX, pmouseY);}
  
  
}



