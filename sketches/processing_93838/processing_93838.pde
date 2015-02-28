
boolean readytopaint = false;
boolean painting = false;
boolean cycleWidth = false;
boolean drawcircles = false;
boolean randomfill=false;
boolean clearCanvas = false;
int stopX = 0;
PImage img;


int x=40;
int y=50;
int w=60;
int h=80;
int buttonspace = 80;

float drawred = 0;
float drawgreen = 0;
float drawblue = 0;
float strokewidth= 3;








void setup () {
  size (1000,800);
  background (24, 167, 181);
  
  //Canvas
  rect (180,160,800,600);
  
  //Button 1: Random Colour
  fill (drawred,drawgreen,drawblue);
  rect (x,y,w,h);
  //Button 2: Red
  fill (255,0,0);
  rect (x+buttonspace,y,w,h);
  //Button 3: Green
  fill (0,255,0);
  rect (x+buttonspace*2,y,w,h);
  //Button 4: Blue
  fill (0,0,255);
  rect (x+buttonspace*3,y,w,h);

  stroke(0,230,255);  
  //button 5: stroke size 20
  strokeWeight (20);
  line (370,50,370,120);
  //button 6: stroke size 10
  strokeWeight (10);
  line (400,50,400,120);
  //button 7: strokesize 3
  strokeWeight (3);
  line (420,50,420,120);
  stroke(0);
  strokeWeight (1);

  //button 8 "ink" tool
  img=loadImage ("ink.png");
  
  //button 9 clear
  fill (255);
  rect (x,y+300,w,h);

  //button 10 bubble tool
  fill(255);
  noStroke ();
  rect (x,y+430,w,h);
  
  //button 11 fill
  strokeWeight(1);
  rect (x,y+570,w,h);

  /* Text */  
  fill (255);
  
  //Title
  textSize (80);
  text ("Scribbler", 500,y+50);
  
  //Buttons
  textSize(18);
  text("random", x, y+h+20);
  text("red",x*3 , y+h+20);
  text("green", x*5, y+h+20);
  text("blue", x*7, y+h+20);
  text("linesize", x*9, y+h+20);
  text ("ink", x, 330);
  text ("clear", x, 450);
  text ("bubbles", x, 580);
  text ("random fill", x, 720);
  
  //Reset properties
  fill(0);
  stroke(0);
  strokeWeight(3);
}

void draw (){  

  if (clearCanvas) {
    fill(255);
    stroke(0);
    strokeWeight(1);
    rect (180,160,800,600);
    fill (drawred,drawgreen,drawblue);
    clearCanvas = false;
  }

  if(randomfill) {
    fill (random (255), random (255), random (255));
  } else
    fill(255);

  //Update Bubbles Button
  if (drawcircles)
    stroke(255,0,0);
  else
    stroke(0);
  rect (x,y+430,w,h);
    
  stroke(drawred,drawgreen,drawblue);
  if (cycleWidth)
    strokewidth = random(8);
  strokeWeight (strokewidth);
  if (painting && readytopaint) {
    if (!drawcircles) {
      pmouseX = constrain (pmouseX, 180,980);
      pmouseY = constrain (pmouseY, 160,760);
      line (pmouseX,pmouseY,mouseX,mouseY);
    } else {
      pmouseX = constrain (pmouseX, 190,970);
      pmouseY = constrain (pmouseY, 170,750);
      ellipse (pmouseX, pmouseY, 20,20);
    }
  }
  stroke(0);
  strokeWeight (3);

  //Button 1: Random Colour
  fill (drawred,drawgreen,drawblue);
  rect (x,y,w,h);
  //Button 1: Random Colour
  if ((mousePressed) && (mouseX>x) && (mouseX <x+w)
    && (mouseY>y) && (mouseY <y+h))
  {
    drawred = random(255);
    drawgreen = random(255);
    drawblue = random(255);
  }

  /*Update ink button*/  
  if(cycleWidth)
    tint(255,0,0); 
  else {
    noTint();
  }
  image (img,x,y+170,w,h);
  
}


// draw function
void mouseDragged() {
  if ((mouseX > 180) && (mouseX < 980) && (mouseY>160) && (mouseY <780))
    painting = true;
  else
    painting = false;
}

void mousePressed() {
  readytopaint = true;
  
  /* Check for button clicked */
  
  //Button 2: Red  
  if ((mouseX> x+buttonspace) && (mouseX < x+buttonspace+w)
  && (mouseY>y) && (mouseY <y+h)){
    drawred = 255;
    drawgreen = 0;
    drawblue = 0;
  }
  //Button 3: Green
  else if ((mouseX> x+buttonspace*2) && (mouseX < x+buttonspace*2+w)
  && (mouseY>y) && (mouseY <y+h)){
    drawred = 0;
    drawgreen = 255;
    drawblue = 0;
  }
  //Button 4: Blue
  else if ((mouseX> x+buttonspace*3) && (mouseX < x+buttonspace*3+w)
  && (mouseY>y) && (mouseY <y+h)){
    drawred = 0;
    drawgreen = 0;
    drawblue = 255;
  }
  //Button 5: Stroke Weight 20
  else if ((mouseX> 360) && (mouseX < 385)
  && (mouseY>50) && (mouseY <120)){
   strokewidth=20; }
  //Button 6: Stroke Weight 10
  else if ((mouseX> 390) && (mouseX < 410)
  && (mouseY>50) && (mouseY <120)){
   strokewidth=10; }
  //Button 7: Stroke Weight 3
  else if ((mouseX> 410) && (mouseX < 425)
  && (mouseY>50) && (mouseY <120)){
   strokewidth=3;
  }
  //Button 8: Ink
  else if ((mouseX>x-5) && (mouseX < x+5+w)
  && (mouseY>y+165) && (mouseY <y+175+h)){
     if (cycleWidth) {
       cycleWidth = false;
       strokewidth = 3;
     } else {
       cycleWidth = true;
     }
  }
  //Button 9: Clear
  else if ((mouseX> x) && (mouseX <x+w)
  && (mouseY>y+300) && (mouseY <y+300+h)) {
    clearCanvas = true;
  }
  //Button 10: Bubbles
  else if ((mouseX> x) && (mouseX <x+w)
  && (mouseY>y+430) && (mouseY <y+430+h)) {
    if(drawcircles)
      drawcircles = false;
    else
      drawcircles = true;
  }
  //Button 11: Random Fill
  else if ((mouseX> x) && (mouseX <x+w)
  && (mouseY>y+570) && (mouseY <y+570+h)){
     fill (random (255), random (255), random (255));
     rect (180,160,800,600);
     rect (x,y+570,w,h);
     if (randomfill) {
       randomfill = false;
     } else {
       randomfill = true;
     }
  }

}

void mouseReleased() {
  readytopaint = false;
  painting = false;
  

}
