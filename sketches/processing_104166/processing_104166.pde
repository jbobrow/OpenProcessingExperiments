
// An array of stripes

Stripe[] stripes = new Stripe[10];

void setup() {
 size(500, 500);
// initialize all Stripes
for (int i = 0; i < stripes.length; i++) {
 stripes[i] = new Stripe(); 
 }
}

void draw() {
 background(100);
//move and display all stripes
 for (int i = 0; i < stripes.length; i++){
   //check if mouse is over the stripe
  stripes[i].rollover(mouseX, mouseY);
  stripes[i].move();
  stripes[i].display(); 
 }
}

class Stripe {
 float x;
 float speed;
 float w;
 boolean mouse; 

Stripe() {
 x = 0;
 speed = random(1);
 w = random(10, 30);
 mouse = false;
}

// Draw stripe
void display() {
 if (mouse) {
  fill(255, 200, 2);
 } else {
  fill(255, 100); 
 }
 noStroke();
 rect(x, 0, w, height);
}

// Move stripe
 void move() {
  x += speed;
  if (x > width + 20) x =-20;
 }

//Check if point is inside of Stripe
void rollover(int mx, int my) {
 // Left edge is x, rigth edge is x + w
 if (mx > x && mx < x + w) {
  mouse = true;
 } else {
   mouse = false;
}
 
 

}

}
