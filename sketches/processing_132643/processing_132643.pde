
Line line;
Control[] controls = new Control[6];

color c1, c2, c3, c4;//colors used by controls

void setup() {
  size(400, 400);
  frameRate(30);

  c1 = color(255, 60, 77, 190);
  c2 = color(217, 255, 0, 190);
  c3 = color(0, 204, 255, 190);
  c4 = color(255, 140, 0, 190); 

  line = new Line(); 

  controls[0] = new Control(20, 30, c1);
  controls[1] = new Control(60, 60, c2);  
  controls[2] = new Control(99, 90, c3);
  controls[3] = new Control(110, 120, c4);
  controls[4] = new Control(370, 370, c3);
  controls[5] = new Control(380, 380, c4);
}

boolean paused = false;
int select = -1;//tracks which controller is selected  -1 is none
int skin = 1;//which color scheme is selected

void draw() {
  backGround();
  line.display();
  foreGround();
}

//*******************************************************************************
//  LINE CLASS
//*******************************************************************************

class Line {
  float amp1;//amplitude of first sine wave
  float amp2;//amplitude of second sine wave - the two are later summed into one signal
  float freq1;//frequency of first sine wave
  float freq2;//frequency of second sine wave

  Line() {
  }

  void display() {
    freq1 = map(controls[0].x, controls[0].sx - 11, controls[0].sx + 11, 1, 28);
    freq2 = map(controls[2].x, controls[2].sx - 11, controls[2].sx + 11, 1, 16);
    amp1 = map(controls[1].x, controls[1].sx - 11, controls[1].sx + 11, 2, 120);
    amp2 = map(controls[3].x, controls[3].sx - 11, controls[3].sx + 11, 02, 120);
    float f = frameCount/50.0;
    strokeWeight(2);
    beginShape();
    for (int j = 0; j < 10; j++) {
      float f1 = sin(f * freq1 + ((j + 1) * 50)) * amp1;
      float f2 = sin(f * freq2 + ((j + 1) * 50) * freq2) * amp2;
      float y = height/2 + f1 + f2;
      curveVertex(j*60 - 60, y);
    }
    endShape();
  }
}


//*******************************************************************************
//  CONTROL CLASS
//*******************************************************************************
class Control {
  float x;
  float sx;//static x used to constrain control movement
  color c;

  Control(float _x, float _sx, color _c) {
    x = _x;
    sx = _sx;
    c = _c;
  }
}


//*******************************************************************************
//  MOUSE FUNCTIONS
//*******************************************************************************

void mouseMoved() {
  select = -1;
  for (int i = 0; i < controls.length; i++) {
    if (dist(mouseX, mouseY, controls[i].x, 390) < 6) {
      select = i;
    }
  }
};

void mouseDragged() {
  if (select != -1) {
    if (select < 4) {
      controls[select].x=constrain(mouseX, controls[select].sx-11, controls[select].sx+11);
    }
  }
};

void mouseClicked() {
  if (dist(mouseX, mouseY, controls[5].x, 390) < 6) {
    if (!paused) { 
      noLoop(); 
      paused = true;
    }
    else { 
      loop(); 
      paused = false;
    }
  }
  if (dist(mouseX, mouseY, controls[4].x, 390) < 6) {
    skin += 1;
    if (skin > 3) {
      skin = 0;
    }
  }
};


//*******************************************************************************
//  BACKGROUND / FOREGROUND
//*******************************************************************************

void backGround() {
  if (skin == 0) {    
    fill(255, 213, 0, 25);   
    noStroke();
    rect(0, 0, width, height); 
    stroke(255, 60, 0);
  }
  if (skin == 1) {    
    fill(60, 22, 65, 25);    
    noStroke();
    rect(0, 0, width, height);       
    stroke(255, 181, 158);
  }    
  if (skin == 2) {    
    fill(102, 102, 255, 25); 
    noStroke();
    rect(0, 0, width, height);     
    stroke(67, 2, 3);
  }
  if (skin == 3) {    
    fill(95, 232, 230, 25);
    noStroke();
    rect(0, 0, width, height);
    stroke(49, 97, 21);
  }
}

void foreGround() {
  noStroke();
  fill(0, 0, 0, 200);
  rect(controls[0].sx - 20, 385, 130, 10, 100);
  rect(362, 385, 26, 10, 100);
  for (int i = 0; i < controls.length; i++) {
    fill(controls[i].c);
    ellipse(controls[i].x, 390, 6, 6);
  }
}

