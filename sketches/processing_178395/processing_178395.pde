
//This piece of code creates a dynamic star which is pivoted in the centre of the screen
//and rotates creating a dynamic pattern with different colors. It loads 4 images and the associated text
//My theme in this case is Peace. 
/*
 1. Keyboard events 
      - if 'a' or 'A' key is pressed, the canvas is cleared and the background color is changed. User can start the sketch again using the mouse pressed event
      - if 's' or 'S' key is pressed, the current frame is saved as frame.jpg
2. The screen is blank at start and static once the mouse key is released


*/
//Global Variables
float angle = 1;
float fillCol = 0;  
int a = 1;
int c = 1;
int d = 1;
PFont myFont;
PImage img_sunrise;
PImage img_birds;
PImage img_waves;
PImage img_dew;
PImage img_quote;
int x_birds = 0;
int y_birds = 0;
int x_waves = 0;
int y_waves = 0;
int x_dew = 0;
int y_dew = 0;


int imgWidth= 904;
int imgHeight = 628;
boolean b_rise = false;
int y_rise = 0;
int x_rise = 0;
 //setup()
void setup()
{
   // max canvas size
    size(1000, 720);
    img_sunrise = loadImage("sunrise.JPG");
    img_birds = loadImage("birds.JPG");
    img_waves = loadImage("waves.JPG");
    img_dew = loadImage("dew.jpg");
    img_quote = loadImage("Quote.jpg");
    colorMode(HSB, 360, 100, 100); 
    myFont = loadFont("MonotypeCorsiva-48.vlw");
    textFont(myFont);
    fill(#FFFFFF);
    textSize(30);
}
   
void draw()
{
  
    //if (mousePressed)
    {
     //  background(102);
     

      //increment the angle gradually 
       angle += 2;
       
      pushMatrix();
      fillCol = angle;
      if (angle > 360)
      {
         fillCol = angle % 360;
      }
      
      
      fill(fillCol, angle, 300);
      translate(width*0.5, height*0.5);
      rotate(angle / 200.0);
      star(0, 0, angle, 7, 5); 
      popMatrix();


//SUNRISE
if (!b_rise)
{
      x_rise = 1000/2 -  a * 10;
      if (x_rise < 0)
      x_rise = 0;
       
      y_rise = 720/2 - a * 5;
       
      if (y_rise < 0)
      y_rise = 0;
      
      if (a < 100)
         a+=1;
      
   
     if ( x_rise == 0 || y_rise == 0)
      {
        b_rise = true;
      }
}
      image(img_sunrise, x_rise  ,y_rise - 20, (imgWidth/3)    , imgHeight/3);
        text("Watching the sunrise on a winter morning ", x_rise , y_rise + imgHeight/3 + 10)  ;

// BIRDS
    if (b_rise)
    {
      a =1;
      x_birds = 1000/2 +  a * 10;
      if (x_birds  > 1000 - imgWidth/3)
        x_birds = 1000 - imgWidth/3;
       
      y_birds = 720/2 - a * 5;
       
      if (y_birds < 0)
      y_birds = 0;
      image(img_birds, 1000 - (imgWidth/3)  ,y_rise - 20, (imgWidth/3)    , imgHeight/3);
      
      if (a < 100)
         a+=1;
      
  text("Hearing the chirping of birds ", x_birds + 150, y_rise + imgHeight/3 + 10)  ;


    }
    
       
 // WAVES
      c = 1;
      x_waves = 1000/2 -  c * 10;
      if (x_waves < 0)
      x_waves = 0;
       
      y_waves = 720/2 + c * 10;
       
       if (y_waves > 0)
      y_waves = 720 - imgHeight/3;
      
      image(img_waves, 0  ,y_waves - 10, (imgWidth/3)    , imgHeight/3);
      
      if (c < 100)
         c+=1;
      
  text("Watching the waves crash on the sands", 0, y_waves - 30 )  ;

 
    }
    
    //DEW
      d =1;
       x_dew = 1000/2 +  d * 10;
      if (x_dew  > 1000 - imgWidth/3)
        x_dew = 1000 - imgWidth/3;
       
      y_dew = 720/2 + d * 5;
       
      if (y_dew > 0)
      y_dew = 720 - imgHeight/3;
      image(img_dew, 1000 - (imgWidth/3)  ,y_dew - 10, (imgWidth/3)    , imgHeight/3);
      
      if (d < 100)
         d+=1;
      
  text("Feeling the dew beneath your feet ", x_dew + 100, y_dew - 30)  ;

 textSize(40);
     text("PEACE   IS ", 1000/2 - 80 , 720/2 + 50)  ;
      textSize(30);
     image(img_quote, 50, 2);
}

//function draws the star 
void star(float x, float y, float radius1, float radius2, int npoints) 
{
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
  
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) 
    {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
     
      vertex(sx, sy);
      sx = x + cos(a + halfAngle) * radius1;
      sy = y + sin(a + halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape();
}

void keyReleased()
{
  //clear the background and change the background color
  if (key == 'a' || key == 'A')
  {
    background(random(360), random(100), random(100));
    angle = 1;
  }
  
  //save current frame
  if (key == 's' || key == 'S')
  {
    saveFrame("frame.jpg");
  }
  
}



