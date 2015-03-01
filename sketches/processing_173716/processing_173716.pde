

Kaleidoscope scope=new Kaleidoscope();
float move;
int state;
int counter;
void setup() {
  size(1000, 1000);
}
void draw() {
  counter++;
  background(0);
  scope.mousePressed();
  scope.update();
  scope.colorUpdate(); 

  scope.drawShape(0, 0, width/2, color(20), 6, 0, state);
  fill(255);
  textSize(24);
  if (counter>60) {
    state=state+1; 
    counter=0;
    if (state>4) {
      state=0;
    }
  }
}
class Kaleidoscope {
  float x, y, l, theta, count, num, pos, posTwo, posThree, posFour, posFive;
  color c;
  Kaleidoscope() {
    x=0;
    y=0;
    l=0;
    c=0; 
    theta=0;
    count=0;
    num=200;
    pos=0;
    posTwo=0;
    posThree=0;
    posFour=0;
    posFive=0;
    count=-.003;
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

      //Ellipses//
      for (int j=0; j<3; j++) {
        ellipse(x+l/j, y, l/j, l/j);
        ellipse(x-l/j, y, l/j, l/j);
        ellipse(x, y-l/j, l/j, l/j);
        ellipse(x, y+l/j, l/j, l/j);
      }
    }
    if (s==2) {

      //Rectanlges//
      rect(x, y, x-l/2, y-l/2);
      rect(x, y, x+l/2, y-l/2);
      rect(x, y, x+l/8, y-l/8);
      rect(x, y, x-l/8, +l/8);
    }
    if (s==3) {

      //Cool lines//
      strokeWeight(l/10);
      stroke(c, 800/l);
      line(x, 0, 0, y);
      line(0, x, y, 0);
    }
    if (s==4) {
      num=150;
      rect(l/2, y, y, l/2); 
      rect(l/2, x, x, l/2); 
      rect(sqrt(l/2), x, sqrt(l), l/2); 
      rect(x, y, l/5, l/2+x);
    }
    popMatrix();


    if (l>num) {
      for (int n=0; n<hexNum; n++) {
        drawShape((l*3/4)*cos(n*trigCalc(hexNum)), l*3/4*sin(n*trigCalc(hexNum)), l/4, color(pos, posTwo, posFour), 1, 0, s);
        drawShape((l*(sqrt(3)/4))*cos(n*trigCalc(hexNum)+PI/6), l*(sqrt(3)/4)*sin(n*trigCalc(hexNum)+PI/6), l/4, color(posTwo, posFive, posThree), 3, 0, s);
        drawShape((l*(sqrt(3)/2))*cos(n*trigCalc(hexNum)+PI/6), l*(sqrt(3)/2)*sin(n*trigCalc(hexNum)+PI/6), l/4, color(posThree, posTwo, posFour), 3, 0, s);
      }
      drawShape(x+l, y, l/2, color(posFour, posFour, posThree), 6, 0, s);
      drawShape(x-l, y, l/2, color(posTwo, posFour, pos), 6, 0, s);
    }
  }

  //Rotation Control//
  void update() {
    theta=theta+count;
  }
  void colorUpdate() {
    pos=127.5+127.5*cos(theta);
    posTwo=127.5+127.5*cos(4*theta);
    posFour=127.5+127.5*cos(5*theta);
    posThree=127.5+127.5*cos(6*theta);
  }

  //divices 2PI by number of hexagons.//
  float trigCalc(int hexNum) {
    float calc=2*PI/hexNum;
    return calc;
  }
  void mousePressed() {
    if (mouseButton==LEFT) {

      num=100;
    }
    if (mouseButton==CENTER) {
      num=200;
    }
    if (mouseButton==RIGHT) {
      num=300;
    }
  }
}
//by Christian Bigham//

