
int x = 100;
int y = 100;
int xspeed = 1;
int yspeed = 3;
boolean mouseOnRight;


//font
PFont avenirfont; 
int fontPosY;

void setup() {
    
  avenirfont = loadFont("Avenir-Black-48.vlw");
  
  size(1000, 600);
  background(180, 180, 180);

  strokeWeight(2);
  frameRate(10);
  
  mouseOnRight = false;
  
   //activating font
  textFont(avenirfont);
  
  // text
  text("Dashboard", 20, fontPosY+50);

  fill(100);
  text("Blaah", 20, width-30);
}

void draw() {

  if (mousePressed == true) {
    fill(random(250), random(250), random(250));
    ellipse(500, 500, 50, 50);

    fill(random(250), random(250), random(250));
    ellipse(250, 250, 100, 100);
    
    fill(random(250), random(250), random(250));
    ellipse(600, 400, 50, 50);
    
    fill(random(250), random(250), random(250));
    rect(900, 200, 50, 50);
  }
  
  // insert boolean
  
   if (mouseX >= width/2 && mouseOnRight == false) {
    mouseOnRight = true; 
   }
  noStroke();
  fill(255,10);
  
  
 //new if
    if (mouseOnRight){
  x = x + xspeed;
  y = y + yspeed;
    }
 if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  
  fill(175);
  ellipse(x,y,16,16);
  
  fill(255,255,255);
  
  
  // eyes - thanks to base code from http://www.openprocessing.org/sketch/48315 *
  //background white circle
  ellipse (350,300,60,60);
  ellipse (450,300,60,60);
  ellipse (550,300,60,60);
  
  //tracking mouse movement + pupil size (radius)
  // questions: why is the 0 there? Why does it say "ax" instead of just "x"? Where does it get the "ax" from? 
  float ax = map (mouseX, 0, width, 345, 360);
  float ay = map (mouseY, 0, height, 290, 310);
  
  float bx = map (mouseX, 0, width, 445, 460);
  float by = map (mouseY, 0, height, 290, 310);
  
  float cx = map (mouseX, 0, width, 548, 296); 
  float cy = map (mouseY, 0, height, 290, 310);
   
  // pupil placement + color 
  fill(0,0,0);
  ellipse (ax,ay,40,40);
  ellipse (bx,by,40,40);
  ellipse (cx,cy,40,40);
  
  println(mouseX+","+mouseY);
  
  }
  
 




//* void setup () {
//   
//  size (800,600);
//  smooth ();
//   
//}
// 
// 
//void draw () {
//   
//  background (200,250,255);
//   
//  fill(255,255,255);
//  ellipse (400,300,360,360);
//  ellipse (350,300,60,60);
//   
//  float ax = map (mouseX, 0, width, 345, 360);
//  float ay = map (mouseY, 0, height, 290, 310);
//   
//  fill(0,0,0);
//  ellipse (ax,ay,40,40);
//   
//  float bx = map (mouseX, 0, width, 445, 460);
//  float by = map (mouseY, 0, height, 290, 310);
//   
//  ellipse (bx,by,40,40);
//   
//  fill (240,250,220);
//  rect (430,475,20,30);
//  rect (350,475,20,30);
//   
//  ellipse (520,500,190,25);
//  ellipse (280,500,190,25);
//   
//  ellipse (210,320,40,40);
//  ellipse (590,320,40,40);
//  ellipse (210,350,30,30);
//  ellipse (590,350,30,30);
//  ellipse (210,370,20,20);
//  ellipse (590,370,20,20);
//   
// 
//   
//   
//}
////
