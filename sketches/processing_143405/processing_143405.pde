
void setup(){
size(500,500);

}


void draw(){
  
   background(125,165,131);
  
//Orella exterior (marro)://
stroke(124,103,94);
fill(124,103,94);
ellipse(mouseX-70,mouseY-100,80,80);
ellipse(mouseX+70,mouseY-100,80,80);

//Orella interior (carn)://
fill(227,177,153);
stroke(227,177,153);
ellipse(mouseX-70,mouseY-100,45,45);
ellipse(mouseX+70,mouseY-100,45,45);

//Orella interior (carn)://
fill(224,138,97);
stroke(224,138,97);
ellipse(mouseX-70,mouseY-100,35,35);
ellipse(mouseX+70,mouseY-100,35,35);


fill(124,103,94);
stroke(124,103,94);
//Esfera (marró clar)://
ellipse(mouseX,mouseY,240,240);
//Triangle (marró clar)://
triangle(mouseX-97, mouseY-70, mouseX-147, mouseY, mouseX-97, mouseY+70);
triangle(mouseX+97, mouseY-70, mouseX+147, mouseY, mouseX+97, mouseY+70);


fill(100,87,81);
stroke(100,87,81);
//Esfera (marró fosc)://
ellipse(mouseX,mouseY,225,225);
//Triangle (marró fosc)://
triangle(mouseX-88, mouseY-70, mouseX-138, mouseY, mouseX-88, mouseY+70);
triangle(mouseX+88, mouseY-70, mouseX+138, mouseY, mouseX+88, mouseY+70);

//Cresta (marró fosc)://
stroke(124,103,94);
fill(124,103,94);
triangle(mouseX-20,mouseY-115, mouseX+20, mouseY-115, mouseX, mouseY-20);

//Esfera morro (marró fosc)://
stroke(124,103,94);
fill(124,103,94);
ellipse(mouseX,mouseY+60,108,108);

//Esfera morro (blanca)://
fill(255,255,255);
stroke(255,255,255);
ellipse(mouseX,mouseY+60,98,98);

//Triangle nas (nigga)://
fill(0,0,0);
stroke(0,0,0);
triangle(mouseX,mouseY+60,mouseX-20,mouseY+40,mouseX+20,mouseY+40);

//Triangle nas (nigga)://
fill(57,57,57);
stroke(57,57,57);
triangle(mouseX,mouseY+45,mouseX-20,mouseY+40,mouseX+20,mouseY+40);

//Ralla boca (vertical+morrus)://
line(mouseX,mouseY+60,mouseX,mouseY+70);
line(mouseX,mouseY+70,mouseX-20,mouseY+75);
line(mouseX,mouseY+70,mouseX+20,mouseY+75);

//Elipse antifaç (marro clar)://
stroke(124,103,94);
fill(124,103,94);
ellipse(mouseX+75,mouseY,115,55);
ellipse(mouseX-75,mouseY,115,55);

//Elipse antifaç (blanc)://
fill(255,255,255);
stroke(255,255,255);
ellipse(mouseX-75,mouseY,100,40);
ellipse(mouseX+75,mouseY,100,40);

//Elipse antifaç (negre)://
fill(0,0,0);
stroke(0,0,0);
ellipse(mouseX-65,mouseY,80,30);
ellipse(mouseX+65,mouseY,80,30);


//Ulls (blau)://
 fill(mouseY+5,230,99);
stroke(245,230,99);
ellipse(mouseX-35,mouseY,10,10);
ellipse(mouseX+35,mouseY,10,10);

//Ulls (blau)://
 fill(mouseY+5,230,99);
stroke(245,230,99);
ellipse(mouseX-35,mouseY,mouseY/6,mouseY/6);
ellipse(mouseX+35,mouseY,mouseY/6,mouseY/6);

//Ulls (negre)://
fill(0,0,0);
stroke(0,0,0);
ellipse(mouseX-35,mouseY,6.5,6.5);
ellipse(mouseX+35,mouseY,6.5,6.5);

//Ulls (reflex blanc)://
fill(255,255,255);
stroke(255,255,255);
ellipse(mouseX-37,mouseY-2,1.9,1.9);
ellipse(mouseX+37,mouseY-2,1.9,1.9);

//bigotis (esquerre)://
stroke(0,0,0);
line(mouseX+30,mouseY+50,330,50);
line(mouseX+30,mouseY+58,320,70);
line(mouseX+30,mouseY+66,310,85);

//bigotis (dreta)://
stroke(0,0,0);
line(mouseX-30,mouseY+50,170,50);
line(mouseX-30,mouseY+58,180,70);
line(mouseX-30,mouseY+66,190,85);

}


