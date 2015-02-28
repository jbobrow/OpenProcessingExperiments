
int numlines = 180;
float freq = .01;




void setup() {
  size(800, 800);
  noLoop();
}

void draw() {


  background(255);
  stroke(0);
  strokeWeight(1);

  for (int i =0; i < numlines; i++)
  {
    pushMatrix();
    translate(width/2, height/2);
    rotate (radians(i*2) );
    noFill();
    stroke(random(255));

    beginShape();
    float numsteps = random(200,500);
    for (int x=0; x < numsteps; x+=4)
    {
      float n = noise(x*freq,i)*100; //noise default is range 0.0 to 1.0
      println(n);
      vertex(x, n);
    }
    endShape();

    popMatrix();
  }
}



///freq+framecont

