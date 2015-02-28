
float midax=400;
float miday=300;

int a= 15;
int b= 15;
int i;
int variacio;
int npiolin =5;

float c1=(255);
float c2=(255);
float c3=(255);


//matriu de posicions 
float [] posicioX = new float [npiolin]; //per la posicio en x
float [] posicioY = new float [npiolin]; //per la posicio en y
float [] velocitatX = new float [npiolin]; //velocitats X
float [] velocitatY = new float [npiolin]; //velocitats Y


void setup(){
  size (1000,1000);
  
    for (int i=0; i < npiolin; i++) { //definim les posicions i les velocitats
    posicioX[i]= (width/2);
    posicioY[i]= (height/2);
    velocitatX[i]= random(-a,b);
    velocitatY[i]= random(-a,b);
    }
}
 
 
void draw(){
 background(58-mouseY/10, 255-mouseY/10, 5-mouseY/10);  //canvia color fons segons Y mouse

//bucle
 for (i=0; i < npiolin; i++) {
   posicioX[i] += velocitatX[i] ;
   posicioY[i] += velocitatY[i];
   
//limits
     if ( posicioX[i]+midax/2 > width || posicioX[i]-midax/2 < 0) {
      velocitatX[i]= -velocitatX[i];
    }
    else {
      velocitatX[i]= random(-a,b);
    }
    if (posicioY[i]+miday-50 > height || posicioY[i]-miday < 0) {
      velocitatY[i] = -velocitatY[i];
    }
    else {
      velocitatY[i] = random (-a,b);
    }
    
    
//dibuix
  dibuix();
  dibuix_ulls();
  dibuix_ulls_canvicolor();
  dibuix_ulls_negres();
  condicionals();
     }
}


void mousePressed() { //canvia color ulls cada cop que apretem mouse
    c1=random(255);
    c2=random(255);
    c3=random(255);
}


void condicionals(){
   if (mousePressed){ //quan apretem cursor, piula
    piulada();
 }
}
 
void piulada(){
  if (mousePressed == true) { //clic mouse, color del fons piulada canvia random
  fill(random(255), random(255), random(255));
  ellipse (width/2, 100,150,100);
  
PFont font;
font=loadFont("ArialHebrew-48.vlw");
textFont(font);
 
stroke(255);
fill(255);
textSize(35);
text("PIU!", width/2-30, 100);
text("PIU!", width/2-30, 130);
  }
}


