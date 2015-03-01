
boolean m_c = false;
boolean loading = false;

void setup() {
  size(600, 600, P3D);
  translate(0, 0);
  frameRate(60);
}

float RECT_SZ = 100;

void draw() {
  colorMode(HSB, 360, 100, 100);
  background(0);
  stroke(map(mouseX, 0, width, 0, 360), map(mouseX, 0, width, 0, 100), map(mouseX, 0, width, 0, 100));
  fill(map(mouseX, 0, width, 0, 360), map(mouseX, 0, width, 0, 100), map(mouseX, 0, width, 0, 100));;
  
  if (RECT_SZ == 600) loading = true;
  
  if(m_c == true && loading == false) {
    //stroke(255);
    rect(width/2, height/2, RECT_SZ, RECT_SZ);
    RECT_SZ ++;
  } else if (loading == true) {
      stroke(255);
      fill(255);
      rect(width/2, height/2, RECT_SZ, RECT_SZ);
      textMode(CENTER);
      fill(0);
      text("Load Complete", width/2, height/2);
    }
  
  else if(!(mouseX<30 || mouseX>570)) RECT(mouseX,height/2,0);
  
  
  
}

void RECT(float x, float y, float z) {
  float a;
  
  if(x<100) a = 90;
  else if (x<300) a = map(x, 100, 300, 90, 0);
  else if (x<500) a = map(x, 300, 500, 0, -90);
  else a = -90;
  
  translate(x, y, z);
  
  rotateY(radians(a));
  rectMode(CENTER);
  rect(0, 0, RECT_SZ, RECT_SZ);
}

void mouseClicked() {
  if((mouseX>250 && mouseX<350)) m_c = !m_c;
}
