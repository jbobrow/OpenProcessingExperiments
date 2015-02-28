

int move = 225;
int centermove = 106;
int countermove = -106;
float purplex;
float easing = .1;
float lefteye = 109;
float wink = PI/4;
float orangey;
float rotateangle;
float x;
float easing2 = .01;
float boxwink = 6;
float grow = 0.0;
float grow2 = 0.0;
float glassesY;
PImage styles;
int s = second();
boolean drawGlasses = false;

void setup() {
 size( 640, 480); 
 
  styles = loadImage("lines.png");
 smooth();
}

void draw() {
  
  println(frameCount);
   //println(mouseX + " : " + mouseY);
   background( 217, 193, 219);
   
   
//LEFT EYE-------------------------------------------------------
//white filling

  stroke(0);
  fill( 255);
  strokeWeight(5);
  ellipse( 212, 221, 194, 299);
  
//black bottom part of eye

  fill(0);
  noStroke();
  ellipse( 211, 210, 109, 167);
 
//purple filling


  float purpemap = map( purplex, 0, width, 205, 225);
  float purpleleft = mouseX - 209;
  purplex += (purpleleft - purplex) * easing;

  fill(193, 122, 195);
  //float lefteyemap = map(lefteye, 0, 100, 0, width);
  ellipse( purpemap, 199, 99, 150);
  //purplex = constrain(purpleleft, 212, 10);
  if ((keyPressed == true) && (key == 'd')) {
    ellipse( 212, 210, 105, 155);
    //ellipse( 472, 210, 105, 155);
    //ellipse( 211, 210, 109, 167);
  }
  
  
//black over filling

  fill(0);
  ellipse( 212, 195, 95, 141);
  
//gleem in eye
  fill(255);
  ellipse( 259, 225, 37, 37);
  
//orange eyelid
  
  stroke(0);
  strokeWeight(5);
  float orangefill = mouseY;
  orangey += (orangefill - orangey) * easing;
  fill( 299, 140, 61);
  float wink = map(orangey, 350, height, 0, PI); 
  //boxwink = map(orangey, 350, height, 0, PI); 
  noStroke();
  //rect( 118, 221, 170 - boxwink, 60 * TWO_PI * boxwink);
  stroke(0);
  strokeWeight(5);
  //arc( 212, 221, 194, 299, PI - 2 * wink, TWO_PI + 2 * wink);
  arc( 212, 221, 194, 299, PI, TWO_PI);
  
if (mouseY > 400) {
  
  
}
  //arc( 212, 221, 194, 299, 0, TWO_PI);
  /*   grow = grow + 2;
     grow2 = grow2 + 2.3;
if (mouseY > 350 ) {
   arc( 212, 360 - grow, 57 + grow, 20 + 2 * grow, 0, PI);
   if( grow > 138) {
    grow = 0; 
   }
}
*/


  // if( grow2> 194) {
  //   grow2 = 0;
  // }
   
    //if( grow2 > 194) {
     // grow = 0;
    //}
   // if( grow > 138) {
    //grow = 0; 
    //} 
    
//}
  
  
  //rect( 10, 10, 20, 20);
  //if(mouseX < 10 && mouseX > 30){
   // rect
    //}
  
  
  
//line

  stroke(0);
  strokeWeight(5);
  line( 115, 220, 309, 222);
  noStroke();
  

// stylish lines
  

  image(styles, 100, 56);
//LEFT EYE--------------------------------------------------END






//RIGHT EYE-------------------------------------------------------
//white filling

translate(move, 0);

  stroke(0);
  fill( 255);
  strokeWeight(5);
  ellipse( 212, 221, 194, 299);
  
//black bottom part of eye

  fill(0);
  noStroke();
  ellipse( 211, 210, 109, 167);
 
//purple filling
  
  float purplemap = map( purplex, 0, width, 215, 237);
  float purpleright = mouseX;
  purplex += (purpleright - purplex) * easing;
  fill(193, 122, 195);
  ellipse( purplemap -10, 199, 99, 150);
  //purplex = constrain(x - 10, 212, 230);
  //float cons = constrain(purpleright, 20, 70);
  //ellipse( cons, 199, 99, 150);
//ellipse( 212, 199, 99, 150);
  if ((keyPressed == true) && (key == 'd')) {
    //noFill();
    //strokeWeight(10);
    //stroke(0);
    //arc( 101, 47, 310, 150, 0, PI);
    noStroke();
    fill(193, 122, 195);
    
    ellipse( 212, 210, 105, 155);
    //ellipse( 472, 210, 105, 155);
    //ellipse( 211, 210, 109, 167);
  }
  
  
//black over filling

  fill(0);
  ellipse( 212, 195, 95, 141);
  
//gleem in eye
  fill(255);
  ellipse( 259, 225, 37, 37);
  
//orange eyelid
  
  stroke(0);
  strokeWeight(5);
  fill( 299, 140, 61);
  arc( 212, 221, 194, 299, PI, TWO_PI);
  //line
    //image styles
  image(styles, 100, 56);
    if ((keyPressed == true) && (key == 'd')) {
    noFill();
    strokeWeight(10);
    stroke(0);
    arc( 101, 47, 310, 150, 0, PI);
    }
  fill( 299, 140, 61);
  strokeWeight(5);
  if (mousePressed == true) {
  if (mouseButton == LEFT) {
    //arc( 212, 221, 194, 299, orangey, orangey);
    //ellipse( 212, 221, 194, 299);
    //arc( 437, 221, 194, 299, 0, PI);
    ellipse( -13, 221, 194, 299);
    arc( 212, 323, 134, 90, 0, PI);
    stroke(0);
    strokeWeight(5);
    line( -110, 220, 80, 222);
    line( 140, 323, 280, 323);
    
  }
     
 
     image(styles, 100, 56);
    if (keyPressed){
      if (key == 'd' || key == 'D')
      {
    noFill();
    strokeWeight(10);
    stroke(0);
    arc( 101, 47, 310, 150, 0, PI);
    }
    }
   
   //void mousePressed(){
   //if (mouseButton == RIGHT) {
    if (drawGlasses == true) {
    image(styles, 100, 56);
    //noFill();
    float glasses = mouseY;
    float glassesmap = map( glassesY, 0, height, 300, 330);
    glassesY += (glasses - glassesY) * easing;
    //strokeWeight(10);
    //arc( 101, 47, 310, 150, 0, PI);
    strokeWeight(5);
    stroke(0);
    fill(255, 150);
    ellipse( -15, glassesmap, 150, 150);
    ellipse( 212, glassesmap, 150, 150);
    line( 62, glassesmap, 137, glassesmap);
  }
  }
  
  
   if ((keyPressed == true) && (key == 'b')) {
     fill( 299, 140, 61);
     ellipse( -13, 221, 194, 299);
     line( -110, 220, 80, 222);
     //if (s > 10) {
     ellipse( 212, 221, 194, 299);
      //if (mouseButton == RIGHT) {
    if (drawGlasses == true) {
    //image(styles, 100, 56);
    //noFill();
    float glasses = mouseY;
    float glassesmap = map( glassesY, 0, height, 300, 330);
    glassesY += (glasses - glassesY) * easing;
    //strokeWeight(10);
    //arc( 101, 47, 310, 150, 0, PI);
    strokeWeight(5);
    stroke(0);
    fill(255, 150);
    ellipse( -15, glassesmap, 150, 150);
    ellipse( 212, glassesmap, 150, 150);
    line( 62, glassesmap, 137, glassesmap);
  } 
     
     
     if (frameCount == 60) {
     ellipse( -13, 221, 194, 299);
     line( -110, 220, 80, 222);
     ellipse( 212, 221, 194, 299);
     
     }

   }

  stroke(0);
  strokeWeight(5);
  line( 115, 220, 309, 222);
  
  noStroke();
  
  

  
  
 // stylish lines
  
 // PImage styles;
 //styles = loadImage("lines.png");

   
//RIGHT EYE--------------------------------------------------END






}

   void mousePressed(){
   if (mouseButton == RIGHT) {
     drawGlasses = true;
     
   }
   }
   
   void mouseReleased(){
    drawGlasses = false; 
   
   }


