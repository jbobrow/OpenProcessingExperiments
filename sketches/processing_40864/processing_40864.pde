
void setup () {
  size(600, 500);
}
int Sally = 50;
int Bullet = 415;
int Smoke = 170;
void draw () {
  background(125);
  fill(120, 130, 50); //green gray
  ellipse(10, 300, 50, 50); //head
  line(7, 325, 0, 350);
  line(0, 350, 40, 360);
  line(0, 350, 40, 340);
  ellipse(40, 340, 10, 10); //hands
  ellipse(40, 360, 10, 10);
  fill(0, 80);
  ellipse(18, 290, 8, 8); //eyes
  ellipse(4, 290, 8, 8);
  fill(0, 40);
  ellipse(10, 310, 10, 3); //mouth
  //front zombie
  fill(140, 130, 60);
  ellipse(30, 400, 75, 75); //head
  line(30, 438, 30, 499);
  line(30, 465, 80, 430);
  line(30, 468, 85, 470);
  ellipse(80, 430, 15, 15);
  ellipse(85, 470, 15, 15);
  fill(0, 80);
  ellipse(20, 390, 10, 10);
  ellipse(40, 390, 10, 10);
  fill(0, 40);
  ellipse(30, 420, 20, 6);
  //man on right
  fill(100, 50, 25);
  ellipse(450, 250, 50, 50);
  line(450, 275, 450, 350); //body
  line(450, 350, 465, 385);
  line(450, 350, 435, 385);
  line(450, 300, 465, 335);
  line(450, 300, 425, 290);
  ellipse(465, 335, 10, 10);
  fill(0);
  rect(418, 280, 8, 15);
  rect(410, 280, 15, 5); //gun barrel
  fill(0);
  ellipse(460, 245, 8, 8);
  ellipse(445, 245, 8, 8);
  line(448, 255, 455, 255);
  fill(0, 80);
  rect(100, 150, 180, 120); //house
  Smoke = Smoke-1;
  fill(75);
  stroke(75);
  ellipse(140, Smoke, 20, 20);
  ellipse(150, Smoke-1, 30, 30);
  ellipse(165, Smoke-3, 25, 40);
  ellipse(200, Smoke-20, 20, 20);
  ellipse(215, Smoke-22, 30, 40);
  fill(255, 50, 0);
  stroke(0);
  rect(120, 170, 40, 40);
  rect(190, 190, 50, 80);
  Sally = Sally+2;
  fill(255, 222, 173);
  ellipse(Sally, 365, 80, 80); //head
  line(Sally-5, 420, Sally-40, 385);
  ellipse(Sally-40, 385, 10, 10);
  line(Sally+5, 420, Sally+40, 385);
  ellipse(Sally+40, 385, 10, 10);
  fill(0, 0, 255);
  triangle(Sally, 405, Sally-25, 499, Sally+25, 499);
  fill(100, 149, 237);
  ellipse(Sally+10, 350, 12, 12);
  ellipse(Sally-10, 350, 12, 12);
  fill(0);
  ellipse(Sally, 385, 10, 20);
  Bullet = Bullet-2;
  ellipse(Bullet, 280, 3, 3);
  }

                
                
