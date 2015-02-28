
float x=0;
float y =0;
float xspeed=+5;
float yspeed=+5;

void setup() { 

  size(500,500);
  background(166,114,240);
  x=300;
  y=80;
  xspeed=random(10);
  yspeed=random(10);
}


void draw() { //over and over again
  background(0);

  if (x>=500-40) {
    xspeed=xspeed*-1;
  }

  if(x<=0+40) {
    xspeed=xspeed*-1;
  }

  if (y>=500-40) { //CIRCLE MOVING WITHIN THE SQUARE
    yspeed=yspeed*-1;
  }

  if(y<=0+40) {
    yspeed=yspeed*-1;
  }
 
  x=x+xspeed;
  y=y+yspeed;
  
  fill(69,78,229);
  ellipse(x+300,y+300,900,900);
    fill(125,78,99,90);
  ellipse(x+500,y,900,900);
  fill(201,255,44,90);
  ellipse(x,y+500,700,700);
    fill(208,245,193,90);
  ellipse(x+10,y+100,600,600);
   fill(222,163,211,90);
  ellipse(x,y,700,700);
}      
                
