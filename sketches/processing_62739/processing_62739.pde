
class aLine {
  private int[] coords, vib;
  private int i, vibMax, addXa, addXb, addYa, addYb, speed, shade, shadeAdd;
  private boolean direction;

  public aLine() {
    coords = new int[int(random(4, 15))*2];
    vib = new int[coords.length];
    speed = int(random(1, 5));
    shade = int(random(255));
    shadeAdd = int(random(1,5));
    if (random(2)>1) {
      coords[0] = int(random(10, width-10));
      coords[1] = 0;
      coords[coords.length-2] = width-coords[0];
      coords[coords.length-1] = height;
      addXa = speed;
      addYa = 0;
      addXb = speed;
      addYb = 0;
    } 
    else {
      coords[0] = 0;
      coords[1] = int(random(10, height-10));
      coords[coords.length-2] = width;
      coords[coords.length-1] = height-coords[1];
      addXa = 0;
      addYa = -speed;
      addXb = 0;
      addYb = -speed;
    }
    for (i=2; i < coords.length-2; i += 2) {
      coords[i] = int(random(10, width-10));
      coords[i+1] = int(random(10, height-10));
    }
    //vib = 0;
    vibMax = int(random(4, 14));
    direction = true;
  }

  public void update() {
    noFill();
    beginShape();
    if ((shade + shadeAdd>= 255) || (shade + shadeAdd <= 0)) shadeAdd = -shadeAdd;
    shade += shadeAdd;
    stroke(shade, 255-(shade/2)-(vib[2]*10));

    changeDirectionA();
    coords[0] += addXa;
    coords[1] += addYa;
    curveVertex(coords[0], coords[1]);
    curveVertex(coords[0], coords[1]);
    for (i=2; i < coords.length-2; i+=2) {
      if ((coords[i-2] - coords[i]) < (coords[i-1] - coords[i+1])) {
        if (direction) {
          curveVertex(coords[i] + ++vib[i], coords[i+1]);
        } 
        else {
          curveVertex(coords[i] + --vib[i], coords[i+1]);
        }
      }
      else {
        if (direction) {
          curveVertex(coords[i], coords[i+1] + ++vib[i]);
        } 
        else {
          curveVertex(coords[i], coords[i+1] + --vib[i]);
        }
      }
      if ((vib[i] > vibMax) || (vib[i] < -vibMax)) direction = !direction;
    }
    changeDirectionB();
    coords[i] += addXb;
    coords[i+1] += addYb;
    curveVertex(coords[i], coords[i+1]);
    curveVertex(coords[i], coords[i+1]);
    endShape();
  }

  private void changeDirectionA() {
    if ((coords[0] <= 0) && (coords[1] <= 0)) {
      coords[0] = 0;
      coords[1] = 0;
      addXa = speed;
      addYa = 0;
    }
    if ((coords[0] >= width) && (coords[1] <= 0)) {
      coords[0] = width;
      coords[1] = 0;
      addXa = 0;
      addYa = speed;
    }
    if ((coords[0] >= width) && (coords[1] >= height)) {
      coords[0] = width;
      coords[1] = height;
      addXa = -speed;
      addYa = 0;
    }
    if ((coords[0] <= 0) && (coords[1] >= height)) {
      coords[0] = 0;
      coords[1] = height;
      addXa = 0;
      addYa = -speed;
    }
  }

  private void changeDirectionB() {
    if ((coords[i] <= 0) && (coords[i+1] <= 0)) {
      coords[i] = 0;
      coords[i+1] = 0;
      addXb = 0;
      addYb = speed;
    }
    if ((coords[i] >= width) && (coords[i+1] <= 0)) {
      coords[i] = width;
      coords[i+1] = 0;
      addXb = -speed;
      addYb = 0;
    }
    if ((coords[i] >= width) && (coords[i+1] >= height)) {
      coords[i] = width;
      coords[i+1] = height;
      addXb = 0;
      addYb = -speed;
    }
    if ((coords[i] <= 0) && (coords[i+1] >= height)) {
      coords[i] = 0;
      coords[i+1] = height;
      addXb = speed;
      addYb = 0;
    }
  }
}


