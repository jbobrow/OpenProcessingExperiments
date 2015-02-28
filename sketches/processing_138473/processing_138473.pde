
PFont f;

void setup () {
  size(500, 500);
  smooth();
  background (255);
  f = createFont("Arial",16,true); 
}



void draw () {
  if (mousePressed) {
    noStroke ();
  float x1 = random (0,200);
  float x2 = random (0,80);
  float x3 = random (0,170);
    if (mouseX < 200 && mouseY <200 ) {
       for (int c = 20; c < 570; c+=100){
         for (int d = 20; d < 550; d+=100){
       noStroke ();
       fill ( random(0,255), random(0,255), random(0,255),200);
       rect (c,d,x2,x2);
         strokeWeight (1);
         stroke (random(0,255), random(0,255), random(0,255));
          line (c-x2, d-x2, mouseX, mouseY);
          line (c+x2, d+x2, mouseX, mouseY);
         }
       }
       } else if ( mouseX > 300 && mouseY > 200 && mouseY <400) {
       for (int g = 20; g < 570; g+=100){
         for (int h = 20; h < 550; h+=100){
       noFill();
       strokeWeight (3);
       stroke(random(0,255), random(0,255), random(0,255),200);
       rect (g,h,x2,x2);
         strokeWeight (1);
         stroke (random(0,255), random(0,255), random(0,255));
          line (g-x2, h-x2, mouseX, mouseY);
          line (g+x2, h+x2, mouseX, mouseY);
         }
       }    
     } else if (mouseX < 300 && mouseY > 200){     
       for (int a = 50; a < 570; a+=100){
         for (int b = 50; b < 550; b+=100){
       noStroke ();
       fill ( random(0,255), random(0,255), random(0,255),200);
       ellipse (a,b,x2,x2);
         strokeWeight (1);
         stroke (random(0,255), random(0,255), random(0,255));
          line (a-x2, b-x2, mouseX, mouseY);
          line (a+x2, b+x2, mouseX, mouseY);
         }
       }
     } else if (mouseX > 300 && mouseY < 200){     
       for (int a = 50; a < 570; a+=100){
         for (int b = 50; b < 550; b+=100){
       noFill();
       strokeWeight (3);
       stroke (random(0,255), random(0,255), random(0,255),200);
       ellipse (a,b,x2,x2);
         strokeWeight (1);
         stroke (random(0,255), random(0,255), random(0,255));
          line (a-x2, b-x2, mouseX, mouseY);
          line (a+x2, b+x2, mouseX, mouseY);
         }
       }
      } else if (mouseX > 300 && mouseY > 300){     
        background (random(0,255), random(0,255), random(0,255));
     } else {
       for (int e = 0; e < 500; e+=100){
         for (int f = 500; f > 0; f-=100){
         strokeWeight (1);
         stroke (random(0,255), random(0,255), random(0,255));
          line (e, 0, mouseX, mouseY);
          line (f, 500, mouseX, mouseY);
          line (0, e, mouseX, mouseY);
          line (500, f, mouseX, mouseY);
           
         }
       }
     }
  } else {
      background (255);
      textFont (f, 16);
      fill(0);
      text("Click Me",mouseX,mouseY);  
  }
  
}


