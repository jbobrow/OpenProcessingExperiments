
float r,g,b,a;

void setup() {
  size(300, 300);
}

void draw() {
  background(255);
  for (int i=20; i<width;i+=20) {  //limits not to exceed its canvas
    r=random(255);  //random color of line
    g=random(255);
    b=random(255);
    a=random(50, 70);
    stroke(r,g,b,a);
    strokeWeight(3);  
    float mx=mouseX/10;  //minimize mouseX
    float offsetA=random(-mx, mx);  //upper line's change
    float offsetB=random(-mx, mx);  //lower line's change
    line (i+offsetA, 20, i-offsetB, 280); // place 20 lines  
    // both x coordination will change once i move mouse to right side
  }
}


