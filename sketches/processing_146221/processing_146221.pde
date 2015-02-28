
PVector v1, v2, w1, w2;

void setup() {
  size(1000, 1000);
  background(0);
  v1 = new PVector(random(width), random(height));
  v2 = new PVector(random(width), random(height));
  w1 = new PVector(random(width), random(height));
  w2 = new PVector(random(width), random(height));
}



void draw() {
  background(150,50,50);
  float n = 1000;
float mess;

 mess = mouseY*2+200;
     n = mouseX+100;

  for (int i=0; i<n;i++) {
    PVector a = PVector.lerp(v2, v2, i*(50/n)); 
    PVector b = PVector.lerp(w2, w2, i*(50/n));
    
    a.x = a.x + noise(0.007*i-mouseX)*mess;
    a.y = a.y + noise(0.007*i-mouseY)*mess;
    b.x = b.x + noise(0.007*i-mouseX)*mess;
    b.y = b.y + noise(0.007*i-mouseY)*mess;
    stroke(map(i, 0, n, 0, 255),10);
    noStroke();
    fill(mouseY*0.5-200,mouseX*0.2+150,(mouseX+a.y)*0.5+150,3);
    ellipse(a.x-500,a.y-500, 200,200);
    fill(mouseY*0.5+40,mouseY*0.2+50,(mouseX+a.y)*0.5+150,3);
    ellipse(a.x-450,a.y-450, 200,200);
    fill(mouseX*0.5+40,mouseX*0.2+50,(mouseX+a.y)*0.5+150,3);
    ellipse(a.x-520,a.y-520, 150,150);
  }
}

void keyPressed() {
  if (key == ' ') {
    setup();
  }
}

