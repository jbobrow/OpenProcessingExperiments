
float x=0;
float y =0;
float xspeed=+5;
float yspeed=+5;

void setup() { 

  size(500,500);
  background(155,80,147);
  x=300;
  y=80;
  xspeed=random(10);
  yspeed=random(10);
}


void draw() { //over and over again
  background(77,6,70);

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
  
noStroke();
  fill(250,255,201);
  ellipse(x+100,y+100,80,80);
  fill(220,227,149);
   ellipse(x+100,y+200,80,80);
   ellipse(x+100,y+300,80,80);
   fill(216, 229,72);
   ellipse(x+100,y+400,80,80);
    fill(234,252,36);
   ellipse(x+100,y+500,80,80);
   ellipse(x+200,y+100,80,80);
    fill(208,252,36);
   ellipse(x+200,y+200,80,80);
   ellipse(x+200,y+300,80,80);
  ellipse(x+200,y+400,80,80);
  fill(181,224,11);
   ellipse(x+200,y+500,80,80);
    ellipse(x+300,y+100,80,80);
     ellipse(x+300,y+200,80,80);
      ellipse(x+300,y+300,80,80);
ellipse(x+300,y+400,80,80);
ellipse(x+300,y+500,80,80);
 ellipse(x+400,y+100,80,80);
 ellipse(x+400,y+200,80,80);
ellipse(x+400,y+300,80,80);
 ellipse(x+400,y+400,80,80);
 ellipse(x+400,y+500,80,80);
          ellipse(x+500,y+100,80,80);
        
                   ellipse(x+500,y+200,80,80);
                            ellipse(x+500,y+300,80,80);
                                     ellipse(x+500,y+400,80,80);
                                              ellipse(x+500,y+500,80,80);
}
