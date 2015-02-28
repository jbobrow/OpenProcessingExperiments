
float r = 0.00;
int max = 120;
float radint = TWO_PI/max;

void setup() {
   size(600, 600);
   smooth();
   frameRate(60);
   stroke(255);
   strokeWeight(1);
   background(0);
}

int xR = random(width);
int yR = random(height);

void draw() {
   //background(0, 0, 0, 1.0);
   translate(width/2,height/2);

   r += radint;
   rotate(r);
   
   if(r >= PI){
    r=0;
    xR = random(width/4);
    yR = random(height/4);
    //stroke(random(255), random(255), random(255), 60);
   }

   line(0,0, -xR, -yR);
   line(0,0, xR, yR);
}

void mousePressed() {
 clear();
}
