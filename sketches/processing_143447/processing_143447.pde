
void setup(){
size(400,400);
}


void draw(){
 
background(255);  


//pies
fill(237,197,50);
strokeWeight(2);
stroke(250,150,0);
ellipse(mouseX-90,mouseY+150,width*0.4,height*0.2);
ellipse(mouseX+90,mouseY+150,width*0.4,height*0.2);



//cuerpo
stroke(0,0,0);
fill(0);
ellipse(mouseX,mouseY,width*0.75,height*0.75);



//ojos blanco
strokeWeight(0);
stroke(0,0,0);
fill(255,255,255);
ellipse(mouseX-45,mouseY-90,width*0.2,height*0.2);
ellipse(mouseX+45,mouseY-90,width*0.2,height*0.2);



//barriga
ellipse(mouseX,mouseY+55,width*0.6,height*0.45);



//ojos negro
fill(0,0,0);
ellipse(mouseX-40,mouseY-80,width*0.1,height*0.1);
ellipse(mouseX+40,mouseY-80,width*0.1,height*0.1);



//pico
fill(237,197,50);
strokeWeight(2);
stroke(250,150,0);
triangle(mouseX+30,mouseY-45,mouseX,mouseY+10,mouseX-30,mouseY-45);

}

