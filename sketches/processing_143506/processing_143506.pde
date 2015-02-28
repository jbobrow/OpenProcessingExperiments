
//Josep Rimbau. Grup 3. Informatica-practica 2
int posx, posy;

void setup(){
  size(600,600);
}

void draw(){
  background(250,250,250);
  fill(245,207,15);
  //orellas
strokeWeight(1);
stroke(0,0,0);
  ellipse(mouseX+width/6,mouseY+width/60,width/12,height/10);
  ellipse(mouseX-width/6,mouseY+width/60,width/12,height/10);
    //ORELLASINTERIOR
    
 strokeWeight(2);
  ellipse(mouseX-width/6,mouseY+width/60,width/24,height/20);
  ellipse(mouseX+width/6,mouseY+width/60,width/24,height/20);
 
  //CABELLS
  fill(250,250,250);
  stroke(110,110,110);
  ellipse(mouseX,mouseY-height/4,width/8,height/10);
  ellipse(mouseX,mouseY-height/4,width/12,height/14);
  strokeWeight(1);
  
  //CARA
  stroke(0,0,0);
  fill(245,207,15);
  rectMode(CENTER);
  rect(mouseX,mouseY,width/3,height/2,width/2);
  //NAS
  ellipse(mouseX,mouseY,width/25,height/25);
  //ULLS
  fill(250,250,250);
  ellipse(mouseX+width/15,mouseY-width/12,width/8,height/8);
  ellipse(mouseX-width/15,mouseY-width/12,width/8,height/8);
  fill(0,0,0);
  ellipse(mouseX+width/15,mouseY-width/12,width/30,height/30);
  ellipse(mouseX-width/15,mouseY-width/12,width/30,height/30);
  fill(250,250,250);
  ellipse(mouseX+width/13.5,mouseY-width/12,width/80,height/80);
  ellipse(mouseX-width/17,mouseY-width/12,width/80,height/80);
  //BOCA
  fill(180,120,40);
  ellipse(mouseX,mouseY+width/7.5,width/4,height/5);
   fill(0,0,0);
  ellipse(mouseX,mouseY+width/7.5,width/16,height/16);
strokeWeight(2);
stroke(110,110,110);
 //cabells lateral esquerra
 line(mouseX-width/6,mouseY-width/10,mouseX-(width/60)*9,mouseY-width/30);
  line(mouseX-(width/60)*9,mouseY-width/30,mouseX-width/7.5,mouseY-width/10);
  line(mouseX-width/6,mouseY-width/10,mouseX-(width/60)*11,mouseY-width/30);
  line(mouseX-(width/60)*11,mouseY-width/10,mouseX-(width/60)*11,mouseY-width/30);
   //cabells lateral dreta
  line(mouseX+width/6,mouseY-width/10,mouseX+(width/60)*9,mouseY-width/30);
  line(mouseX+(width/60)*9,mouseY-width/30,mouseX+width/7.5,mouseY-width/10);
  line(mouseX+width/6,mouseY-width/10,mouseX+(width/60)*11,mouseY-width/30);
  line(mouseX+(width/60)*11,mouseY-width/10,mouseX+(width/60)*11,mouseY-width/30);
  
 
  noCursor();
}