void dibuix (){
   //cap
stroke(0);
strokeWeight(3);
fill(250,255,0);
triangle( posicioX[i]-182, posicioY[i]-60, posicioX[i]-100, posicioY[i]+120, posicioX[i]-60, posicioY[i]-50);
 
strokeWeight(3);
fill(250,255,0);
triangle( posicioX[i]+182, posicioY[i]-60, posicioX[i]+100, posicioY[i]+120, posicioX[i]+60, posicioY[i]-50);
 
beginShape();
vertex( posicioX[i]-60,  posicioY[i]-50);
vertex( posicioX[i]+60,  posicioY[i]-50);
vertex( posicioX[i]+100,  posicioY[i]+120);
vertex( posicioX[i]-100,  posicioY[i]+120);
endShape(CLOSE);
 
strokeWeight(3);
fill(250,255,0);
ellipse( posicioX[i], posicioY[i]-120,midax,miday);
 
//tapar
fill(250,255,0);
noStroke();
beginShape();
vertex( posicioX[i]-175, posicioY[i]-50);
vertex( posicioX[i]+176,  posicioY[i]-50);
vertex( posicioX[i]+99,  posicioY[i]+122);
vertex( posicioX[i]-97,  posicioY[i]+122);
endShape(CLOSE);
 

 
//galtes
pushMatrix();
translate( posicioX[i]-78, posicioY[i]+140);
stroke(0);
strokeWeight(3);
fill(250,255,0);
rotate(radians(-10));
ellipse(0,0,120,70);
popMatrix();
 
 
pushMatrix();
translate( posicioX[i]+93, posicioY[i]+140);
fill(250,255,0);
rotate(radians(10));
ellipse(0,0,120,70);
popMatrix();
 
//tapargaltes
noStroke();
rect( posicioX[i]-100, posicioY[i]+98,204,65);
 
//boca
stroke(0);
strokeWeight(2);
stroke(0);
fill(255,205,0);
ellipse( posicioX[i]+5, posicioY[i]+120,60,20);
 
fill(255,205,0);
ellipse( posicioX[i]+5, posicioY[i]+120,80,40);
 
noStroke();
fill(250,255,0);
rect( posicioX[i]-50, posicioY[i]+120,100,30);
 
stroke(0);
fill(255,205,0);
ellipse( posicioX[i]+5, posicioY[i]+120,60,20);
 
stroke(0);
line( posicioX[i]-35, posicioY[i]+120,posicioX[i]+45, posicioY[i]+120);
 
noStroke();
fill(255,205,0);
rect( posicioX[i]-25, posicioY[i]+109,61,10);
 
//seies
noFill();
stroke(0);
curve( posicioX[i]-75, posicioY[i]-50, posicioX[i]-125, posicioY[i]-120, posicioX[i]-80, posicioY[i]-150, posicioX[i]+150, posicioY[i]-50);
 
noFill();
stroke(0);
curve( posicioX[i]+50, posicioY[i]-50, posicioX[i]+125, posicioY[i]-120, posicioX[i]+80, posicioY[i]-150, posicioX[i]-150, posicioY[i]-50);
 
 
//cabell
noFill();
stroke(0);
curve( posicioX[i], posicioY[i], posicioX[i], posicioY[i]-230, posicioX[i]-25, posicioY[i]-285, posicioX[i], posicioY[i]-150);
 
noFill();
stroke(0);
curve( posicioX[i], posicioY[i]-200, posicioX[i]+15, posicioY[i]-260, posicioX[i], posicioY[i]-285, posicioX[i]+10, posicioY[i]-150);
 
 
//coss
strokeWeight(3);
fill(250,255,0);
ellipse( posicioX[i], posicioY[i]+160,130,20);

noStroke();
fill(250,255,0);
rect( posicioX[i]-70, posicioY[i]+140,200,23);

//stroke(0);
//fill(250,255,0);
//rect( posicioX[i]-27, posicioY[i]+160,70,100);
 
//stroke(0);
//strokeWeight(3);
//noFill();
//ellipse( posicioX[i]-35, posicioY[i]+210,20,100);
 
//stroke(0);
//strokeWeight(3);
//noFill();
//ellipse( posicioX[i]+50, posicioY[i]+210,20,100);
 
//noStroke();
//fill(58-mouseY/10, 255-mouseY/10, 5-mouseY/10);
//rect( posicioX[i]-47, posicioY[i]+168,10,100);
 
//noStroke();
//fill(58-mouseY/10, 255-mouseY/10, 5-mouseY/10);
//rect( posicioX[i]+52, posicioY[i]+168,10,100);
//rect( posicioX[i]-50, posicioY[i]+256,140,50);
}
 
 void dibuix_ulls(){
 //ulls
pushMatrix();
translate( posicioX[i]-75, posicioY[i]);
rotate(-0.2);
stroke(0);
strokeWeight(2);
fill(255);
ellipse(0,0,60,170);
popMatrix();
 
pushMatrix();
translate( posicioX[i]+75, posicioY[i]);
rotate(0.2);
stroke(0);
strokeWeight(2);
fill(255);
ellipse(0,0,60,170);
popMatrix();


  }


void dibuix_ulls_negres(){

pushMatrix();
translate( posicioX[i]-63, posicioY[i]+60);
rotate(-0.2);
strokeWeight(2);
fill(0);
ellipse(0,0,25,50);
popMatrix();

pushMatrix();
translate( posicioX[i]+63, posicioY[i]+60);
fill(0);
strokeWeight(2);
rotate(0.2);
ellipse(0,0,25,50);
popMatrix();
}


void dibuix_ulls_canvicolor(){
pushMatrix();
translate( posicioX[i]+67, posicioY[i]+39);
strokeWeight(2);
rotate(0.2);
fill(c1,c2,c3);
ellipse(0,0,50,90);
popMatrix();

pushMatrix();
translate( posicioX[i]-67, posicioY[i]+39);
rotate(-0.2);
strokeWeight(2);
fill(c1,c2,c3);
ellipse(0,0,50,90);
popMatrix();
}




