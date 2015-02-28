
//CARABINER
//matthew endler

Carabiner cb1, cb2;


void setup() {
  smooth();
  size (800,800);
  colorMode(HSB);
  cb1 = new Carabiner(40, 80, 45, 150, 500);
  cb2 = new Carabiner(15, 30, 100, 500, 700);
}

void draw() {
  background (255);
  cb1.appear();
  cb1.hinge();
  cb2.appear();
  cb2.hinge();
}

void mouseDragged() {
  cb1.touching(mouseX,mouseY);
}


class Carabiner {
  int x, y;
  int h, s, b;
  color g;
  int rotateval;

  Carabiner(int _h, int _s, int _b, int _x, int _y) {
    h=_h;
    s=_s;
    b=_b;
    x=_x;
    y=_y;
  }

  void appear() {
    fill(h, s, b);
    beginShape();
    vertex(x, y-135);
    vertex(x+20, y-20);
    vertex(x+23, y-14);
    vertex(x+29, y-7);
    vertex(x+38, y-3);
    vertex(x+46, y-1);
    vertex(x+56, y-2);
    vertex(x+68, y-6);
    vertex(x+75, y-11);
    vertex(x+80, y-19);
    vertex(x+83, y-25);
    vertex(x+85, y-31); //hinge lowerleftcorner and pivot point
    vertex(x+69, y-36); //hinge lowerrightcorner
    vertex(x+66, y-24);
    vertex(x+48, y-16);
    vertex(x+36, y-21);
    vertex(x+32, y-32);
    vertex(x+17, y-140);
    vertex(x+22, y-148);
    vertex(x+29, y-151);
    vertex(x+39, y-150);
    vertex(x+55, y-145);
    vertex(x+72, y-134);
    vertex(x+78, y-124);
    vertex(x+79, y-111); //hinge upperleftcorner
    vertex(x+98, y-108);  //hingeupperrightcorner
    vertex(x+97, y-122);
    vertex(x+93, y-137);
    vertex(x+81, y-151);
    vertex(x+61, y-160);
    vertex(x+37, y-168);
    vertex(x+20, y-165);
    vertex(x+6, y-156);
    vertex(x, y-142);
    endShape(CLOSE);
  }

  void touching(int mx, int my) {
    println("h:" + hue(g) + "s:" + saturation(g) + "b:" + brightness(g));
    g = get(mx, my);
    //if (hue(g) < h+1 || hue(g) > h-1  && saturation(g) < s+2 || saturation(g) > s-2 && brightness(g) == b) {
      if (brightness(g)==45){
      mx=x;
      my=y;
    }
  }


  void hinge() {

    pushMatrix();
    translate(x+69, y-36);
    rotate(radians(rotateval));
    fill(175);
    beginShape();
    vertex(0, 0);
    vertex(10, -75);
    vertex(29, -71);
    vertex(16, 5);
    endShape(CLOSE);
    fill(125);
    ellipse(9, -7, 5, 5);
    if (brightness(g) == 175) {
      rotateval--;
    } 
    else {
      rotateval++;
    }
    g = get(mouseX, mouseY);
    if (rotateval < -44) {
      rotateval =-44;
    }
    else {
      if (rotateval>0) {
        rotateval=0;
      }
    }

    popMatrix();
  }
}


