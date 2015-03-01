
float eyeX = 0;
float eyeY = 0;
float maxH = 100;
float delta=3, delta2 = 6;
float r2=305;
float degZ=0;
float zz=1;
float control = 700;
void setup () {
  noCursor();
  size(1000, 1000, P3D);
  smooth();
}


void draw() {
  if (degZ==10||degZ==-10) zz*=-1 ;
  degZ+=zz;
  translate(0, height/2 + 200, 0);
  rotateX(radians(degZ));
  background(0);
  println(mouseX, mouseY);
  ////////////////////////////////////////////////////////////////////////////////////////////////
  eyeX = map(mouseX, 0, height, -90, 90);
  eyeY = map(mouseY, 0, height, -45, 45);
 // rotateX(radians(eyeX));
 // rotateY(PI/2 );
  ////////////////////////////////////////////////////////////////////////////////////////////////
  pushMatrix();
  noStroke();
  fill(255);
  drawSphere(width/2-100, height/2 - control, 0, height/20); //left white eye
  drawSphere(width/2+100, height/2 - control, 0, height/20); //right white eye
  popMatrix();
  ////////////////////////////////////////////////////////////////////////////////////////////////
  pushMatrix();
  fill(0);
  noStroke();
  float r = 20;
  float dlx = (width / 2) + 100 ;
  float dly = (height / 2);
  float mlx = map(mouseX, 0, width, dlx - 15, dlx + 15);
  float mly = map(mouseY, 0, width, dly - 15, dly + 30);
  drawSphere(mlx, mly - control, 37, r); ////left black eye
  float drx = (width / 2) - 100;
  float dry = (height / 2);
  float mrx = map(mouseX, 0, width, drx - 15, drx + 15);
  float mry = map(mouseY, 0, width, dry - 15, dry + 30);
  drawSphere(mrx, mly - control, 37, r);////right black eye
  popMatrix();
  ////////////////////////////////////////////////////////////////////////////////////////////////
  if (mousePressed) { //making the red change in the eye
    PVector x = new PVector(mouseX-400, mouseY-500);
    PVector y = new PVector(100, 0);
    float alpha = PVector.angleBetween(x, y);
    float xm = x.mag();
    float ym = y.mag();
    float o = xm*ym*sin(alpha);
    float om = abs(o);
    float co = map(om, 0, 50000, 0, 255);
    pushMatrix();
    fill(255, co, co);
    drawSphere(mrx, mry-3 - control, 20, height/30);////left red eye
    drawSphere(mlx, mly-3 - control, 20, height/30);////lefe red eye
    noLoop(); //color stop when clicked
    popMatrix();
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////
  pushMatrix();
  translate(width/2, 400 - control, 0);
  float u = 250;
  float c1 = random(255);
  float c2 = random(255);
  float c3 = random(255);
  for (float theta =0; theta <360; theta +=0.7) {
    for (float polar = 90; polar<180; polar +=0.7) {
      float degt = radians(theta);
      float degp = radians(polar);
      float q = u*sin(degp)*cos(degt);
      float e = u*sin(degp)*sin(degt);
      float w = u*cos(degp);
      stroke(255);
      if (mousePressed)
      {
        stroke(c1, c2, c3); //color stop
      } else
      {
        stroke(c1, c2, c3); //color stop
      }
      strokeWeight(3);
      point(q, w, e);
    }
  } // Body of the hat
  popMatrix();
  ////////////////////////////////////////////////////////////////////////////////////////////////
  pushMatrix();
  translate(0, - control, 0);
  beginShape();
  vertex(250, 400, 0);
  bezierVertex(250, 400, 300, 750, 400, 300, 750, 400, 0);
  vertex(250, 400, 0);
  bezierVertex(250, 400, 500, 750, 400, 500, 750, 400, 0);
  endShape(); // chang UP
  beginShape();
  vertex(250, 400, 0);
  bezierVertex(250, 400, 250, 750, 400, 250, 750, 400, 0);
  vertex(250, 397, 0);
  bezierVertex(250, 397, 500, 750, 397, 500, 750, 397, 0);
  endShape(); // chang DOWN
  popMatrix();
  ////////////////////////////////////////////////////////////////////////////////////////////////
  pushMatrix();
  translate(250, 100, 0);
  fill(255, 132, 0);
  stroke(#FF8400);
  rotateY(PI/2);
  for (float h = 0; h < 30; h+=1) {
    pushMatrix();
    translate(0, 0 - control, -h);
    ellipse(50, 360, 200, 200);
    popMatrix();
  }
  fill(255, 0, 230);
  stroke(#FF00E6);
  for (float p = 0; p < 50; p+=1) {
    pushMatrix();
    translate(0, 0 - control, -p);
    ellipse(50, 360, 100, 100);
    popMatrix();
  }
  pushMatrix();
  translate(0, 0, 550);
  fill(255, 132, 0);
  stroke(#FF8400);
  for (float h = 0; h < 30; h+=1) {
    pushMatrix();
    translate(0, 0 - control, -h);
    ellipse(50, 360, 200, 200);
    popMatrix();
  }
  fill(255, 0, 230);
  stroke(#FF00E6);
  for (float p = 0; p < 50; p+=1) {
    pushMatrix();
    translate(0, 0 - control, -p+20);
    ellipse(50, 360, 100, 100);
    popMatrix();
  }
  popMatrix();
  popMatrix();
  ////////////////////////////////////////////////////////////////////////////////////////////////
  pushMatrix();
  translate(500, 510 - control, -100);
  rotateX(radians(45));
  fill(255, 0, 0);
  stroke(255, 0, 0);
  ellipse(0, 250, 100, 50+mouseY/15);
  popMatrix();
  ////////////////////////////////////////////////////////////////////////////////////////////////
  pushMatrix();
  stroke(255, 0, 0);
  fill(255, 0, 0);
  for (float h = 0; h<maxH; h+=3) {
    pushMatrix();
    translate(0, 0 - control, h);
    ellipse(width/2, height/2+100, 30, 30);
    popMatrix();
  }
  popMatrix();
  ////////////////////////////////////////////////////////////////////////////////////////////////
  pushMatrix();
  noFill();
  translate(515, 450 - control, -50);
  rotateY(radians(90));
  strokeWeight(20 );
  stroke(#FF00E6);
  beginShape();
  for (float deg2=180; deg2<360; deg2+=delta2) {
    float phi = radians(deg2);
    for (float deg=0; deg<1; deg+=delta) {
      float theta=radians(deg);
      float x=r2*sin(phi)*cos(theta);
      float y=r2*sin(phi)*sin(theta);
      float z = r2* cos(phi);
      vertex(y, x, z);
    }
  }
  endShape( );
  popMatrix();
}
////////////////////////////////////////////////////////////////////////////////////////////////
void drawSphere(float x, float y, float z, float radius) {
  pushMatrix();
  translate(x, y, z);
  sphere(radius);
  popMatrix();
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      maxH +=10;
    }
    if (keyCode == DOWN) {
      maxH -=10;
    }
  }
}


