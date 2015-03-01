
int counter;


//import processing.pdf.*;
float d=30, q=200, l=0;
void setup() { 
  size(900,600); // the most common computer display resolutions
  background(250, 250, 250); // RGB colors for skyblue: http://cloford.com/resources/colours/500col.htm
  smooth(); // to draw anti-alias
  // beginRecord(PDF, "sleeve3.pdf");
}

void draw() {
  float x = 0; // command x axis to move randomly
  //if(key=='a'){noFill();
  // noStroke();}
  //stroke(random(150,240),random(0,250),random(150,250),200);
  //fill(random(150,240),random(0,100),random(100,250),200);

  stroke(random(0, 250), random(q+20, q), random(150, q), 200);
  fill(random(200, 240), random(150, 200), random(200));
  if (keyPressed){if (key=='w'){q=random(0, 250); l=random(0,q);}
                  if (key=='s')q=q-50;
                  if (key=='q')background(255);}

for (int i = 0; i<width; i+=6) { 
  // any int withint the width of the defined size is visualized with 6 pixel gaps between the ellipses' centers.
  //noStroke();
  //noFill();
  strokeWeight(1);
  // stroke(240,100,100);
  //white dot with 25% opacity
  if (keyPressed) {
    if (key=='a' && d>=0) d=d-0.01;
    if (key=='d')d=d+0.01;
  }
  ellipse(i, noise(i*0.003f, frameCount*0.005f)*height, d, d); // noise=level of variety; framecount=motion speed on y-axis; (x, y)=pixels per width and height.
}


//endRecord();}
}
