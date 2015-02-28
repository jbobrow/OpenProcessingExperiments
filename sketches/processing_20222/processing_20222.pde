
void setup() {
size(250, 250);
rectMode(CENTER);
ellipseMode(CENTER);
frameRate(20);
smooth();
background(41,36,33);
// bright green circle
stroke(192,255,62);
strokeWeight(30);
point(215,215);
}
 
void draw() {

// white rotating triangles 
for(int c=0; c<260; c+=20)
for(int d=0; d<260; d+=5)
 {
    fill(255);
    stroke(1);
    strokeWeight(1);
    rotate(frameCount/20f);
    triangle(50, 225, 100, 125, 150, 225);
}

// maroon rotating triangles
for(int c=0; c<260; c+=20)
for(int d=0; d<260; d+=5)
 {
    fill(139,54,38);
    stroke(1);
    strokeWeight(1);
  rotate(frameCount/20f);
 triangle(20, 195, 70, 95, 120, 195);
}

// blue rotating triangles 
for(int c=0; c<260; c+=20)
for(int d=0; d<260; d+=5)
 {
    fill(0,128,128);
    stroke(1);
    strokeWeight(1);
  rotate(frameCount/20f);
 triangle(0, 155, 30, 55, 80, 155);
}
}

