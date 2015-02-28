
//importing minim libraries for enabling sound
import ddf.minim.*;
//including PImage for the background image
PImage stars;
//declaring color palettes
color[] palette = {#FFFFFF, #FFF92E, #7EFCFF, #3DBC53, #A5FFB4, #000000};
//Global variables
float x = 10;
float y = 10;
int number = 70;
float newx[] = new float[number];
float newy[] = new float[number];
Minim minim;
AudioSample star;
//setup code block for initialization
void setup()
{
 size(800,600);
 //loading the background image
 stars = loadImage("stars.jpeg");
 minim = new Minim(this);
 //loading the sound file
 star = minim.loadSample("star.mp3");
 
}

//draw code block starts here

void draw()
{
  //displayint the background image
  image(stars,0,0,800,600);

      //setting up the twinkling of stars effect.
      float rnd = random(0,5);
      float r = random(1,3);  
      //setting random stroke weight, stroke, and fill color
      strokeWeight(int(rnd));   
      stroke(palette[int(rnd)]);
      fill(palette[int(rnd)]);
      x=random(width);
      y=random(height);
      //setting random co-ordinates and radius for the ellipse
      ellipse(x,y,r,r);
      ellipse(x+200,y+200,r,r);
      //setting up the cursor tail
      for(int i=1; i<number; i++)
     {
        newx[i-1] = newx[i];
        newy[i-1] = newy[i];
     } 

   //adding the new values
      newx[number-1] = mouseX;
      newy[number-1] = mouseY;  

    //seting up the ellipse
      for(int i=0; i<number; i++)
      {
        ellipse(newx[i], newy[i], i/2, i/2);
      }

}

//creating a sound effect for every mouse press event
void mousePressed()
{
 star.trigger(); 
 
}

//saving the screenshot
void keyReleased()
{
  if (key == 's' || key == 'S') saveFrame("screen.png");
  
}

