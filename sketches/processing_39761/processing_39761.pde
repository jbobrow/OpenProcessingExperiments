
//summer and winter
//code inspired from D.Shiftman, Learning Processing, p.115 as presentated by Prof Senske in Class week 6

int count=50; //number of sunshine and snow

float[]x=new float[count];
float[]y=new float[count];
//array x and y coordinate
float[]speed=new float[count];
//snow and sunshine speed


color sun=color (255, 255, 0);
color snow=color(255, 255, 255);
color iceblue=color(0, 200, 255);
color orangesky=color (250, 117, 8);
color syrup=color(255, 0, 0);
// create color name

void setup() {
  size(300, 300);
  for (int a=0;a<count;a++) {
    x[a]=random(width);
    y[a]=a*(height/count);
    speed[a]=random(0.5, 2);
  }
}

void draw() {
  background(255, 255, 255);
  if (mousePressed) {
    stroke(0);
    background(iceblue);
    noStroke();
    rectMode(CENTER);
    rect(150, 140, 150, 5);
    ellipse(150, 190, 60, 120);
    ellipse(150, 120, 30, 30);
    triangle(120, 110, 180, 110, 150, 90);
    //draw the snowman
    for (int a=0;a<count;a++) {
      fill(snow);
      ellipse(x[a], y[a], 10, 10); 
      y[a]=y[a]+speed[a];
      if (y[a]>width+5) {
        y[a]=-5;
        //draw the falling snow
      }
    }
  }
  else {
    background (orangesky);
    fill(syrup);
    noStroke();
    triangle(50, 75, 250, 75, 150, 200);
    rectMode(CENTER);
    rect(150, 225, 10, 100);
    triangle(100, 275, 200, 275, 150, 250);
    //draw the glass silhoutte
    fill(sun);
    stroke(sun);
    for (int a=0;a<count;a++) {
      rect(x[a], y[a], 2, 60); 
      y[a]=y[a]+speed[a];
      if (y[a]>width+2) {
        y[a]=-5;
        //draw the falling sunshine
      }
    }
  }
}


