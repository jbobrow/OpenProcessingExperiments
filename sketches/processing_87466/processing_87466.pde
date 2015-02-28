
//sahana kumar
//copyright sahana kumar 2013

float x,y,wd,ht;
color a, b, c;

void setup()
{
  size (400,400);
  smooth();
  background(229, 171, 229);
  x = 20;
  y = 20;
  wd = 90;
  ht = 90;
  
}

void draw()
{
  fill(255);
 rect(0, 0, width, height);

 figure(mouseX,mouseY, wd, ht);
//figure(x, y, wd, ht);
}




void figure ( float fx, float fy, float fwd, float fht)
{
    fill(c);
 noStroke();
 ellipse (fx+180, fy+60, fwd, fht);
 
  fill(b);
 noStroke();
 ellipse (fx+180, fy+120, fwd, fht);
 
 /* fill( 250, 227, 243);
 noStroke();
 ellipse (fx+180, fy+180, fwd, fht);*/
 
 fill( a);
 noStroke();
 ellipse (fx+180, fy+180, fwd, fht);
 
 fill(219, 139, 53);
 beginShape();
 vertex(fx+138, fy+200);
  vertex(fx+220, fy+200);
  vertex(fx+180, fy+320);
  endShape();
  
}

void keyPressed()   {
{
   
  if (keyCode == ' ') {
    a=color(random(255),random(255),random(255)  );
    b =color(random(255),random(255),random(255)  );
    c =color(random(255),random(255),random(255)  );
  }
}

}



