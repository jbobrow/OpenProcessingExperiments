
float [] c = {
  0, 0, 0, 0, 0, 0,0,0,0,0
};
void setup() {
  size(600, 600);
  background(30);
  rectMode(CENTER);
  smooth();
  noFill();
  colorMode(HSB, 100);

  for (int i=0;i<10;i++) {
    c[i] = random(50)+50;
  }
}


void draw() {
  fill(0,0,0,5);
  rect(0,0,width*2,height*2);
  
 // background(0, 0, 0);


  translate(width/2, height/2);


  float a = map(mouseY, 0, 600, -20, 20);
  float t = map(mouseX, 0, 800, 5, 15);

  fill(c[0], 100, 100);
  stroke(c[0], 100, 100);
  renderLimb(a, t); 

  fill(c[1], 100, 100);
  stroke(c[1], 100, 100);
  renderLimb(a, t/2);

  a=a*(-1);

  fill(c[2], 100, 100);
  stroke(c[2], 100, 100);  
  renderLimb(a, t/2);
  
  fill(c[3], 100, 100);
  stroke(c[3], 100, 100);
  renderLimb(a, t); 
  
  
  t=t*(-1);
  
   fill(c[4], 100, 100);
  stroke(c[4], 100, 100);
  renderLimb(a, t); 

  fill(c[5], 100, 100);
  stroke(c[5], 100, 100);
  renderLimb(a, t/2);


  
  a=a*(-1);
  
  fill(c[6], 100, 100);
  stroke(c[6], 100, 100);  
  renderLimb(a, t/2);
  
  fill(c[7], 100, 100);
  stroke(c[7], 100, 100);
  renderLimb(a, t);
}

void renderLimb(float a, float t) {
  pushMatrix();
  for (int i=0;i<20;i++) {

    translate(t, 0);
    println(a);
    rotate(radians(a));
    ellipse(0,0,2,2);
    //rect(0, 0, map(mouseX, 0, 800, 5, 30), 3);
  }
  a=a*(-1);
  for (int i=0;i<20;i++) {

    translate(t, 0);

    println(a);
    rotate(radians(a));
    
    //rect(0, 0, map(mouseX, 0, 800, 5, 30), 3);
    ellipse(0,0,2,2);
  }  

  popMatrix();
}


