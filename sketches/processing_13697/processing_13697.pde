
float a=0;

void setup(){
  size(360,200);
  colorMode(HSB,360,100,100);
}

void draw(){
  background(0);
  for(int x=0; x<360; x=x+1){
   float y= sin(radians(x+frameCount)*a)*100+100;
   stroke(random(0,55),100,100);
   line(180,100,x,y);
  }
   a=a+0.03;
}
                
