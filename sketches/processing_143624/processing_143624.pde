

//Codi Paula. Chococat. Definició variables. 

int a;
int b;

void setup(){
  size(600,600);
  background(66,42,165);
  a=width/2;
  b=height/2;
  noCursor();
}

void draw(){
background(66,42,165);
  
//fons nit
stroke(255,217,80);
fill(255,217,80);
ellipse(width/2,height/2,400,400);
stroke(66,42,165);
fill(66,42,165);
ellipse(width/4,height/2,380,380);  
  
//orelles
stroke(0);
fill(0);
triangle(mouseX-30,mouseY-75,mouseX-60, mouseY-15,mouseX-90,mouseY-80);
triangle(mouseX+30,mouseY-75, mouseX+60,mouseY-15,mouseX+90,mouseY-80);
fill(255);
triangle(mouseX-20,mouseY-65,mouseX-50, mouseY-5,mouseX-80,mouseY-70);
triangle(mouseX+20,mouseY-65, mouseX+50,mouseY-5,mouseX+80,mouseY-70);

//bigots
stroke(0);
strokeWeight(5);
line(mouseX-150,mouseY+20,mouseX-60,mouseY+5);
line(mouseX+150,mouseY+20,mouseX+60,mouseY+5);
line(mouseX+150,mouseY-20,mouseX+60,mouseY-5);
line(mouseX-150,mouseY-20,mouseX-60,mouseY-5);


//cara 
stroke(0);
fill(0);
ellipse(mouseX,mouseY,180,160);

//ulls
stroke(255);
fill(255);

ellipse(mouseX+a/8,mouseY,50,50);
ellipse(mouseX-a/8,mouseY,50,50);

fill(0);
ellipse(mouseX+a/10,mouseY,28,28);
ellipse(mouseX-a/10,mouseY,28,28);

//nas
stroke(180,119,58);
fill(180,119,58);
ellipse(mouseX,mouseY+30,15,10);
}


