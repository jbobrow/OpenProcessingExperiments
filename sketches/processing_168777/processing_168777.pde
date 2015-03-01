
float temp_x;

Gum g, g2, g3, g4, g5, g6;


void setup()
{
 size (600, 600);

g = new Gum();
g2 = new Gum(); 
g3 = new Gum();
g4 = new Gum();
g5 = new Gum();
g6 = new Gum();
}

void draw()
{
 background (195, 220, 255);

noStroke();
fill( 235, 0, 48);
rectMode (CENTER);
rect (300, 585, 380, 200, 16); 

fill (195, 220, 255, 60);
ellipseMode (CENTER);
ellipse (width/2, 330, 450, 400);

noStroke();
fill (random (0,255), random (0, 255), random (0, 255));

g.update();
g.display();
  g2.update();
  g2.display();
    g3.update();
    g3.display();
      g4.update();
      g4.display();
        g5.update();
        g5.display();
          g6.update();
          g6.display();
          
   

 stroke(243, 255, 178);
 strokeWeight( 16);
 fill(243, 255, 178, 94);
ellipse (width/2, height/2, 500, 500);

noStroke ();
fill(243, 255, 178, 80);
bezier (200, 98, 10, 380, 130, 440 , 270, 90);

noFill();
stroke(185, 0, 40);
strokeWeight(9);
rect (300, 610, 160, 60, 16);

noStroke();
fill (185, 0, 40);
bezier (120, 490, 95, 700, 190, 700 , 140, 505);

noFill();
stroke(0);
strokeWeight(2);
rect (300, 610, 160, 60, 16);





println( mouseX, mouseY);
}



class Gum
{
 float x, y, vx, vy, grav, diam;

  Gum()
  {
  x = 160;
  y = 160;
  diam = random (70, 140);
  vx = random (-5, 5);
  vy = random (-5, 5);
  grav = .05;
  }
  
  void update()
{
vy+= grav;
x+= vx;
y+=vy;

  if (y > 440)
     {
       y = 440 ;
       vy*= -.9;
     }
     
  if (y < 130)
     {
       y = 130 ;
       vy*= -.9;
     }
 
    if (x < 130)
    {
      x = 130;
     vx*= -1;
     }
 
     if (x > 440)
     {
      x = 440;
      vx*= -.9;
     }

}  
  


void display ()
{
     pushMatrix();
     translate (x, y);
     ellipse (0,0, diam, diam);
     popMatrix(); 
}

}
