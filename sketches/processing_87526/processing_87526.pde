
float x,y,wd,ht;
color a, b, c, d, e, f,g, h, i;
 
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
 
 figure(x,y, wd, ht);
//figure(x, y, wd, ht);
}
 
 
 
 
void figure ( float fx, float fy, float fwd, float fht)
{
  //head
 fill(c);
 noStroke();
 ellipse (fx+180, fy+60, fwd, fht);
 
 //eyes
 fill(d);
 ellipse(fx+150, fy+60, fwd/5, fht/5);
 ellipse(fx+210, fy+60, fwd/5, fht/5);
 
 //mouth
 fill(g);
 ellipse(fx+180, fy+80, fwd/2, fht/3);

  
 //head
 fill(b);
 noStroke();
 ellipse (fx+180, fy+150, fwd, fht);
 
 //eyes 
 fill(e);
 ellipse(fx+150, fy+150, fwd/5, fht/5);
 ellipse(fx+210, fy+150, fwd/5, fht/5);
 
 //mouth
 fill(h);
 arc(200, 183, 50, 50,0, PI);


 //head
 fill( a);
 noStroke();
 ellipse (fx+180, fy+240, fwd, fht);
  
 //eyes    
 fill(f);
 ellipse(fx+150, fy+240, fwd/5, fht/5);
 ellipse(fx+210, fy+240, fwd/5, fht/5);
 
 //mouth
 fill(i);
 arc(200, 290, 50, 50, PI, TWO_PI);
}
 
void keyPressed()   {
{
    
  if (keyCode == ' ') {
    a=color(random(255),random(255),random(255)  );
    b=color(random(255),random(255),random(255)  );
    c=color(random(255),random(255),random(255)  );
    d=color(random(255),random(255),random(255)  );
    e=color(random(255),random(255),random(255)  );
    f=color(random(255),random(255),random(255)  );
    
  }
 
}
}

void mousePressed()
{
  
  g=color(random(255), random(255), random(255) );
  
  h=color(random(255), random(255), random(255) );
  
  i=color(random(255), random(255), random(255) );
}

