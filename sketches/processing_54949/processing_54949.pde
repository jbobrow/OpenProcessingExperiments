
// Ryanne Hollies
// PS2-6

Cat cat;
Cat cat2;

void setup() {
  size(400, 500);
  smooth();
  cat = new Cat(width/2, height/2, color(255, 0, 0), .3); 
  cat2 = new Cat(0, 0, color(255), 2.5);
  }

void draw() {
  background(0);
  cat.display();
  
  
  cat2.display();
  cat2.x = mouseX;
  cat2.y = mouseY;
  }

//--------------------------------------------------------------------

void mouseDragged () {
 fill(mouseX, mouseY, 255, 10);
  }

//--------------------------------------------------------------------

class Cat {
  float x;
  float y;
  color c;
  float eyes;
  
  Cat(float x2, float y2, color c2, float e) {

  x = x2;
  y = y2;
  c = c2;
  eyes = e;
  
  }
  
void display() {  
  //head
  fill(c);
  noStroke();
  ellipse(x, y-150, 80, 80);

 
 //left ear
  fill(c);
  noStroke();
  triangle(x-32, y-170, x-15, y-187, x-32, y-205);


// right ear
 fill(c);
 noStroke();
 triangle(x+32, y-174, x+14, y-186, x+32, y-205); 
 
 //body
 
 fill(c);
 ellipse(x, y-15, 220, 200);
 fill(150);
 ellipse(x-30, y+85, 40, 30);
 ellipse(x+40, y+85, 40, 30);
 
 
 //left paw
 ellipse(x-30, y-50, 40, 30);
 fill(c);
 rectMode(CENTER);
 rect(x-30, y-68, 40, 30);

// right paw
 fill(150); 
 ellipse(x+40, y-50, 40, 30); 
 fill(c);
 rectMode(CENTER);
 rect(x+40, y-68, 40, 30);

 // tail
 stroke(c);
 strokeWeight(25);
 line(x+80, y+20, x+160, y-50);
 
 //eyes and nose
 noStroke();
 fill(0);
 ellipse(x-15, y-160, 7, 7*eyes);
 ellipse(x+7, y-160, 7, 7*eyes);
 noStroke();
 fill(224, 143, 188);
 triangle(x-5, y-145, x, y-135, x+5, y-145);

//whiskers
 float w = 0;
 if (mousePressed) w = map(0, mouseY, -20, height/30, 20);
 stroke(0);
 strokeWeight(.8);
 line(x-10, y-140, x-47, y-145 + w);
 line(x-10, y-140, x-47, y-135 + w);
 line (x+10, y-140, x+47, y-145 - w);
 line(x+10, y-140, x+47, y-135 - w);
  }
}

