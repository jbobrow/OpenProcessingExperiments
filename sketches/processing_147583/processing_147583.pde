
float radius;
int centX;
int centY;
float x,y;
float lastx,lasty;
float radiusNoise=random(10);
float ang;
float thisradius,rad;
float addr=5;
float opacity=10;
void setup(){
  size(500,400);
  background(0);
  strokeWeight(2);
  stroke(255,opacity);
  smooth();
  radius = 10;
  centX=250;
  centY=200;
  ang=0;
  lastx =centX+radius;
  lasty = centY;
  frameRate(150);
}

void draw(){
  if(mousePressed){
    fill(0,20);
    rect(0,0,width,height);
  }
  stroke(random(0,2)*100,50);
  for(int i =0;i<20;i++){
    ang++;
    radiusNoise+=0.5;
    //stroke(0,radius%255);
    if(radius>150){
        addr=-random(0,5);
    }if(radius<0){
        addr=random(0,5);
    }
    radius+=addr;
     
    thisradius = radius + (noise(radiusNoise)*70);
    rad = radians(ang%360);
    x = centX + (thisradius * cos(rad));
    y = centY + (thisradius * sin(rad));
    line(x,y,lastx,lasty);
    lastx=x;
    lasty=y;
  }
  
}
