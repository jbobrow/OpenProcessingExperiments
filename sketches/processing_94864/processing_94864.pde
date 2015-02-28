
int left = -50; //moves shape down
int right =  400; //moves shape to the right
int up = -30; //moves shape up
int down = 500; //moves shape down
int down2 = 300; //moves triangle not so down
int mid = 200; //moves shape to the middle in the x direction

void setup() {
  size (800, 800); // size of the background
  background (0); //black background
  noStroke(); //No borders
}

void draw () {
  background(0); //Redraws the background so copies
  right = right -4; //Moves whatever shape with the right int towards the left
  right = max(0, right); //Stops at the their initial x position
  
  if (right <= 0) { //When all the shapes with right int are at their initial x position
    mid = mid -4;//Moves shapes in the middle towards their intial x position
    mid = max(0, mid);
  } else {
    up = up +1; //moves shapes with up int to their initial y position
    up = min(0, up); //Stop at intial position
  }
  
  if (mid <= 0) { //Once shapes with middle int have reached their intial x position
    down = down -4; //move all the shapes with down int up 
    down = max(0, down); //Stop at the shape's intial position
  }
  
  if (down <= 300) { //when shapes with down  int reached 300 px in the y direction
    down2 = down; //set down2 so that it matches down and the shape with down2 would move together with the shapes with down
  }
  
  fill(0, 0, 255);
  triangle(100+right, 50, 200+right, 50, 100+right, 200); //Blue triangle
  fill(249, 250, 0);
  triangle(200+mid, 50+down, 290+mid, 50+down, 100+mid, 200+down);  //yellow triangle     
  fill(255, 0, 0);
  quad(290, 50+up, 400, 50+up, 400, 100+up, 100, 200+up); //Red Quad
  fill(255);
  triangle(400, 100+down2, 400, 150+down2, 100, 200+down2); //White triangle
  fill(16, 175, 27);
  triangle(400+right, 150+down, 400+right, 200+down, 100+right, 200+down);  //Green triangle  
  
  if (down <= 0) { //once all the triangles are in place, triangles change colors
    frameRate(2);
    fill(random (255), random(255), random(255)); //random color
    triangle(100, 50, 200, 50, 100, 200); //1st triangle
    fill(random (255), random(255), random(255)); //random color
    triangle(200, 50, 290, 50, 100, 200);  //2nd triangle     
    fill(random (255), random(255), random(255)); //random color
    quad(290, 50, 400, 50, 400, 100, 100, 200); //Quad
    fill(random (255), random(255), random(255)); //random color
    triangle(400, 100, 400, 150, 100, 200); //3rd triangle
    fill(random (255), random(255), random(255)); //random color
    triangle(400, 150, 400, 200, 100, 200);  //4th triangle
  }
}



