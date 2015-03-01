
void setup(){
size(400,400);
noStroke();
}

int x=0;
int speed=3;
int reversespeed=-3;
int y=400;
float a=random(200);


void draw (){
  
  for(int i=0;i<250;i=i+5){
    fill(x,i,40,100);
      }
  
  background(x,100,150);
  frameRate(30);
    translate(-150,50);
      rect(y,x,50,50);

  
     translate(-50,-150);
    rect(y,450,300,50);
  
  translate(100,-100);
  rect(450,y,50,500);
      translate(0,50);
  rect(x,100,300,50);
    translate(0,50);
    stroke(1);
    noStroke();
    rect(100,x,50,300);
    rect(x,100,300,50);
    fill(x,20,100,100);
    rect(x,100,300,50);
triangle(100,100,300,100,100,300);
triangle(500,100,350,100,500,250);
triangle(350,150,400,150,375,125);
triangle(100,500,100,450,150,500);
ellipse(500,500,200,200);

    
   
   
  y=y+reversespeed;
  x=x+speed;
   
  if ((y<200) | (y>=450)){;
  reversespeed=reversespeed*-1;}
   
  if ((x<0) | (x>=250)){;
  speed=speed*-1;

  
  
  
  
  
}
 
      }

