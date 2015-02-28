
// EYEs that:
// follow the cursor
// blink on click
// do evils on 'e' press
// pupils dilate on 'p' press
// background colour changes by pressing r , g or b.
// any other button makes background black.


int blinkbottom = -100;
float r = 355;
float g = 147;
float b = 206;
int eyeheight = 180;
int pupil = 60;

void setup () {
  size (800, 400);
  smooth ();
}

void draw () {
  background (r, g, b);
  fill (255);
  noStroke ();
  
  // eye balls 
  ellipse (200, 200, 200, eyeheight);
  ellipse (600, 200, 200, eyeheight);
  
  //map
  float eye1x = map (mouseX, 0,500, 150,250);
  float eye1y = map (mouseY,0,height, 150,250);
  float eye2x = map (mouseX,300,width, 550,650);
  float eye2y = map (mouseY,0,height, 150,250);
  
  eye1x = constrain (eye1x,150,250);
  eye2x = constrain (eye2x,550,650);
  

  // iris
  ellipseMode (CENTER);
  fill (40,200,80);
  ellipse (eye1x, eye1y, 100, 100);
  ellipse (eye2x, eye2y, 100, 100);
  
  //pupils
  fill (0);
  ellipse (eye1x,eye1y,pupil,pupil);
  ellipse (eye2x,eye2y,pupil,pupil);

  //blinker
  fill (r, g, b);
  rectMode(CORNER);

  rect (0, blinkbottom, 800, 200);
  if ((mousePressed == true) && (blinkbottom<100)) {
    blinkbottom+=10;
  }
  else if (blinkbottom>-100)
  {
   blinkbottom-=10; 
  } 
  print (pupil);

 //colour
 if (keyPressed) {
   if (key=='r' || key=='R') {
     r+=10;
   }
   else if (key=='g' || key=='G') {
     g+=10;
   }
   else if (key=='b' || key=='B') {
     b+=10;
   }
   else if (key=='e') {
     if (eyeheight>100) {
       eyeheight--;
     }
     else {
       eyeheight=200;
     } 
   } 
   else if (key=='p') {
     if ((pupil<200) && (pupil>4)) {
       pupil--;
     }
     else {
       pupil=94;
     }
   }
   
   else {
     r=0;
     g=0;
     b=0;
   }
 }

   
  
   
   
 
  }


