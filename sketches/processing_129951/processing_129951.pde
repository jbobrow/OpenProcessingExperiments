
float x=500;
float y=500;
float x2,y2;
float kaku=60;
float a=0.9;
void setup(){
size(500,500);
background(0);
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
fill(45,399,399,30);
ellipse(0,0,width,height);
circle(0);
}
void draw(){
 background(0);


translate(width/2,height/2);
rotate(radians(1));
kaku+=2;
x=500;
y=500;


//fill(155,200,255);
  circle(0);

}

void circle(int count){
  if(count<60){
 float centX=cos(radians(kaku*count))*(x-x*a)/2;
 float centY=sin(radians(kaku*count))*(x-x*a)/2;
  x=x*a;
  y=y*a;
  translate(centX,centY);
  ellipse(0,0,x,y);
  count++;
  circle(count);
  }
  
}



