
float x,y,angle;
int i;

void setup(){
  size(500,500);
  colorMode(HSB,360,100,100);
  x = 50;
  y = 100;
  angle = 1;
  smooth();
  background(0);
    noStroke();

}

void draw(){
  x = tan(radians(angle))*100 + height/width;
  //y = cos(radians(angle))*100 + height;
  ellipse(angle/2,y,x++,x);
  fill(random(360),random(60),100);
  ellipse(angle*2,x,y*2,x*2);
  fill(random(360),random(60),100);
  ellipse(x,y*2,angle++,x*2);
  fill(random(360),random(60),100);

  
  if(angle==width){
    angle=50;
    x=20;
    y=25;
  }else{
    if(angle>height){
      angle=30;
      x=50;
      y=50;
    } else {
      if(angle>height){
        angle=5;
        x=15;
        y=15;
      }
    angle+=2;
    x++;
    y+=2;
   
    
    }
  }
} 



