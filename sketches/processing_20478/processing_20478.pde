
void setup (){

size(400, 400);

smooth();
}


void draw(){
 background(255);  
 //dance floor
  fill(mouseX, 0, mouseY);
 rect(0,279,120,120);
  fill(mouseX, mouseX, mouseX);
 rect(140, 279, 120, 120);
 fill(mouseY, mouseY, mouseY);
 rect(0,0,120,120);
 fill(0, mouseX, mouseY);
 rect(140, 0, 120,120);
  fill(0, mouseY, mouseX);
 rect(0, 140, 120,120);
  fill(mouseX, mouseY, 0);
 rect(140,140,120,120);
  fill(mouseY, mouseX, 0);
 rect(279,140,120,120);
 fill(mouseY, 0, mouseY);
 rect(279,0,120,120);
 fill(mouseX, 0, mouseX);
 rect(279,279,120,120);
//cuerpo
stroke(0,140,100);
fill(0,140,200);
rect(mouseX-25, mouseY-100, 50, 150);

//cabeza
noStroke();
fill(250, 0, 150);
ellipse(mouseX,mouseY-100, 100, 100);

//ojos
stroke(0);
fill(0);
ellipse(mouseX-30, mouseY-100, 20, 50);
ellipse(mouseX+30,mouseY-100, 20, 50);

//patillas
line(mouseX-25, mouseY+50, pmouseX-25, pmouseY+70);
line(mouseX+25, mouseY+50, pmouseX+25, pmouseY+70);
//centro
stroke (255);
point(200,200);

}






