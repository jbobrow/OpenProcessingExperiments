
int d3=125;
int d=100;
int d1=75;

color c1 = color(0, random(255), random(255));
color c2 = color(0, random(255), random(255));
color c3 = color(0, random(255), random(255));
color c4 = color(0, random(255), random(255));

int wide = 600;
int high = 600;
 
int d = 20;
 
float x1 = random(wide);
float y1 = random(high);
float easing1 = .02;
 
float x2 = random(wide);
float y2 = random(high);
float easing2 = .04;
 
float x3 = random(wide);
float y3 = random(high);
float easing3 = .06;


void setup() {
    size(600, 600);
    noStroke();
    noCursor();
}

void draw() {
    background(#00ffc3);
    
    fill(c1, 100);
    ellipse(x3, y3, d+400, d+450);
    x3 += (mouseX - x3)*easing3;
    y3 += (mouseY - y3)*easing3;
     
    fill(c2, 100);
    ellipse(x3, y3, d+340, d+340);
    x3 += (mouseX - x3)*easing3;
    y3 += (mouseY - y3)*easing3;     
     
    fill(c3, 100);
    ellipse(x3, y3, d+310, d+310);
    x3 += (mouseX - x3)*easing3;
    y3 += (mouseY - y3)*easing3;    
     
    fill(c4, 100);
    ellipse(x3, y3, d+300, d+290);
    x3 += (mouseX - x3)*easing3;
    y3 += (mouseY - y3)*easing3;     


    
    fill(c2, 100);
    ellipse(x2, y2, d+230, d+220);
    x2 += (mouseX - x2)*easing2;
    y2 += (mouseY - y2)*easing2;

    fill(c1, 100);
    ellipse(x2, y2, d+175, d+210);
    x2 += (mouseX - x2)*easing2;
    y2 += (mouseY - y2)*easing2;

    fill(c3, 100);
    ellipse(x2, y2, d+150, d+150);
    x2 += (mouseX - x2)*easing2;
    y2 += (mouseY - y2)*easing2;

    fill(c4, 100);
    ellipse(x2, y2, 120, d+140);
    x2 += (mouseX - x2)*easing2;
    y2 += (mouseY - y2)*easing2;
     
     fill(c2, 100);
    ellipse(x2, y2, d+100, d+110);
    x2 += (mouseX - x2)*easing2;
    y2 += (mouseY - y2)*easing2;    
     

    
    fill(c4, 100);
    ellipse(x1, y1, d+75, d+100);
    x1 += (mouseX - x1)*easing1;
    y1 += (mouseY - y1)*easing1;

    fill(c3, 100);
    ellipse(x1, y1, d+50, d+75);
    x1 += (mouseX - x1)*easing1;
    y1 += (mouseY - y1)*easing1;

    fill(c2, 100);
    ellipse(x1, y1, d+50, d);
    x1 += (mouseX - x1)*easing1;
    y1 += (mouseY - y1)*easing1;

    fill(c1, 100);
    ellipse(x1, y1, d, d);
    x1 += (mouseX - x1)*easing1;
    y1 += (mouseY - y1)*easing1;
}

void keyPressed() {
  x1 = random(wide);
  y1 = random(high);
 
  x2 = random(wide);
  y2 = random(high);
 
  x3 = random(wide);
  y3 = random(high);
}

