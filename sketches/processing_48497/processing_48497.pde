
// Cristina Mele
// Project 1
// December 20, 2011



PImage [ ] mustaches, name;

PImage welcome;

boolean start;
       

import processing.video.*;
Capture video;


final boolean ROTATE = false;

void setup()
{
  
   size( 800, 800 );
   video = new Capture( this, width, height, 15 ); 
   
   welcome = loadImage("welcome.jpg");

   PImage [ ] temp = {loadImage("wideLatin_mus.png"), loadImage ("avantGarde_mus.png"),loadImage("baskerville_mus.png"),
                      loadImage ("bauhaus_mus.png"), loadImage("cooperBlack_mus.png"), loadImage ("didot_mus.png"),
                      loadImage("lithosBold_mus.png"),loadImage ("mrsEaves_mus.png"),
                      loadImage ("zaphino_mus.png"),loadImage ("zapfDingbats_mus.png")}; 
    
   PImage [ ] temp2 = {loadImage("wideLatin_name.png"), loadImage ("avantGarde_name.png"),loadImage("baskerville_name.png"),
                      loadImage ("bauhaus_name.png"), loadImage("cooperBlack_name.png"), loadImage ("didot_name.png"),
                      loadImage("lithosBold_name.png"),loadImage ("mrsEaves_name.png"),
                      loadImage ("zaphino_name.png"),loadImage ("zapfDingbats_name.png")};                       
  
   mustaches = temp;
   name = temp2;
   
}


void draw( )
{  
  
  if (start == true)
  {
  background( 0 );
  
  drawWelcome();
  webCam();
  drawFrame();  
  drawMustaches();
 // saveImage();
  }
  else
  {
    drawWelcome();
  }

}

void drawWelcome()
{
  image(welcome, 0,0,width, height);
  if (mousePressed)
  {
    start=true;
  }
}


void webCam()
{
   if( video.available( )  )
  {
     video.read( );
  } 
  
  if ( ROTATE == true)
  {
    translate( width/2, height/2);
    rotate( radians( frameCount*.1));
    imageMode(CORNER);
    image( video, -width/2, -height/2, width, height);
  }
  else
  {
    imageMode(CORNER);    
    image( video, 0, 0, width, height);
  }
  
}


void drawFrame()
{
  noStroke();
  rect(0,height-150,width,height);
  rect(0,0,8,height);
  rect(0,0,width,8);
  rect(width-8,0,width,height);  
}



void drawMustaches()
{
  imageMode(CENTER);
  
  if (keyCode == '0')
  {
    image (mustaches[0], width/2, height-height/2);
    image (name[0], width/2, height-75); 
  }
  if (keyCode == '1')
  {
    image (mustaches[1], width/2, height-height/2); 
    image (name[1], width/2, height-75);
  }
  if (keyCode == '2')
  {
    image (mustaches[2], width/2, height-height/2); 
    image (name[2], width/2, height-75);
  }
  if (keyCode == '3')
  {
    image (mustaches[3], width/2, height-height/2); 
    image (name[3], width/2, height-75);
  }
  if (keyCode == '4')
  {
    image (mustaches[4], width/2, height-height/2);
    image (name[4], width/2, height-75); 
  }
  if (keyCode == '5')
  {
    image (mustaches[5], width/2, height-height/2); 
    image (name[5], width/2, height-75);
  }
  if (keyCode == '6')
  {
    image (mustaches[6], width/2, height-height/2); 
    image (name[6], width/2, height-75);
  }
  if (keyCode == '7')
  {
    image (mustaches[7], width/2, height-height/2); 
    image (name[7], width/2, height-75);
  }
  if (keyCode == '8')
  {
    image (mustaches[8], width/2, height-height/2); 
    image (name[8], width/2, height-75);
  } 
  if (keyCode == '9')
  {
    image (mustaches[9], width/2, height-height/2); 
    image (name[9], width/2, height-75);
  }   
  
}


void keyPressed ()
{
  if (keyCode == ' ')
  {
    save("mustachePhotobooth.jpg");
  }
}



