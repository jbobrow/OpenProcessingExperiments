
int q = 460;
int w = 250;
int g = 70;

void setup() {
  size(400, 400);
  background(255);
}

void draw () {
  background(10, 208, 255);


  float a = millis()/500.0;
  float inc = TWO_PI/60.0;
  float prev_x = -50, prev_y = 300, x, y;
  float amp = 40;
  
  //Erstellen der Sonnenstrahlen

  frameRate(10);
  stroke(250, (random(210, 255)), 167);
  strokeWeight(3);
  line(340, 60, 200, 350);
  line(340, 60, 300, 400);
  line(340, 60, 400, 400);
  line(340, 60, 450, 200);
  line(340, 60, 500, 100);
  line(340, 60, 500, 20);
  line(340, 60, 400, 10);
  line(340, 60, 370, -5);
  line(340, 60, 330, -5);
  line(340, 60, 290, -5);
  line(340, 60, 200, -5);
  line(340, 60, -10, 40);
  line(340, 60, -10, 150);
  line(340, 60, -10, 300);
  
  //Erstellen der Sonne 
  
  frameRate(20);
  stroke(250, (random(210, 255)), 167); 
  fill(255, 243, 129);
  ellipse(340, 60, 90, 90);
  
  noStroke(); 
  
  //Erstellen der Wolken
  
    if ((q==460) || (q>-60)) { q=q-1; }
    if ((q==-60)) { q=q+520; }
    
    if ((w==460) || (w>-60)) { w=w-1; }
    if ((w==-60)) { w=w+520; }
    
    if ((g==70) || (g>-60)) { g=g-1; }
    if ((g==-60)) { g=g+520; }
  
  
  fill(255);   
  ellipse(q, 80, 100, 10);
  fill(240);
  ellipse(w, 100, 150, 15);
  fill(230);
  ellipse(g, 70, 70, 8);
 
 //Erstellen der Wellen
 
 for (int i=0; i<400; i=i+3) {
  stroke(0, 0, 255);
  strokeWeight(10);
    x = i;
    y = 320 + sin(a) * amp;
    line(prev_x, prev_y, x, y);
  stroke(18, 118, 255);
  strokeWeight(20);
    x = i;
    y = 345 + sin(a) * amp;
    line(prev_x, y, x, y); 
  stroke(18, 150, 255);
  strokeWeight(20);
    x = i;
    y = 360 + sin(a) * amp;
    line(prev_x, y, x, y);
  stroke(18, 194, 255);
  strokeWeight(20);
    x = i;
    y = 375 + sin(a) * amp;
    line(prev_x, y, x, y);
  stroke(18, 237, 255);
  strokeWeight(20);
    x = i;
    y = 390 + sin(a) * amp;
    line(prev_x, y, x, y);
  stroke(18, 255, 241);
  strokeWeight(20);
    x = i;
    y = 405 + sin(a) * amp;
    line(prev_x, y, x, y);
  stroke(160, 255, 249);
  strokeWeight(20);
    x = i;
    y = 420 + sin(a) * amp;
    line(prev_x, y, x, y);
  stroke(192, 250, 246);
  strokeWeight(20);
    x = i;
    y = 430 + sin(a) * amp;
    line(prev_x, y, x, y);
    
    prev_x = x;
    prev_y = y;
    a = a + inc;
    amp = amp / 1.02;
  }

  
}
