
PVector [] ap;
int minRad=1, maxRad= 10;
float distanceToCenter;
float distance;
float newR; float newX; float newY;
          color from = color(204, 102, 0);
          color to = color(0, 102, 153);
void setup() {
  size(900, 600);
  smooth();
   background(#57385c);
   ap = new PVector[0];
   for (int ii=0; ii<3; ii++){
   ap = (PVector []) append(ap, new PVector (width*random(0.25,0.75), height*random(0.25, 0.75), random (minRad, maxRad)));
          colorMode( RGB, 1000); //colorMode(HSB, 600);
   }
}
void draw()
{ 
  for (int s=0; s<1000; s++){ // grow, faster, faster!!I said grow muthafucka!
   newR = random(minRad, maxRad);
   newX = random(newR, width-newR);
   newY = random(newR, height-newR);
   distanceToCenter = dist (newX, newY, width/2, height/2);
  if (distanceToCenter +  100 *cos(distanceToCenter/ sqrt(distanceToCenter /100)) < 250 &&
    distanceToCenter +  100 *cos(distanceToCenter/ sqrt(distanceToCenter /100)) > 50){
    float closestDist = 100000000;
    int closestIndex = 0;
    // which circle is the closest?
    for (int i=0; i < ap.length; i++)
    {
      distance = dist(newX, newY, ap[i].x, ap[i].y);
      if (distance < closestDist)
      {
        closestDist = distance;
        closestIndex = i;
      }
       if (distance < 5) //quit sooner
      {
        i = ap.length;
      }
    } 
   if (distance > 30) // avoid branches touching one another
   {
      // aline it to the closest circle outline
      float angle = atan2(newY-ap[closestIndex].y, newX-ap[closestIndex].x);
//      float deltaX = cos(angle) * ap [closestIndex].z;
//      float deltaY = sin(angle) * ap [closestIndex].z;
      float deltaX =  cos((angle+frameCount)*3 ); // the spiral //+ log(distanceToCenter)*12
      float deltaY =  sin((angle+frameCount)*3 );
     // draw them
    //for (int i=0 ; i < ap.length; i++) {

    //}
          newR =  exp( map (closestDist, 0, width, 0.8 , 6) ) * 2/sqrt(distanceToCenter/10)  ;
          newX = ap[closestIndex].x  + 1*deltaX; 
          newY = ap[closestIndex].y  + 1*deltaY; 
         ap = (PVector []) append (ap, new PVector (newX, newY, newR ));
          int i= closestIndex;
          stroke( i%ap.length/20 ,i %ap.length/100, i %ap.length/20);   //fill 3 10 2
            float colVal= map(closestDist, 0, width/2, 0.2, 1);
          strokeWeight(ap[i].z);
          line(ap[i].x, ap[i].y, newX, newY ) ; 
   }
 }
  }
}

