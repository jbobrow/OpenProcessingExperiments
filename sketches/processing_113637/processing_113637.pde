
void setup(){
size(900,300,P3D);
background(0);
smooth();
}
float punta=0;
int grados=0;
float centrohoja=150.0;
//float offset=0.0;
float centroSolX=0.0;
float centroSolY=0.0;
//float centroSolXC=420.0;
//float ruido=0.0;
void draw(){
  
  frameRate(30);
fill(200,200,200,50);

planta();
pushMatrix();
translate(100,0);
planta();
translate(100,0);
planta();
translate(-300,0);
planta();
translate(-100,0);
planta();
popMatrix();
fill(0,10);
rect(0,0,900,300);
noFill();
stroke(255,231,111,90);
//noise
//offset+=0.01;
//ruido=noise(offset);
//centroSolX= (ruido+0.4)*450;
centroSolX=random(0.99,1.01)*450.0;
centroSolY=random(0.9,1.1)*45.0;
//centroSolXC=constrain(centroSolX,420.0,470.0);
ellipse(centroSolX,centroSolY,60.0,60.0);
}
  



void planta(){
//stroke(0);
strokeWeight(0);
noStroke();
fill(170,201,150,90);

smooth();
beginShape();
curveVertex(300.0,0.0);//controlador

if(centrohoja<800.0){
 if(centrohoja==150.0){
  punta=random(0.9,1)*random(170,180);
 centrohoja=int(random(0.999,1)*centrohoja); 
 }
  if(centrohoja==750.0){
  punta=random(0.9,1)*random(170,180);
 centrohoja=int(random(0.999,1)*centrohoja); 
 println(punta);
 }
 if(centrohoja<300.0||centrohoja>=650.0){
 punta=random(0.9,1)*random(130,160);
 centrohoja=int(random(0.999,1)*centrohoja); 
 }
 if(centrohoja>=300.0&&centrohoja<450.0){
 punta=random(0.9,1)*random(110,130); 
 centrohoja=int(random(0.999,1)*centrohoja); 
 }
 if(centrohoja>450.0&&centrohoja<=650.0){
 punta=random(0.9,1)*random(110,130);

centrohoja=int(random(1,1.0009)*centrohoja); 
}
if(centrohoja==450.0){
  punta=random(0.99999,1.0)*100.0;
  
}

curveVertex(centrohoja,punta);//primer punto
curveVertex(450,300);
curveVertex(centrohoja,punta);//segundo punto};
centrohoja+=50.0;}

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


