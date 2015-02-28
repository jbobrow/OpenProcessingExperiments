
void setup()
{
 size(200,200);
}

void draw()
{
 //Clears the screen.
 background(255);
 
 //Centers the rotations.
 translate(width/2,height/2);
 for(int m=1 ; m<=60 ; m++ )
 {
  minuteTick(m);
 }
 for(int h=1 ; h<=12 ; h++ )
 {
  hourTick(h);
 }
 quarterTick(12);
 quarterTick(3);
 quarterTick(6);
 quarterTick(9);

 //Rotates the clock to face the right way (12 at the top).
 rotate(radians(-90));
 pushMatrix();

 //Draws the hour hand.
 float angle = radians(map(hour() + float(minute())/60, 0, 12, 0, 360));
 rotate(angle);
 line(0,0, 30, 0);
 popMatrix();

 //Draws the minute hand.
 pushMatrix();
 angle = radians(map(minute(), 0, 60, 0,360));
 rotate(angle);
 line(0,0, 60,0);
 popMatrix();

 //Draws the second hand.
 pushMatrix();
 angle = radians(map(second(), 0, 60, 0, 360));
 rotate(angle);
 strokeWeight(2);
 line(0,0,80,0);
 popMatrix();
}

void quarterTick(int q)
{
 pushMatrix();
 float angle = radians(map(q, 0, 12, 0, 360));
 rotate(angle);
 strokeCap(ROUND);
 stroke(100);
 strokeWeight(9);
 line(80, 0, 90, 0);
 point(70, 0);
 stroke(color(255, 0, 0));
 strokeWeight(5);
 line(80, 0, 90, 0);
 point(70, 0);
 popMatrix();
}

void hourTick(int h)
{
 pushMatrix();
 float angle = radians(map(h, 0, 12, 0, 360));
 rotate(angle);
 strokeCap(PROJECT);
 stroke(100);
 strokeWeight(5);
 line(80, 0, 90, 0);
 stroke(color(0, 200, 0));
 strokeWeight(3);
 line(80, 0, 90, 0);
 popMatrix();
}

void minuteTick(int m)
{
 pushMatrix();
 float angle = radians(map(m, 0, 60, 0, 360));
 rotate(angle);
 strokeCap(ROUND);
 stroke(150);
 strokeWeight(3);
 line(80, 0, 90, 0);
 popMatrix();
}


