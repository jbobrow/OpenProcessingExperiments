
void setup(){
size(900,300);
background(0);
smooth();
}
float punta=0;

int centrohoja=150;
//float offset=0.0;
float centroSolX=0.0;
float centroSolY=0.0;
//float centroSolXC=420.0;
//float ruido=0.0;
void draw(){
  
  frameRate(10);
fill(200,200,200,50);

planta(900.0,0.0,0.0,0.0);
pushMatrix();
translate(100,0);
planta(900.0,0.0,0.0,0.0);
popMatrix();
pushMatrix();
translate(200,0);
planta(900.0,0.0,0.0,0.0);
popMatrix();
pushMatrix();
translate(-100,0);
planta(900.0,0.0,0.0,0.0);
popMatrix();
pushMatrix();
translate(-200,0);
planta(900.0,0.0,0.0,0.0);
popMatrix();
fill(0,10);
rect(0,0,900,300);
noFill();
stroke(255,231,111,90);
//noise
//offset+=0.01;
//ruido=noise(offset);
//centroSolX= (ruido+0.4)*450;
centroSolX=random(0.99,1.01)*450;
centroSolY=random(0.9,1.1)*45;
//centroSolXC=constrain(centroSolX,420.0,470.0);
ellipse(centroSolX,centroSolY,60,60);
println();
}
  



void planta(float centroX,float centroY,float largoX, float largoY){
//stroke(0);
strokeWeight(0);
noStroke();
fill(170,201,150,90);
float centrox=centroX;

float centroy=centroY;
//println(centroy);
//println(centrox);
smooth();
//filter(BLUR,0.005);

beginShape();
curveVertex(300,0);//controlador

if(centrohoja<800){
 if(centrohoja<300||centrohoja>=650){
 punta=random(0.9,1)*random(120,150);
 println("punta chica es :"+punta);
 }
 if(centrohoja>=300&&centrohoja<450){
 punta=random(0.9,1)*random(100,120); 
  println("punta med es :"+punta);
 }
 if(centrohoja>450&&centrohoja<=650){
 punta=random(0.9,1)*random(100,120);
  println("punta med es :"+punta);
 }


if(centrohoja==450){punta=random(0.9,1)*random(90,100); println("la punta es:"+punta);}

curveVertex(centrohoja,punta);//primer punto
curveVertex(450,300);
curveVertex(centrohoja,punta);//segundo punto};
centrohoja+=50;}

//for(int laHoja=150;laHoja<800;laHoja+=50){
//punta=random(150,170);
//if(laHoja==450){punta=100;}
//curveVertex(laHoja,punta);//primer punto
//curveVertex(450,300);
//curveVertex(laHoja,punta);//segundo punto};
//println(laHoja);
//}


curveVertex(600,0);//controlador
endShape();
//println("la punta:" +punta);

if(centrohoja>=800){
centrohoja=150;
punta=0;
}
//fill(0,10);
//rect(0,0,900,300);
}


void mousePressed(){
saveFrame("nochedelagave-####.jpg"); 

}


