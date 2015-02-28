
float theta =0;
color bob, mary;
float jitter;

 
void setup() {
  size(600,600);
  smooth();
  background (0);
}
 
void draw() {
  bob = color(random(255),random(255),random(255));
  mary = color(random(255));
  fill(0, 24);
rect(0, 0, 600, 600);



fill(mary);
ellipse(width/2, height/2, 30, 30);




 
  translate (width/2,height/2);
 
  for(float i=0; i< TWO_PI; i+=0.9) {
    
    pushMatrix();
    rotate(theta+i);

    for(float j=0; j < TWO_PI; j+=0.1) {
      pushMatrix();
      translate(200,200);
      rotate (theta-.05);
      noStroke();
      fill(mary);
      ellipse(width/2, height/2, 10, 10);
      noStroke();
      fill(bob);
      ellipse(width/2, height/2, 8, 8);
     
     
      popMatrix();
    }
    popMatrix();
  }
  endShape();
  theta-=0.05;
  
  noStroke();
  fill(255);
  ellipse(width/2, height/2, 20, 20);
}

