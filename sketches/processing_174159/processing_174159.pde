
//float x, y, vx, vy, grav;
int breaker;


void setup()
{
size (600, 600);
  //size (600, 600, P3D);
  //background (255);

//  x = random(width);
 // y = 0;
  //vx = random (-1, 5);
  //vy = random (-1, 5);
  //grav= .9;

  breaker = 0;
}


void draw()
{
 // vy+=grav;
  //x+= vx;
  //y+=vy;

  background(240, 255, 216 );
  noStroke();



  //noLights();

  //background
  breaker++;
pushMatrix(); 
  strokeWeight(6);
  stroke (random (0, 255), random (0, 255), random (0, 255), 75);
  fill (random (0, 255), random (0, 255), random (0, 255), 75);
  ellipseMode (CENTER);
  ellipse(width/2, height/2, 575*sin(breaker), 575*sin(breaker));

  popMatrix();


//    pushMatrix();
  //face
  noStroke();
  fill (240, 201, 138);
  ellipse (width/2, height/2, 300, 300);

  //eyes
  fill(255);
  ellipse (210, 280, 90, 90);
  ellipse(370, 270, 140, 140);
  fill (random (0, 255), random (0, 255), random (0, 255));
  ellipse (385, 250, 25, 25 );
  ellipse( 190, 275, 25, 25);

  //hair
  strokeWeight(4);
  stroke (0);
//  noFill();
  line (237, 166, 256, 131);
  line (283, 154, 302, 120 );
  line (326, 155, 346, 118);

  //mouth
  noStroke();
  fill (random (0, 255), random (0, 255), random (0, 255));
//  arc (width/2, 380, 120, 120, 0, PI+QUARTER_PI, CHORD);
  ellipse(width/2, 395, 120, 80);
  fill (221, 115, 93);
  ellipse (300, 430, 50, 20);

  //popMatrix();


//  pushMatrix();  
  //jawbreakers
  //fill(52, 174, 184, 95);
  //noStroke();
  //lights();
  //translate (x, y);
  //ellipse (x, y, 100, 100);


//  if (y > height)
  //{
    //y = height;
    //vy*= -.9;
  //}

//  if (x < 0)
  //{
    //x = 0;
    //vx*= -1;
  //}

//  if (x > width)
 // {
   // x = width;
   // vx*= -.9;
  //}
  //popMatrix();


}

