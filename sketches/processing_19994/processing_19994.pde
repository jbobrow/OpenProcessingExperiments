
void setup() {
  size(300,300);
  ellipseMode(CENTER);
  frameRate(1);
}

void draw() {
  background(155,28,28);
  for(int x=0; x<width; x+=10) {
    
    strokeWeight(3);
    stroke(77,21,72);
    noFill();
    beginShape();
    curveVertex(x,x+10);
    curveVertex(random(x,x+=10),random(x+=10,x+15));
    curveVertex(random(width/6,width*5/6),height);
    curveVertex(random(width/6,width*5/6),height);
    endShape();

    stroke(147,90,146);
    fill(245,179,12);
    ellipse(x,x+10,random(10,30),random(10,30)); 

    noStroke();
    fill(random(150,250),158,74,150);
    ellipse(random(75,width-75),x,random(10,50),random(10,50));


    fill(random(50,100),width/2,x,90);
    rect(random(75,width-75),x,15,15);
  }
}


