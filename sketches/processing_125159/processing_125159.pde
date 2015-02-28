
// working with Images in Procesinf
  // Declare a Pimage varible type
PImage sleepofreason;  
 int smallPoint, largePoint;
 float offset = 0;
 float easing = 0.1;

  // Load an image file from HDD
void setup() {
 size(1200, 643);
 sleepofreason = loadImage("sleepofreason.png");
      
      //create an efect of bouncing ball in mov(libray)
       smallPoint = 100;
       largePoint = 260;
       imageMode(CENTER);
        noStroke();
        background(255);

// working with sound
     //Load audio file from HDD
    minim = new Minim(this);
    project2 = minim.loadFile("project2.mp3");
    project2.play();
    project2.loop();
} 

// draw the image to the screen at (0, 0) 
void draw() {
  image(sleepofreason, 0, 0);

   // working with text and variables 
     background(sleepofreason);
     String hw = " The sleep of reason produces monters";
     PFont georgia = loadFont("georgia.vlw"); 
     textFont(georgia);
     fill( #F50C0c);
     textSize (58);
     textAlign(CENTER);
     text(hw, width/2, height/6);

   // working with funcions rect()
     colorMode(HSB,width, height, 100);
     rect(100,150,100,100);
     translate(550,250);
     scale(1.3);
     rotate(radians(45));
     rect(100,100,100,100);
     rect(100,100,100,100);
  
  // ball bouncing
      float pointillize = map(2*mouseX/3, 0, width/2, smallPoint, largePoint);
      int x = int(random(sleepofreason.width));
      int y = int(random(sleepofreason.height));
      color pix = sleepofreason.get(x, y);
      fill(pix, 228);
      ellipse(x, y, pointillize, pointillize);
// transparecy

  float dx = (2*mouseX-sleepofreason.width/2) - offset/2;
  offset += dx * easing; 
  tint(255, 117);  // Display at half opacity
  image(sleepofreason, offset, 0);
   rotate(radians(0));
}

// Import 'Minim' library files
  import ddf.minim.*;

//Declare golbal variables
    Minim minim;
    AudioPlayer project2;












