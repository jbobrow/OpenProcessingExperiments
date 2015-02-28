
int ellipseSize=25;
int x = 0;
int speed = 1;
String state = "growing";
//ellipse size change variable


void setup() {
  size(250, 250);
}

void draw() {
  background(255);
  //ellipse(mouseX, mouseY, ellipseSize,ellipseSize);
 
  ellipse(x, 100, ellipseSize, ellipseSize);

  if (ellipseSize > 100) {
    state = "shrinking";
  }

  if (ellipseSize < 1) {
    state = "growing";
  }

  
  if (state == "growing") {
    fill(0, 255, 0);
    ellipseSize = ellipseSize + 1;
  }
  
  if (state == "shrinking") {
     fill(255, 83, 3);
    ellipseSize = ellipseSize - 1;
  }


 

  /* if (ellipseSize < 1) {
   x = -ellipseSize + 1;
   
   
   }
   
   
   if(ellipseSize > 1)  {
   changeEllipse = -ellipseSize - 1;
   
   }
   
   changeEllipse = changeEllipse + ellipseSize; {}
   */

  if (x > 250) {
    speed = -1;
  }

  if (x == 0) {
    speed = 1;
  }


  x = x + speed;
  {
  }
}
//speed
/*x = x + 1;
 } else {
 x = x - 1;
 }
 }*/


/*variable: refer to it and gets back to it
 int: whole numbers, 1,int ellipseSize=50;
 int x = 0;
 int speed = 1;
 
 
 void setup(){
 size(250, 250); 
 }
 
 void draw() {
 background(255);
 //ellipse(mouseX, mouseY, ellipseSize,ellipseSize);
 ellipse(x, 100, ellipseSize, ellipseSize);
 
 if (ellipseSize > 200) {
 ellipseSize = ellipseSize - 1;
 
 }
 
 else {
 ellipseSize = ellipseSize + 1;
 }
 
 
 if (x > 300) {
 speed = -1;
 }
 
 if (x == 0) {
 speed = 1;
 }
 
 x = x + speed;{
 }
 }
 //speed
  /*x = x + 1;
 } else {
 x = x - 1;
 }
 }*/

void mousePressed() {
  background(0, 255, 0);
}

void keyPressed() {
  background(255, 83, 3); 
  println(key);
}

/*variable: refer to it and gets back to it
 int: whole numbers, 1,
 float: decimal numbers
 char: character, ex. keypresed, key 
 
/*
 float: decimal numbers
 char: character, ex. keypresed, key 
 
 */

