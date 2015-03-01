

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/152412*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int fc, num = 70, edge = 10, maxDist=130;
Ball[] balls = new Ball[num];
ArrayList<Triangle> triangles;
boolean save = false;
float c=random(50, 255),d=random(50, 255),e=random(50, 255);

void setup() {
size(window.innerWidth, window.innerHeight);
//size(displayWidth, displayHeight);
  createStuff();
  if(width <= 800){
    
    num = 30;
  }
}

void draw() {
  background(#2c2c2c);

  triangles = new ArrayList<Triangle>();
  Ball b1, b2; // temporary balls used to figure out whether two balls are neighbours

  for (int i=0; i<num; i++) {

    balls[i].move();
    b1 = balls[i];
    b1.neighbours = new ArrayList<Ball>();
    b1.neighbours.add(b1);

    for (int j=i+1; j<num; j++) { // 'i' to avoid having doubles, and '+1' to avoid comparing a ball to itself (I think...)
      b2=balls[j];
      float d = PVector.dist(b1.loc, b2.loc); // comparing the location of both balls
      if (d>0 && d<maxDist) {  // if b2 is in the range then add it to the list of neighbours
        b1.neighbours.add(b2);
      }
    }
    if (b1.neighbours.size()>1) { // if there are at least two neighbours then add the triangle(s) the the triangles array
      addTriangles(b1.neighbours);
    }
    
   
  }

  drawTriangles();

  if (save) {
    if (frameCount%2==0 && frameCount < fc + 241) saveFrame("image-####.gif");
    if (frameCount >= fc + 241) noLoop();
  }
}

void createStuff() {
  // creating the location of the rotating reference points
  for (int i=0; i<num; i++) {
    balls[i]=new Ball();
  }
}

void addTriangles(ArrayList<Ball> b_neighboors)
{
  int s = b_neighboors.size();
  if (s > 2)
  {
    for (int i = 1; i < s-1; i ++)
    {
      for (int j = i+1; j < s; j ++)
      {
        triangles.add(new Triangle(b_neighboors.get(0).loc, b_neighboors.get(i).loc, b_neighboors.get(j).loc));
      }
    }
  }
}

void drawTriangles()
{
  fill(c, 4);
  stroke(c,d,e, 40);
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles.size (); i ++)
  {
    Triangle t = triangles.get(i);
    t.display();
  }
  endShape();
}

void keyPressed() {
  if (key=='s') {
    fc = frameCount;
    save = true;
  }
  if (key=='c') {
    createStuff();
    c = random(50, 255);
        d = random(50, 255);
    e = random(50, 255);

  }
  if (key=='f') saveFrame("image-###.jpg");
}

void mouseReleased() {
  //show =! show;
}

class Ball {

  ArrayList<Ball> neighbours;  // arraylist of the 'ball' itself and all the others balls whose distance < maxDist to it
  float theta, radius = random(20, 80);
  float offSet = random(TWO_PI);
  int dir;
  PVector org = new PVector(random(edge, width-edge), random(edge, height-edge));
  PVector loc = new PVector(org.x+radius, org.y);

  Ball() {
    dir=random(1)>.5 ? -1 : 1; // clockwise or anti-clockwise
  }

  void move() {
    float scal = map(sin(theta),-1,1,1,4);
    loc.x = org.x + sin(offSet)*radius*scal;
    loc.y = org.y + cos(theta+offSet)*radius*scal;
    theta += (0.0523/2*dir);
    ellipse(loc.x,loc.y,30,30);
    rectMode(CENTER);
    rect(loc.x,loc.y,10,10);
  }
}

class Triangle
{
  PVector A, B, C;

  Triangle(PVector p1, PVector p2, PVector p3)
  {
    A = p1;
    B = p2;
    C = p3;
  }

  public void display()
  {
    vertex(A.x, A.y);
    vertex(B.x, B.y);
    vertex(C.x, C.y);
  }
}

