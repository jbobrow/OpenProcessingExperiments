
float x;
float y;
float v=2;
float vy=1;
float ix=180;
float iy=265;
float amplada=150;
float altura_d=400;
float altura_b=250;
float color1= random (255);
float color2= random (255);
float color3= random (255);
float mida1=55;
float mida2=30;




void setup(){
  size(1000,1000);
  x = random(width);
  y=random(height);
}


void draw(){
  background(255);
  textSize(50);
  fill(0);
  text("Mickey Mouse", width-400,height-900);
  x=x+v;
  y=y+vy;
  
  limits();
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
  limitsnas();
  
  
}


void limits(){
  if (x+amplada >width){
    v=-v;
    x = width-amplada;
  }
  if(x-amplada<0){
        v=-v;
    x = amplada;
  }
  
  if (y+altura_d > height){
    vy=-vy;
    y=height-altura_d;
  }
  
  if (y-altura_b <0){
    vy=-vy;
    y=altura_b;
  }
  
}

void limitsnas(){
  if (x>width/2){
    mida1=mida1-0.09;
    
  }
  else{
    mida1=mida1+0.09;
  }
 
  
}
  
  
void mousePressed(){
  background(0);
  x=mouseX;
  y=mouseY;
 
  v=random(-5,2);
  vy=random(-5,2);
  
  color1=random (255);
  color2= random (255);
  color3= random (255);
  
}


void cararodona(){
  fill(0);
  ellipse(x,y-35,250,250);
}

void urelles(){
  ellipse(x-100,y-185,130,130); 
  ellipse(x+100,y-185,130,130);
}
  
void brasos(){
  beginShape();
  vertex(x+45,y+85);
  vertex(x+60,y+85);
  vertex(x+107,y+185);
  vertex(x+50,y+265);
  vertex(x+25,y+265);
  vertex(x+87,y+185);
  endShape(CLOSE); 
  
  beginShape();
  vertex(x-35,y+85);
  vertex(x-60,y+85);
  vertex(x-107,y+185);
  vertex(x-50,y+265);
  vertex(x-25,y+265);
  vertex(x-87,y+185);
  endShape(CLOSE);
}



void cua(){
  noFill();
  strokeWeight(3);
  bezier(x,y+165,x-100,y+315,x-140,y+235,x-ix,y+iy);
   
  
}


void cuerpo(){
  fill(color1,color2,color3);
  noStroke();
  quad(x-85,y+185,x-85,y+215,x+85,y+215,x+85,y+185);
  strokeWeight(3);
  quad(x-70,y+215,x-10,y+215,x-10,y+310,x-70,y+310);
  quad(x+70,y+215,x+10,y+215,x+10,y+310,x+70,y+310);
  arc(x,y+215,170,170,0,PI,OPEN);
  fill(0);
  quad(x-45,y+65,x+45,y+65,x+70,y+185,x-70,y+185);
}


void botons(){
  fill(255);
  stroke(0);
  strokeWeight(2);
  ellipse(x-40,y+225,30,50);
  ellipse(x+40,y+225,30,50);
}


void potes(){
  fill(0);
  quad(x-50,y+310,x-30,y+310,x-30,y+375,x-50,y+375);
  quad(x+50,y+310,x+30,y+310,x+30,y+375,x+50,y+375);
}


void peus(){
  noStroke();
  fill(255,217,0);
  arc(x-40,y+380,60,60,PI,TWO_PI,OPEN);
  arc(x+40,y+380,60,60,PI,TWO_PI,OPEN);
  quad(x-70,y+380,x-10,y+380,x-10,y+390,x-70,y+390);
  quad(x+70,y+380,x+10,y+380,x+10,y+390,x+70,y+390);
}



void blanculls(){
  noStroke();
  fill(255);
  ellipse(x-30,y-65,75,150);
  ellipse(x+30,y-65,75,150);
}
  

void blancboca(){
  noStroke();
  fill(0);
  ellipse(x,y+35,240,120);
  fill(255);
  ellipse(x,y+35,230,110);
}
  
  
void nas(){
  fill(255-mouseY/3,0,0);
  ellipse(x,y,mida1,mida2);
  stroke(0);
  strokeWeight(3);
  noFill();
  arc(x,y+13,100,70,PI+QUARTER_PI,TWO_PI-QUARTER_PI);
}

void ulls(){
  noStroke();
  fill(0);
  ellipse(x-15,y-65,20,90);
  ellipse(x+15,y-65,20,90);
  fill(255);
  ellipse(x-10,y-85,5,10);
  ellipse(x+20,y-85,5,10);
  
}

void boca(){
  noFill();
  stroke(0);
  arc(x,y-15,250,120,QUARTER_PI,HALF_PI+QUARTER_PI);
  bezier(x-50,y+40,x-20,y+90,x+20,y+90,x+50,y+40);
  strokeWeight(1);
  bezier(x-20,y+80,x-5,y+87,x+5,y+87,x+20,y+80);
}


