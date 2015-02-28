
void setup(){
size(600, 600);
background(0);
noStroke();
}

int x=300;
int y=300;
int x1=400;
int x2=200;
int y2=200;
int x3 = 200;
int y3 = 400;
int x4 = 400;
int y4 = 400;

void draw(){
//para que titilen los colores
float m = millis()*x;
//fondo que da efecto de barrido 
fill(0, 25);
rect(0, 0, width, height);
//-------------------------------------------------  
//linea verde
strokeWeight(10);
  stroke(m % 255, 255, 0);
  line(width/2, height/2, x++, y--);
//esfera verde 
noStroke();
fill(m % 255, 255, 0);
ellipse(x++, y--, 50, 50);
//------------------------------------------------- 
if(y <= 200){
//linea cian
strokeWeight(10);
 stroke(0, m % 255, 255);
 line(400, 200, x1--, 200);
//esfera cian 
noStroke();
fill(0, m % 255, 255);
ellipse(x1--, 200, 50, 50);
//esfera verde 
noStroke();
fill(m % 255, 255, 0);
ellipse(400, 200, 50, 50); 
};
//-------------------------------------------------   
if(x1 <= 200){
//linea magenta
strokeWeight(10);
 stroke(255, 0, m % 255);
 line(200, 200, x2, y2++);
//esfera magenta 
noStroke();
fill(255, 0, m % 255);
ellipse(x2, y2++, 50, 50);
//esfera cian 
noStroke();
fill(0, m % 255, 255);
ellipse(200, 200, 50, 50); 
};
//-------------------------------------------------    
if(y2 >= 400){
//linea naranja
strokeWeight(10);
 stroke(255, m % 255, 0);
 line(200, 400, x3++, y3);
//esfera naranja
noStroke();
fill(255, m % 255, 0);
ellipse(x3++, y3, 50, 50);
//esfera magenta 
noStroke();
fill(255, 0, m % 255);
ellipse(200, 400, 50, 50); 
};
//------------------------------------------------- 
if(x3 >= 400){
//linea violeta
strokeWeight(10);
 stroke(m % 255, 0, 255);
 line(400, 400, x4++, y4--);
//esfera violeta
noStroke();
fill(m % 255, 0, 255);
ellipse(x4++, y4--, 50, 50);
//esfera naranja 
noStroke();
fill(255, m % 255, 0);
ellipse(400, 400, 50, 50); 
};
//-------------------------------------------------	
if(y4 <= 200){
//esfera violeta
noStroke();
fill(m % 255, 0, 255);
ellipse(600, 200, 50, 50); 
};
//-------------------------------------------------
noStroke();
fill(m % 255);
ellipse(width/2, height/2, 50, 50);
}

//-------------------------------------------------
//-------------------------------------------------
//-------------------------------------------------
void mouseClicked() {
  //click en esfera blanca 
  if(mouseX >= 275 && mouseX <= 325 && mouseY >= 275 && mouseY <= 325) {
    fill(255);
    ellipse(300, 300, 150, 150);
  };
  //click en esfera verde 
  if(mouseX >= 375 && mouseX <= 425 && mouseY >= 175 && mouseY <= 225) {
     fill(255, 0, 255);
       ellipse(400, 200, 150, 150); 
  };
  //click en esfera cian 
  if(mouseX >= 175 && mouseX <= 225 && mouseY >= 175 && mouseY <= 225) {  
  fill(255, 0, 0);
ellipse(200, 200, 150, 150);
  };
    //click en esfera magenta 
  if(mouseX >= 175 && mouseX <= 225 && mouseY >= 375 && mouseY <= 425) {  
fill(0, 255, 0);
ellipse(200, 400, 150, 150); 
  };
    //click en esfera naranja 
  if(mouseX >= 375 && mouseX <= 425 && mouseY >= 375 && mouseY <= 425) {  
fill(0, 0, 255);
ellipse(400, 400, 150, 150); 
  };
    //click en esfera violeta 
  if(mouseX >= 575 && mouseX <= 625 && mouseY >= 175 && mouseY <= 225) {  
fill(255, 255, 0);
ellipse(600, 200, 150, 150); 
  };
}

