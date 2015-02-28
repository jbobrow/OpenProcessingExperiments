
//Informatica 2013/2014 - S2B_Dibuix Personatge Kerobero - Laura Freixas Conde//

 
void setup(){ // elements fixos
  size(1000,1000); //width es 800 i height es 800
  background(255); //color de fons
}


void draw(){
//definició valor fons
noCursor();
float x = mouseX-width/2; // asigno la coordenada x al cursor
float y = mouseY-height/2; // asigno la coordenada y al cursor
background(220);

//formes calideoscopiques
  stroke(0);
  strokeWeight(width/1000);
  fill(mouseY,mouseY,mouseX,mouseX);

  line(width/3,height/3,width/3*2,height/3*2);
  line(width/3*2,height/3,width/3,height/3*2);
  
  ellipse(width/2,height/4,mouseX+5,mouseX+5);
  ellipse(width/4,height/4*2,mouseX+5,mouseX+5);
  ellipse(width/4*3,height/4*2,mouseX+5,mouseX+5);
  ellipse(width/2,height/4*3,mouseX+5,mouseX+5);
  
  ellipse(width/2,height/2,mouseX-50,mouseX-50);
  ellipse(width/3,height/3,mouseX+10,mouseX+10);
  ellipse(width/3*2,height/3,mouseX+10,mouseX+10);
  ellipse(width/3,height/3*2,mouseX+10,mouseX+10);
  ellipse(width/3*2,height/3*2,mouseX+10,mouseX+10);
  
  
  ellipse(width/2,height/2,width/2,height/2);
  noFill();
  ellipse(width/2,height/2,mouseX+100,mouseX+100);
  

//orella esquerra
stroke(0);
strokeWeight(width/500);
fill(251,199,1);
ellipse(mouseX-140,mouseY,width/4.4,height/4);

//orella interior esquerra
fill(251,253,128);
ellipse(mouseX-150,mouseY,width/6.1,height/5.3);

//orella dreta
fill(251,199,1);
ellipse(mouseX+140,mouseY,width/4.4,height/4);

//orella interior dreta
fill(251,253,128);
ellipse(mouseX+150,mouseY,width/6.1,height/5.3);

//cara
fill(251,199,1);
ellipse(mouseX,mouseY,width/2.8,height/3);

//boca 
fill(255,113,128);
ellipse(mouseX,mouseY+10,width/66.6,height/17.7);
noStroke();
fill(251,199,1);
rect(mouseX,mouseY+17,width/66.6,-height/17.7);
rect(mouseX,mouseY+17,-width/66.6,-height/17.7);

//ull esquerre
stroke(0);
strokeWeight(width/500);
fill(251,199,1);
ellipse(mouseX-120,mouseY,width/57.1,height/114.2);
noStroke();
rect(mouseX-130,mouseY,width/40,height/114.2);

//ull dret
stroke(0);
strokeWeight(width/500);
fill(251,199,1);
ellipse(mouseX+120,mouseY,width/57.1,height/114.2);
noStroke();
rect(mouseX+110,mouseY,width/40,height/114.2);

//nas
stroke(0);
strokeWeight(width/500);
fill(0);
triangle(mouseX-3,mouseY+5,mouseX+3,mouseY+5,mouseX,mouseY+7);

//llavi esquerre
noFill();
ellipse(mouseX+4,mouseY+15,width/100,height/160);
fill(251,199,1);
noStroke();
rect(mouseX,mouseY+15,width/40,-height/177.7);

//llavi dret
stroke(0);
strokeWeight(width/500);
noFill();
ellipse(mouseX-4,mouseY+15,width/100,height/160);
fill(251,199,1);
noStroke();
rect(mouseX,mouseY+15,-width/40,-height/177.7);

//galta esquerra
stroke(0);
strokeWeight(width/500);
fill(194+mouseY,28+mouseX/2,42);
ellipse(mouseX-120,mouseY+25,width/32,height/80);

//galta dreta
ellipse(mouseX+120,mouseY+25,width/32,height/80);

}




