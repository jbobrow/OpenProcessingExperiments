

void setup(){
  size(600,600);
  smooth();
  background(0);
  fill(255);
  noStroke();
colorMode(HSB,360,100,100,100);
 
}
 
void draw (){
  background(0);
  float ellSize=0;
  for(int x=0; x<width; x+=100){
      for(int y=0; y<width; y+=10){
        ellSize=sin(x+sin(y))*100*cos(x/5)*sin(x+cos(y));
        ellSize=cos(x+sin(y))+26*sin(x+cos(y));
         ellSize=cos(x+sin(y))+26*sin(x-cos(y));
          ellSize=cos(x*2+sin(y))+26*sin(x+cos(y));
        ellSize=cos(x+sin(y))+26*sin(x+cos(y));
        ellipse(x,y,ellSize,ellSize);
        float fillC=16*sin(x/sin(y))+300;
         
      fill(fillC,126,120,40);
       ellipse(300,300,400,400);
       fill(302,22,33);
      ellipse(300,300,300,300);
      
      
 
      
      }
  }
}

