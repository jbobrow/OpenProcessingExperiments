
void setup() {
  size (500, 500);
  fill(255);
  smooth();
}
 
 
void draw() {
  
 noStroke();
  background(255);
  fill(85,85,85);
  rect(100,175,300,200);
  fill(85,85,85,80);
  rect(90,165,320,220);
  fill(139,95,38);
  rect(30,385,450,30);
  fill(118,81,32);
  rect(50,415,410,50);
  fill(198,158,104);
  rect(50,415,40,80);
  rect(420,415,40,80);
  
     stroke(0);
  strokeWeight(3);
  int antennaX = random(mouseX/10);
  int antennaY = random(mouseY/10);
  int antennaA = random(mouseX/10);
  int antennaB = random(mouseY/10);
  line(160+antennaX,70+antennaY,250,165);
  line(250,165,350+antennaA,50+antennaB);
  strokeWeight(1);
  ellipse(160+antennaX,70+antennaY,6,6);
  ellipse(350+antennaA,50+antennaB,6,6);
  
noStroke();
 fill(255);
  float mPos;
  float nPos;
  int mnSize = 5;
  int mnDistance = 3;

  for (int m=120; m<150; m=m+mnDistance) {
    for (int n=200; n<350; n=n+mnDistance) {

      mPos = m + random(mouseX/70);
      nPos = n + random(mouseX/70);
 
      ellipse(mPos, nPos, mnSize, mnSize);
    }
  }
 
  fill(243,250,53);
  float cPos;
  float dPos;
  int cdSize = 5;
  int cdDistance = 3;

  for (int c=150; c<180; c=c+cdDistance) {
    for (int d=200; d<350; d=d+cdDistance) {

      cPos = c + random(mouseX/70);
      dPos = d + random(mouseX/70);
 
      ellipse(cPos, dPos, cdSize, cdSize);
    }
  }
    fill(0,255,255);
  float aPos;
  float bPos;
  int abSize = 5;
  int abDistance = 3;

  for (int a=180; a<210; a=a+abDistance) {
    for (int b=200; b<350; b=b+abDistance) {

      aPos = a + random(mouseX/70);
      bPos = b + random(mouseX/70);
 
      ellipse(aPos, bPos, abSize, abSize);
    }
  }
  fill(0,255,0);
  float ePos;
  float fPos;
  int efSize = 5;
  int efDistance = 3;

  for (int e=210; e<240; e=e+efDistance) {
    for (int f=200; f<350; f=f+efDistance) {

      ePos = e + random(mouseX/70);
      fPos = f + random(mouseX/70);
 
      ellipse(ePos, fPos, efSize, efSize);
    }
  }
    fill(250,53,247);
  float gPos;
  float hPos;
  int ghSize = 5;
  int ghDistance = 3;

  for (int g=240; g<270; g=g+ghDistance) {
    for (int h=200; h<350; h=h+ghDistance) {

      gPos = g + random(mouseX/70);
      hPos = h + random(mouseX/70);
 
      ellipse(gPos, hPos, ghSize, ghSize);
    }
  }
    fill(255,0,0);
  float iPos;
  float jPos;
  int ijSize = 5;
  int ijDistance = 3;

  for (int i=270; i<300; i=i+ijDistance) {
    for (int j=200; j<350; j=j+ijDistance) {

      iPos = i + random(mouseX/70);
      jPos = j + random(mouseX/70);
 
      ellipse(iPos, jPos, ijSize, ijSize);
    }
  }
      fill(0,0,255);
  float kPos;
  float lPos;
  int klSize = 5;
  int klDistance = 3;

  for (int k=300; k<330; k=k+klDistance) {
    for (int l=200; l<350; l=l+klDistance) {

      kPos = k + random(mouseX/70);
      lPos = l + random(mouseX/70);
 
      ellipse(kPos, lPos, klSize, klSize);
    }
  }
  }

