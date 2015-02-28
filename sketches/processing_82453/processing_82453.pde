
void setup(){
  size(300,300);
  background(0,0,0);
}

void draw(){
  int count=0; 
  float r=random(0,255);
  float g=random(0,255);
  float b=random(0,255);
  float x=random(200);
  float y=random(200);
  float a=random(-300,300);
  float c=random(0,100);
  float d=random(-30,60);
  float h=random(-50,50);
  while(count<=50){
    frameRate(5);
    fill(r,g,b);
    ellipse(int(random(300)),int(random(300)),h,d);
    fill(int(random(255)),int(random(255)),int(random(255)));
    triangle(int(random(300)),int(random(300)),x,x,y,y);
    count=count+1;
  }
}
    
  


