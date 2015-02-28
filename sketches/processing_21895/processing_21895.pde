
void setup(){
  size(650,650);
  frameRate(15);
  smooth();
  background(0);
}

float e = 100;
int i;
float sz = 30;

void draw(){
  float x = width/2;
  float y = height/2;

  colorMode(HSB,360,100,100);
  
  background(0);  
  for(i=0; i<30;i++){
    fill(10*i,100,100);
    noStroke();
    ellipse(x + i*10 *sin(e*i),y + i*10 *cos(e*i),sz,sz);
    ellipse(x - i*10 *sin(e*i),y - i*10 *cos(e*i),sz,sz); 
    stroke(10*i,100,100);
    strokeWeight(10);
    line(x + i*10 *sin(e*i),y + i*10 *cos(e*i),x + (i+1)*10 *sin(e*(i+1)),y + (i+1)*10 *cos(e*(i+1)));    
    line(x - i*10 *sin(e*i),y - i*10 *cos(e*i),x - (i+1)*10 *sin(e*(i+1)),y - (i+1)*10 *cos(e*(i+1)));
    }
  e -= 0.0099;
  if(e < -100){
    e = 100;
  }
}

