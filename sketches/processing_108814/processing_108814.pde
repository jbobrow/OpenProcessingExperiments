
void setup() {
  colorMode(HSB, 200, 100, 100);
  size (1000, 1000);
  smooth();
}
 
void draw() {
  background (249, 255, 13);

  for (int jizz = 2000; jizz > 0; jizz = jizz - 20) {//circle
    fill(jizz/10-10, 60, 40);
    ellipseMode(CENTER);
    ellipse(width/2, height/2, jizz/2, jizz/2);
   
  }
  for (int pee = 3000; pee > 0; pee = pee - 20) {//rectangle
   noFill();
   stroke(pee/10, 100, 90);
   rectMode(CENTER);
   rect(width/2, height/2, (3*pee)/4, pee);
  }
  for (int poo = 1200; poo > 0; poo = poo - 20) {
    noFill();
    stroke(poo/10, 100, 60);
    triangle(0, 0, poo, height/2, width/2, poo);//toplefttriangle
    triangle(1000,1000, poo, height/2, width/2, poo);//righttriangle
    triangle(0,1000,poo,height/2,width/2,poo);//bottomlefttriangle
    triangle(1000,0,poo,height/2,width/2,poo);//bottomrighttriangle
  }
    for (int jizz = 2000; jizz > 0; jizz = jizz - 20) {//circle
    noFill();
    stroke(0,0,0);
    ellipseMode(CENTER);
    ellipse(width/2, height/2, jizz/3, jizz/3);
    }
}
