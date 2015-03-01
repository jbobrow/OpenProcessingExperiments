
void setup(){
size(200,200); 
smooth();
frameRate(30);
}

boolean mouse = false;
void mousePressed() {
    mouse=true;
}
void mouseReleased(){
    mouse=false;
}

void draw(){
ellipseMode(CENTER);
rectMode(CENTER);
background(0);
  
 
float X = mouseX;
float Y = mouseY;
float R = random(255);
float G = random(255);
float B = random(255);
float R2 = random(255);
float G2 = random(255);
float B2 = random(255);

 
//haus
stroke(0);
fill(R,G,B);
ellipse(X,Y-60,40,40);
  
//augu
stroke(0);
fill(0);
ellipse(X-10,Y-65,7,7);
ellipse(X+10,Y-64,7,7);
  
//nef
stroke(0);
line(X,Y-60,X,Y-55);
  
//munnur
stroke(0);
line(X-10,Y-53,X-4,Y-48);
line(X-4,Y-48,X+3,Y-48);
line(X+4,Y-48,X+10,Y-53);
 
//hÃ¡ls
stroke(R2,G2,B2);
line(X,Y-40,X,Y-20);
  
//magi
stroke(0);
fill(R,G,B);
ellipse(X,Y,20,35);
 
//fÃ¦tur
stroke(R2,G2,B2);
line(X,Y+15,80,170);
line(X,Y+15,120,170);

//glowstick band
stroke(255,255,255);
ellipse (X,Y-20,5,10);
 
//glowstick
stroke(0);
fill(111,255,0);
rect(X,Y-10,5,15);

//hendur
if (mouse) {
    stroke(R2,G2,B2);
    line(X,Y-20,X-30,Y-50);
    line(X,Y-20,X+30,Y-50);
    }
else {
    stroke(R2,G2,B2);
    line(X,Y-20,X-30,Y+5);
    line(X,Y-20,X+30,Y+5);
    }
}
