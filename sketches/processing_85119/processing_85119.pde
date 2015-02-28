
// header

/*****************************************
* Header Title: elaborate the title here
* more details of sketch here
* include any credits to other people
* Your Name - date when created
*****************************************/


// global variables

// setup
int x, y;// will be used to reference the mouse position
int ellipse_diameter = 220;// this is the diameter of the ellispe. Change value to change ellipse diameter
void setup() {
  size(500, 500);
  smooth();
}

// draw

void draw(){
  x = mouseX;
  y = mouseY;

  background(0);
  
   if ( x < 250) {
    background(255);
   }
   
   else if ( x >= 200 && x < 400) {
    background(128);}
  
  fill(255, 0, 0);// red inside
  noStroke();// no outline
  ellipse(mouseX, mouseY, ellipse_diameter, ellipse_diameter);
  
  fill(0, 0, 255);// blue inside  
  noStroke();// no outline  
  rect(170, 45, 150, 150);
  
  fill(0, 0, 255);// blue inside  
  noStroke();// no outline  
  rect(125, 190, 240, 30);
  
    // 3. left eye - rect(x, y, width, height);
  //fill(255);// black eye center//
  //ellipse(225, 260, 20, 20);
  // 4. right eye - rect(x, y, width, height);
  //ellipse(275, 260, 20, 20);//
  
  if (mousePressed) {
    fill(0);
  } else {
    fill(255,250,0);
  }
  triangle(390, 420, 390, 310, 250, 310);
  
  triangle(110, 420, 110, 310, 250, 310);}
