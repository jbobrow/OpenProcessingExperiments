

/*
MOUSE
position x : width and height of the ellipse
position y : color stroke of the ellipse when/while c key is used/pressed
press : draw
release : stop drawing (no posibility to start it again)

KEYS
c : stroke color, depending on the mouse Y position while c key is pressed
s : save png

*/




//Import 'Minim' library files
import ddf.minim.*;


//Declare global variables
float angle;
color strokeColor = color(360);
PImage img1, img12, img2, img22, img3, img32, img4, img42, img5, img52;
PFont f1, f2;

Minim minim;
AudioPlayer sound1;
AudioPlayer sound2;
AudioPlayer sound3;
AudioPlayer sound4;
AudioPlayer sound5;

boolean buttonOn1;  
boolean buttonOn2;
boolean buttonOn3;
boolean buttonOn4;
boolean buttonOn5;

//Setup()
void setup() {
  size(768, 720);
  frameRate(30);
  
  //Load the images from file 
  img1 = loadImage("sounds from the street.png");
  img12 = loadImage("sounds from the street Black&White.png");
  img2 = loadImage("walking at Villa Savoye.png");
  img22 = loadImage("walking at Villa Savoye Black&White.png");
  img3 = loadImage("jazz in Paris.png");
  img32 = loadImage("jazz in Paris Black&White.png");
  img4 = loadImage("Firminy.png");
  img42 = loadImage("Firminy Black&White.png");
  img5 = loadImage("saxophonist at Louvre.png");
  img52 = loadImage("saxophonist at Louvre Black&White.png");
  
  //Load text
  f1 = loadFont( "CourierNewPS-BoldMT-150.vlw" ); 
  f2 = loadFont( "CourierNewPS-BoldMT-50.vlw" );
  //textLeading(20);  // Set leading to 30
  
  buttonOn1 = false;
  buttonOn2 = false;
  buttonOn3 = false;
  buttonOn4 = false;
  buttonOn5 = false;
   
  //Load audio file from HDD
  minim = new Minim(this);
  sound1 = minim.loadFile("sounds from the street.mp3");
  sound2 = minim.loadFile("walking at Villa Savoye.mp3");
  sound3 = minim.loadFile("jazz in Paris.mp3");
  sound4 = minim.loadFile("tourists' voices at Firminy.mp3");
  sound5 = minim.loadFile("saxophonist at Louvre.mp3");
   
  sound1.loop();
  sound1.mute(); 
  sound2.loop();
  sound2.mute(); 
  sound3.loop();       
  sound3.mute();
  sound4.loop();       
  sound4.mute();
  sound5.loop();       
  sound5.mute();
}


