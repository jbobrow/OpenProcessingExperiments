
float transparence = 200;
 
void setup() {
  size(400, 400);
  frameRate(random(500));
  background(10);
  noStroke();
}
 
void draw() {
   fill(70,70,70,transparence);
   rect(random (400), random (400), 10, 10);
   
   fill(900,900,900,transparence);
   rect(random (400), random (400), 10, 10);

   fill(100,200,200,transparence);
   rect(random (400), random (400), 10, 10);
   
   fill(255,50,50,transparence);
   rect(random (400), random (400), 50, 50);
 
   transparence = random(120);
}


