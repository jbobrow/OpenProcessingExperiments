
PFont Helvetica;
float t;
float ang;
float i;
color rand = color(random(255), random(255), random(255));

void setup() {
  Helvetica = createFont("Helvetica", 60);
  size(580, 250);
  background(0);
}

void draw() {
   background(random(255), random(255), random(255));
   t = radians(ang);
   smooth();
   noStroke();
   textFont(Helvetica);
   fill(rand);
   text("I NEED SLEEP", 80+130*cos(t), 130+130*sin(t));
   text("I NEED SLEEP", 50+180*cos(t), 150+180*sin(t));
   ang += 5;
   i = ang/360;
   if(ang > 360 * i) {
     text("I NEED SLEEP", 80+i+80*cos(t), 130+i+80*sin(t));
   }
   textSize(12);
   text("IMPORTANT STUFF", random(width), random(height));
}


