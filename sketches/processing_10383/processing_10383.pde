
public class Orbital {

  float x, y, z;

  float rad, sze;

  String txt;

  Orbital[] children;

  boolean is_selected = false;
  boolean is_clicked = false;

  color scolor;

  Orbital(float psize, float radius) {

    txt = "";

    this.sze = psize;
    this.rad = radius;


    children = new Orbital[0];

  }

  Orbital(Orbital parent, String txt) { // constructor for children

    this.txt = txt;

    this.sze = parent.sze/3*2;
    this.rad = parent.rad/2;


    children = new Orbital[0];

  }

  void update(float newx, float newy, float newz, boolean p_selected) {

    x = newx;
    y = newy;
    z = newz;

    if(p_selected) {
      is_selected = true;
    }

      // calculating sphere distribution

    // constants 
    float dphi = PI*(3-sqrt(5));
    float phi = 0;
    float dz = 2.0/float(children.length);
    float z = 1 - dz/2.0;

    // child downscaling
    float crad = rad/3;
    
    // determining positions children
    for(int i = 0; i < children.length; i++) {

      float r = crad*sqrt(1-z*z);

      float childx = r*cos(phi); 
      float childy = r*sin(phi); 
      float childz = crad*z;

      z = z - dz;
      phi = phi + dphi;
      
      // recursive update
      children[i].update(childx, childy, childz, is_selected);
    }

  }

  void draw() {

    pushMatrix();

    translate(x, y, z);

    if(is_selected) {
      scolor = color(255);
    } 
    else {
      scolor = color(0);
    }

    for(int i = 0; i < children.length; i++) {

      stroke(scolor);
      line(0,0,0, children[i].x, children[i].y, children[i].z);

      // recursive draw
      children[i].draw();

    }

    // orient to camera position
    float[] rotations = cam.getRotations();
    rotateX(rotations[0]);
    rotateY(rotations[1]);
    rotateZ(rotations[2]);

    if(is_clicked) {
      fill(scolor);
      text(txt, sze, 0, 150, 300);
    } 
    else {
      noFill();
    }

    stroke(scolor);    
    rect(-sze/2.0, -sze/2.0, sze, sze);

    if(!mousedragged) {

      if(isMouseover(mouseX, mouseY)) {

        if(mousePressed) {
          is_clicked = true;
          is_selected = true;

          focusx = modelX(0, 0, 0);
          focusy = modelY(0, 0, 0);
          focusz = modelZ(0, 0, 0);
        }
      } 
      else {
        //is_selected = false;
      }

      if(keyPressed) {
        if(key == ENTER || key == RETURN) {
          is_clicked = false;
          is_selected = false;
        }
      }
    }

    popMatrix();

  }


    // mouse handling  
  
  boolean isMouseover(float mousex, float mousey) {

    float left = screenX(-sze/2.0, -sze/2.0, 0);
    float right = screenX(sze/2.0, sze/2.0, 0);

    float top = screenY(-sze/2.0, -sze/2.0, 0);
    float bottom = screenY(sze/2.0, sze/2.0, 0);

    if(mousex > left && mousex < right) {
      if(mousey > top && mousey < bottom) {
        return true;
      }
    }

    return false;
  }


}


