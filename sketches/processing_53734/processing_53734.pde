
float x, y, angle;


void setup () {
  size (600, 600);
  background (2, 40, 12);
  stroke(x*8, 130, angle);
  strokeWeight(.005);
  noFill();
  smooth();
  x = 0;
  y = 0;
  angle = 0;
}

void draw () {

  x = cos(radians(angle)) * 400 + 20;
  y = sin(radians(angle)) * 200 + height/2.5;
  ellipse(angle, y, x+2, y+1);
  ellipse(x, angle+5, y+1, x+10);
  rect(x, y, x*2, angle*height/3);
  angle ++;
  x++;
  y++;



  if (angle > width+50) {
    rect(x+200, y-200, x*6, angle*2.0);
    stroke( 2, 40, 12);
    //rect(x+100, y, angle, x*2);
    //rect(x+50, y*20, angle, x);
    y++;
    x=0;
    ellipse(x, y+500, angle, angle);
   
     x = mouseX;
     y = mouseY;
     if (x == mouseX && y == mouseY) {
     ellipse(x-100, y+500, angle+5, angle);
     stroke( x*8, y, x);
     }
     
  }
}



