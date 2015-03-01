
PVector [] ap;
int minRad=1, maxRad= 10;
float distanceToCenter;
float newR; float newX; float newY;
void setup() {
  size(900, 600);
  smooth();
   background(#57385c);
   ap = new PVector[0];
   ap = (PVector []) append(ap, new PVector (width/2, height/2, random (minRad, maxRad)));
          colorMode( RGB, 1000); //colorMode(HSB, 600);
}
void draw()
{ 
   noStroke();
   newR = random(minRad, maxRad);
   newX = random(newR, width-newR);
   newY = random(newR, height-newR);
   distanceToCenter = dist (newX, newY, width/2, height/2);
if (distanceToCenter < 300) {
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
    float deltaX = cos(angle) * ap [closestIndex].z;
    float deltaY = sin(angle) * ap [closestIndex].z;
   // draw it
       int i= closestIndex;
       fill( i%ap.length/10 ,i %ap.length/100, 0);
       ellipse(  ap[i].x, ap[i].y, ap[i].z*2 , ap[i].z*2 ); 
        newR =  exp(map (closestDist, 0, width, 1, 7));
        newX = ap[closestIndex].x  +deltaX;
        newY =  ap[closestIndex].y + deltaY;
       ap = (PVector []) append (ap, new PVector (newX, newY, newR));
 }
}
void mousePressed ()
{
 setup();
}
