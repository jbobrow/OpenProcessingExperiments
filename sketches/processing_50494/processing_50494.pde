
class CurveWidget {
  float x_pos = 0;        // top left x
  float y_pos = 0;        // top left y
  float d_width = 100;    // display width
  float d_height = 100;   // display height
  int num_datapoints = 10;// number of datapoints
  float data[];           // value array
  Datadot dots[];         // dot array

  CurveWidget() {
    // default constructor
    data = new float[num_datapoints];
    dots = new Datadot[num_datapoints];
    for (int i=0;i<num_datapoints;i++) {
      data[i] = 0.5;
      dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height, 9, this, i);
    }
  }

  CurveWidget(float x, float y, float w, float h, int n) {
    x_pos = x;
    y_pos = y;
    d_width = w;
    d_height = h;
    num_datapoints = n;
    data = new float[num_datapoints];
    dots = new Datadot[num_datapoints];
    for (int i=0;i<num_datapoints;i++) {
      data[i] = 0.5;
      dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
    }
  }

  void display() {
    // display widget background
    rectMode(CORNER);

    noStroke();
    fill(250);
    rect(x_pos, y_pos, d_width, d_height);

    // display grid
    stroke(220);
    for (int i=0;i<num_datapoints;i++) {
      line(x_pos, y_pos+(d_height/(num_datapoints-1)*i), x_pos+d_width, y_pos+(d_height/(num_datapoints-1)*i));
      line(x_pos+(d_width/(num_datapoints-1)*i), y_pos, x_pos+(d_width/(num_datapoints-1)*i), y_pos+d_height);
    }

    // display connecting lines
    float x_off = d_width/(num_datapoints-1);
    float last_datapoint = data[0];
    stroke(255, 153, 0, 160);
    strokeWeight(3);
    for (int i=1;i<num_datapoints;i++) {
      float curr_datapoint = data[i];
      float px = x_pos + (i)*(x_off);
      float py = y_pos + d_height - (curr_datapoint*d_height);
      float pxl = x_pos + (i-1)*(x_off);
      float pyl = y_pos + d_height - (last_datapoint*d_height);
      line(pxl, pyl, px, py);
      last_datapoint = curr_datapoint;
    }
    strokeWeight(1);
    noStroke();
    // display datadots
    Datadot last_datadot = dots[0];
    last_datadot.update(x_pos, y_pos+d_height);
    last_datadot.display();
    for (int i=1;i<num_datapoints;i++) {
      Datadot curr_datadot = dots[i];
      curr_datadot.update(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height);
      curr_datadot.display();
      last_datadot = curr_datadot;
    }
  }
  
  // debug function to print the data array to the console
  void printDatapoints() {
    for (int i=0;i<num_datapoints;i++) {
      float curr_datapoint = data[i];
      println("Datapoint " + i + " = " + curr_datapoint);
    }
  }

  public void click(float x, float y) {
    if (isInside(x, y)) {
      for (int i=0;i<num_datapoints;i++) {
        Datadot curr_dot = dots[i];
        curr_dot.click(x, y);
      }
    }
  }

  // initialize the data array with different curves
  public void setCurve(int kind) {
    float anginc = 0.0;
    float ang = 0.0;
    switch(kind) {
    case 1: // ramp up
      for (int i=0;i<num_datapoints;i++) {
        data[i] = 1.0/(num_datapoints-1)*i;
        dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
      }
      break;
    case 2: // ramp down
      for (int i=0;i<num_datapoints;i++) {
        data[i] = 1.0 - (1.0/(num_datapoints-1)*i);
        dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
      }
      break;
    case 3: // sine
      anginc = TWO_PI/(num_datapoints-1);
      ang = 0.0;
      for (int i=0;i<num_datapoints;i++) {
        ang = i*anginc;
        data[i] = (sin(ang)+1.0)/2.0;
        dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
      }
      break;
    case 4: // half up sine
      anginc = PI/(num_datapoints-1);
      ang = 0.0;
      for (int i=0;i<num_datapoints;i++) {
        ang = i*anginc;
        data[i] = sin(ang);
        dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
      }
      break;
    case 5: // half down sine
      anginc = PI/(num_datapoints-1);
      ang = 0.0;
      for (int i=0;i<num_datapoints;i++) {
        ang = PI + (i*anginc);
        data[i] = 1.0 + sin(ang);
        dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
      }
      break;
    case 6: // down sine
      anginc = PI/(num_datapoints-1);
      ang = 0.0;
      for (int i=0;i<num_datapoints;i++) {
        ang = HALF_PI + (i*anginc);
        data[i] = (1.0 + sin(ang))/2.0;
        dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
      }
      break;
    case 7: // up sine
      anginc = PI/(num_datapoints-1);
      ang = 0.0;
      for (int i=0;i<num_datapoints;i++) {
        ang = PI + HALF_PI + (i*anginc);
        data[i] = (1.0 + sin(ang))/2.0;
        dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
      }
      break;
    case 8: // noise
      for (int i=0;i<num_datapoints;i++) {
        data[i] = constrain(noise(i*random(0.05)) * 1.1, 0.0, 1.0);
        dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
      }
      break;
    case 9: // random
      for (int i=0;i<num_datapoints;i++) {
        data[i] = random(1.0);
        dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
      }
      break;

    default: // straight line
      for (int i=0;i<num_datapoints;i++) {
        data[i] = 0.5;
        dots[i] = new Datadot(x_pos+(i*(d_width/(num_datapoints-1))), y_pos+d_height-(d_height*data[i]), 9, this, i);
      }
      break;
    }
  }
 
  // get the data array with numbers between 0.0 and 1.0
  public float[] getData() {
    return data;
  }

  // helper function 
  private boolean isInside(float x, float y) {
    if ((x<x_pos+d_width)&&(x>x_pos)&&(y<y_pos+d_height)&&(y>y_pos)) {
      return true;
    }
    else {
      return false;
    }
  }
}


