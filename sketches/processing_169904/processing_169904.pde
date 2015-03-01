
float temp_x;

int num_objects = 60;
Scoop[] scoop_array = new Scoop[num_objects];

Scoop s;

void setup()
{
 size (600, 600); 

s =  new Scoop();
for (int i = 0; i<num_objects; i++)
{
  scoop_array[i] = new Scoop();
}
}



void draw()
{
  background (255);
  noStroke();

//strawberry  
  fill (242, 169, 153 );
  rect ( -1, -1, 602, 201 );
   
   //chocolate
      fill (115, 88, 80 );
      rect (-1, 399, 602, 201 );
   
   //vanilla   
    fill (248, 236, 201 );
    rect (-1, 199, 602, 200 );
    
//scoop
fill (188, 255, 196 );
ellipse (width/2, 200, 220, 180);
     
  //cone    
fill (199, 166, 125);
//stroke (199, 166, 125);
//strokeWeight (3);
triangle (209, 250, 300, 445, 390, 250 );


//mint 
noStroke();
 fill (188, 255, 196 );
      rect (-1, 590, 602, 100);
     
     //cherry
     noFill();
     stroke (225, 0, 0);
     bezier (300, 99, 305, 93, 302, 86, 298, 78);
     noStroke();
     fill (222, 0, 0);
     ellipse (width/2, 110, 25, 23);
     
     
      
fill (188, 255, 196);
for (int i = 0; i<num_objects; i++)
{
scoop_array[i].update();
scoop_array[i].display();
}
//pushMatrix ();

//popMatrix();

println (mouseX, mouseY);
      
}


class Scoop
{
 float x, y, vx, vy, grav, diam;
 

Scoop()
{
 x = 300;
y = 210;
diam = random (1, 30);
vx = random ( -.5, .5);
vy = random (0, 5);
grav = .005;

}

void update()
{
  vy+= grav;
  x+= vx;
  y+=vy;
  





  
}


void display()
{
pushMatrix();
translate (x, y);
ellipse (0, 0, diam, diam);
popMatrix();
}

}
