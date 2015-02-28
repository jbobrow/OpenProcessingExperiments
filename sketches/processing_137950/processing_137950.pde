
// STRESSING CIRCLES AND RELAXING SQUARES
// This application try to implement all most learnt in course.
// I don't know if it has a clear artistic propose but a like to think it some kind of stress-relax tool. 
// Try it and feel stressed while pressing the circle button and relaxed when pressing square button. And if you whats to save, be fast :-)
// See you in next Processing course

// AUDIO LIB
import ddf.minim.*;

Minim minim;
AudioPlayer noise;
AudioPlayer trans;

// VARS
int numElements=8;
int numX=0;
int numY=0;
int scaleX=0;
int scaleY=0;
int initPosX=0;
int initPosY=0;
int toolbarWidth=100;
PImage icoDisc;
int typeElement;
boolean pressing;
float randMax=5;
float randMin=-5;
String pressingElement;


float theta = 0.0;  // Start angle at 0
float amplitude = 150.0;  // Height of wave
float yvalues;  // Using an array to store height values for the wave
float Mx;

boolean showIntroImage=true;

PImage introImage;


//SETUP BLOCK
void setup() {

  //Window size
  size(800, 600);
  
  //Background color (first pallete array position)
  background(#000000);

  // Load intro image
  introImage = loadImage("intro_stress_relax.png"); 

  // INIT AUDIO LIB
  minim = new Minim(this);

  // LOAD AUDIO FILES
  noise  =minim.loadFile("102817__timbre__scary-rev-up-noise-2-bit-looped.wav"); 
  trans  =minim.loadFile("144027__kasa90__loopx.wav"); 

  // LOAD TO MEMORY ICON DISC
  icoDisc = loadImage("ico_disc.png");
}



//DRAW BLOCK
void draw() {
  
  if(showIntroImage){
    image(introImage, 0, 0);  
  }else{

  // deforming stroke with sound buffer size if pressing ellipse
  if (pressing && pressingElement=="ellipse") {
    for (int i = 0; i < noise.bufferSize() - 2; i++)
    {
      stroke(255);
      if (i%13==0) stroke(#00A4E8);        
      line(i, 400 + noise.left.get(i)*850, i+20, 400 + noise.left.get(i+1)*850);
    }
  }

  if (pressing && pressingElement=="rect") {
    for (int i = 0; i < trans.bufferSize() - 2; i++)
    {
      stroke(255);    
      line(i, 400 + trans.left.get(i)*400, i+2, 400 + trans.left.get(i+1)*400);
    }
  }    

  // blending effect
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);     
  fill(255);



  // preparing random effect 
  if (pressing) {
    randMax=randMax+0.5;
    randMin=randMin-0.5;
    theta += 0.05;
  }
  else {
    if (randMax>4) {
      randMax=randMax-1;
      randMin=randMin+1;
      yvalues=0;
    }
  }

  // number of elements on screen
  int widthElement=width/numElements+scaleX;
  int heightElement=height/numElements+scaleY;

  int numElementX=width/widthElement;
  int numElementY=height/heightElement;



  // Y (rows)
  for (int y=0;y<numElementY;y++) {

    // X (cols)
    for (int x=0;x<numElementX;x++) {
      switch(typeElement) {

      case 1:
        ellipse(x*widthElement+random(randMin, randMax)+widthElement/2+toolbarWidth, y*heightElement+random(randMin, randMax)+heightElement/2, widthElement/2, widthElement/2);
        break;

      case 2:
        yvalues= sin(theta)*amplitude;
        rect(x*widthElement+widthElement/2+toolbarWidth-25+random(randMin, randMax), y*heightElement+heightElement/2-25+yvalues, widthElement/2, widthElement/2);
        break;
      }
    }
  }

  // TOOLBAR

  // toolbar background
  noStroke();
  fill(70);
  rect(0, 0, toolbarWidth, height);  

  // button ellipse and button rect
  fill(255);
  ellipse(toolbarWidth/2, 50, 50, 50);
  rect(25, 100, 50, 50);

  image(icoDisc, 25, 500);
  
  }
  
}

// ON PRESSING MOUSE
void mousePressed() {

  // FIRST CLICK ON INTRO IMAGE
  if(showIntroImage){
    showIntroImage=false;
  }
  
  // CLICK ON ELLIPSE
  if (mouseX>25 && mouseX<75 && mouseY>25 && mouseY<75) {
    println("ellipse");
    pressingElement="ellipse";
    pressing=true;
    trans.rewind();
    trans.pause();     
    noise.rewind();
    noise.play(); 
    typeElement=1;
  }

  // CLICK ON RECT
  if (mouseX>25 && mouseX<75 && mouseY>100 && mouseY<150) {
    println("rect");
    pressingElement="rect";
    pressing=true;
    noise.rewind();
    noise.pause();     
    trans.rewind();
    trans.play();     
    typeElement=2;
  }  

  // CLICK ON DISC "SAVE"
  if (mouseX>25 && mouseX<75 && mouseY>500 && mouseY<550) {
    PImage img=get(100, 0, 700, 600);
    img.save("GhostPattern.jpg");
  }
}

// ON RELEASE MOUSE
void mouseReleased() {
  pressing=false;
  noise.pause();
  trans.pause();
}


