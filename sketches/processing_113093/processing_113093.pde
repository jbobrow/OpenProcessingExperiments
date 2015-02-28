
float timer = 0;


void setup() {

  size(600, 600);
  frameRate(10);
  background(0);
  

 
  colorMode(HSB, 360, 100, 100);
}

 

  void draw() {
    loop();
   
    timer += 0.1;
    
    for (int i = 0; i < 50; i++) { //Draw 50 X shapes
      drawX(int(random(255)), int(random(30)),int(random(width)), int(random(height)), 100);
    }

}

 

 

void drawX(int gray, int weight, int x, int y, int size) {

    
    stroke(gray, 100, 100);
    strokeWeight(weight);
    

  if (timer > 0 && timer < 3)
  {
    line(x, y, x+size, y+size);
    line(x+size, y, x, y+size);
  }
   

   smooth();

   if (timer > 3 && timer < 5) {
   //fill(gray, 100, 100);

   rect(100, 60, 80, 10);

   rotate(-PI/16);

    rect(100, 60, 80, 10);

    rotate(-PI/8);

    rect(100, 60, 80, 10);
   }
   

    smooth();
if (timer > 5 && timer < 7) {
  fill(360, 100, 100);
    ellipse(400, 150, 35, 20);

    rotate(-PI/20);

    ellipse(400, 150, 35, 20);

    rotate(-PI/10);

     ellipse(400, 150, 35, 20);
}
     
     smooth();
    if (timer > 7 && timer < 10) {
    
      rect(500, 200, 50, 30);
      
    rotate(-PI/40);
    
    rect(500, 200, 50, 30);
    
    rotate(-PI/20);
    
    rect(500, 200, 50, 30); 
    }
    
    if (timer > 10 && timer < 15) {
      fill(255, 0, 0);
   rect(350, 90, 80, 100);
   rotate(-PI/20);
    rect(400, 65, 100, 110);
    rotate(-PI/40);
    rect(300, 90, 67, 200);
}

if (timer > 15 && timer < 20) {
  ellipse(500, 500, 200, 300);
    rotate(-PI/20);
    ellipse(600, 300, 350, 600);
    rotate(-PI/40);
     ellipse(550, 250, 220, 400);

}


if (timer > 20 && timer < 25) {
  ellipse(100, 500, 200, 300);
    rotate(-PI/20);
    rect(150, 300, 350, 600);
    rotate(-PI/40);
     rect(200, 250, 220, 400);
}

}


