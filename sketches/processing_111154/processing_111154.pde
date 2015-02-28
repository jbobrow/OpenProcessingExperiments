
//myoriginal gravity

float cc;
float x;
float x1;
float y = 0;
float y1 = 0;
float speed = 0;
float speed1 = 0;
float gravity = 0.1;
float gravity1 = 0.8;


boolean button = false;

void setup() {
  size(600, 600);
  colorMode(HSB);
}


void draw() {

  background(255);

  fill(100, 20);
  noStroke();
  rect(0, 0, width, 300);

  fill(255, 20);
  noStroke();
  rect(0, 300, width, 600);

  fill(0);
  noStroke();
  ellipse(0, y, 25, 25);
  
  x = 0;
  while (x<width) {
    x = x + 60;

    fill(0);
    noStroke();
    ellipse(x, y, 25, 25);
  }


  y = y + speed;
  speed = speed + gravity;

  if (gravity > 0) {
    if (y > height/2) {
      speed = speed * -0.95;
    }
  } 
  else if (gravity < 0) {
    if (y < 0) {
      speed = speed *-0.95;
    }
  }


//  x1 = 0;
//  while (x1 <width) {
//    x1 = x1 + 30;
//    fill(40);
//    noStroke();
//    ellipse(x1, y1, 25, 25);
//  }
  
  for(int i=30; i<width; i+=60){
   fill(40);
    noStroke();
    ellipse(i, y1, 25, 25);
  }
  
  y1 = y1 + speed1;
  speed1 = speed1 + gravity1;


  if (gravity1 > 0) {
    if (y1 > height/2) {
      speed1 = speed1 * -0.95;
    }
  } 
  else if (gravity1 < 0) {
    if (y1 < 0) {
      speed1 = speed1 *-0.95;
    }
  }

  /*  if(mouseX > mx && mouseX < mx + mw && mouseY > y && mouseY < my+mh){
   button = true;
   } else{
   button = false;
   }
   
   if(button){
   y = -y + speed;
   speed = speed + gravity;
   } */
}

void mousePressed() {
  speed = -speed;
  gravity = -gravity;
  speed1 = -speed1;
  gravity1 = -gravity1;
}
