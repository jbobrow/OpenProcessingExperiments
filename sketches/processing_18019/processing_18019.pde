
// carolyn schuetz
// art 497 algorithmic vcd
// lesson one project step 2
// due: 1/11/11


// Program draws an interactive Giraffe. Pressing the 's' key will change
// the color and positions of her spots. Pressing the 't' key will make
// the tree grow. Once the tree grows tall enough, pressing the 'l' key will
// make Ginny stick her tongue out and pressing 'k' will bring her tongue
// back in. Have fun interacting with Ginny the Giraffe!

// variable declarations
// general variables
int halfWidth;
int halfHeight;
int canvasX = 200;
int canvasY = 200;

// variables when G key is pressed
int treeY;
int maxTree;
boolean leafDirect = true;




// sets up the Avatar's window
void setup() { 
  size(canvasX,canvasY);              // set window size
  smooth();                   // set as smooth
  rectMode(CENTER);           // make the rectangle mode CENTER
  background(175,218,245);    // set background to light blue
  frameRate(60);              // sets frameRate to 60 frames per second
  
  // initialize variables
  treeY = canvasY; 
  maxTree = 80;
  halfWidth = canvasX/2;
  halfHeight = canvasY/2;
  
  // set scenery
  noStroke();
  fill(12,167,31);
  rect(halfWidth,height-35,width,70);
  
  // draw Giraffe's body + neck
  noStroke();
  fill(234,159,38);
  rect(halfWidth,halfHeight,30,100);
  rect((halfWidth)-30,(halfHeight)+35,80,30);
}


// draws Ginny the Giraffe
void draw() {
  noStroke(); 
  
  // draw one ear to be behind head
  fill(152,114,8);
  triangle((halfWidth)+20,(halfHeight)-70,(halfWidth)+40,(halfHeight)-70,(halfWidth)+30,(halfHeight)-85);
  
  // draw Giraffe's head
  fill(234,159,38);
  ellipse((halfWidth)+20,(halfHeight)-50,80,50);
  ellipse((halfWidth)+50,(halfHeight)-35,35,25);
  // draw one ear to be in front of head
  fill(152,114,8);
  triangle((halfWidth)-5,(halfHeight)-65,(halfWidth)+15,(halfHeight)-65,(halfWidth)+5,(halfHeight)-80);
  
  // draw Giraffe's eyes
  fill(255,255,255);
  ellipse((halfWidth)+18,(halfHeight)-55,20,20);
  ellipse((halfWidth)+33,(halfHeight)-60,20,20);
  fill(0,0,0);
  ellipse((halfWidth)+18,(halfHeight)-50,10,10);
  ellipse((halfWidth)+33,(halfHeight)-55,10,10);
  
  // draw Giraffe's nostrils
  fill(152,114,8);
  ellipse((halfWidth)+50,(halfHeight)-27,10,5);
  ellipse((halfWidth)+60,(halfHeight)-35,5,10);

  //draw Giraffe's legs
  strokeWeight(5);
  stroke(131,87,15);
  line((halfWidth)-65,(halfHeight)+50,(halfWidth)-65,(halfHeight)+80);
  line((halfWidth)-55,(halfHeight)+50,(halfWidth)-55,(halfHeight)+70);
  line((halfWidth),(halfHeight)+50,(halfWidth),(halfHeight)+80);
  line((halfWidth)+10,(halfHeight)+50,(halfWidth)+10,(halfHeight)+70);

  // draw Giraffe's tail
  line((halfWidth)-70,(halfHeight)+20,(halfWidth)-80,(halfHeight)+40);
}

void keyPressed() {
  // press T to make the tree grow
  if((key == 't') || (key == 'T')) {
    noStroke();
    fill(26,118,22);
    if(treeY > halfWidth-50 && leafDirect) {
    quad(halfWidth+50,treeY,halfWidth+55,treeY+5,halfWidth+50,treeY+10,
                halfWidth+45,treeY+5);
    }
    else if(treeY > halfWidth-50 && !leafDirect) {
    quad(halfWidth+55,treeY,halfWidth+60,treeY+5,halfWidth+55,treeY+10,
                halfWidth+50,treeY+5);
    }
    leafDirect = !leafDirect;
    treeY = treeY-10;
  }

  
  // press 'L' to have her stick her tongue out
  if((key == 'l') || (key == 'L')) {
    if (treeY < halfHeight-10){
    noStroke();
    fill(245,101,185);
    ellipse((halfWidth)+55,(height/2)-20,18,35);
    treeY = height-100;
    }
  }
  
  if ((key == 'k') || (key == 'K')) {
    noStroke();
    fill(175,218,245);
    ellipse((halfWidth)+55,(halfHeight)-20,20,36);
  }
  
  // press 's' to draw random spots
  if ((key == 's') || (key == 'S')) {
    
    // variables when key S is pressed
    int numBodySpots = 0;  // number of body spots
    int numNeckSpots = 0;  // number of neck spots
    int spotX;             // spot's X coordinate
    int spotY;             // spot's Y coordinate
    int r;                 // RGB's RED value
    int g;                 // RGB's GREEN value
    int b;                 // RGB's BLUE value
    
    // redraw body and neck to cover current spots
    noStroke();
    fill(234,159,38);
    rect(halfWidth,halfHeight,30,100);            // neck
    rect((halfWidth)-30,(halfHeight)+35,80,30);   // body
    
    while(numNeckSpots < 5) {
      // initialize variables
      r = int(random(0,255));
      g = int(random(0,255));
      b = int(random(0,255));
      spotX = int(random(halfWidth-10, halfWidth+10));
      spotY = int(random(halfHeight-35,halfHeight+10));
       
      // run loop to draw neck spots 
      fill(r,g,b);
      ellipse(spotX,spotY,10,10);
      numNeckSpots++;
    }
    
    while(numBodySpots < 10) {
      // initialize variables
      r = int(random(0,255));
      g = int(random(0,255));
      b = int(random(0,255));
      spotX = int(random(halfWidth-65,halfWidth+5));
      spotY = int(random(halfHeight+25, halfHeight+45));
      
      // run loop to draw body spots
      fill(r,g,b);
      ellipse(spotX, spotY, 10,10);
      numBodySpots++;
    }
  }
}


  
