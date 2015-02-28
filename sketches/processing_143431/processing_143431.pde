

void setup(){
size(500,500);
background(51);
}


void draw(){
background(51);
noStroke();

fill(183,39,39);
rect(mouseX-90,mouseY-70,10,160);//bras dret
rect(mouseX+80,mouseY-70,10,160);//bras esquerre 
rect(mouseX-50,mouseY-190,100,100);//Cap
rect(mouseX-70,mouseY-80,140,180);//cuerpo principal

rect(mouseX-65,mouseY+100,45,80);//fut
rect(mouseX+20,mouseY+100,45,80);//fut

fill(10,10,10);
stroke(255,252,252);
strokeWeight(3);
ellipse(mouseX-25,mouseY-160,30,30);//ull dret
ellipse(mouseX+25,mouseY-160,30,30);//ull esq

rect(mouseX-30,mouseY-120,60,20);//boca
triangle(mouseX,mouseY-145,mouseX-5,mouseY-130,mouseX+5,mouseY-130);//nas


fill(255,252,252);
rect(mouseX-50,mouseY-60,100,100);//quadro blanc
stroke(10,10,10);
line(mouseX,mouseY-30,mouseX,mouseY+20);
}

