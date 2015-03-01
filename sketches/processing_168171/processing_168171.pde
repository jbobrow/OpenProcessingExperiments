
float eyeX = 0;
float eyeY = 0;

void setup () {

  size(1000, 1000, P3D);
  smooth();
}

void draw() {

  background(0);

  eyeX = map(mouseX, 0, height, -90, 90);
  eyeY = map(mouseY, 0, height, -45, 45);
  rotateX(radians(eyeX)); 
  rotateY(radians(eyeY));
  //camera follow the mouse can change how the snapback moves by controling the numbers in the 'map'

  noStroke();
  fill(255);
  drawSphere(width/2-100, height/2, 0, height/20); //left white eye
  drawSphere(width/2+100, height/2, 0, height/20); //right white eye

  noStroke();
  float r = 20;
  fill(0);
  noStroke();
  float dlx = (width / 2) +100 ;
  float dly = (height / 2);

  float mlx = map(mouseX, 0, width, dlx - 15, dlx + 15);
  float mly = map(mouseY, 0, width, dly - 15, dly + 30);

  drawSphere(mlx, mly, 37, r); ////left black eye

  float drx = (width / 2) - 100;
  float dry = (height / 2);
  float mrx = map(mouseX, 0, width, drx - 15, drx + 15);
  float mry = map(mouseY, 0, width, dry - 15, dry + 30);


  drawSphere(mrx, mly, 37, r);////right black eye

  if (mousePressed) { //making the red change in the eye
    PVector x = new PVector(mouseX-400, mouseY-500);
    PVector y = new PVector(100, 0);
    float alpha = PVector.angleBetween(x, y);
    float xm = x.mag();
    float ym = y.mag();
    float o = xm*ym*sin(alpha);
    float om = abs(o);
    float co = map(om, 0, 50000, 0, 255);
    fill(255, co, co);
    drawSphere(mrx, mry-3, 20, height/30);////left red eye
    drawSphere(mlx, mly-3, 20, height/30);////lefe red eye
    noLoop(); //color stop when clicked
  }

  float u = 250;

  translate(500, 400, 0);
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



  translate(-500, -400, 0);

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
}


void drawSphere(float x, float y, float z, float radius) { 
  pushMatrix(); 
  translate(x, y, z);
  sphere(radius);
  popMatrix();
}



