
class Robot {
 
 //Properties 

int hx=mouseX; //Head x-coordinate
int hy=mouseY; //Head y-coordinate
int x=600;
int y=600;


//Constructor
Robot (int px, int py) {
  x=px;
  y=py;
  println ("draw robot");
}

void display (){
   //Neck
  stroke(0);
  strokeWeight(20);
  line(hx-50, hy-100, x-50, y);

  //Head
  fill(0);
  stroke(1);
  strokeWeight(8);
  line(hx-55, hy-150, hx-55, hy-250);
  line(hx-10, hy-130, hx+70, hy-200);
  fill(200);
  noStroke();
  fill(255);
  ellipse(hx-50, hy-100, 100, 100);
  fill(200);
  stroke(100);
  strokeWeight(3);
  rectMode(CENTER);
  rect(hx-55, hy-80, 40, 20);

  shape(antennae, hx-95, hy-300);
  shape(antennae, hx+30, hy-240);

  //Eye
  noStroke();
  fill(150);
  quad(hx-50, hy-130, hx-70, hy-110, hx-200, hy-210, hx-130, hy-270);
  fill(255);
  stroke(160);
  strokeWeight(15);
  ellipse(hx-220, hy-300, 180, 180);
  noStroke();
  float r = random(0, 255);
  float b = random (0, 255);
  fill(r, 0, b);
  ellipse(hx-220, hy-300, 60, 60);


  //Arm
  noStroke();
  fill(10);
  quad(x+10, y+10, x+20, y+20, x+150, y-90, x+140, y-100);
  fill(100);
  triangle(x+150, y-90, x+190, y-75, x+220, y-140);
  triangle(x+140, y-100, x+120, y-140, x+180, y-180);


  //Legs
  fill(0);
  rectMode(CORNER);
  rect(x-100, y+100, 10, 100); 
  rect(x-30, y+100, 10, 100);
  fill(100);
  quad(x-90, y+200, x-100, y+200, x-150, y+220, x-90, y+220);
  quad(x-30, y+200, x-20, y+200, x+30, y+220, x-30, y+220);


  //Body
  fill(255);
  ellipse(x-50, y+50, 250, 200);
  fill(100);
  stroke(150);
  strokeWeight(3);
  ellipse(x, y, 50, 50);
  ellipse(x, y+100, 50, 50);
  ellipse(x+30, y+50, 50, 50);
  fill(0, 255, 0);
  triangle(x-100, y+50, x-30, y, x-30, y+100);
  fill(0);
  text ("START", x-85, y+55);
}

void move (){
  
hx=mouseX; //Head x-coordinate
hy=mouseY; //Head y-coordinate

   if (mousePressed) {
    fill (255, 0, 0);
    triangle (x-100, y+50, x-30, y, x-30, y+100);
    fill(0);
    text ("STOP", x-80, y+55);
  }
}
  
  
}

