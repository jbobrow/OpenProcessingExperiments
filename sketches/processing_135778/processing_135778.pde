
/*float angle = 0.0;
float offset = 60;
float scalar = 2;
float speed = 0.05;*/ 

int radius = 40;
float x = 110;
float speed = 2;
int direction = 1;

int radius1 = 40;
float y = -radius; 
float speed1 = 0.125; 

int radius2 = 40;
float z = -radius; 
float speed2 = 200; 

int radius3 = 40;
float k = -radius; 
float speed3 = 5; 

void setup() {
    size(800, 600);
    ellipseMode(RADIUS);
  }
 
  void draw() {

rectMode(CENTER);

float angle = 0.0;

   float color1 =random(0,255);
float color2 =random(0,255);
float color3 =random(0,255);
float opac =random(50, 100);
  
    //couldn't figure out how to make spiral work
    /*fill(0);
    smooth();
    float x = offset + cos(angle) * scalar;
    float y = offset + sin(angle) * scalar;
    ellipse (x, y, 2, 2);
    angle += speed;
    scalar =+ speed;*/
    
    
   if ( mouseX < 400 ) {
      background(#93E1FF);
    } else {
      background(#0378A5);
    }
    
    
     if ( mouseX < 400 ) {
       fill(#F1F2A4);
       noStroke();
      ellipse(100,100, 100, 100);
    } else {
             fill(#FFCF0D);
     ellipse(700, 100, 100, 100);}
     
     if ( mouseX < 400 ) {
       fill(#51ED52);
       noStroke();
     beginShape();
vertex(0, 550);
vertex(50, 600);
vertex(100, 550);
vertex(150,600);
vertex(200, 550);
vertex(250, 600);
vertex(300, 550);
vertex(350, 600);
vertex(400, 550);
endShape(CLOSE);  
     
    } else {
     beginShape();
fill(0);
vertex(400, 550);
vertex(450, 600);
vertex(500, 550);
vertex(550,600);
vertex(600, 550);
vertex(650, 600);
vertex(700, 550);
vertex(750, 600);
vertex(800, 550);
endShape(CLOSE);}

fill(#A7FFFA, 85);
    x += speed * direction;
    if ((x> width-radius) ||(x < radius)) {
      direction = -direction;
    }
    if (direction == 1) {
     // arc (x, 60, radius, radius, 0.52, 5.96);
      ellipse (x, 60, 50, 50);
    } else {
     // arc (x, 60, radius, radius, 3.67, 8.9);     
      ellipse (x, 60, 50, 50);}
      
fill(#FFA7F4, 100);
    x += speed * direction;
    if ((x> width-radius) ||(x < radius)) {
      direction = -direction;
    }
    if (direction == 1) {
      ellipse (x, 180, 50, 50);
    } else {
      ellipse (x*2, 180, 50, 50);

    } 
    
    fill(#FFA7F4, 100);
    x += speed * direction;
    if ((x> width-radius) ||(x < radius)) {
      direction = -direction;
    }
    if (direction == 1) {
      ellipse (x, 300, 50, 50);
    } else {
      ellipse (x, 300, 50, 50);
    }

fill(#A7FFFA, 100);
    x += speed * direction;
    if ((x> width-radius) ||(x < radius)) {
      direction = -direction;
    }
    if (direction == 1) {
      ellipse (x, 180, 50, 50);
    } else {
      ellipse (x*2, 375, 50, 50);

    } 
    
    fill(#A7FFFA, 100);
    x += speed * direction;
    if ((x> width-radius) ||(x < radius)) {
      direction = -direction;
    }
    if (direction == 1) {
     // arc (x, 60, radius, radius, 0.52, 5.96);
      ellipse (x, 60, 50, 50);
    } else {
     // arc (x, 60, radius, radius, 3.67, 8.9);     
      ellipse (x, 500, 50, 50);}

fill (#FFE517);
y += speed1;
if (y > width+radius1) { 
  y = -radius1;
} 
rect(100, y, 50, 50);  

y += speed1;
if (y > width+radius1) { 
  y = -radius1;
} 
rect(200, y, 50, 50); 

y += speed1;
if (y > width+radius1) { 
  y = -radius1;
} 
rect(300, y, 50, 50); 

y += speed1;
if (y > width+radius1) { 
  y = -radius1;
} 
rect(400, y, 50, 50); 

y += speed1;
if (y > width+radius1) { 
  y = -radius1;
} 
rect(500, y, 50, 50);

y += speed1;
if (y > width+radius1) { 
  y = -radius1;
} 
rect(600, y, 50, 50);

fill(#FC0000);
z += speed2;
if (z > width+radius2) { 
  z = -radius2;
} 
ellipse(z, 500, 10, 10);

fill(#F3FC00);
z += speed2;
if (z > width+radius2) { 
  z = -radius2;
} 
ellipse(z, 400, 10, 10);

fill(#36FF00);
z += speed2;
if (z > width+radius2) { 
  z = -radius2;
} 
ellipse(z, 300, 10, 10);

fill(#FC0000);
z += speed2;
if (z > width+radius2) { 
  z = -radius2;
} 
ellipse(z, 200, 10, 10);

stroke (1000);
if (mousePressed == true) {
  stroke (0);
} else {
  stroke (255);
}

fill(color1, color2, color3, opac);
if (mousePressed){
  ellipse (mouseX, mouseY, 300, 300);
} else if (keyPressed) {
  rect (mouseX, mouseY, 200, 800);
}


fill(#36FF00, 70);
stroke(255);
k += speed3;
if (k > width+radius3) { 
  k = -radius3;
} 
bezier(k, 60,  k, 100,  100, 75,  k, k);

fill(#36FF00, 70);
k += speed3;
if (k > height+radius3) { 
  k = -radius3;
} 
bezier(k, 100,  k, 60,  100, 75,  200, k);

}


