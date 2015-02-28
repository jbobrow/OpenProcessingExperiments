
import hypermedia.video.*;
import java.awt.Rectangle;


OpenCV opencv;

PImage a, speecha,speechb,speechc, bkimage; //start image class
PFont fontA; //start font class


String []texts = {"1st","2nd","3rd","4th","5th", "6th","7th", "8th", "9th", "10th"};//texts to be displayed on to of the faces

Rectangle[] faces;//area of face detection
color[ ] col;//variable color

void setup() {

  size(640,480);
  
  opencv = new OpenCV( this );
  opencv.capture( width, height );                   // open video stream
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT_TREE );// load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"

  
  ///load images//
  speecha = loadImage("speecha.png");
  speechb = loadImage("speechb.png");
  speechc = loadImage("speechc.png");
  bkimage = createImage(width, height, RGB);//empty later copy background
  ///load font////
  fontA = loadFont("Ziggurat-HTF-Black-32.vlw");//load font
  textFont(fontA, 28);//font size


  //initialize color//
  col = colint( );
}

void draw() {
  vid(); 
  detection();
  noiseFilter();
  interlaceFilter();
  frame();
  info();
}


void vid()
{
  opencv.read();//grab a frame
  opencv.convert( GRAY);//easier recognition
  //opencv.flip( OpenCV.FLIP_HORIZONTAL);

  opencv.brightness( 45 );
  opencv.contrast(35);

  // display the image video feed
  image( opencv.image(), 0, 0);
}

void detection()
{
  //******************detection*************/
  faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
  for( int i=0; i<faces.length; i++ ) {
    
    //rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); //draw rect around face
    
    noStroke();
    area(faces[i].x, faces[i].y, faces[i].width, faces[i].height);

    fill(col[i]);//font color
    text(texts[i],faces[i].x+faces[i].width/2, faces[i].y-faces[i].height/3);//countin people


    /*****proximity method****/
    if (faces[i].width < 130 && faces[i].width > 10) {
      image(speecha,faces[i].x+faces[i].width/1.5, faces[i].y-faces[i].height/2, faces[i].width, faces[i].height/2);
    }
    if (faces[i].width > 131 && faces[i].width < 250) {
     image(speechb,faces[i].x+faces[i].width/1.5, faces[i].y-faces[i].height/2, faces[i].width, faces[i].height/2);
    }  
    if (faces[i].width > 251 && faces[i].width < 400) {
      image(speechc,faces[i].x+faces[i].width/1.5, faces[i].y-faces[i].height/2, faces[i].width, faces[i].height/2);
    } 

    if (keyCode == 'S' || keyCode == 's') {   
      /******face swapping*******/
      image(opencv.image(OpenCV.MEMORY),0,0);//save image in memory
      opencv.remember();

      /*****Eyes*******/
      copy(faces[i].x+faces[i].width/10,faces[i].y+faces[i].height/5, faces[i].width-faces[i].width/10, faces[i].height/3,faces[0].x+faces[i].width/15,faces[0].y+faces[i].height/4, faces[0].width, faces[0].height/4);
      /*****FACE*******/
      //copy(faces[i].x+faces[i].width/5,faces[i].y, faces[i].width-faces[i].width/4, faces[i].height, faces[0].x+faces[0].width/5,faces[0].y, faces[0].width-faces[0].width/4 , faces[0].height);

      fill(col[i]);
      text("CLONING...", faces[i].x, faces[i].y-.5*faces[i].height);
    }     
    println(faces);   //print faces[i] pos.
  }
}

void  area(int x1, int y1, int w, int h)
{
  
 int ds = 500;// down sampling 
 
 if (keyCode == 'r' || keyCode == 'R')
{ 
  image(opencv.image(OpenCV.MEMORY),0,0);//save image in memory
  opencv.remember();
  
  bkimage.copy(0,0,width,height,0,0,width,height);//copy
 
  bkimage.loadPixels();
  for(int i = 0; i < pixels.length; i ++)
  {
  bkimage.pixels[i] = pixels[i]/ds;//ds
  bkimage.pixels[i] = color(blue(pixels[i]/ds), green(pixels[i]/ds), red(pixels[i]/ds));
  }
   
   bkimage.updatePixels();
   image(bkimage,x1,y1,w,h);
}
}

///random colors initializer///
color [ ] colint( )
{
  color[ ] tempcol = new color [texts.length];
  for(int i = 0; i < tempcol.length; i++)
  {
    int redC = int (random(100,250));
    int greenC = int(random(100,250));
    int blueC = int(random(100,250)); 
    tempcol [ i ] = color (redC, greenC, blueC);
  }
  return tempcol;
}

////noise video filters///
void noiseFilter() {
  int dimension = (width*height);

  loadPixels();
  for (int i = 0; i < dimension; i += random(1,5)) { 
    pixels[i] = color(red(pixels[i]), green(pixels[i]), min(255, blue(pixels[i]) + random(0, 50)));
  }
  updatePixels();
}

///video effect//
void interlaceFilter() {
  noStroke();
  for (int i = 0; i < height; i += 6) {
    fill(100, 100, 255, random(10, 30));
    rect(0, i, width, 2);
  }
}

//
void frame() {
  noStroke();
  fill(0, 0, 0, 220);
  rect(0, 0, width - 10, 10);
  rect(0, 10, 10, height);
  rect(10, height - 10, width - 10, 10);
  rect(width - 10, 0, 10, height);
}

void info()
{
  fill(250,10,10,80);
  text("Press 's' to swap eyes", width/10, height/10);
  text("Press 'r' to cover face", width/10, height/6);
  
}
///stop opencv object when closing app
public void stop() {
  opencv.stop();
  super.stop();
}


