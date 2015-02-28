
float x;
float y;
float v = random(3,5);
float vy = random(3,5);
int midax=400;
int miday=300;


void setup(){
  size (800,800);
  x =  (width/2);
  y = (height/2);
}
 
 
void draw(){
  //canvia color fons segons Y mouse
  background(100-mouseY/10, 255-mouseY/10, 9-mouseY/10);

 dibuix();
 dibuix_ulls();
 condicionals();
}
  

void condicionals(){
 x = x+v;
 y = y+vy;
 
   if (x+midax/2> width||x-midax/2 < 0) {
    v=-v;
  }
   if (y+miday-50> height||y-miday < 0) {
    vy=-vy;
  }
   if (x < width/3) { //canvia color d'ulls segons posició X figura
    dibuix_ulls_blaus();
    dibuix_ulls_negres();
   }
   else if (x < (width/3)*2) { 
      dibuix_ulls_turquesa();
      dibuix_ulls_negres();
   }
   else { 
    dibuix_ulls_verd();
    dibuix_ulls_negres();
   }
   if (mousePressed){ //quan apretem cursor, piula
    piulada();
   }
}
 
void piulada(){
  if (mousePressed == true) { //clic mouse, color del fons piulada canvia random
  fill(random(255), random(255), random(255));
  ellipse (mouseX, mouseY,150,100);
  
PFont font;
font=loadFont("BrowalliaNew-48.vlw");
textFont(font);
 
stroke(255);
fill(255);
textSize(25);
text("PIU!", mouseX-30, mouseY);
text("PIU!", mouseX-30, mouseY+30);
  }
}

 
void mousePressed() { //canvia velocitat quan apretem cursor
  v = random(-5, 5);
  vy = random(-5, 5);
}


void dibuix(){
   //cap
stroke(0);
strokeWeight(3);
fill(250,255,0);
triangle(x-182,y-60,x-100,y+120,x-60,y-50);
 
strokeWeight(3);
fill(250,255,0);
triangle(x+182,y-60,x+100,y+120,x+60,y-50);
 
beginShape();
vertex(x-60, y-50);
vertex(x+60, y-50);
vertex(x+100, y+120);
vertex(x-100, y+120);
endShape(CLOSE);
 
strokeWeight(3);
fill(250,255,0);
ellipse(x,y-120,midax,miday);
 
//tapar
fill(250,255,0);
noStroke();
beginShape();
vertex(x-175,y-50);
vertex(x+176, y-50);
vertex(x+99, y+122);
vertex(x-97, y+122);
endShape(CLOSE);
 

 
//galtes
pushMatrix();
translate(x-78,y+140);
stroke(0);
strokeWeight(3);
fill(250,255,0);
rotate(radians(-10));
ellipse(0,0,120,70);
popMatrix();
 
 
pushMatrix();
translate(x+93,y+140);
fill(250,255,0);
rotate(radians(10));
ellipse(0,0,120,70);
popMatrix();
 
//tapargaltes
noStroke();
rect(x-100,y+98,204,65);
 
//boca
stroke(0);
strokeWeight(2);
stroke(0);
fill(255,205,0);
ellipse(x+5,y+120,60,20);
 
fill(255,205,0);
ellipse(x+5,y+120,80,40);
 
noStroke();
fill(250,255,0);
rect(x-50,y+120,100,30);
 
stroke(0);
fill(255,205,0);
ellipse(x+5,y+120,60,20);
 
stroke(0);
line(x-35,y+120,x+45,y+120);
 
noStroke();
fill(255,205,0);
rect(x-25,y+109,61,10);
 
//seies
noFill();
stroke(0);
curve(x-75,y-50,x-125,y-120,x-80,y-150,x+150,y-50);
 
noFill();
stroke(0);
curve(x+50,y-50,x+125,y-120,x+80,y-150,x-150,y-50);
 
 
//cabell
noFill();
stroke(0);
curve(x,y,x,y-230,x-25,y-285,x,y-150);
 
noFill();
stroke(0);
curve(x,y-200,x+15,y-260,x,y-285,x+10,y-150);
 
 
//cos
noStroke();
fill(250,255,0);
rect(x-27,y+160,70,100);
 
stroke(0);
strokeWeight(3);
noFill();
ellipse(x-35,y+210,20,100);
 
stroke(0);
strokeWeight(3);
noFill();
ellipse(x+50,y+210,20,100);
 
noStroke();
fill(100-mouseY/10, 255-mouseY/10, 9-mouseY/10);
rect(x-47,y+168,10,100);
 
noStroke();
fill(100-mouseY/10, 255-mouseY/10, 9-mouseY/10);
rect(x+52,y+168,10,100);
rect(x-50,y+256,140,50);
}
 
 void dibuix_ulls(){
 //ulls
pushMatrix();
translate(x-75,y);
rotate(-0.2);
stroke(0);
strokeWeight(2);
fill(255);
ellipse(0,0,60,170);
popMatrix();
 
pushMatrix();
translate(x+75,y);
rotate(0.2);
stroke(0);
strokeWeight(2);
fill(255);
ellipse(0,0,60,170);
popMatrix();
}


void dibuix_ulls_negres(){

pushMatrix();
translate(x-63,y+60);
rotate(-0.2);
strokeWeight(2);
fill(0);
ellipse(0,0,25,50);
popMatrix();

pushMatrix();
translate(x+63,y+60);
fill(0);
strokeWeight(2);
rotate(0.2);
ellipse(0,0,25,50);
popMatrix();
}


void dibuix_ulls_blaus(){
pushMatrix();
translate(x+67,y+39);
strokeWeight(2);
rotate(0.2);
fill(0,159,255);
ellipse(0,0,50,90);
popMatrix();

pushMatrix();
translate(x-67,y+39);
rotate(-0.2);
strokeWeight(2);
fill(0,159,255);
ellipse(0,0,50,90);
popMatrix();
}



void dibuix_ulls_turquesa(){
pushMatrix();
translate(x+67,y+39);
strokeWeight(2);
rotate(0.2);
fill(3,255,211);
ellipse(0,0,50,90);
popMatrix();

pushMatrix();
translate(x-67,y+39);
rotate(-0.2);
strokeWeight(2);
fill(3,255,211);
ellipse(0,0,50,90);
popMatrix();
}


void dibuix_ulls_verd(){
pushMatrix();
translate(x+67,y+39);
strokeWeight(2);
rotate(0.2);
fill(119,255,3);
ellipse(0,0,50,90);
popMatrix();

pushMatrix();
translate(x-67,y+39);
rotate(-0.2);
strokeWeight(2);
fill(119,255,3);
ellipse(0,0,50,90);
popMatrix();
}




