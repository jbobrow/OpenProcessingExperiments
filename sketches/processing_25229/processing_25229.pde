
float x;
float xspeed= +5;
float y;
float yspeed=+1;

void setup() {
  size(600,600);
  background(0);
  x=100;
  y=200;
}

void draw(){
  background(225,244,0);
  
  fill(255,53,0,20);
  ellipse(x,80,y,100);
  
    fill(255,53,0,20);
  ellipse(x,160,y,200);
  
    fill(255,53,0,20);
  ellipse(x,240,y,280);
  
  fill(255,53,0,20);
  ellipse(x,320,y,360);
  
    fill(255,53,0,20);
  ellipse(x,160,y,200);
  
    fill(255,53,0,20);
  ellipse(x,240,y,280);
  
  noStroke();
fill(255,53,47,40);
triangle(x+random(50)-random(50),y+random(70)-random(70),280,280,300,300);

  
  if(x <= 600){
   xspeed=yspeed;   
  }
  
  if(x>=600){
    xspeed=6;
  }
  
 
  x=x+xspeed;
  y=y+yspeed;
  
  if(y>=200){
yspeed=yspeed;
  }
  
  if(x>=20){
    xspeed=xspeed;
  }
  
  fill(255,53,0,80);
  ellipse(x,40,y,50);
}


