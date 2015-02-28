

int a;
int b;

void setup(){
  size (700,700);
  a=width;
  b=height;
}

void draw (){
  background (255,255,255);
  
             
  noStroke();
  fill(52,49,54,230); //CAMES
  rectMode(CENTER);
  rect(mouseX-1.5*a/30,mouseY+9.5*b/30,2.5*a/30,6*b/30);
  rect(mouseX+1.5*a/30,mouseY+9.5*b/30,2.5*a/30,6*b/30);
  
  fill(43,32,38,230); //RATLLES NEGRES
  rectMode(CENTER);
  rect(mouseX,mouseY-1.5*b/30,6*a/30, 1.5*b/30);
  rect(mouseX,mouseY+1.5*b/30,6*a/30,1.5*b/30);
  rect(mouseX,mouseY+4.5*b/30,6*a/30,1.5*b/30);

  fill(200,47,64,230); //RATLLES VERMELLES
  rect(mouseX,mouseY,6*a/30,1.5*b/30);
  rect(mouseX,mouseY+3*b/30,6*a/30,1.5*b/30);
  rect(mouseX,mouseY+6*b/30,6*a/30,1.5*b/30);

  fill(222,168,121,200); //CAP I MANS
  triangle(mouseX,mouseY-0.5*b/30,mouseX-3*a/30,mouseY-6.5*b/30,mouseX+3*a/30,mouseY-6.5*b/30); //CAP
  triangle(mouseX-2.5*a/30, mouseY+4.5*b/30,mouseX-2.5*a/30, mouseY+7.5*b/30, mouseX-5*a/30,mouseY+6*b/30);
  triangle(mouseX+2.5*a/30, mouseY+4.5*b/30,mouseX+2.5*a/30, mouseY+7.5*b/30, mouseX+5*a/30,mouseY+6*b/30);

  fill(52,49,54,230); //BARRET
  triangle(mouseX-5*a/30,mouseY-6.5*b/30,mouseX+5*a/30,mouseY-6.5*b/30,mouseX+5*a/30,mouseY-9.5*b/30); 
  triangle(mouseX-3*a/30,mouseY-6.5*b/30,mouseX+a/30,mouseY-6.5*b/30,mouseX-a/30,mouseY-11.5*a/30);
  triangle(mouseX-1.5*a/30,mouseY-6.5*b/30,mouseX+3.5*a/30,mouseY-6.5*b/30,mouseX+a/30,mouseY-13.5*a/30);
}


