
//inicio variables
float posicioX;
float posicioY;
float vel = 4;

void setup(){
 size (800,600);
  posicioX = width/2;
  posicioY = height/2;
}
void draw(){
background(0,0,0);
fill(255,173,241);
 background(0);
  fill(mouseX,0,0);
  ellipse(mouseX,mouseY,20,20);
  dibuixatot();
  comprovaLimits();
}
void dibuixatot(){
  
//ma esquerra
pushMatrix();
  fill(mouseX,173,241);
rotate(-0.3);
ellipse(mouseX-190,mouseY,90,150);
popMatrix();

//ma dreta
pushMatrix();
fill(mouseX,173,241);
rotate(0.2);
ellipse(mouseX+170,mouseY-90,150,90);
popMatrix();

//peu esquerra
fill(206,0,3);
pushMatrix();
translate(mouseX,mouseY);
rotate(radians(-15));
ellipse(-115,110,130,80);
popMatrix();

//cos
fill(255,173,241);
strokeWeight(3);
stroke(255,0,200,30);
ellipse(mouseX,mouseY,280,280);

//boca
noStroke();
fill(219,0,33);
ellipse(mouseX,mouseY+15,30,30);

//peu dret
fill(206,0,3);
pushMatrix();
translate(mouseX,mouseY);
rotate(radians(-60));
ellipse(-80,120,130,80);
popMatrix();

//ull negre
fill(0,0,0);
ellipse(mouseX-30,mouseY-50,30,80);
ellipse(mouseX+30,mouseY-50,30,80);
//ullblau
fill(0,107,252);
ellipse(mouseX-30,mouseY-50,25,75);
ellipse(mouseX+30,mouseY-50,25,75);
//ull negre petit
fill(0,0,0);
ellipse(mouseX-30,mouseY-60,27,60);
ellipse(mouseX+30,mouseY-60,27,60);
//ull blanc
fill(255);
stroke(0,104,252);
strokeWeight(2);
ellipse(mouseX-30,mouseY-70,20,30);
ellipse(mouseX+30,mouseY-70,20,30);

//galtes
fill(277,2,160,80);
noStroke();
ellipse(mouseX-70,mouseY,40,25);
pushMatrix();
ellipse(mouseX+70,mouseY,40,25);
popMatrix();
}
void comprovaLimits(){
posicioX = posicioX+vel;
  if(posicioX > width) {
    vel= -vel;
  }
    if(posicioX < 0) {
    vel= -vel;
   }
}

