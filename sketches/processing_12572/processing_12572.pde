
class colorCycler {
  float cycleSpeed;
  float r_part;
  float b_part;
  float g_part;
  float r_target;
  float b_target;
  float g_target;
  boolean r_upwards;
  boolean g_upwards;
  boolean b_upwards;

  colorCycler(float cycleSpeed_in) {
    cycleSpeed = cycleSpeed_in;
    randomColor();
  }
  
  void randomColor() {
    /*r_part = random(255);
    g_part = random(255);
    b_part = random(255);*/
    r_part = 255;
    g_part = 255;
    b_part = 255;
    r_target = random(255);
    g_target = random(255);
    b_target = random(255);
  }

  //cycle the color one and return it
  color nextColor() {
    //red part
    if (r_part >= r_target) {
      if(r_upwards) {//target reached
        r_target = random(255);
        if (r_target >= r_part) {
          r_upwards = true;
        }
        else {
          r_upwards = false;
        }
      }
      else {
        r_part -= cycleSpeed;
      }
    }
    else {
      if(r_upwards) {
        r_part += cycleSpeed;
      }
      else {//target reached
        r_target = random(255);
        if (r_target >= r_part) {
          r_upwards = true;
        }
        else {
          r_upwards = false;
        }
      }
    }

    //green part
    if (g_part >= g_target) {
      if(g_upwards) {//target reached
        g_target = random(255);
        if (g_target >= g_part) {
          g_upwards = true;
        }
        else {
          g_upwards = false;
        }
      }
      else {
        g_part -= cycleSpeed;
      }
    }
    else {
      if(g_upwards) {
        g_part += cycleSpeed;
      }
      else {//target reached
        g_target = random(255);
        if (g_target >= g_part) {
          g_upwards = true;
        }
        else {
          g_upwards = false;
        }
      }
    }

    //blue part
    if (b_part >= b_target) {
      if(b_upwards) {//target reached
        b_target = random(255);
        if (b_target >= b_part) {
          b_upwards = true;
        }
        else {
          b_upwards = false;
        }
      }
      else {
        b_part -= cycleSpeed;
      }
    }
    else {
      if(b_upwards) {
        b_part += cycleSpeed;
      }
      else {//target reached
        b_target = random(255);
        if (b_target >= b_part) {
          b_upwards = true;
        }
        else {
          b_upwards = false;
        }
      }
    }

    colorMode(RGB);
    return(color(r_part,g_part,b_part));
  }
}


