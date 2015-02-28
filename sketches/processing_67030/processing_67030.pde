
int counter;
int maxRadius;
int bandWidth=50;
int n;

void setup() {  //setup function called initially, only once
  size(600, 300);
  counter = 0;
  maxRadius= ceil(sqrt(sq(width)+sq(height)));
  n=2+ceil(maxRadius/bandWidth);
  ellipseMode(CENTER);
  smooth();
  noStroke();
}

void draw() {  //draw function loops 
  counter+=2;
  for (int i=n;i>0;i--) {
      if ((i+(counter/bandWidth))%2==0)
          fill(255);
      else
          fill(0);
      int r=(i*bandWidth)-(counter%bandWidth);
      ellipse(width/2, height/2, r,r);
  }
}


