
//Joan Recasens
//GEDI - 2012-2013
//Grup 03
//ELISAVA

//Primer definim les variables

int x;
int y;

// primer a set up definim el tamany axií com el color de fons.
void setup()
{
size(400,400);
background(37,149,232);
}

void draw()
{
//En primer lloc modificarem el peix perque es mogui seguin el curso.
 // es realitza un background amb el color del fons per evitar que el peix, que es moura es repeteixi.
background(37,149,232);
fill(255,255,0,32);
strokeWeight(2);
ellipse(mouseX,mouseY,100,50);

fill(255,255,0,32);
strokeWeight(2);
triangle(mouseX-50,mouseY,mouseX-130,mouseY+55,mouseX-90,mouseY-65);

fill(101,203,15);
ellipse(mouseX+20,mouseY,20,20);
ellipse(mouseX+20,mouseY,3,3);
// Un cop modificat tot el peix perque es mogui seguin el cursor anem a modificar les bombolles d' aire perque tambè es moguin amb el mouse i canvin de color.Totes canvien de color de manera independent, 
//es per aquet motiu que totes tenen imposicions diferents respecte la X i la Y
fill(mouseX+25,mouseY+80,mouseX+4);
ellipse(mouseX+50,mouseY-30,20,20);
fill(mouseX+7,mouseY+15,mouseX+23);
ellipse(mouseX+80,mouseY-65,30,30);
fill(mouseX+4,mouseY+7,mouseY+6);
ellipse(mouseX+100,mouseY-110,40,40);


fill(240,47,29);
//Fem que el cos del cranc es fassi gran, posan una imposició sumatoria cuan el mouse es mou en l' eix de les X
ellipse(200,380,50+mouseX/20,20+mouseX/20);
line(175,380,160,370);
line(160,370,150,390);
line(225,380,240,370);
line(240,370,250,390);
fill(240,208,29);
strokeWeight(1);
///Fem que la sorra  es fassi gran, posan una imposició sumatoria cuan el mouse es mou en l' eix de les Y
rect(0,390-mouseY/15,400+mouseX,400+mouseX);
}