//draw()
  void draw() {
  //white rectangle with transparency used as background
  noStroke();
  colorMode(HSB, 360, 150, 150, 150);
  fill(100, 10);
  rect(0, 0, width, height);
  
  //spinning ellipses
  noFill();
  ellipseMode(CENTER);
  if (mousePressed) {
    pushMatrix();
    translate(mouseX, mouseY);
    stroke(strokeColor);
    for (int i = 1; i < 30; i++) {
      rotate(radians(angle/i));
      ellipse(0, 0, 20*i+mouseX-(width-width/5)/2, 10*i+mouseX-(width-width/5)/2);
    }
    popMatrix();
  }
  angle+=0.75;
  
  //Display the images  
  int img1width = height/5 * img1.width/img1.height;
  image(img1, width-img1width, 0, img1width, img1.height);
  
  int img2width = height/5 * img2.width/img2.height;
  image(img2, width-img2width, 2+img2.height, img2width, img2.height);
    
  int img3width = height/5 * img3.width/img3.height;
  image(img3, width-img3width, 2*img2.height+4, img3width, img3.height);
  
  int img4width = height/5 * img4.width/img4.height;
  image(img4, width-img4width, 3*img4.height+6, img4width, img4.height);
  
  int img5width = height/5 * img5.width/img5.height;
  image(img5, width-img5width, 4*img5.height+8, img5width, img5.height);
  
  
  //Control the loading of the color or black and white images
  //Control img1, img12
  if (buttonOn1) { }
    else { int img12width = height/5 * img12.width/img12.height;
    image(img12, width-img12width, 0, img12width, img12.height);
        }  
    
  //Control img2, img22
  if (buttonOn2) { }
    else { int img22width = height/5 * img22.width/img22.height;
           image(img22, width-img22width, 2+img22.height, img22width, img22.height);
        }      
       
  //Control img3, img32
  if (buttonOn3) { }
    else { int img32width = height/5 * img32.width/img32.height;
           image(img32, width-img32width, 2*img32.height+4, img32width, img32.height);
          }       
      
  //Control img4, img42
  if (buttonOn4) { }
    else { int img42width = height/5 * img42.width/img42.height;
  image(img42, width-img42width, 3*img42.height+6, img42width, img42.height);
        }  
     
  //Control 5 img5, img52
  if (buttonOn5) { }
    else { int img52width = height/5 * img52.width/img52.height;
  image(img52, width-img52width, 4*img52.height+8, img52width, img52.height);
        }    
     
  textFont(f1,20); 
  fill(0);   
  text("Press on the image if you want \n                 to listen to...", 100, 150);
  text("Press and move the mouse \nif you want to draw", 25, 470);
  text("Press...", 70, 300); 
  
  textFont(f2,13); 
  fill(0);    
  text("sounds from the street", 320, 100);
  text("me walking at Villa Savoye", 300, 250);
  text("a jazz band \non the street in Paris", 320, 380);
  text("the ecoe in \nSaint-Pierre Church \nin Firminy", 350, 550);
  text("the saxophonist at Louvre", 300, 650);  
  
  text("'s' key \nif you want \nto save a screenshot", 40, 350); 
  text("'c' key \nif you want \nto chage the drawing color", 40, 400); 
  
  text("Sources: \npersonal photos and audio recordings", 40, 590);
  }
  
  void mouseReleased() {
  //sound1
  if ( mouseX>width-img1.width && mouseX<width && mouseY>0 && mouseY<height/5) {
    if (buttonOn1 == true) {
      sound1.mute();
      buttonOn1 = false;
    }
    else {
      sound1.unmute();
      buttonOn1 = true;
    }
  }
  
   //sound2
  if ( mouseX>width-img1.width && mouseX<width && mouseY>height/5 && mouseY<2*height/5) {
    if (buttonOn2 == true) {
      sound2.mute();
      buttonOn2 = false;
    }
    else {
      sound2.unmute();
      buttonOn2 = true;
    }
  }
  
   //sound3
  if ( mouseX>width-img1.width && mouseX<width && mouseY>2*height/5 && mouseY<3*height/5) {
    if (buttonOn3 == true) {
      sound3.mute();
      buttonOn3 = false;
    }
    else {
      sound3.unmute();
      buttonOn3 = true;
    }
  }       
    
  //sound4
  if ( mouseX>width-img1.width && mouseX<width && mouseY>3*height/5 && mouseY<4*height/5) {
    if (buttonOn4 == true) {
      sound4.mute();
      buttonOn4 = false;
    }
    else {
      sound4.unmute();
      buttonOn4 = true;
    }
  }
  
   //sound5
  if ( mouseX>width-img1.width && mouseX<width && mouseY>4*height/5 && mouseY<height) {
    if (buttonOn5 == true) {
      sound5.mute();
      buttonOn5 = false;
    }
    else {
      sound5.unmute();
      buttonOn5 = true;
    }
  }
  }


//Keyboard Input
//keyPressed()
void keyPressed () {
  if (key== 's' || key == 'S') saveFrame("screenshot"+ int(random(100)) + ".png");
  if (key== 'c' || key == 'C') strokeColor = color(mouseY, mouseY, mouseY);
}



