
float ix=180;
float iy=265;


void setup(){
  size(700,900);
}

void draw(){
  background(255);
  cararodona();
  urelles();
  brasos();
  cua();
  cuerpo();
  botons();
  potes();
  peus();
  blancboca();
  blanculls();
  nas();
  ulls();
  boca();
  
}

void cararodona(){
  fill(0);
  ellipse(mouseX,mouseY-35,250,250);
}

void urelles(){
  ellipse(mouseX-100,mouseY-185,130,130); 
  ellipse(mouseX+100,mouseY-185,130,130);
}
  
void brasos(){
  beginShape();
  vertex(mouseX+45,mouseY+85);
  vertex(mouseX+60,mouseY+85);
  vertex(mouseX+107,mouseY+185);
  vertex(mouseX+50,mouseY+265);
  vertex(mouseX+25,mouseY+265);
  vertex(mouseX+87,mouseY+185);
  endShape(CLOSE); 
  
  beginShape();
  vertex(mouseX-35,mouseY+85);
  vertex(mouseX-60,mouseY+85);
  vertex(mouseX-107,mouseY+185);
  vertex(mouseX-50,mouseY+265);
  vertex(mouseX-25,mouseY+265);
  vertex(mouseX-87,mouseY+185);
  endShape(CLOSE);
}

void cua(){
  noFill();
  strokeWeight(3);
  bezier(mouseX,mouseY+165,mouseX-100,mouseY+315,mouseX-140,mouseY+235,mouseX-ix,mouseY+iy);
  
  
  
}


void cuerpo(){
  fill(255,0,0);
  noStroke();
  quad(mouseX-85,mouseY+185,mouseX-85,mouseY+215,mouseX+85,mouseY+215,mouseX+85,mouseY+185);
  strokeWeight(3);
  quad(mouseX-70,mouseY+215,mouseX-10,mouseY+215,mouseX-10,mouseY+310,mouseX-70,mouseY+310);
  quad(mouseX+70,mouseY+215,mouseX+10,mouseY+215,mouseX+10,mouseY+310,mouseX+70,mouseY+310);
  arc(mouseX,mouseY+215,170,170,0,PI,OPEN);
  fill(0);
  quad(mouseX-45,mouseY+65,mouseX+45,mouseY+65,mouseX+70,mouseY+185,mouseX-70,mouseY+185);
}


void botons(){
  fill(255);
  stroke(0);
  strokeWeight(2);
  ellipse(mouseX-40,mouseY+225,30,50);
  ellipse(mouseX+40,mouseY+225,30,50);
}


void potes(){
  fill(0);
  quad(mouseX-50,mouseY+310,mouseX-30,mouseY+310,mouseX-30,mouseY+375,mouseX-50,mouseY+375);
  quad(mouseX+50,mouseY+310,mouseX+30,mouseY+310,mouseX+30,mouseY+375,mouseX+50,mouseY+375);
}


void peus(){
  noStroke();
  fill(255,217,0);
  arc(mouseX-40,mouseY+380,60,60,PI,TWO_PI,OPEN);
  arc(mouseX+40,mouseY+380,60,60,PI,TWO_PI,OPEN);
  quad(mouseX-70,mouseY+380,mouseX-10,mouseY+380,mouseX-10,mouseY+390,mouseX-70,mouseY+390);
  quad(mouseX+70,mouseY+380,mouseX+10,mouseY+380,mouseX+10,mouseY+390,mouseX+70,mouseY+390);
}


void blanculls(){
  noStroke();
  fill(255);
  ellipse(mouseX-30,mouseY-65,75,150);
  ellipse(mouseX+30,mouseY-65,75,150);
}
  

void blancboca(){
  noStroke();
  fill(0);
  ellipse(mouseX,mouseY+35,240,120);
  fill(255);
  ellipse(mouseX,mouseY+35,230,110);
}
  
  
void nas(){
  fill(0);
  ellipse(mouseX,mouseY,55,30);
  stroke(0);
  strokeWeight(3);
  noFill();
  arc(mouseX,mouseY+13,100,70,PI+QUARTER_PI,TWO_PI-QUARTER_PI);
}

void ulls(){
  noStroke();
  fill(0);
  ellipse(mouseX-15,mouseY-65,20,90);
  ellipse(mouseX+15,mouseY-65,20,90);
  fill(255);
  ellipse(mouseX-10,mouseY-85,5,10);
  ellipse(mouseX+20,mouseY-85,5,10);
  
}

void boca(){
  noFill();
  stroke(0);
  arc(mouseX,mouseY-15,250,120,QUARTER_PI,HALF_PI+QUARTER_PI);
  bezier(mouseX-50,mouseY+40,mouseX-20,mouseY+90,mouseX+20,mouseY+90,mouseX+50,mouseY+40);
  strokeWeight(1);
  bezier(mouseX-20,mouseY+80,mouseX-5,mouseY+87,mouseX+5,mouseY+87,mouseX+20,mouseY+80);
}


