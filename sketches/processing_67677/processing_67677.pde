
boolean state;
float rate = 4;
float x, y;


void setup() {
  size(1000, 800); //window size
  smooth(); //smooth shapes
  rectMode(CENTER);
  x = width/2;
  y = height/2;
}

void draw() {
  //BACKGROUND...
  //generating random numbers for r,g,b,a
  background(10); //black background
  float r, g, b, a; //red,green,blue,alpha variables
  float diam, bx, by; //diameter,x&y position
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  //generating randoms for diameter,x&y position
  diam = random(35);
  bx = random(width);
  by = random(height);

  //drawing ellipses
  noStroke();
  fill(r, g, b, a);
  ellipse(bx, by, diam, diam);


  drawZEVO();
  moveZEVOY();
  
}



 void drawZEVO() {
    //cloak circles
    for (int xi =0; xi< 285; xi+=5) {
      for (int yi=0; yi< 250; yi+=5) {
        strokeWeight(5);
        stroke(0, random(255), 0);
        point(x-138.34+xi, y+yi);
      }
    }

    //body
    //legs
    stroke(0);
    strokeWeight(1.5);
    fill(250, 230, 190);
    rect(x-70, y+160, 50, 80);
    rect(x+70, y+160, 50, 80);

    //shoes
    strokeWeight(1.5);
    fill(0, 230, 190);
    rect(x-78.34, y+200, 70, 30);
    rect(x+79.66, y+200, 70, 30);

    //arms & hands
    strokeWeight(1.5);
    fill(250, 230, 190);
    rect(x-140, y+20, 50, 120);
    ellipse(x-140, y+90, 60, 60);
    rect(x+140, y+20, 50, 120);
    ellipse(x+140, y+90, 60, 60);



    //short
    strokeWeight(2);
    fill(237, 255, 0);
    rect(x-70, y+100, 120, 100);
    rect(x+70, y+100, 120, 100);

    //shirt
    strokeWeight(2);
    fill(0, 230, 190);
    ellipse(x+140, y-20, 80, 80);
    ellipse(x-140, y-20, 80, 80);
    rect(x, y, 280, 200);

    //head
    strokeWeight(1.5);
    fill(250, 230, 190);
    ellipse(x, y-150, 350, 300);

    //eye1
    fill(255);
    strokeWeight(3);
    ellipse(x-87.5, y-200, 116, 85.7); //c1
    fill(150, 255, 255);
    ellipse(x-87.5, y-200, 58, 85.7); //c2
    fill(0);
    stroke(0);
    strokeWeight(25);
    point(x-87.5, y-200); //c3

    //eye2
    fill(255);
    strokeWeight(3);
    ellipse(x+87.5, y-200, 116, 85.7); //c1
    fill(150, 255, 255);
    ellipse(x+87.5, y-200, 58, 85.7); //c2
    stroke(0);
    fill(0);
    strokeWeight(25);
    point(x+87.5, y-200); //c3

    //nose
    noFill();
    strokeWeight(3);
    curve(x-44, y-270, x-40, y-100, x+42, y-100, x+46, y-270);

    //mouth
    curve(x-87.5, y-150, x-87.5, y-50, x+87.5, y-50, x+87.5, y-150);

    

    if (y < 0-250) {
      y = height + 250;
      x = mouseX;
    }
  }
  
  void moveZEVOY(){
    y =y-10;  
  }
