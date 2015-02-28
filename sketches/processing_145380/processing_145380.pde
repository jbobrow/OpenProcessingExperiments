
 //inicio variables
float x, y;
float v=random(2,2);
float vy=random(2,2);

void setup(){
 size (800,600);
  x = random(width);
  y = random(height);

}
void draw(){
background(0,0,0);
fill(255,173,241);
 background(0);
  fill(x,0,0);
  ellipse(x,y,20,20);
  dibuixatot();
  x = x+v;
  y = y+vy;
  limits();
 
}
void dibuixatot(){
  
//ma esquerra
pushMatrix();
  fill(x,173,241);
rotate(-0.3);
ellipse(x-190,y,90,150);
popMatrix();

//ma dreta
pushMatrix();
fill(x,173,241);
rotate(0.2);
ellipse(x+170,y-90,150,90);
popMatrix();

//peu esquerra
fill(206,0,3);
pushMatrix();
translate(x,y);
rotate(radians(-15));
ellipse(-115,110,130,80);
popMatrix();

//cos
fill(x,173,241);
strokeWeight(3);
stroke(255,0,200,30);
ellipse(x,y,280,280);

//boca
noStroke();
fill(219,0,33);
ellipse(x,y+15,30,30);

//peu dret
fill(206,0,3);
pushMatrix();
translate(x,y);
rotate(radians(-60));
ellipse(-80,120,130,80);
popMatrix();

//ull negre
fill(0,0,0);
ellipse(x-30,y-50,30,80);
ellipse(x+30,y-50,30,80);
//ullblau
fill(0,107,252);
ellipse(x-30,y-50,25,75);
ellipse(x+30,y-50,25,75);
//ull negre petit
fill(0,0,0);
ellipse(x-30,y-60,27,60);
ellipse(x+30,y-60,27,60);
//ull blanc
fill(255);
stroke(0,104,252);
strokeWeight(2);
ellipse(x-30,y-70,20,30);
ellipse(x+30,y-70,20,30);

//galtes
fill(277,2,160,80);
noStroke();
ellipse(x-70,y,40,25);
pushMatrix();
ellipse(x+70,y,40,25);
popMatrix();
}
void mousePressed(){
  v = random(-5,5);
  vy = random(-5,5);
  x = mouseX;
  y = mouseY;
 }
 
void limits(){
    if (x+170 > width || x-170 < 0) {
    v = -v;
  }
 
  if (y+180> height || y-180 < 0) {
    vy = -vy;
  }
}


