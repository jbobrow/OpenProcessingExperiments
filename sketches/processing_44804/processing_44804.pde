
// rational drawing of circles  

// an example from Pearson (2011), p.68  

// revised to use setup() and draw()  

// dulce



void setup() {  

  size(500, 500);   

  background(255);   

  strokeWeight(0.1);   

  smooth();
  //noLoop();
  frameRate(1);
}  



void draw() {  

  background(255);
  // set the radius and center point  

  float radius = 100;   

  int centX = width/2;   

  int centY = height/2;   

  for (int i=0;i<2;i++) {
    int r=255;

    int g=255;  

    int b=255;  







    radius= 3;
    float x, y;   

    float lastx = -999;   

    float lasty = -999; 
    float radiusNoise = random(150); 

    float startAng= random(300) ;

    for (float ang=startAng; ang<=startAng+360*4; ang+=random(5)) { 
      r=floor(random(255));  

      g=floor(random(255));  

      b=floor(random(255)); 
      radiusNoise += 0.05;
      radius +=0.5 ; 
      float thisRadius = radius + (noise(radiusNoise)*200) - 100;

      float rad = radians(ang);                                     

      x = centX + (thisRadius * cos(rad));   

      y = centY + (thisRadius * sin(rad));   
      if (lastx > -999) {
        stroke(167);
        strokeWeight(2);
        line(x, y, lastx, lasty);
        stroke(r, g, b, 20);
        strokeWeight(2);
        line(x, y, centX, centY);
      }  

      lastx=x;
      lasty=y;
    }
  }
}
void mousePressed() {  

  saveFrame("circle1.png");
} 


