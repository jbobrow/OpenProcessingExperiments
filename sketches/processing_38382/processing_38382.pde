
int value = 0;
int x_position=0;
int x_speed=30;

void setup() {
  size(450, 450);
}


void draw() {
  //draw the shining lines  
  strokeWeight(70);  
  stroke(random(255), 50);
  line(250, -200, -150, 500);
  strokeWeight(30); 
  stroke(random(255), 30);
  line(250, -30, -150, 670);
  strokeWeight(10);
  stroke(random(255), 20);
  line(280, 0, -120, 700);
  strokeWeight(50);
  stroke(random(255), 10);
  line(350, 0, -50, 700);
  strokeWeight(15);
  stroke(random(255), 40);
  line(420, 0, 20, 700);
  strokeWeight(10);
  stroke(random(255), 20);
  line(480, 0, 80, 700);

  //draw the running balls behind  
  x_position=x_position+x_speed;
  noStroke();
  fill(255, 30);
  ellipse(x_position, 0, 20, 20);
  fill(88, 219, 80, 30);
  ellipse(x_position, 56.25, 20, 20);
  fill(220, 242, 61, 40);
  ellipse(x_position, 112.5, 20, 20);
  fill(242, 119, 61, 50);
  ellipse(x_position, 168.75, 20, 20);
  fill(172, 61, 242, 40);
  ellipse(x_position, 225, 20, 20);
  fill(87, 61, 242, 40);
  ellipse(x_position, 281.25, 20, 20);
  fill(255, 0, 0, 50);
  ellipse(x_position, 337.5, 20, 20);
  fill(3, 255, 249, 40);
  ellipse(x_position, 393.75, 20, 20);
  fill(5, 255, 3, 30);
  ellipse(x_position, 450, 20, 20);

  if (x_position>450) {
    x_position=0;
  }


  fill(value, 10);
  rect(0, 0, 450, 450);

  //draw rolling balls
  stroke(random(255), random(255), random(255), 80);
  strokeWeight(1);
  fill(random(220, 256), random(30, 256), random(30, 256), 40);
  ellipse(250, 250, random(100), (100));
  fill(random(30, 256), random(30, 256), random(30, 256), 50);
  ellipse(380, 350, random(80), (80));
  fill(random(30, 256), random(30, 256), random(30, 256), 40);
  ellipse(100, 59, random(200), (200));
  fill(random(30, 256), random(220, 256), random(30, 256), 50);
  ellipse(450, 450, random(200), (200));
  fill(random(30, 256), random(220, 256), random(30, 256), 40);
  ellipse(350, 230, random(60), (60));
  fill(random(220, 256), random(30, 256), random(30, 256), 40);
  ellipse(168, 168, random(50), (50));
  fill(random(220, 256), random(220, 256), random(30, 256), 30);
  ellipse(190, 350, random(150), (150));
}

void mouseReleased() {
  if (value==0) {
    value=225;
  } 
  else {
    value=0;
  }
}  

