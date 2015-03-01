
float inferiorY = 400;
PImage unicorn;
PImage grumpy;
PImage fondo;
float limitXforma = 220;
float pgatX = mouseX;
float bocaX = 180;
float bocaY = 280;

int numUnicorns = 10;

float[] unicornX = new float [numUnicorns];
float[] unicornY = new float [numUnicorns];
float [] vx = new float [numUnicorns];
float [] vy = new float [numUnicorns];


void setup(){
size(600,400);  
unicorn = loadImage("unicorn.png");
grumpy = loadImage("grumpy.png");
fondo = loadImage("fondo.jpg");
for (int i=0; i<numUnicorns; i++) {
    unicornX[i] = bocaX;
    unicornY[i] = bocaY-30;
    vx[i] = random(-5,5);
    vy[i] = random(-5,5);
  }
}

void draw(){
image(fondo,0,0);

vomitunicorn();

cospukerainbows();

arcoiris();

grumpycat();

dibuixaUnicorn();



}

void vomitunicorn(){
 
for(int i=0; i<numUnicorns; i++){
  unicornX[i] += vx[i];
  unicornY[i] += vy[i]; 
  if((unicornX[i]>=width) || (unicornX[i]<=0)){
    vx[i]=-vx[i];
    }
    if((unicornY[i]>=height) || (unicornY[i]<=0)){
    vy[i]=-vy[i]; 
    }
    if (mousePressed){
    unicornX[i] = mouseX;
    unicornY[i] = mouseY; 
}
  }
}

//DIBUIXA UNICORN

void dibuixaUnicorn(){
  for(int i = 0; i<numUnicorns; i++){
  image (unicorn, unicornX[i], unicornY[i], 50,50);  
  }
}

void arcoiris(){ 
  //curves (bezier?) varias con varios colores para arcoiris desde 180,280 (centro arco)
//el punto final de la curva siempre sera mousex, y400
beginShape();
vertex(bocaX, bocaY);
stroke(204,0,204);
strokeWeight(5);
noFill();
bezierVertex(bocaX, bocaY, (mouseX - mouseX/2 ), 0, mouseX+60, height);
endShape();

beginShape();
vertex(bocaX, bocaY);
stroke(0,0,225);
strokeWeight(5);
noFill();
bezierVertex(bocaX+10, bocaY, (mouseX - mouseX/2 )+10, 0, mouseX+70, height);
endShape();

beginShape();
vertex(bocaX, bocaY);
stroke(0,153,255);
strokeWeight(5);
noFill();
bezierVertex(bocaX+20, bocaY, (mouseX - mouseX/2 )+20, 0, mouseX+80, height);
endShape();

beginShape();
vertex(bocaX, bocaY);
stroke(0,204,0);
strokeWeight(5);
noFill();
bezierVertex(bocaX+30, bocaY, (mouseX - mouseX/2 )+30, 0, mouseX+90, height);
endShape();

beginShape();
vertex(bocaX, bocaY);
stroke(255,255,0);
strokeWeight(5);
noFill();
bezierVertex(bocaX+40, bocaY, (mouseX - mouseX/2 )+40, 0, mouseX+100, height);
endShape();

beginShape();
vertex(bocaX, bocaY);
stroke(255,153,0);
strokeWeight(5);
noFill();
bezierVertex(bocaX+50, bocaY, (mouseX - mouseX/2 )+50, 0, mouseX+110, height);
endShape();

beginShape();
vertex(bocaX, bocaY);
stroke(255,0,0);
strokeWeight(5);
noFill();
bezierVertex(bocaX+60, bocaY, (mouseX - mouseX/2 )+60, 0, mouseX+120, height);
endShape();

}

void cospukerainbows(){

beginShape();
stroke(0);
fill(255);
vertex(100, inferiorY);
bezierVertex(100, inferiorY, 120, 350, 150, 300);
vertex(150, 300);
bezierVertex(150, 300, 180, 280, 200, 300);
vertex(200, 300);
bezierVertex(200, 300, 190, 280, limitXforma, inferiorY);
endShape();
arc(bocaX,bocaY, 80, 80, 0, PI+HALF_PI, PIE);
}

void grumpycat(){
  float pgatX = mouseX;
image(grumpy,pgatX,260,120,140);
}



