
// Hyun Jean Kwon
// © Hyun Jean Kwon Fall 2013, Pittsburgh, PA
// HW5 Course 60257

float x, y, w, h;

void setup() {
    size(400, 400);
    smooth();
    background(255);
    stroke(0);
    x = 200;
    y = 200;
    w = 250;
    h = 250;
}

void draw() {
noStroke();
float d = dist(width/2, height/2, mouseX, mouseY);
float maxDist = dist(0, 0, width/2, height/2);
float gray = map(d, 0, maxDist, 0, 255);
fill(gray, 50);
rect(0, 0, width, height);
  
//glasses 
strokeWeight(10);
strokeCap(PROJECT);
stroke (random(255),random(255),random(255));
line (x-(0.5*w), y-(0.25*h), x+(0.5*w), y-(0.25*h));
fill(255, 0, 232);
ellipse (x+(0.225*w), y-(0.225*h), w*0.3, h*0.3);
ellipse (x-(0.225*w), y-(0.225*h), w*0.3, h*0.3);
line (x+(0*w), y-(0.3*h), x+(0*w), y-(0.4*h));

if (mouseY == y){
    stroke(255, 105, 0);
    line (x-(0.5*w), y-(0.25*h), x+(0.5*w), y-(0.25*h));
    ellipse (x+(0.225*w), y-(0.225*h), w*0.3, h*0.3);
    ellipse (x-(0.225*w), y-(0.225*h), w*0.3, h*0.3);
    line (x+(0*w), y-(0.3*h), x+(0*w), y-(0.4*h));
    }
if (mouseX == x){
    stroke(255, 105, 0);
    line (x-(0.5*w), y-(0.25*h), x+(0.5*w), y-(0.25*h));
    ellipse (x+(0.225*w), y-(0.225*h), w*0.3, h*0.3);
    ellipse (x-(0.225*w), y-(0.225*h), w*0.3, h*0.3);
    line (x+(0*w), y-(0.3*h), x+(0*w), y-(0.4*h));
    }
if (keyPressed){
 if (key == CODED) {
   if (keyCode == DOWN) {
     if (w > 150){
     w= w*0.9;
     h= h*0.9;
     }
   }
   if (keyCode == UP) {
     if (w < 400){
     w= w*1.1;
     h= h*1.1;
     }
   }
 }
}
//nose
noFill ();
strokeWeight(7.5);
strokeCap(PROJECT);
beginShape ();
curveVertex (x-(0.1*w), y+(0*h));
curveVertex (x-(0.1*w), y+(0.1*h));
curveVertex (x+(0*w), y+(0.2*h));
curveVertex (x+(0.1*w), y+(0.1*h));
curveVertex (x+(0.1*w), y+(0*h));
endShape ();
//nose2
beginShape ();
curveVertex (x+(0*w), y+(0.3*h));
curveVertex (x+(0.1*w), y+(0.1*h));
curveVertex (x+(0*w), y-(0.25*h));
curveVertex (x+(0*w), y-(0.6*h));
endShape ();

//mustache2
beginShape ();
curveVertex (x-(0.3*w), y+(.175*h));
curveVertex (x-(0.2*w), y+(.25*h));
curveVertex (x-(0.1*w), y+(.275*h));
curveVertex (x+(0*w), y+(.25*h));
curveVertex (x+(.1*w), y+(.175*h));
endShape (); 
//mustache3
beginShape ();
curveVertex (x-(0.1*w), y+(.175*h));
curveVertex (x+(0*w), y+(.25*h));
curveVertex (x+(.1*w), y+(.275*h));
curveVertex (x+(.2*w), y+(.25*h));
curveVertex (x+(.3*w), y+(.175*h));
endShape ();

//center
ellipse (x, y, 2, 2);
fill (10, 80);

//moving glasses
line (mouseX-(0.5*w), mouseY-(0.25*h), mouseX+(0.5*w), mouseY-(0.25*h));
fill(255, 0, 232);
ellipse (mouseX+(0.225*w), mouseY-(0.225*h), w*0.3, h*0.3);
ellipse (mouseX-(0.225*w), mouseY-(0.225*h), w*0.3, h*0.3);
line (mouseX+(0*w), mouseY-(0.3*h), mouseX+(0*w), mouseY-(0.4*h));

//moving nose
noFill ();
strokeWeight(7.5);
strokeCap(PROJECT);
beginShape ();
curveVertex (mouseX-(0.1*w), mouseY+(0*h));
curveVertex (mouseX-(0.1*w), mouseY+(0.1*h));
curveVertex (mouseX+(0*w), mouseY+(0.2*h));
curveVertex (mouseX+(0.1*w), mouseY+(0.1*h));
curveVertex (mouseX+(0.1*w), mouseY+(0*h));
endShape ();
//moving nose2
beginShape ();
curveVertex (mouseX+(0*w), mouseY+(0.3*h));
curveVertex (mouseX+(0.1*w), mouseY+(0.1*h));
curveVertex (mouseX+(0*w), mouseY-(0.25*h));
curveVertex (mouseX+(0*w), mouseY-(0.6*h));
endShape ();
 
//moving mustache
fill(255, 98, 0);
beginShape ();
curveVertex (mouseX-(0.4*w), mouseY+(0.35*h));
curveVertex (mouseX-(0.2*w), mouseY+(0.25*h));
curveVertex (mouseX+(0*w), mouseY+(0.19*h));
curveVertex (mouseX+(0.2*w), mouseY+(0.25*h));
curveVertex (mouseX+(0.4*w), mouseY+(0.35*h));
endShape ();
}



