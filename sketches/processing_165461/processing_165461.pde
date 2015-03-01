
void setup (){
size(500,500);
smooth();
}

void draw () {
fill(0,20);
rect(0,0,width,height);
fill(255,255,255);

 text("("+mouseX+" , "+mouseY+")",mouseX-28,mouseY-40); //el text segueix el mouse
 
ellipseMode(CENTER);
//orelles grans
fill(#B45D00);
ellipse(mouseX+25,mouseY-20,20,20);
ellipse(mouseX-25,mouseY-20,20,20);
//orelles petites
fill(#FCC88F);
ellipse(mouseX+25,mouseY-15,10,10);
ellipse(mouseX-25,mouseY-15,10,10);
//cap
fill(#B45D00);
ellipse(mouseX,mouseY, 55,45);  
//morro
fill(255,255,255);
ellipse(mouseX,mouseY+10,25,15);
//nas
fill(0,0,0);
ellipse(mouseX, mouseY+7,5,5);
//ulls
ellipse(mouseX+10,mouseY-5,5,8);
ellipse(mouseX-10,mouseY-5,5,8);
//boca
noFill();
stroke(0);
arc(mouseX-5,mouseY+10,5,5, 0, radians(180));
arc(mouseX+5,mouseY+10,5,5, 0, radians(180));

  
}
