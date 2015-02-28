



class Cloud2 { 
  float cloudCount = 1000;
float y = random(0, 400);
float speed = random(.001, 1);
float scale = random(1, 8);
float cx1 = random(-10,0);
 float cy1 = random(-10,0);
  float cx2 = random(0,10);
  float cy2 = random(-10,-20);
  float cx3 = random(10,20);
 float cy3 = random(-10, -20);
  float cx4 = random(20,10);
 float cy4 = random(-10,0);
  float cx5 = random(10,0);
float cy5 = random(0,5);
int d = -1;
  Cloud2 (float y, float s) {  

  } 
  void update() { 
 
       if (cloudCount > 0)
   {
     noStroke();
     fill(255);
     beginShape();
     curveVertex(cloudCount, y);
     curveVertex(cloudCount, y);
     curveVertex(cloudCount + (cx1 * scale), y + (cy1 * scale));
     curveVertex(cloudCount + (cx2 * scale), y + (cy2 * scale));
     curveVertex(cloudCount + (cx3 * scale), y + (cy3 * scale));
     curveVertex(cloudCount + (cx4 * scale), y + (cy4 * scale));
     curveVertex(cloudCount + (cx5 * scale), y + (cy5 * scale));
     curveVertex(cloudCount, y);
     curveVertex(cloudCount, y);
   endShape();
   cloudCount = cloudCount - speed;
   }
   
    if (cloudCount <= 0 )
   {
   cloudCount = 1000;
   y = random(0, 400);
   speed = random(.01, 1);
   scale = random(5, 15);
 cx1 = random(-10,0);
 cy1 = random(-10,0);
 cx2 = random(0,10);
 cy2 = random(-10,-20);
 cx3 = random(10,20);
 cy3 = random(-10, -20);
 cx4 = random(20,10);
 cy4 = random(-10,0);
 cx5 = random(10,0);
 cy5 = random(0,5);


   }
  } 
} 

