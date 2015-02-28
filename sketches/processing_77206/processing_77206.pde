
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/61275*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//--------------------------------------------------------
//  sketch:  SpaceFlowers.pde
//  version: 1.0   2012-10-28 
//---------------------------------------------------------
/** 
Demonstrate how fast it is possible to move, resize and rotate Sprites.
Move mouse to change motion and rotation speed.
Press mouse button to rotate sprites.
*/
PImage bgImage;     // background image

PVector[] position; // make circles with a location loc
float[] radius;     // circle radius [rad]
PImage[] pic;       // picture references

int imagesNr = 5;   // number of loaded pictures
PImage[] images;    // loaded pictures
int num = 128;      // max. number of flying objects
float rate = 1.05;  // circles appear to be magnified by multiplication factor rate

//---------------------------------------------------------
void setup()
{
  size(800,600, P2D);
  bgImage = loadImage("space.jpg");
  bgImage.resize(width+2, height+2);
  // initialize data arrays
  position = new PVector[num];
  radius = new float[num];
  pic = new PImage[num];
  images = new PImage[imagesNr];
  images[0] = loadImage("Flower1.png");
  images[1] = loadImage("Flower2.png");
  images[2] = loadImage("Flower3.png");
  images[3] = loadImage("Flower4.png");

  createSprites(num, images);

  for(int ni=0; ni<num; ni++)
  {
    position[ni] = new PVector();
    radius[ni] = 0.0;
    pic[ni] = images[int(random(0,imagesNr-1))]; 
  }
  for(int ni=0; ni<num; ni++)
    createNewSprite(ni);
  noStroke();
  fill(255,88);
//  frameRate(120);  // only for testing
  mouseY = 0;
}
//---------------------------------------------------------
void draw()
{
  // the rate of magnification is user controlled
  rate = 1.0 + 0.01*(height-mouseY)/height;
  //println (mouseY + " r="+nf(rate,0,2));
  image (bgImage,-1,-1);   // draw background
  translate(width*0.5, height*0.5);
  for(int ni=0; ni<num; ni++)
  {
    // draw the circle
    PVector ls = position[ni];
    float r = radius[ni];
    //ellipse(ls.x, ls.y, 2*r, 2*r);  // only for testing
    
    pushMatrix();
      translate (ls.x-r, ls.y-r);
      if (mousePressed)
      { translate (r,r);
        rotate (frameCount*-0.01);
        translate (-r,-r);
      }
      image (pic[ni], 0, 0, 2*r, 2*r);
    popMatrix();
    
    // find the circles location and rotate it at a user defined speed
    float angle = atan2(position[ni].y, position[ni].x) + (mouseX-width*0.5)*0.00005;
    // find the circles location and expand it at the magnification rate
    float distance = mag(position[ni].y, position[ni].x)*rate;
    // recombine the location from polar to cartesian coordinates
    position[ni] = new PVector(distance*cos(angle), distance*sin(angle));
    // expand the circle size by the magnification rate
    radius[ni] *= rate;
    // if the circle has grown to be not visible on the screen
    if (position[ni].mag() -radius[ni] > mag(width/2,height/2))
    {
      // reset the circle to be a new one
      createNewSprite(ni);
    }
  }
  text (round(frameRate) + " fps", 20-width/2, 20-height/2);
}
//---------------------------------------------------------
void keyPressed()
{
  if (key == 's') save ("spaceFlowers.png");
}
//---------------------------------------------------------
void createNewSprite(int i)
{
  // this method makes a new circle that does not overlap any other circle
  // only make 10000 attempts, else give up
  int attempt = 0;
  // stop makeing attempts when a good circle is found
  boolean solution = false;
  while(attempt<10000 && solution==false)
  {
    attempt++;
    // make a circle so small it isnt visible
    float newRad = random(0, 0.2);
    // generate a circle very close to the center of the screen
    float distance = random(0, 0.4);
    // do not make a circle that envelops the center of the screen
    // because it would expand to envelop the entire screen
    if(distance > newRad)
    {
      // make a circle with uniform probability density over angular coordinate
      float angle = random(0,TWO_PI);
      // combine the location from polar to cartesian coordinates
      PVector newPos = new PVector(distance*cos(angle),distance*sin(angle));
      // test to see if the new circle is on top of any of the existing ones
      boolean intersection = false;
      for(int j=0; j<num; j++)
      {
        // if the circle being tested is its self don't do the test
        if(i!=j)
        {
          // find the relative location of two circles
          PVector delta = PVector.sub(newPos, position[j]);
          // if the magnitude of their relative location is less than
          // the sum of their radiuses
          if(delta.mag() < newRad +radius[j])
          {
            // then they are overlapping
            intersection = true;
          }
        }
      }
      // if the new circle is not overlaping with any of the old ones
      if(!intersection)
      {
        // stop making attempts
        solution = true;
        // set the circle to the new circle params
        position[i] = newPos.get();
        radius[i] = newRad;
      }
    }
  }
  // if no solution is found tell me
  if(!solution) println("no solution "+i);
}


