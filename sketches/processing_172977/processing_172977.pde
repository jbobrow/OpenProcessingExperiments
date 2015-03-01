
class BoxStepper {
  int[] lastVec = new int[4];
  float i = 0;
  float r = random(0,255);
  BoxStepper () { }

  float drawBox(int start, int box_width) {
    float offsetY = mouseY;
    float offset = map(mouseX, 0, width, 0, 0.8);
    i = i + 0.05 + offset;
    float n = noise(0.04*i);

    stroke(255);
    strokeWeight(1);

    n *= height;
    // Draw Rect
    fill(n, n, n);
    noStroke();
    rect(start + box_width/2, height, -box_width, -1 * n +offsetY);

    int x1 = start + box_width/2;
    int y1 = int(height - n);
    int x2 = start + box_width/2 - box_width;
    int y2 = int(height - n);
    lastVec[0] = x1;
    lastVec[1] = y1;
    lastVec[2] = x2;
    lastVec[3] = y2;
    strokeWeight(1);
    //stroke(255*n-height/r);
    stroke(155);
    //stroke(r/0.8);
    line(x1, y1-1+offsetY, x2, y2-1+offsetY);

   
    for (int w=0; w < n; w++) {
      strokeWeight(1);
      //stroke(w-20*n/200, w*n/200, w-1+n/10);
      stroke(r-w-20*n/50, w*n/200-r, w-1+n/10-r);
      //stroke(w-20, w, w-1);
      line(x1, y1+w+offsetY, x2, y2+w+offsetY);
    }
    return n;
  }
  
}




int AMOUNT = 42; // NOTE :: Also Answer to Everything.
BoxStepper box1;
boolean FIRST = true;


void setup() {
  size(800, 400);
  //frameRate(20);
  box1 = new BoxStepper();
  background(0);
  // Random Backgroud Gradient
  int r = int(random(0, 255));
  int v = int(random(0, 155));
  for (int h=0; h<height+1; h++) {
    float s = map(h, 0, height, 155, 50);
    stroke(s*2-r+v, s/2+v, r);
    line(0, height-h, width, height-h);
  }
  // Random Stars:
  for (int star=0; star<=random (0, 5000); star++) {
    int st_x = int(random(0, width));
    int st_y = int(random(0, height));
    stroke(255);
    strokeWeight(random(0, 1.5));
    point(st_x, st_y);
  }
}

void draw() {
  if (FIRST) {
    strokeWeight(1);
    fill(255, 255, 255, 1);
    rect(20, 20, width-40, height-40);

    fill(255);
    textSize(12);
    text("Hill Generator V0.1", width/24, height/9);
    textSize(20);
    text("Mouse Left & Right is Frequency\n"
    +"Mouse Up & Down is Amplitude\n\n\n\n"
    +"Clicking Resets", width/3, height/3);

  } else {

    for (int i=0; i<AMOUNT; i++) {
      box1.drawBox(AMOUNT/2*i, AMOUNT/2);
    }
  }
}

void mousePressed() {
  setup(); // Reset on Click
  FIRST = false;
}

