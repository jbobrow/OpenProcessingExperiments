
void setup() {
  size(200,200);
}

void draw() { 
  background(#ffff33);
  noStroke();
  for(int x=10; x<200; x=x+15)
    for(int y=10; y<200; y=y+15)
    {
      ellipse(x,y,5,5);
    }

  for(float y=0; y<=200; y=y+50) {
    for(float x=0; x<=200; x=x+50) {
      pushMatrix();
      translate(x,y);
      scale(0.2);
      rotate(radians(frameCount));
      minji_draw();
      popMatrix();
    }
  }
} 

void minji_draw() {
  //face
  stroke(1);
  fill(#3399ff);
  ellipse(100,140,180,170);
  fill(#ffffff);
  ellipse(100,160,150,140);

  //eyes
  int[] x= {
    80,118
  };
  ellipse(x[0],100,40,55);
  ellipse(x[1],100,40,55);

  //eyes(2)
  fill(#000000);
  int[] y= {
    85,113
  };
  ellipse(y[0],105,8,8);
  ellipse(y[1],105,8,8);

  //mouth
  fill(#cc0000);
  int[] a= {
    45,155,100
  };
  int[] b= {
    160,210
  };

  beginShape();
  vertex(a[0],b[0]);
  vertex(a[1],b[0]);
  vertex(a[2],b[1]);
  endShape(CLOSE);

  //nose
  fill(#cc0000);
  ellipse(100,125,18,18);
  fill(#ffffff);
  noStroke();
  ellipse(103,122,8,8);

  //
  stroke(1);
  line(100,135,100,160);
  line(40,118,80,135);
  line(35,140,80,139);
  line(38,162,80,143);
  line(160,118,120,135);
  line(165,140,120,139);
  line(166,162,120,143);
}
         
