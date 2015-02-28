
void setup() {
size(1000,1000);
}

void draw() {
background(255);

stroke(41,124,123);
fill(41,124,123);
ellipse(-215+mouseX,-75+mouseY,50,120); //orelles1


stroke(41,124,123);
fill(41,124,123);
ellipse(217+mouseX,-75+mouseY,50,120); //orella 2

ellipse(mouseX,-125+mouseY,420,400);  //original
ellipse(mouseX,-75+mouseY,420,480); //cap darrera
stroke(0);
strokeWeight(2);
fill(189,42,219);

ellipse(-215+mouseX,-25+mouseY,30,30);
ellipse(215+mouseX,-25+mouseY,30,30);

//cara
stroke(125,171,229);
fill(125,171,229);
ellipse(-45+mouseX,25+mouseY,320,400);
ellipse(45+mouseX,25+mouseY,320,400);
stroke(125,171,229);
fill(125,171,229);
rect(-175+mouseX,-175+mouseY,40,200);
rect(135+mouseX,-175+mouseY,40,200);



ellipse(-75+mouseX,-175+mouseY,200,200);//ullprimer
stroke(0);
fill(255);



fill(245,215,151);
ellipse(-75+mouseX,-175+mouseY,100,100);//ullprimer gran
fill(42,247,170);
ellipse(-75+mouseX,-175+mouseY,60,60); //cercle prim ull

fill(0);
ellipse(-75+mouseX,-175+mouseY,50,50);//ullprimerinterior
fill(255);
ellipse(-65+mouseX,-175+mouseY,15,15); //pupilabrillo


stroke(125,171,229);
fill(125,171,229);
ellipse(76+mouseX,-175+mouseY,200,200);//ullprimer
stroke(0);
fill(255);


fill(245,215,151);
ellipse(75+mouseX,-175+mouseY,100,100);//ullsegon gran
fill(42,247,170);
ellipse(75+mouseX,-175+mouseY,60,60); //cercle prim voltant ull
fill(0);
ellipse(75+mouseX,-175+mouseY,50,50); //ullsegoninterior
fill(255);
ellipse(85+mouseX,-185+mouseY,15,15); //pupilabrillo


stroke(129,72,20);
fill(129,72,20);
triangle(-35+mouseX,-105+mouseY,35+mouseX,-105+mouseY,mouseX,-65+mouseY); //nas
ellipse(mouseX,-106+mouseY,70,25);

fill(255);

//barbeta
stroke(125,171,229);
fill(125,171,229);
ellipse(5+mouseX,195+mouseY,120,120);
//boca
stroke(180,18,18);
strokeWeight(7);
fill(0);
ellipse(5+mouseX,90+mouseY,180,180);


//interior orelles
stroke(0);
fill(0);
ellipse(-215+mouseX,-75+mouseY,15,60);
ellipse(217+mouseX,-75+mouseY,15,60);

//celles
stroke(0);
noFill();

curve(-35+mouseX, -202+mouseY, -45+mouseX, -255+mouseY, -125+mouseX, -245+mouseY, -45+mouseX, -202+mouseY); 
curve(135+mouseX, -155+mouseY, 125+mouseX, -245+mouseY, 45+mouseX,-255+mouseY, 125+mouseX, -185+mouseY); 



//lletres
textSize(50);
fill (255,255,255) ;
text ("Bu!", -30+mouseX, 110+mouseY);

 if (mousePressed){
   noStroke();
   fill(random(233),random(234),mouseX,70);
   ellipse(mouseX-50,mouseY+30,20,20);
   ellipse(height-mouseX-50,mouseY+30,20,20);
   ellipse(mouseX-50,width-mouseY+30,60,60);
   ellipse(height-mouseX-50,width-mouseY+30,60,60);
   fill(random(233),random(234),mouseX,70);
   ellipse(mouseX-100,mouseY+30,20,20);
   ellipse(height-mouseX-100,mouseY+70,20,20);
   ellipse(mouseX-100,width-mouseY+70,60,60);
   ellipse(height-mouseX-100,width-mouseY+70,60,60);

}
}


