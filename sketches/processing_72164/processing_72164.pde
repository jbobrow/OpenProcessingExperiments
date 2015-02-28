
float randomDiameter = 0;
float strokeGray = 255;
void setup(){

size(1200,600);
 background(0);
 //noStroke();
  noStroke();
colorMode(RGB, 150 );
for (int i = 0; i < 1200; i++) {
  for (int j = 0; j < 600; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}



}

void draw() {
  stroke (0);
   strokeWeight (5);
   line (0,100,1200,100);
  stroke (0);
   strokeWeight (5);
   line (0,500,1200,500);

  
 smooth ();
 stroke (strokeGray);
 fill (230);
 strokeWeight(1);
rect(mouseX,mouseY,5,5);

if (randomDiameter <1000){
 randomDiameter++;
}
else{
 randomDiameter=0;
}


}
void mouseClicked() { 
noStroke(); 
  fill(204,50);
  rect(0,0,width,height);
  strokeWeight(10);
  translate(random(width), height);
  scale(random(0.5,1));
  branch(0);
 
}
 
void branch(int depth) {
  if (depth<5) {
    if (depth<4)
    {
      stroke(0);
    }
    else if (depth<8){
      stroke(0,150);
    }
    else {
      stroke(0,50);
    }
    line (0,0,0,-height/3);
    pushMatrix();
    {
      translate(0,-height/5);
      rotate(random(-PI/4,PI/4));
      scale(random(0.5,0.8));
      branch(depth+int(random(1,2)));
    }
    popMatrix();
    pushMatrix();
      {
        translate(0,-height/3);
      rotate(random(-PI/4,PI/4));
      scale(random(0.6,0.75));
      branch(depth+int(random(1,1)));
    }
    popMatrix();
    pushMatrix();
      {
        translate(0,-height/3);
      rotate(random(-PI/4,PI/4));
      scale(random(0.6,0.7));
      branch(depth+int(random(1,1)));
    }
    popMatrix();
    pushMatrix();
      {
        translate(0,-height/3);
      rotate(random(-PI/4,PI/4));
      scale(random(0.55,0.65));
      branch(depth+int(random(1,3)));
    }
    popMatrix();
  }


  
}

void keyPressed () {
 if (key == 's') {
   save("MarnfahKanjanavanit.pde");
 }
}



