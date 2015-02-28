
void setup() {
  size(600, 600);
}
void draw() {
  frameRate(40);
  int s= second();
   
  pushMatrix();
  //translate(width*0.5, height*0.5);
 


  int resolution = 200;
  float radius = 100;
  float circleX = width * 0.5;
  float circleY = height * 0.5;

  beginShape();
  for (int i = 0; i<resolution; i=i+1) {

    float waveAngle = map( i, 0, resolution, 0, TWO_PI* s/5);
    float waveOffset = sin(waveAngle) * s *2;

    float angle = map(i, 0, resolution, 0, TWO_PI);
    float circleOffX = cos(angle) * (radius + waveOffset);
    float circleOffY = sin(angle) * (radius + waveOffset);

    float x = circleX + circleOffX;
    float y = circleY + circleOffY;


    noStroke();
    fill(155-s, 100-s, 255-s, 10); 

   // vertex(x, y);
 rotate(PI);
 
    ellipse( x, y, 3, 3);
  }

  endShape(CLOSE);
  
   popMatrix(); 
}
