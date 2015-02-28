
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(0);
  frameRate(100);
}

void draw() {
    fill(0,0,0,3);
    rect(0,0,width,height);
    translate(width/2, height/2);
    float angle=random(0,TWO_PI);
    float dAngle=random(0,0.3);
    int armLen = int(random(width/10,width/2));
    float a1=angle-dAngle;
    float a2=angle+dAngle;
    for(int li=0; li<armLen; li++) {
        fill(184,0,245,map(li,0,armLen,0,100));
        stroke(184,0,245,100-map(li,0,armLen,0,100));
        line(li*sin(a1),li*cos(a1),li*sin(a2),li*cos(a2));
    }
}

void keyPressed() {
    background(0);
}
