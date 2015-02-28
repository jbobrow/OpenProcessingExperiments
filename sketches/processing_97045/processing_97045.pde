
//Joan Recasens
//GEDI - 2012-2013
//Grup 03
//ELISAVA
 
//Primer definim les variables
 
int posX, posY, velX, velY;
int x=100;
int y=50;

//el color del cranc el construim amb les variables RGB

color colorcrancR,colorcrancG,colorcrancB,colorcranc;

color peixR,peixG,peixB,peix;

 
// primer a set up definim el tamany així com el color de fons.
void setup(){

size(400,400);
background(37,149,232);
posX = width/2;
posY = height/2;
velX = 3;
velY = 5; 
colorcrancR = 240;
colorcrancG = 17;
colorcrancB = 29;

}

void draw()
{
  
//En primer lloc modificarem el peix perque es mogui seguin el curso.
 // es realitza un background amb el color del fons per evitar que el peix, que es moura es repeteixi.



posX = posX+velX;
posY = posY+velY;
  
 
background(37,149,232);
fill(255,255,0,32);
strokeWeight(2);
ellipse(posX,posY,x,y);

fill(255,255,0,32);
strokeWeight(2);
triangle(posX-50,posY,posX-130,posY+55,posX-90,posY-65);

 
fill(101,203,15);
ellipse(posX+20,posY,20,20);
ellipse(posX+20,posY,3,3);

// Un cop modificat tot el peix perque es mogui seguin el cursor anem a modificar les bombolles d' aire perque tambè es moguin amb el mouse i canvin de color.Totes canvien de color de manera independent,
//es per aquet motiu que totes tenen imposicions diferents respecte la X i la Y

fill(posX+25,posY+80,posX+4);
ellipse(posX+50,posY-30,20,20);
fill(posX+7,posY+15,posX+23);
ellipse(posX+80,posY-65,30,30);
fill(posX+4,posY+7,posY+6);
ellipse(posX+100,posY-110,40,40);
 
 
fill(colorcrancR,colorcrancG,colorcrancB);
//Fem que el cos del cranc es faci gran, posan una imposició sumatoria quan el mouse es mou en l' eix de les X

ellipse(200,380,50+posX/20,20+posX/20);
line(175,380,160,370);
line(160,370,150,390);
line(225,380,240,370);
line(240,370,250,390);
fill(240,208,29);
strokeWeight(1);

rect(0,390,400,400);

// Fem que el rebot sigui al extrem

//comprovem la posicio X
  if((posX<130)||(posX>350)){
    velX = -velX;
  } 
    //comprovem la posicio Y
  if((posY<55)||(posY>335)){
    velY = -velY;
  } 
}

//Al fer click el cranc canviara de color

void mousePressed() {
  if (colorcranc == 0) {
    colorcrancR= int(random(0,240));
    colorcrancG= int(random(0,240));
    colorcrancB= int(random(0,240));
  } else {
    colorcrancR= 240;
    colorcrancG= 0;
    colorcrancB= 0;
  }
}


