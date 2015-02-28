
boolean hitspace = false;

float x, y;
float targetX, targetY;
float easing = .05;

PImage rd1, rd2, vd1, vd2, bgimg;
//PShape vd1, vd2;
//***I replaced my .svg w/ .png because I kept getting an error
//about elliptical arcs not being supported, Bug #696

void setup() {
  size(480, 320);
  smooth();
  rd1 = loadImage("rldonut01.png");
  rd2 = loadImage("rldonut02.png");
  vd1 = loadImage("vcdonut01.png");
  vd2 = loadImage("vcdonut02.png");
  bgimg = loadImage("donutbg.png");
}

void draw() {
  background(bgimg);

  targetX = mouseX;
  targetY = mouseY;
  x = x + ((targetX - x) * easing); // makes donut follow the cursor
  y = y + ((targetY - y) * easing);


  if (hitspace == true) { //when spacebar is pressed, rd1 appears
    //image(rd1, x, y);
    imageMode(CENTER);
    if (mousePressed == true) { //in this mode, if mouse is clicked, rd2 should appear
      image(rd2, x, y);        
      imageMode(CENTER);
    }
    else {
      image(rd1, x, y);
    }

  }else {
    //image(vd1, x, y); // vd1 is the default if space isn't pressed
    imageMode(CENTER);
    if (mousePressed == true) { //in this mode, if mouse is clicked, vd2 should appear
      image(vd2, x, y);         
      imageMode(CENTER);
    }
    else {
      image(vd1, x, y);
    }

  }


}
void keyPressed() {
  if (key == ' ') {
    if (hitspace == true) {
      hitspace = false;
    } 
    else {
      hitspace = true;
    }


  }

}


