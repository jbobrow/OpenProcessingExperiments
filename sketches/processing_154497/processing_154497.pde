
PVector [] ap;
int minRad= 1, maxRad= 3;
int RAD = 180;


void setup() {
  size(600, 400);
  smooth();

  frameRate (200);

  ap = new PVector[0];

  int num = 15;
  int i = 0;
  while (i < num)
  {
    ap = (PVector []) append(ap, new PVector (width/2 + cos (i*TWO_PI/num)*RAD, height/2 + sin (i*TWO_PI/num)*RAD, random (minRad, maxRad)));
    i++;
  }
}


void draw()
{

  background(#57385c);
  noStroke();
  fill (#ffedbc);

  float newR = random(minRad, maxRad);
  float newX = random(newR, width-newR);
  float newY = random(newR, height-newR);

  float distanceToCenter = dist (newX, newY, width/2, height/2);
  if (distanceToCenter<RAD)
  {

    float closestDist = 100000000;
    int closestIndex = 0;
    float distance;
    // which circle is the closest?
    for (int i=0; i < ap.length; i++) 
    {
      distance = dist(newX, newY, ap[i].x, ap[i].y);
      if (distance < closestDist) {
        closestDist = distance;
        closestIndex = i;
      }
    }


    // aline it to the closest circle outline
    float angle = atan2(newY-ap[closestIndex].y, newX-ap[closestIndex].x);


    newX = ap[closestIndex].x + cos(angle) * ap [closestIndex].z;
    newY = ap[closestIndex].y + sin(angle) * ap [closestIndex].z;

    ap = (PVector []) append (ap, new PVector (newX, newY, newR));
  }

  // draw them
  for (int i=0 ; i < ap.length; i++) {

    ellipse( ap[i].x, ap[i].y, ap[i].z*2, ap[i].z*2);
  }
}

void mousePressed ()
{
  setup();
}

