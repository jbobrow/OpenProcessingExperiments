

void setup(){
  size(300,300);
  colorMode(HSB,360,100,100);
}
void draw(){
  background(0,0,100);
  
  for(int x=0; x<300; x=x+30){
    float y= sin(radians(x+frameCount)*0.8)*100+50;
    noStroke();
    fill(random(255),50,150);
    ellipse(150,150,300,y*2);
  }
 
}
