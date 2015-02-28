
Cat cat;

void setup() {
  size(400, 500);
  smooth();
  cat = new Cat(width/2, height/2); 
  }

void draw() {
  background(0);
  cat.display();
  //cat.x = mouseX;
  //cat.y = mouseY;
  }

//--------------------------------------------------------------------

void mouseDragged () {
 fill(mouseX, 255, mouseY, 10);
  }

//--------------------------------------------------------------------

class Cat {
  float x;
  float y;

  
  Cat(float _x, float _y) {

  x = _x;
  y = _y;
  }
  
void display() {  
  //head
  fill(255);
  noStroke();
  ellipse(x, y-150, 80, 80);

 
 //left ear
  fill(255);
  noStroke();
 triangle(x-32, y-170, x-15, y-187, x-32, y-205);


// right ear
 fill(255);
 noStroke();
 triangle(x+32, y-174, x+14, y-186, x+32, y-205); 
 
 //body
 
 fill(255);
 ellipse(x, y-15, 220, 200);
 fill(150);
 ellipse(x-30, y+85, 40, 30);
 ellipse(x+40, y+85, 40, 30);
 
 
 //left paw
 ellipse(x-30, y-50, 40, 30);
 fill(255);
 rectMode(CENTER);
 rect(x-30, y-68, 40, 30);

// right paw
 fill(150); 
 ellipse(x+40, y-50, 40, 30); 
 fill(255);
 rectMode(CENTER);
 rect(x+40, y-68, 40, 30);

 // tail
 stroke(255);
 strokeWeight(25);
 line(x+80, y+20, x+160, y-50);
 
 //eyes and nose
 noStroke();
 fill(mouseX, 0, mouseY);
 ellipse(x-15, y-160, 7, 7);
 ellipse(x+7, y-160, 7, 7);
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

