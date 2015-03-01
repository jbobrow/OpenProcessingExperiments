
Kaleidoscope scope=new Kaleidoscope();
float move;
int state;
void setup() {

  size(800, 800);
}
void draw() {
  background(0);
  scope.mousePressed();
  scope.update();
  scope.drawShape(0, 0, width/2, color(20), 6, 0, state);
  fill(255);
  textSize(24);
  text("State "+ (state+1), 25, 25, width, height);
}

void mousePressed() {
  if (mouseButton == LEFT) { 
    if (state<4) {
      state++;
    } else {
      state=0;
    }
  }
}



class Kaleidoscope {

  float x, y, l, theta, count, num, pos, posTwo, posThree;
  color c;


  Kaleidoscope() {
    x=0;
    y=0;
    l=0;
    c=0; 
    theta=0;
    count=0;
    num=30;
    pos=dist(0, 0, mouseX, mouseY)/dist(0, 0, 800, 800);
    posTwo=dist(mouseX, mouseY, 800, 800)/dist(800, 800, 0, 0);
    posThree=dist(mouseX, mouseY, 0, 800)/dist(800, 800, 0, 0);
  }
//Primary Function//
  void drawShape(float x, float y, float l, color c, int hexNum, float rad, int s) {
    noStroke();
    //Pushmatrix so we can ltimately rotate//
    pushMatrix();
    //Push origin to center.
    translate(width/2, height/2); 
    //Rotate Controler//Rotates canvas//  
    rotate(theta+rad); 
    fill(c, l*.34);
    if (s==0) {
      //Draw Hexagon at origin//    

      num=80;
      triangle(x, y, x-l/2, y+(l*sqrt(3)/2), x-l, y);
      fill(c, l*.7);
      triangle(x, y, x+l/2, y-(l*sqrt(3)/2), x+l, y);
      fill(c, l*.55);
      triangle(x, y, x-l/2, y-(l*sqrt(3)/2), x-l, y);
      fill(c, l*.4);
      triangle(x, y, x+l/2, y+(l*sqrt(3)/2), x+l, y);
      fill(c, l/3);
      triangle(x, y, x+l/2, y+(l*sqrt(3)/2), x-l/2, y+(l*sqrt(3)/2));
      fill(c, l*.67);
      triangle(x, y, x-l/2, y-(l*sqrt(3)/2), x+l/2, y-(l*sqrt(3)/2));
    }
    if (s==1) {
      num=100;
      //Ellipses//
      for (int j=0; j<5; j++) {
        ellipse(x+l/j, y, l/j, l/j);
        ellipse(x-l/j, y, l/j, l/j);
        ellipse(x, y-l/j, l/j, l/j);
        ellipse(x, y+l/j, l/j, l/j);
      }
    }
    if (s==2) {
      num=50;
      //Rectanlges//
      rect(x, y, x-l/2, y-l/2);
      rect(x, y, x+l/2, y-l/2);
      rect(x, y, x-l/4, y+l/4);
      rect(x, y, x+l/8, y-l/8);
      rect(x, y, x-l/8, +l/8);
    }
    if (s==3) {
      num=60;
      //Cool lines//
      strokeWeight(l/10);
      stroke(c, 800/l);
      line(x, 0, 0, y);
      line(0, x, y, 0);
    }
    if (s==4) {
      num=60;
      rect(x, l/4, y, l/4);
      rect(y, l/4, x, l/4);

      rect(l/2, y, y, l/2); 
      rect(l/2, x, x, l/2); 
      rect(sqrt(l/2), x, sqrt(l), l/2); 
      rect(x, y, l/5, l/2+x);
    }
    popMatrix();


    if (l>num) {
      for (int n=0; n<hexNum; n++) {
        drawShape((l*3/4)*cos(n*trigCalc(hexNum)), l*3/4*sin(n*trigCalc(hexNum)), l/4, color(mouseX*255/width, mouseY*255/height, pos*255), 1, 0, s);
        drawShape((l*(sqrt(3)/4))*cos(n*trigCalc(hexNum)+PI/6), l*(sqrt(3)/4)*sin(n*trigCalc(hexNum)+PI/6), l/4, color(posThree*255, mouseX*255/width, mouseY*255/height), 3, 0, s);
        drawShape((l*(sqrt(3)/2))*cos(n*trigCalc(hexNum)+PI/6), l*(sqrt(3)/2)*sin(n*trigCalc(hexNum)+PI/6), l/4, color(mouseY*255/height, posTwo*255, mouseX*255/width), 3, 0, s);
      }
      drawShape(x+l, y, l/2, color(mouseX*255/width, posThree*255, mouseY*255/height), 6, 0, s);
      drawShape(x-l, y, l/2, color(255*posTwo, mouseY*255/height, mouseX*255/width), 6, 0, s);
    }
  }

  //Rotation Control//
  void update() {
    theta=theta+count;
  }

  //divices 2PI by number of hexagons.//
  float trigCalc(int hexNum) {
    float calc=2*PI/hexNum;
    return calc;
  }

  //control center//count controls rotation rate//
  void mousePressed() {
    if (mouseButton==LEFT) {

      count=-.01;
    }
    if (mouseButton==CENTER) {
      count=0;
    }
    if (mouseButton==RIGHT) {
      count=.01;
    }
  }
}

//by Christian Bigham//

