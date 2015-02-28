
void setup(){
size(200,200);
}

void draw()
{
background(255);
smooth();
noFill();
strokeWeight(3);
stroke(0,0,255);
ellipse(30,30,30,30);//azul

stroke(227,233,10);
ellipse(45,55,30,30);//amarillo

stroke(0,0,0);
ellipse(60,30,30,30);//negro

stroke(55,240,2);
ellipse(75,55,30,30);//verde

stroke(192,1,30);
ellipse(mouseX, mouseY,30,30);//rojo
}

