
float mx;
float my;
float easing = 0.5;
int radius = 24;
int edge = 100;
int inner = edge + radius;
int trans  = 15;
PImage bg;
PImage clear;
PImage mount;
PImage rain;
PImage sun1;
PImage sun2;
PImage sun3;
/* @pjs preload="nextgray.jpg"; */
void setup() {
  size(800, 602);
  bg = loadImage("nextgray.jpg");
  clear = loadImage("cloudscl.GIF");
  mount = loadImage("colormount.jpg");
  rain = loadImage("rain.GIF");
  sun1 = loadImage("transition0.GIF");
  sun2 = loadImage("transition1.GIF");
  sun3 = loadImage("transition2.GIF");
  noStroke(); 
  imageMode(CENTER);
}

void draw() { 
  background(0);
  image(bg, 400, 301, 800, 602);
  
  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }
  
  mx = constrain(mx, 100, 700);
  my = constrain(my,50, 170);
  
  tint(255, trans);  // Display at half opacity
  image(mount, 400, 301, 800, 602);
  tint(255, 255);
  if (trans < 225) {
      image(clear, mx, my, 350, 154);
  } else if (trans == 225) {
      image(sun1, mx,my, 350, 154);
  } else if (trans == 240) {
       image(sun2, mx,my, 350, 154);
  } else if (trans >= 255) {
    image(sun3, mx,my, 350, 154);
  }
  if (mousePressed == true) {
    if (trans < 255){
     image(rain, mx, my+300, 200, 690);
    }
  }
  
}

void mouseReleased() {
  trans += 15;
}


