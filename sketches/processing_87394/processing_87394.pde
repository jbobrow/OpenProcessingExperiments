
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;

PImage[][][] img;
boolean isReverse = false;
int iters = 15;

float Ystart = 600;
float yScale = 140;
 
void  setup() 
{
  // Sketch up
  size(800, 800);
  noStroke();
   
  // Load the audio file and play
  minim = new Minim(this);
  player = minim.loadFile("deadmau5 - maths - YouTube.mp3");
  player.play();
  
  //kaledisoscope
  img = new PImage[iters][2][2];
  for (int i = 0; i < iters; i++)
  {
    img[i][0][0] = loadImage("Sequence 1 32.png");
    img[i][0][1] = loadImage("Sequence 1 32 vflip.png");    
    img[i][1][0] = loadImage("Sequence 1 32 h.png");        
    img[i][1][1] = loadImage("Sequence 1 32 hflip.png"); 
   
    for (int h=0; h<2; h++) 
    {
      for (int f=0; f<2; f++) 
      {
        img[i][h][f].resize((int)img[i][h][f].width/(i+1),
                            (int)img[i][h][f].height/(i+1));
        img[i][h][f].loadPixels();
      }
    } 
  }
  loadPixels();
  background(0);
}
 
void draw() 
{
  fill(0);
  //KALEIDOSCOPE
  int stringNum[][][] = new int[iters][2][2];
  
  isReverse = frameCount % (img[0][0][0].width*2) > img[0][0][0].width ? true : false;
  for (int i=0; i<iters; i++) 
  {
    for (int h=0; h<2; h++) 
    {
      for (int f=0; f<2; f++) 
      {      
        stringNum[i][h][f]=round(frameCount*2);      
        if (h==0) 
        {
          if(f==1)
          stringNum[i][h][f]+=100; 
          stringNum[i][h][f]%=img[i][h][f].height;
        }
        else 
        { 
          if(f==1)
          stringNum[i][h][f]+=200;          
          stringNum[i][h][f]%=img[i][h][f].width; 
        }
      }
    }
  }

  if (!isReverse) 
  {
    for (int j=0; j<height/8; j++) 
    {
      for (int i=0; i<img[0][0][0].width; i++) 
      {    
        pixels[i+j*img[0][0][0].width]+=img[0][0][0].pixels[i+(stringNum[0][0][0]+j)%img[0][0][0].height*img[0][0][0].width]-1000;
      }
    }
    
    for (int j=0; j<height/8; j++) 
    {
      for (int i=0; i<img[0][0][1].width; i++) 
      {    
        pixels[i+j*img[0][0][1].width]+=img[0][0][1].pixels[i+(img[0][0][1].height-stringNum[0][0][1]+j)%img[0][0][1].height*img[0][0][1].width];
      }
    }
  
    for (int j=0; j<width; j++) 
    {
      for (int i=0; i<img[0][1][0].height; i++) 
      {    
        pixels[i*width+j]+=img[0][1][0].pixels[i*img[0][1][0].width+(stringNum[0][1][0]+j)%img[0][1][0].width];
      }
    }
    
    for (int j=0; j<width; j++) 
    {
      for (int i=0; i<img[0][1][1].height; i++) 
      {    
        pixels[i*width+j]+=img[0][1][1].pixels[i*img[0][1][1].width+(img[0][1][1].width-stringNum[0][1][1]+j)%img[0][1][1].width];
      }
    }
  
  } else {

    for (int j=0; j<height/8; j++) 
    {
      for (int i=0; i<img[0][0][0].width; i++) 
      {    
        pixels[i+j*img[0][0][0].width]-=img[0][0][0].pixels[i+(stringNum[0][0][0]+j)%img[0][0][0].height*img[0][0][0].width]-1000;
      }
    }
    
    for (int j=0; j<height/8; j++) 
    {
      for (int i=0; i<img[0][0][1].width; i++) 
      {    
        pixels[i+j*img[0][0][1].width]-=img[0][0][1].pixels[i+(img[0][0][1].height-stringNum[0][0][1]+j)%img[0][0][1].height*img[0][0][1].width];
      }
    }
  
    for (int j=0; j<width; j++) 
    {
      for (int i=0; i<img[0][1][0].height; i++) 
      {    
        pixels[i*width+j]-=img[0][1][0].pixels[i*img[0][1][0].width+(stringNum[0][1][0]+j)%img[0][1][0].width];
      }
    }
    
    for (int j=0; j<width; j++) 
    {
      for (int i=0; i<img[0][1][1].height; i++) 
      {    
        pixels[i*width+j]-=img[0][1][1].pixels[i*img[0][1][1].width+(img[0][1][1].width-stringNum[0][1][1]+j)%img[0][1][1].width];
      }
    }
  }  
  updatePixels();
  //END KALEIDOSCOPE
  
  //WHITE CIRCLE IN MIDDLE
  float dimension = player.mix.level() * 600;

  noFill();
  smooth();
  stroke(0);
  strokeWeight(5);
  ellipse  ( width / 2, height / 3, dimension, dimension);
  
  //read and store the spectrum
  float [] buffer = player.mix.toArray();
  //width of the rectangles
  float step = ceil((float)width/buffer.length);
  //END RECTANGLE
  
  
  //SOUND SPECTRUM AT BOTTOM
  /* For each item r is in one buffer drawn rectangle. The result 
  is connected by the buffer*/
  for  ( int  i = 1; i <buffer.length; i++) {
     
    // Positions for determining ¼ r all 4 point
    float  x1 = (i-1) * step;
    float  x2 = i * step;
    float  y1 = Ystart + buffer [i-1] * yScale;
    float  y2 = Ystart + buffer [i] * yScale;
     
    // Define a fill color
    float  h = (buffer [i-1] + buffer [i]) / 2;
    fill  (h * random(255), random(255), random(255));
     
    // Draw a rectangle
    beginShape  (QUADS);
    vertex  (x1, y1);
    vertex  (x2, y2);
    vertex  (x2, height );
    vertex  (x1, height );
    endShape  ();
    //END SOUND SPECTRUM
  }
}
  
    //PLAYER CONTROLS
    void keyPressed()
    {
      if((key == 'P') || (key == 'p')) {
      if (player.isPlaying())
      {
        player.pause();
      }
      else
      {
        player.play();
      }
    }
    }

