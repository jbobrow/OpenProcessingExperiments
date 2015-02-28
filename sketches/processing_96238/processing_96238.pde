
/* Animació 
seminari 2
David Palomar 
Grup 03 */
//NENA QUE VOL MATAR LES MOSQUES
//El joc consisteix en una noia que está envoltada de mosques. Els ulls, que canviaran de color,i els braços de la nena es mourán cap a la posició on estigui el ratolí, seguint així les mosques per tota la pantalla. Les mans de la noia es tenquen en clicar amb el mous, i aixi poder agafar les mosques. Segur... noooo!! les mosques es van movent i al clicar amb el ratolí cambien la seva posició, fent més difícil aquesta tasca.

float x=4;
float y=5.5;
float w;
float q;
float w2;
float q2;
float w3;
float q3;
float w4;
float q4;
float w5=600;
float q5=0;
float w6=600;
float q6=0;
float w7=600;
float q7=0;
float w8=600;
float q8=0;
float w9=600;
float q9=0;
//definim el fons del dibuix

void setup (){
  size(600,600);
  background(82,227,282);
}
void draw(){
  //començem a dibuixar la nena
  background(82,227,282);
  fill(242,158,46);
  //cap
  ellipse(300,300,150,200);
  fill(255);
  noStroke();
  //celles
  stroke(0);
  noFill();
  strokeWeight(3);
  //creo un arc que em servirá per definir les celles sobre els ulls
  ellipseMode(CENTER);
  arc(270,260,60,40,x,y);
  arc(330,260,60,40,x,y);
  
  //ulls
  noStroke();
  //el color dels ulls variara segons la posició del mouse
  fill(255,mouseX,mouseY);
  ellipse(270,265,60,40);
  ellipse(330,265,60,40);
  fill(0); 
  //amb les funcions seguents conseguiré que els ulls es moguin en direcció al ratolí 
  fill(0);
  noStroke();
  ellipse(250+mouseX/20,250+mouseY/20,10,10);
  ellipse(320+mouseX/20,250+mouseY/20,10,10);
  fill(0);
  
  //nas
  stroke(162,130,20);
  fill(242,158,46);
  ellipse(300,300,5,5);
  //boca
  stroke(255,0,0);
  strokeWeight(8);
  fill(222,125,125);
  ellipse(300,330,40,30);
  
  //cabell
  stroke(183,154,91);
  strokeWeight(2);
  fill(139,95,0);
   
  ellipse(300,190,20,20);
  ellipse(320,190,20,20);
  ellipse(340,200,20,20);
  ellipse(350,215,20,20);
  ellipse(365,230,20,20);
  ellipse(280,190,20,20);
  ellipse(260,200,20,20);
  ellipse(250,215,20,20);
  ellipse(235,230,20,20);
  ellipse(240,210,20,20);
  ellipse(300,200,20,20);
  ellipse(320,200,20,20);
  ellipse(340,210,20,20);
  ellipse(350,225,20,20);
  ellipse(365,240,20,20);
  ellipse(280,200,20,20);
  ellipse(260,210,20,20);
  ellipse(250,225,20,20);
  ellipse(235,240,20,20);
  ellipse(240,220,20,20);
  
  //ara faig el cos del nen
  stroke(242,158,46);
  strokeWeight(5);
  line(300,400,300,420);
  noStroke();
  fill(255,0,0);
  rect(270,420,60,50);
  
  //cinturó
  fill(118,86,5);
  rect(270,470,60,20);
  stroke(248,255,54);
  rect(290,470,20,20);
 
  //pantalons
  noStroke();
  fill(255,0,0);
  beginShape();
  vertex(270,490);
  vertex(330,490);
  vertex(340,530);
  vertex(260,530);
  vertex(260,530);
  vertex(250,530);
  endShape();
  
  //peu 1
  stroke(118,86,5);
  fill(118,86,5);
  beginShape();
  vertex(250,530);
  vertex(230,540);
  vertex(260,540);
  vertex(260,530);
  endShape();
  
  //peu 2
  stroke(118,86,5);
  fill(118,86,5);
  beginShape();
  vertex(340,530);
  vertex(360,540);
  vertex(330,540);
  vertex(330,530);
  endShape();
  
  //terra
  noStroke();
  fill(37,203,46);
  rect(0,540,600,60);
 
  // dibuixo les mosques a través de les variables, i les modifico per que es moguin per la pantalla
  fill(0);
  noStroke();
  ellipse(w,q,10,20);
  fill(255);
  ellipse(w+5,q+5,10,10);
  ellipse(w+5,q-5,10,10);
 
  fill(0);
  noStroke();
  ellipse(w2,q2,10,20);
  fill(255);
  ellipse(w2+5,q2+5,10,10);
  ellipse(w2+5,q2-5,10,10);
  
  fill(0);
  noStroke();
  ellipse(w3,q3,10,20);
  fill(255);
  ellipse(w3+5,q3+5,10,10);
  ellipse(w3+5,q3-5,10,10);
  
  fill(0);
  noStroke();
  ellipse(w4,q4,10,20);
  fill(255);
  ellipse(w4+5,q4+5,10,10);
  ellipse(w4+5,q4-5,10,10);
  
  fill(0);
  noStroke();
  ellipse(w5,q5,10,20);
  fill(255);
  ellipse(w5+5,q5+5,10,10);
  ellipse(w5+5,q5-5,10,10);
  
  fill(0);
  noStroke();
  ellipse(w6,q6,10,20);
  fill(255);
  ellipse(w6+5,q6+5,10,10);
  ellipse(w6+5,q6-5,10,10);
  
  fill(0);
  noStroke();
  ellipse(w7,q7,10,20);
  fill(255);
  ellipse(w7+5,q7+5,10,10);
  ellipse(w7+5,q7-5,10,10);
  
  fill(0);
  noStroke();
  ellipse(w8,q8,10,20);
  fill(255);
  ellipse(w8+5,q8+5,10,10);
  ellipse(w8+5,q8-5,10,10);
  
  fill(0);
  noStroke();
  ellipse(w9,q9,10,20);
  fill(255);
  ellipse(w9+5,q9+5,10,10);
  ellipse(w9+5,q9-5,10,10);
  
  //amb la funció "if" consegueixo que les mosques s'allunyin de la mà del nen al clicar el botó dret del ratolí
  if (mousePressed)
  {
   w=w-1;
   q=q-1;
   w2=w2-2;
   q2=q2-3;
   w3=w3+2;
   q3=q3-1;
   w4=w4-2;
   q4=q4+2;
   w5=w5+4;
   q5=q5-2;
   w6=w6+3;
   q6=q6-2;
   w7=w7+2;
   q7=q7-3;
   w8=w8+4;
   q8=q8-5;
   w9=w9+4;
   q9=q9-4;
   
  }
  //amb la funció else, faig que les mosques segueixin el seu recorregut quan no s'apreta cap botó del ratolí
  else 
  {
   w=w+0.6;
   q=q+0.6;
   w2=w2+0.7;
   q2=q2+0.8;
   w3=w3+0.8;
   q3=q3+0.8;
   w4=w4+0.7;
   q4=q4+0.3;
   w5=w5-0.5;
   q5=q5+0.3;
   w6=w6-0.7;
   q6=q6+0.6;
   w7=w7-0.9;
   q7=q7+0.8;
   w8=w8-0.3;
   q8=q8+0.5;
   w9=w9-0.8;
   q9=q9+0.9;
  
  }
  
  //amb la funció "if" faig que al clicar el botó esquerre del ratolí els braços es tanquin per atrapar les mosques.
  
    if(mousePressed)
  {
    //primer failg els braços a la pocició per atrapar la mosca 
    //braços posició 1 que els faig amb la funcó de poligon, realitzant el polígon com un "shape" amb els vertex com a coordenades
  
  fill(255,0,0);
  beginShape();
  vertex(330,420);
  //al posar les components com a combinació de mouseX i mouseY els braços seguiran el ratolí
  vertex(mouseX,mouseY);
  vertex(mouseX+10,mouseY);
  vertex(330,450);
  endShape();
  beginShape();
  vertex(270,420);
  vertex(mouseX,mouseY);
  vertex(mouseX-10,mouseY);
  vertex(270,450);
  endShape();
  
  //els dits ma 1 posició 1, que també seguiran la posició de les mans amb el ratolí
  fill(242,158,46);
  stroke(180,95,4);
  strokeWeight(1);
  ellipse(mouseX,mouseY-10,5,20);
  ellipse(mouseX+5,mouseY-10,5,20);
  ellipse(mouseX+10,mouseY-10,5,20);
  ellipse(mouseX+15,mouseY-10,5,20);
  // ma 1 posició 1
  ellipse(mouseX+5,mouseY,20,15);
  //els dits ma 2 posició 1
  fill(242,158,46);
  stroke(180,95,4);
  strokeWeight(1);
  ellipse(mouseX,mouseY-10,5,20);
  ellipse(mouseX-5,mouseY-10,5,20);
  ellipse(mouseX-10,mouseY-10,5,20);
  ellipse(mouseX-15,mouseY-10,5,20);
  // ma2 posició 1
  ellipse(mouseX-5,mouseY,20,20);
  noCursor();
  }
  else
  { //ara faig la posició que tindran els braços despres de clicar el botó esquerre, es a dir la posició en la qual estaran mentre no es cliqui el ratolí, simplement seguiran el ratolí,
  //per caçar les mosques
  //braços posició 2
  //els realitzo igual que abans pero ara amb la posició que tindran mentres no es cliqui res del ratolí
  
  fill(255,0,0);
  beginShape();
  vertex(330,420);
  vertex(mouseX+30,mouseY+20);
  vertex(mouseX+40,mouseY+20);
  vertex(330,450);
  endShape();
  beginShape();
  vertex(270,420);
  vertex(mouseX-30,mouseY+20);
  vertex(mouseX-40,mouseY+20);
  vertex(270,450);
  endShape();
  //els dits ma 1 posició 2
  fill(242,158,46);
  stroke(180,95,4);
  strokeWeight(1);
  ellipse(mouseX+25,mouseY+15,20,5);
  ellipse(mouseX+30,mouseY+10,5,20);
  ellipse(mouseX+35,mouseY+10,5,20);
  ellipse(mouseX+40,mouseY+10,5,20);
  ellipse(mouseX+45,mouseY+10,5,20);
  // ma 1 posició2
  ellipse(mouseX+35,mouseY+20,20,15);
  //els dits ma 2 posició2
  fill(242,158,46);
  stroke(180,95,4);
  strokeWeight(1);
  ellipse(mouseX-25,mouseY+15,20,5);
  ellipse(mouseX-30,mouseY+10,5,20);
  ellipse(mouseX-35,mouseY+10,5,20);
  ellipse(mouseX-40,mouseY+10,5,20);
  ellipse(mouseX-45,mouseY+10,5,20);
  // ma2 posició2
  ellipse(mouseX-35,mouseY+20,20,20);
  noCursor();
         
 }

  }


