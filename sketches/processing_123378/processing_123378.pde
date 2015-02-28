
import hypermedia.video.*;
import java.awt.Rectangle;
import ddf.minim.*;


Minim minim;
AudioPlayer happysound, straightfacesound, frownsound, intensesound;


PImage img;
PImage img2;
PImage img3;
PImage img4;


OpenCV opencv;

happyface red;  //declare object

void setup() {
    size(700, 680);
    

minim = new Minim(this);

happysound = minim.loadFile("happysound.mp3");
straightfacesound= minim.loadFile ("straightfacesound.mp3");
frownsound = minim.loadFile("frownsound.mp3");
intensesound = minim.loadFile("intensesound.mp3");

  

  img = loadImage("smile.png");
 imageMode(CENTER);
 img2 = loadImage("straightface.png");
 img3 = loadImage ("frown.png");
 img4 =loadImage ("intenseface.png");


  //Load Open CV
  opencv = new OpenCV(this);
  opencv.capture( width, height );
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );    // load the FRONTALFACE description file

  //declare new object
  red = new happyface(150, 500, 500, 130);
}

void stop()
{
happysound.close();
  straightfacesound.close();
  frownsound.close();
 intensesound.close();
  super.stop();
}

void draw() {
  //Open CV
  
  opencv.read();
  
  // detect anything ressembling a FRONTALFACE
  Rectangle[] faces = opencv.detect();
  
  //Map face size to number of faces detected
  float facesize = map(faces.length, 0, 4, 500, 700);
  float facecolor = map(faces.length, 0, 4, 255, 0);
  float pupil = map (faces.length, 0, 4, 130, 2); 
  
  

  red.display(facecolor, facesize, facesize, pupil);
 
  if( faces.length < 1){
     image(img, 350,530);
     happysound.play();
     
   } 
   else {
     happysound.pause();
   }
   
   if ((faces.length >= 1) && (faces.length<3)) {
     
       image(img2, 350,530);
       straightfacesound.play();
   
     } 
     else{
      straightfacesound.pause();
     }
    
  if ((faces.length > 2) && (faces.length <= 4)){
    
       image (img3, 350, 530);
       frownsound.play();
       
   }
   else{
     frownsound.pause();
   }
   
   if (faces.length > 4) {
     image (img4, 350, 530);
     intensesound.play();
     
   }
   else{
     intensesound.pause();
   }
     

}




class happyface {

  float eyeX1;
  float eyeY1;
  float eyeX2;
  float eyeY2;

  float c;
  float x;
  float y;
  
  float pupil;


  happyface(float inC, float inX, float inY, float pupil) {
    c = inC;
    x = inX;
    y = inY;
    pupil = pupil;
  }

  void update() {
    c--;
  }

  void display(float inC, float inX, float inY, float pupil) {

    c = inC;
    x = inX;
    y = inY;
    pupil = pupil;
    

    background(204);
    ellipseMode(CENTER);

    //Underneath face
    fill(196, 232, 255);
    ellipse (width/2, 350, x, y); 

    //Draw Top Face
    fill(255, c, c);
    ellipse (width/2, 350, x, y); 

    //Draw left eye
    fill(255);
    ellipse(width/3, height/2, x/2.5, y/2.5); //Left Eye 

    //Draw left Pupil
    fill(0);
    float eyeangleSide = random(0, width);
    float eyeangleUpDown = random(0, height);
    eyeX1 = map(eyeangleSide, 0, width - 1, width/3 - 30, width/3 + 65); //position
    eyeY1 = map(eyeangleUpDown, 0, height - 1, height/2 - 40, height/2 + 50);
    ellipse(eyeX1, eyeY1, pupil, pupil); //size of pupil

    //Draw Right Eye
    fill(255);
    ellipse(3*width/4, height/2, x/2.5, y/2.5); //Right Eye


    //Draw Right Pupil
    fill(0);
    eyeX2 = map(eyeangleSide, 0, width - 1, 3*width/4 - 30, 3*width/4 + 65); //position
    eyeY2 = map(eyeangleUpDown, 0, height - 1, height/2 - 40, height/2 + 50);
    ellipse(eyeX2, eyeY2, pupil, pupil); //size of pupil
  }
}





