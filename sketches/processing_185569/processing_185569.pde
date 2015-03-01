
float x=250;
float y=250;
float x2,y2;
float kaku=10;
float a=0.97;
float num=60;
float noisefactor=10;
boolean recording = false;
void setup(){
size(500,500);
background(255);

translate(width/2,height/2);
/*for(int i=0; i<30; i++){
  pushMatrix();
  translate(tenX,tenY);
  rotate(radians(kaku));
  tenX=(x-x*a)/2;
  x=x*a;
  y=y*a;
  ellipse(tenX,0,x,y);
  popMatrix(); 
}*/
colorMode(HSB);
noStroke();
fill(155,200,255);
for(int i=0; i<60; i++){
      rotate(radians(6));
      ellipse(x,0,3,3);
    }
//ellipse(0,0,width,height);

circle(0);

frameRate(15);
}

void draw(){
 background(255);


translate(width/2,height/2);
rotate(radians(1));
kaku+= noise(noisefactor)*2-1;
x=250;
y=250;


fill(155,200,255);
  circle(0);
  
   if(recording){
  saveFrame("output/frames####.png");
  }

}

void circle(int count){
  if(count<120){
 float centX=cos(radians(kaku*count))*(x-x*a)/2;
 float centY=sin(radians(kaku*count))*(x-x*a)/2;
  x=x*a;
  y=y*a;
  translate(centX,centY);
  //rotate(radians(3));
  for(int i=0; i<num; i++){
      rotate(radians(360/num));
      ellipse(x,0,3,3);
    }
  count++;
  circle(count);
  }
 // num =60+ noise(noisefactor)*10;
  noisefactor += 0.0001;
  
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    recording = !recording;
  }
}
