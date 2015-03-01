
float time=0;
color[] lanes= {
  #D2AD76, #418785
};

color[] dots= {
  #0B2524, #C01D30, #8F4151, #DDB659, #29487E
};

int particles=30;

int[] c=new int[particles];

float[] theta=new float[particles];
float[] r=new float[particles];
float[] x=new float[particles];
float[] y=new float[particles];
float[] d=new float[particles];

void setup() {
  size(700, 700);
  background(#E4DECE);

  for (int i=0; i<particles; i++) {
    c[i]=int(random(5));

    theta[i]=random(-PI, PI);
    r[i]=random(50, 180);
    x[i]=sin(theta[i])*r[i];
    y[i]=cos(theta[i])*r[i];
    d[i]=random(20, 180-dist(0, 0, x[i], y[i]));
  }
  smooth(8);
}


void draw() {
  background(#E4DECE);
  time+=.03;

  pushMatrix();
  translate(width/2, height/2);
  for (int i=0; i<2; i++) {
    noStroke();
    rotate(i*PI/2);
    fill(lanes[i], 180);
    beginShape();
    vertex(-250, -height/2);
    vertex(-170, -height/2);
    vertex(490, height/2);
    vertex( 350, height/2+100);
    endShape();
  }


  for (int i=0; i<particles; i++) {
    float rot=(180-dist(0, 0, x[i], y[i]))/3;
    noStroke();
    fill(dots[c[i]], 200);
    ellipse(x[i]+rot*sin(time-i)
      , y[i]+rot*cos(time-i), d[i], d[i]);
  }

  for (int i=1; i<int (particles/1.3); i++) {
    stroke(5);
    strokeWeight(.4);
    rotate(radians(noise(i)*500));
    line(x[i]+x[i]*sin(time-i)/5, y[i]+y[i]*cos(time-i)/5, 
    x[i-1]+ x[i-1]*cos(time-i)/5, y[i-1]+y[i-1]*sin(time-i)/5);
  }

  noFill();
  strokeWeight(25);
  stroke(#17161B);
  ellipse(0, 0, 500, 500);

  popMatrix();

  noStroke();
  fill(5, 50);
  rect(0, 0, width, height);
}



