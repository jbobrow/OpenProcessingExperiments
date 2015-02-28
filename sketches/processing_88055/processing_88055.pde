
int x = 215; //variable
int y = 350;
int radius = 12;
float z;
float easing = 0.05;
Pimage img;
Pimage img2;

void setup() {  //established once
smooth();
    size(480, 480);
   frameRate(80);
   ellipseMode(RADIUS);
   img = loadImage("ghostguy.png");
   img2 = loadImage("ghostsprite.png");
}

void draw() {  //always changing


 float targetX = mouseX;
 x += (targetX - x) * easing;
 ellipse(x, 40, 12, 12);
 println(targetX + " : " + x);
 
  background(220, 220, 10, 10);
  
    textSize(32);
    textAlign(TOP);
    text("Ahhhhhhhhhh", 10, 30);
  
  float d = dist(mouseX, mouseY, 350, 100);
  if (d < radius) {
    radius++;
    fill(0);
  } else {
    fill(255);
  }
  ellipse(350, 100, radius, radius);
  
  
  if (keyPressed &&(key == CODED)) {
    if (keyCode == LEFT) { //left arrow move
      x--;
    } else if (keyCode == RIGHT) { //right arrow move
      x++;
    }
  }  
  //rect(x, y, 50, 50); //the character
  image(img, x, y);
  
 if (mousePressed == true) {   //if you click...
   line(x+25, y+25, mouseX, mouseY);   //he shoots
 }
 
 //rect(50, 50, 10, 10);  //Enemy Ghost
 image(img2, 50, 50);

   
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
      


