
//Nathan Trevino  

float SecondStrokeWeight; // Values from 0 - 59 ---- counts the seconds.
float MIL; //valuse from 0 - 999 ''milliseconds.
float M;  // Values from 0 - 59 ''minutes.
float H;    // Values from 0 - 23 ''hours.
float joint, newjoint1, newjoint2, newjoint3, newjoint4, newjoint5, newjoint6, newjoint7; //vertexes for the plant segments
float HeightVariable; //this is a map of the Y value of the screen.
float leafX, leafY;
float leafSpeed;
float cloudX;
PImage tree;
PImage cloud;


//Noise variables for leaf
float leafXoff = 0.1;

//Tree variables
int numApples;





void setup() {

  size (600, 600);
  smooth();
  strokeJoin(ROUND);
  MIL = millis(); 
  M  = minute();
  H  = hour();
  joint = random( 80, 110);
  newjoint1 =random( 80, 110);
  newjoint2 =random( 80, 110);
  newjoint3 =random( 80, 110);
  newjoint4 =random( 80, 110);
  newjoint5 =random( 80, 110);
  newjoint6 =random( 80, 110);
  newjoint7 =random( 80, 110);
  HeightVariable = map ( height, 0, 400, 1, 10);

  //Leaf variables for minutes.
  leafX = 50;
  leafY = 0;
  leafSpeed = 1.5;

  //Tree variables for hours.
  tree = loadImage ("tree.png");
  imageMode(CENTER);
  numApples = 0;
  
  //cloud
  cloud = loadImage("cloud.png");
  cloudX = -150;
}



void draw() {


  backgrounder();
  sapling();
  trees(0, 0);
  trees( 100, 0);
  trees( 200, 20);
  trees( 300, 0);
  trees( 400, 10);
  trees( 500, 0);
  leaves();
}


void sapling() 
{
  SecondStrokeWeight = second()/10; 

  stroke(100, 200, 50);

  strokeWeight (SecondStrokeWeight);
  line ( 100, height, 100, height-20);
  strokeWeight (SecondStrokeWeight);
  line ( 100, height-20, joint, height-40 );


//Segments
  if ( second() > 20 )

  {  
    stroke(100, 200, 50);
    strokeWeight (SecondStrokeWeight);
    line(joint, height-40, joint, height - 60);
  }
  if ( second() >25 )
  {
    stroke(100, 200, 50);
    strokeWeight (SecondStrokeWeight);
    line(joint, height-60, joint, height - 80);
  }
  if ( second() > 32 )

  {
    stroke(100, 200, 50);
    strokeWeight (SecondStrokeWeight);
    line(joint, height-80, newjoint1, height - 100);
  }
  if ( second() > 37 )
  {
    stroke(100, 200, 50);
    strokeWeight (SecondStrokeWeight);
    line(newjoint1, height-100, newjoint2, height - 120);
  }
  if ( second() > 40 )
  {
    stroke(100, 200, 50);
    strokeWeight (SecondStrokeWeight);
    line(newjoint2, height-120, newjoint3, height - 140);
  }

  if ( second() > 42 )
  {
    stroke(100, 200, 50);
    strokeWeight (SecondStrokeWeight);
    line(newjoint3, height-140, newjoint4, height - 160);
  }
  if ( second() > 45 )
  {
    stroke(100, 200, 50);
    strokeWeight (SecondStrokeWeight);
    line(newjoint4, height-160, newjoint4, height - 180);
    if ( second() > 50 )
    {
      stroke(100, 200, 50);
      strokeWeight (SecondStrokeWeight);
      line(newjoint4, height-180, newjoint5, height - 200);
    }
    if ( second() > 52 )
    {
      stroke(100, 200, 50);
      strokeWeight (SecondStrokeWeight);
      line(newjoint5, height-200, newjoint5, height - 220);
    }
    if ( second() > 55 )
    {
      stroke(100, 200, 50);
      strokeWeight (SecondStrokeWeight);
      line(newjoint5, height-220, newjoint6, height - 240);
    }
    if ( second() > 58 )
    {
      stroke(100, 200, 50);
      strokeWeight (SecondStrokeWeight);
      line(newjoint6, height-240, newjoint7, height - 260);
    }
  }
}

void leaves() //based on minutes
{
  if (second() > 51 )
  {
    leafXoff = leafXoff - .02;
    float leafNoise = noise(leafXoff);

    leafX = leafX  + leafNoise;
    leafY = leafY + leafSpeed;
    strokeWeight(1);
    stroke ( 150, 100, 50);
    fill (100, 200, 50);
    ellipse (leafX, leafY, 70, 20);
  }
}

void trees(int ix, int iy) //hours

{

  pushMatrix();
  translate(ix, iy);
  image (tree, 50, 350);
  popMatrix();

  //apples based on hours

  for (int appleX = 0; appleX < 600; appleX+= 25)
  {
    noStroke();
    fill (255);
    ellipse (appleX, 300, 20, 20);
  }

  numApples = hour();
  noStroke();
  fill (255, 0, 0);
  ellipse (numApples*25, 300, 20, 20);
}


void backgrounder()
{
  float landScapeY = 400;
  noStroke();
  fill ( 176, 252, 236);
  rect (0, 0, 600, 600);
  while ( landScapeY <= 600 )

  {
    landScapeY += 20;

    fill( 165, 120, 83, 100 );
    rect( 0, landScapeY, 600, 90);
  }
  
  //cloud
  image( cloud, cloudX, 100);
  
  if( cloudX < 1000)
  {
    cloudX += .5;
  }
  else if (cloudX >= 1000)
  {
    cloudX = -300;
  }
  
}


