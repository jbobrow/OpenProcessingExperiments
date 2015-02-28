
int N = 15;
int b = 10;
float NodeRadius = 35;
boolean childlike = false;
boolean borderCircle = false;

void setup() {
  size(400, 400);
  colorMode(HSB, N, 100, 100);
  background(N);
  noLoop();
  smooth();
}

void draw() {
  background(0);
  fill(0, 0, 100);
  textAlign(BASELINE);
  textSize(20);
  text("b = " + b, 10, height-8);
  text("N = " + N, width/3, height-8);
  text("Scale = " + NodeRadius, 2*width/3, height-8);

  float theta = 2*PI / N;
  float R = N*NodeRadius / PI; //Chosen so 2*N nodes will fit.
  if(borderCircle){noFill();strokeWeight(3);stroke(0,0,50);  ellipse(width/2, height/2, 2*R, 2*R); }
  for (int i=0; i<N; i++)
  {
    float centerx = width/2 + R*cos(i*theta);
    float centery = height/2 + R*sin(i*theta);

    //connection to +1 node
    float centerNx = width/2 + R*cos((i+1)*theta);
    float centerNy = height/2 + R*sin((i+1)*theta);


    //connection to *b node
    float centerBx = width/2 + R*cos((i*b)*theta);
    float centerBy = height/2 + R*sin((i*b)*theta);


    if(borderCircle)
        drawNode(centerx, centery, i);
    //    drawConnection(centerx, centery, centerNx, centerNy, i, false); //draw +1 connection
    drawConnection(centerx, centery, centerBx, centerBy, i, true); //draw *b connection
  }
}

void drawNode(float centerx, float centery, int n)
{
  noStroke();
  fill(n, 100, 100, 200);
  //I didn't plan ahead to include the numbers, so this is a lot of
  //unnecessary recalculations!
  float textx = width/2 + (N+2)*NodeRadius*cos(n*2*PI / N)/PI;
  float texty = height/2 + (N+2)*NodeRadius*sin(n*2*PI / N)/PI;
  textAlign(CENTER, CENTER);
  text(n, textx, texty);
  ellipse(centerx, centery, NodeRadius/3, NodeRadius/3);
}
void drawConnection(float x0, float y0, float x1, float y1, int n, boolean fancy)
{
  if (fancy) {
    stroke(n, 100, 100, 200);
    strokeWeight(min(NodeRadius/3,5));
    if (childlike) {
      float cx0 = (x0+x1)/(2)+N; //control points for bezier curve.
      float cy0 = (y0+y1)/(2)-N; //I'm not satisfied with this choices!
      float cx1 = (x0+x1)/(2)-N;
      float cy1 = (y0+y1)/(2)+N;

      float theta = PI/6; //small angle opening for arrowhead
      float m = (y1 - y0) / (x1 - x0);
      float l = 20; //how long should the arrowhead be?

      int flip = 1;
      if (x0 < x1) {flip = -1;  } //The arrowhead does not behave well because of how inverse-tangent is defined!
      float xt1 = x1 + flip*l*cos(theta - atan(m));
      float yt1 = y1 + flip*l*sin(atan(m) - theta);

      float xt2 = x1 + flip*l*cos(theta + atan(m));
      float yt2 = y1 + flip*l*sin(atan(m) + theta);

//      noFill();
      bezier(x0, y0, cx0, cy0, cx1, cy1, x1, y1);
      triangle(x1, y1, xt1, yt1, xt2, yt2);
      fill(0);
      ellipse(x0, y0, l/2, l/2);
    }
    else {//if not childlike
      line(x0, y0, x1, y1);
    }
  }
  else {//if not fancy
    stroke(0, 0, 100);
    strokeWeight(min(NodeRadius/3,7));
    line(x0, y0, x1, y1);
  }
}



void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      N = max(N - 1, 2);
    }
    else if (keyCode == RIGHT) {
      N++;
    }
    else if (keyCode == DOWN) {
      b = max(b-1, 2);
    }
    else if (keyCode == UP) {
      b++;
    }
  }
  else {
    if (key == 'x')
      NodeRadius = min(width/2, NodeRadius+sqrt(2)/2);
    else if (key =='z')
      NodeRadius = max(1, NodeRadius-sqrt(2)/2);
    else if (key == 'c')
      childlike = !childlike;
    else if(key == ' ')
      borderCircle = !borderCircle;
  }
  //    println("base " + b + ", N = " + N);
  colorMode(HSB, N, 100, 100);
  redraw();
}
