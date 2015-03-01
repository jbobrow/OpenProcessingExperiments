
float counter = 0;
int diam = 30;
int stage = 0;
float counterTwo = 0;
int tTwo = 500;
int t= tTwo/2;

void setup() {
  size(950,950);
  background(255);
  noStroke();
}
void mousePressed() {
  background(255);
}

void draw() {
  if (counterTwo<tTwo) {
    counterTwo ++;
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(255);

    if (stage==0) {
      float xPos = int(random(.5*width/diam))*diam;
      float yPos = int(random(.5*height/diam))*diam;
      if (counter<t) {
        counter++;
        fill(r, 0, 0, a);
        ellipse(xPos+diam, yPos, diam, diam);
      } else {
        counter = 0;
        stage = 1;
      }
    } else if (stage==1) {
      if (counter<t) {
        float xPos = int(random(.5*width/diam, width/diam))*diam;
        float yPos = int(random(.5*height/diam, height/diam))*diam;
        counter++;
        fill(0, g, 0, a);
        ellipse(xPos+diam, yPos+diam, diam, diam);
      } else {
        counter=0;
        stage=2;
      }
    } else if (stage==2) {
      float xPos = int(random(.5*width/diam))*diam;
      float yPos = int(random(.5*height/diam, height/diam ))*diam;
      if (counter<t) {
        counter++;
        fill(0, 0, b, a);
        ellipse(xPos, yPos+diam, diam, diam);
      } else {
        counter=0;
        stage=3;
      }
    } else if (stage==3) {
      float xPos = int(random(.5*width/diam, width/diam))*diam;
      float yPos = int(random(.5*height/diam))*diam;
      if (counter<t) {
        counter++;
        fill(r, g, b, a);
        ellipse(xPos+diam, yPos, diam, diam);
      } else {
        counter=0;
        stage=0;
      }
    }
  } else { 
    counterTwo ++;
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(255);
    if (stage==0) {
      float xPos = int(random(.5*width/diam))*diam;
      float yPos = int(random(.5*height/diam))*diam;
      if (counter<t) {
        counter++;
        fill(r, 0, 0, a);
        rect(xPos+.5*diam, yPos+.5*diam, diam, diam);
      } else {
        counter = 0;
        stage = 1;
      }
    } else if (stage==1) {
      if (counter<t) {
        float xPos = int(random(.5*width/diam, width/diam))*diam;
        float yPos = int(random(.5*height/diam, height/diam))*diam;
        counter++;
        fill(0, g, 0, a);
        rect(xPos+.5*diam, yPos+.5*diam, diam, diam);
      } else {
        counter=0;
        stage=2;
      }
    } else if (stage==2) {
      float xPos = int(random(.5*width/diam))*diam;
      float yPos = int(random(.5*height/diam, height/diam ))*diam;
      if (counter<t) {
        counter++;
        fill(0, 0, b, a);
        rect(xPos+.5*diam, yPos+.5*diam, diam, diam);
      } else {
        counter=0;
        stage=3;
      }
    } else if (stage==3) {
      float xPos = int(random(.5*width/diam, width/diam))*diam;
      float yPos = int(random(.5*height/diam))*diam;
      if (counter<t) {
        counter++;
        fill(r, g, b, a);
        rect(xPos+.5*diam, yPos-.5*diam, diam, diam);
      } else {
        counter=0;
        stage=0;
      }
    }
    if (counterTwo==2*tTwo) {
      counterTwo = 0;
    }
  }
}

