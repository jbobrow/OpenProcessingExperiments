
//Gina DeMatteo
//Colors of Kandinsky
//Code derived from Nick's "dot filter" code given in lab

PImage myPic;

void setup() {
  size(300, 300);
  background(0);
  smooth();

  myPic = loadImage("kandinsky.jpg");
}

int cell = 40; //cell size

void draw() {
  background(0);

  //Filter properties
  for (int y=cell; y <= 250; y+=cell) {    
    for (int x=cell; x <= 180; x+=cell) {
      //pulls colors from source image
      color myFill = color(myPic.pixels[x + (y * 280)]);
      fill(myFill);
      strokeWeight(1);
      //rect size depends on brightness of pixel
      float radius = cell * (brightness(myPic.pixels[x + (y * 100)]) / 300);
      rect(x, y, radius, radius);

      //lines and points drawn to contrast with the rectngles in the composition
      //creates a balance/order/*
      stroke(myFill);
      strokeWeight(1); 
      line(200, 0, 200, 300);
      line(225, 0, 225, 300);
      line(250, 0, 250, 300);

      strokeWeight(6);
      point(200, 50);
      point(200, 250);
      point(225, 100);
      point(225, 200);
      point(250, 25);
      point(250, 150);
      point(250, 275);
    }
  }
}








