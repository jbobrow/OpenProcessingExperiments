
float time=0;

color[] c= {
  #AA5263, #39A57A, #B2B2B2
};

int[] col=new int[50];

void setup() {
  size(700, 700, P2D);
  background(5);
  smooth(8);

  for (int i=0; i<500/15; i++) {
    col[i]=int(random(0, 3));
  }
  colorMode(HSB, 1, 1, 100);
}

void draw() {
  time+=2;

  noStroke();
  fill(0, .1);// fill(0,.2); for Java mode
  rect(0, 0, width, height);

  filter(ERODE);
  filter(BLUR);

  translate(width/2, height/2);

  noFill();

  for (float i=500; i>0; i-=3) {
    pushMatrix();
    rotate(sin(radians(time-i)));
    float ang1=sin(radians(i-time*4));
    float ang2=-cos(radians(i-time*4));
    strokeWeight(.9);
    stroke((cos(ang1)), abs(sin(ang2)), 100);
    arc(0+sin(radians(time))*100, cos(radians(time))*100, i, 
    500+500*sin(radians(cos(time-i))), 
    ang1, ang2);
    popMatrix();
  }

  //  if (frameCount%2==0) {
  //        saveFrame();
  //  }
}



