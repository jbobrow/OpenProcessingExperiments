
float a = 0; //creation of a variable
float speed = 0.9; // vaiable's speed

void setup() {
  size(480, 480);
}

void draw() {
background (0);
fill (51, 169, 203);
a += speed; //increase the value of a
arc(a, 160, 80, 80, HALF_PI, PI); 
arc(a-50, 160, 80, 80, HALF_PI, PI+HALF_PI);
arc(a-140, 160, 80, 80, HALF_PI, PI+PI);
arc(a-230, 160, 80, 80, 0, PI+PI);
}






