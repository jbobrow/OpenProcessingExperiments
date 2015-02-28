
float x;
float y;
float px;
float py;
float easing = 0.05;
int recx = 250;
int recy = 300;
int w = 250;
int h = 300;
int circlex = 250;
int circley = 300;
int diameter = 200;


void setup() {
size(600,600);
rectMode(CENTER);
}

void draw() {
//background(430);
   float d = dist(mouseX, mouseY, circlex, circley);
   float targetX = mouseX;
   x += (targetX - x) * easing;
   float targetY = mouseY;
   y += (targetY - y) * easing;
   float weight = dist(x,y,px,py);
   strokeWeight(weight);
     stroke((mouseY/2 - mouseX/2) % 100 + 100, mouseX/2 % 100 + 100, mouseY/2 % 100 + 100);
   //Thank you thomas for the line above :)
   line(x, y, px, py);
   py = y;
   px = x;
    
  if (dist (mouseX, mouseY, circlex, circley) > diameter/2) {
    fill(255);
  } else {
     fill(0);
  }
   //ellipse(circlex, circley, radius, radius);



  if (d < diameter/2) {
    System.out.println("D is equal to " + d);
    System.out.println("diameter is equal to " + diameter);
    diameter++;
  } else {
    // DO nothing
  }

  ellipse(circlex, circley, diameter, diameter);


  if (mousePressed) {
    rect (circlex, circley, diameter, diameter);  
  } else {
    // Do nothing
  }

}


