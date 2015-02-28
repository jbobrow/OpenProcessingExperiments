
//fill, stroke, strokeWeight, line i o bé rect o bé ellipse
//el dibuix es mou amb el ratolí

int a;
int b;
void setup(){
size(400,400); background(255);
a=width/2;
b=height/2;
}

void draw(){
background(255); 
stroke(0); strokeWeight(4); fill(80,230,50); ellipse(mouseX,mouseY,width/1.1,height/1.75); //cara
stroke(0); fill(255); ellipse(mouseX-width/5,mouseY-height/4, width/2.5, height/2.5);ellipse(mouseX+width/5,mouseY-height/4, width/2.5, height/2.5); // blanc dels ulls
stroke(0); fill(0); ellipse(mouseX-width/13, mouseY-height/4.5, width/8, height/8); ellipse(mouseX+width/13, mouseY-height/4.5, width/8, height/8); // nineta
stroke(0); strokeWeight(8); line(mouseX,mouseY+height/5,mouseX-width/5,mouseY+height/10); line(mouseX,mouseY+height/5,mouseX+width/5,mouseY+height/10); //boca
fill(255,196,225); strokeWeight(1); stroke(255,196,225); ellipse(mouseX-width/3.75,mouseY+height/15, width/8, height/8); ellipse(mouseX+width/3.75,mouseY+height/15, width/8, height/8); //cara
  noCursor();
 
}


