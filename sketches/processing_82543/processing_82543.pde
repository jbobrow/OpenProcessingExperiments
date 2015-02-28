
void setup(){
  size(300,300);
  frameRate(1);
}
void draw(){
  int count=0;
  background(0);
  
  while(count<=100){
     float a=random(-300,300);
  float b=random(-300,300);
  float c=random(-300,300);
  float d=random(-300,300);
  float e=random(0,200);
  float f=random(0,100);
  float g=random(0,255);
  float h=random(0,300);
  float i=random(0,300);
  float j=random(0,300);
  float k=random(0,300);
  float l=random(0,300);
  float r=random(0,300);
    fill(r,g,b);
    triangle(f,h,i,j,k,l);
    count=count+1;
  }
}


