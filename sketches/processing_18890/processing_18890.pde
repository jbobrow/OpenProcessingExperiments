
float x = 0;
float y = 0;
float x2 = 0;
float y2 = 0;
float easing = 0.05;

void setup() {
  size(640, 480);
  noStroke();
}

void draw() {
  smooth();
  background(#002115);

  if (mousePressed) {
    float easing = 0.15;
    
    //jetsam eye color change to red
    pushMatrix();
    fill(#E30004);
    
    //jetsam left eye ball
    translate(170, 191);
    rotate(PI/7);
    ellipse(30, 20, 150, 105);
    popMatrix();
    
    //jetsam right eye ball
    pushMatrix();
    translate(473, 191);
    rotate(-PI/7);
    ellipse(-30, 20, 150, 105);
    popMatrix();

    int w = 40;
    int h = 90;
    int w2 = 10;
    
    //jetsam left pupil
    fill(#002115);
    float mx = constrain(mouseX, 150, 240);
    float my = constrain(mouseY, 240, 270);
    x += (mx-x) * easing;
    y += (my-y) * easing;
    ellipse(x, y, w/2, h);
    
    //jetsam left eye lights
    fill(#C4CB06);
    ellipse(x+3, y-21, 7, 7);
    fill(#C4CB06);
    ellipse(x+4.5, y-13.5, 3, 3);
    
    //jetsam right pupil
    fill(#002115);
    float mx2 = constrain(mouseX, 400, 490);
    float my2 = constrain(mouseY, 240, 270);
    x2 += (mx2-x2) * easing;
    y2 += (my2-y2) * easing;
    ellipse(x2, y2, w/2, h);
            
    //jetsam right eye lights
    fill(#C4CB06);
    ellipse(x2+3, y2-21, 7, 7);
    fill(#C4CB06);
    ellipse(x2+4.5, y2-13.5, 3, 3);
    
    fill(#002115);
    triangle(90, 165, 198, 100, 248, 209);
    triangle(395.5, 210, 445, 99, 580, 163);
    
  } 


  else {
    smooth();
    pushMatrix();
    //flotsam eye color
    fill(#72AF04);
    
    //flotsam left eye ball
    translate(170, 191);
    rotate(PI/7);
    ellipse(30, 20, 150, 105);
    popMatrix();
    
    //flotsam right eye ball
    pushMatrix();
    translate(473, 191);
    rotate(-PI/7);
    ellipse(-30, 20, 150, 105);
    popMatrix();

    fill(#002115);
    
    //flotsam left iris
    float mx = constrain(mouseX, 130, 230);
    float my = constrain(mouseY, 218, 245);
    x += (mx-x) * easing;
    y += (my-y) * easing;
    ellipse(x, y, 60, 70);
    
    //flotsam left eye lights
    fill(#C4CB06);
    ellipse(x+15, y-5, 15, 15);
    fill(#C4CB06);
    ellipse(x+19, y+8, 5, 5);
    
    //flotsam right iris
    float mx2 = constrain(mouseX, 400, 498);
    float my2 = constrain(mouseY, 219.5, 245);
    x2 += (mx2-x2) * easing;
    y2 += (my2-y2) * easing;
    fill(#002115);
    ellipse(x2, y2, 60, 70);
    triangle(90, 165, 198, 100, 248, 209);
    triangle(395.5, 210, 445, 99, 580, 163);
    
     //flotsam right eye lights
    fill(#C4CB06);
    ellipse(x2+15, y2-8, 15, 15);
    fill(#C4CB06);
    ellipse(x2+19, y2+6, 5, 5);
    
  }
}


