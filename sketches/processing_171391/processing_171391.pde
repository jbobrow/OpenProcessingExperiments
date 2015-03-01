
int rii;

void setup() {
size(600, 600);
}


void draw() { 
  
if(mousePressed) background(0);
else background(255);

for(float i = 120; i<=480; i+=120) {
  for(float j = 120; j<=480; j+=120){
    
    if(mousePressed) {
     if(120*rii == ivod) {
       fill(random(255), random(255), random(255), 100);
     } else {
       fill(0);
     }
    } else {
      fill(random(255), random(255), random(255), 100);
    
    leaf(i, j);
  }
}

}
}

void leaf(float Cx, float Cy) {
noStroke();
//fill(random(255), random(255), random(255), 100);
beginShape();
vertex(Cx, Cy);
bezierVertex(Cx+30, Cy+5, Cx+40, Cy+50, Cx, Cy+80);
bezierVertex(Cx-15, Cy+20, Cx-30, Cy+25, Cx, Cy);
//bezierVertex(Cx+10, Cy+5, Cx+20, Cx+40, Cx, Cy+80);
endShape();
}

void mouseClicked() {
  float ri = random(1, 4);
  rii = floor(ri);
}
