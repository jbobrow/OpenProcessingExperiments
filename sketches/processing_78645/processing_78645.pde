
PImage fish;
float x;
float y;
float easing = 0.05;
float d = 160;
float sizeP = 0;
boolean blowup = false;
float r = 0;
float bubbles = 0;
float bubbleheight = 0;
float bubbleheight1 = 0;
float bubbleheight2 = 0;
float bubbleheight3 = 0;
float bubbleheight4 = 0;
float bubbleheight5 = 0;
float bubbleheight6 = 0;
float bubbleheight7 = 0;
float bubbleheight8 = 0;

void setup() {
  fish = loadImage ("puffer.gif");
  size(1080, 720);
  imageMode (CENTER);
}

void draw() {
  background(51, 132, 211);
  noCursor();
  //constrain(d,55,110);

  if ((keyPressed == true) && (key == 'd')) {
    blowup = true; 
    sizeP = 185;
  }
  
  if (blowup == true) {
    sizeP = sizeP - 1;
    if (sizeP <= 1) {
      sizeP = 0;
    }


    float targetX = mouseX;
    float dx = targetX - x;
    if (abs(dx) > 1) {
      x += dx * easing;
    }

    float targetY = mouseY;
    float dy = targetY - y;
    if (abs(dy) > 1) {
      y += dy * easing;
    }

    pushMatrix(); 
    translate ((d)/2, (d)/2);
    rotate(r);
    image(fish, x, y, d + sizeP, d + sizeP);
    popMatrix();



    // Bubbles//
   bubbleheight = bubbleheight + 1;
   if ( bubbleheight > 740 ) {
   bubbleheight = 0;
   }
   
   bubbleheight1 = bubbleheight1 +  random(.8 , 1.5);
   if ( bubbleheight1 > 840 ) {
   bubbleheight1 = 0;
   }
   
   bubbleheight2 = bubbleheight2 +  random( .5 , 1.9);
   if ( bubbleheight2 > 800 ) {
   bubbleheight2 = 0;
   }
   
   bubbleheight3 = bubbleheight3 +  random( .3 , .7);
   if ( bubbleheight3 > 770 ) {
   bubbleheight3 = 0;
   }
   
   bubbleheight4 = bubbleheight4 +  random( 1.2 , 1.7);
   if ( bubbleheight4 > 780 ) {
   bubbleheight4 = 0;
   }
   
   bubbleheight5 = bubbleheight5 + random(.1 , .9);
   if ( bubbleheight5 > 720 ) {
   bubbleheight5 = 0;
   }
   
   bubbleheight6 = bubbleheight6 + random(.5 , 2.3);
   if ( bubbleheight6 > 730 ) {
   bubbleheight6 = 0;
   }
   
   bubbleheight7 = bubbleheight7 + random(.5 , 1.9);
   if ( bubbleheight7 > 780 ) {
   bubbleheight7 = 0;
   }
   
   bubbleheight8 = bubbleheight8 + random(.1 , 1.5);
   if ( bubbleheight8 > 790 ) {
   bubbleheight8 = 0;
   }
   
   
//   noStroke();
//   fill(255,255,255,random(10,45));
//   ellipse( random(1,1080), random(720,725) - bubbleheight, random(55,150),random(15, 175));
   
 noStroke();
 fill(255,255,255,35);
 ellipse( 720, random(720,725) - bubbleheight, random(145,150),random(145, 150));
 
  noStroke();
 fill(255,255,255,35);
 ellipse( 120, 900 - bubbleheight1, random(35,40),random(35, 40));
 
  noStroke();
 fill(255,255,255,15);
 ellipse( 220, 850 - bubbleheight2, 145,random(145, 150));
 
  noStroke();
 fill(255,255,255,35);
 ellipse( 320, 820 - bubbleheight4, 120,random(115, 120));
 
  noStroke();
 fill(255,255,255,35);
 ellipse( 420, 900 - bubbleheight3, 215 ,random(210, 215));
 
 
 noStroke();
 fill(255,255,255,25);
 ellipse( 520, 640 - bubbleheight5, 50,random(45, 50));


 noStroke();
 fill(255,255,255,15);
 ellipse( 620, 920 - bubbleheight6, 65 ,random(55, 65));

 noStroke();
 fill(255,255,255,15);
 ellipse( 820, 920 - bubbleheight8, 65 ,random(55, 65));
 
 noStroke();
 fill(255,255,255,15);
 ellipse( 920, 920 - bubbleheight7, 65 ,random(55, 65));

    // Bubbles //



    // Kelp //





    // Kelp //
    
    
    
    
    // Timer //
    
    
    
    // Timer //
    
    
    // Food // 
    
    // Food //
    
    
    // Counter ///
    
    
    // Counter // 
    
    
    // Enemies //
    
    // Enemies //
    
    
   
  }
}

