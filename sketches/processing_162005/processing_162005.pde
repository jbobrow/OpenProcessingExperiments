
int moveY, moveX;

void setup(){
moveY = 0;
moveX = 0;
size(400, 400); //screen dimensions
}


void draw() {
   /* @pjs preload="10325634_860956567253465_813638495168135983_n.jpg"; */ 
PImage img;
img = loadImage("10325634_860956567253465_813638495168135983_n.jpg");
//main image
image(img, 0, 0);
img.resize(400, 400);//resizing main image
//moving main image
image(img, moveX, moveY);
moveY++;
moveX++;
if(moveY+350 >= height) {
  moveY=0;
  if(moveX+350 >= width) {
    moveX=0;
  }
}
img.resize(100, 100);
//bottom left
image(img, 0, 300);
img.resize(100, 100);
//top right
image(img, 300, 0);
img.resize(100, 100);
//bottom right
image(img, 300, 300);
img.resize(100, 100);
//filter
image(img, 0, 0);
filter(THRESHOLD);
image(img, 0, 0);
filter(THRESHOLD);
 //lines
  stroke(225,90,0);
  line(mouseX, mouseY,600,405);
  
  stroke(225, 0, 0);
  line(mouseX, mouseY, 400, 250);
  
   stroke(0, 255, 30);
  line(mouseX, mouseY, 700, 350);
     
    stroke(255, 250, 250);
  line(mouseX, mouseY, 900, 450);
       stroke(254, 255, 0);
  line(mouseX, mouseY, 500, 200);

//circles
fill(255, 40, 10, 90);
ellipse(393, 244, 100, 100);

fill(0, 200, 255, 150);
ellipse(120, 340, 40, 40);

fill(255, 134, 211, 150);
ellipse(240, 20, 18, 18);
 
//turquoise 
 stroke(0, 200, 255); 
// for dots
for (int i = 0; i < 1000; i = i+5) {
  for (int j = 0; j < 1000; j = j+5) {
    point(i, j);
  }
}
}



  






