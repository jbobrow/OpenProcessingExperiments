
void setup(){

size(700,700);
}

void draw(){
  
background(29,219,242);

strokeWeight(2);
stroke(0,0,0);
fill(250,126,223);
//orelles porc
triangle(mouseX-100,mouseY-100,mouseX-170,mouseY+70,mouseX-180,mouseY-200);
triangle(mouseX+100,mouseY-100,mouseX+170,mouseY+70,mouseX+180,mouseY-200);

strokeWeight(2);
stroke(0,0,0);
fill(247,182,233);
// cap porc
ellipse(mouseX,mouseY,width*0.7,height*0.5);

strokeWeight(2);
stroke(0,0,0);
fill(247,162,229);
//nas
ellipse(mouseX,mouseY+100,width*0.4,height*0.2);

strokeWeight(2);
stroke(0,0,0);
fill(0,0,0);
//forats nas
ellipse(mouseX-60,mouseY+100,width*0.05,height*0.1);
ellipse(mouseX+60,mouseY+100,width*0.05,height*0.1);

strokeWeight(2);
stroke(0,0,0);
fill(255,255,255);
//Ulls
ellipse(mouseX-100,mouseY-55,width*0.09,height*0.15);
ellipse(mouseX+100,mouseY-55,width*0.09,height*0.15);

strokeWeight(2);
stroke(0,0,0);
fill(0,0,0);
//pupiles porc
ellipse(mouseX+100,mouseY-40,width*0.04,height*0.08);
ellipse(mouseX-100,mouseY-40,width*0.04,height*0.08);

noCursor();

}

