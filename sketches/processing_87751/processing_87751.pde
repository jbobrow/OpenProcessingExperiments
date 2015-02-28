
float x;
float y; 

void setup() {
        size(400,400); // La taille de la fenetre.
        frameRate(30); // Le nombre d'images par seconde.
        smooth(); // Lisser les formes dessinees.
        
        x = width/2;
        y = height/2; 
}


void draw() {
        background(127); // Remplir l'arriere-plan d'une teinte de gris.
        noStroke();
        fill(#FFDE21);
        ellipse (x,y,300,300);
           fill(#FAFF71);
        ellipse (x,y,290,290);
        
        stroke(10) ;
        
        fill(255);
beginShape(); //oeil 1
vertex(x+59, y-46);
vertex(x+36, y-82);
vertex(x+5, y-68);
vertex(x-24.0, y-59);
vertex(x-35.0, y-49);
vertex(x-33, y-39);
vertex(x-6, y-41);
vertex(x+11, y-41);
vertex(x+28, y-40);
vertex(x+60, y-46);
endShape();

beginShape(); //oeil2
vertex(x-113, y-45);
vertex(x-124, y-54);
vertex(x-113, 131.0);
vertex(x-103, y-70);
vertex(x-87.0, y-61);
vertex(x-68, y-49);
vertex(x-75.0,y-42.0);
vertex(x-101.0, y-43.0);
endShape(CLOSE);

noStroke();
fill(#84ADAC);
ellipse(x,y-52,25,27);
fill(0);
ellipse(x,y-52,17,15);
fill(#84ADAC);
ellipse(x-100,y-54,25,24);
fill(0);
ellipse(x-100,y-54,17,15);

fill(127);
noStroke();
rect(x-150,y-6,100,96);
stroke(10);

fill(0);
beginShape(); //bouche
vertex(x-88.0, y+47);
vertex(x-121, y+90);
vertex(x-22,y+91 );
vertex(x+12, y+47);
vertex(x+12, y+28);
vertex(x-23.0, y-6);
vertex(x-148,y-6);
vertex(x-88, y+29);
endShape(CLOSE);

fill(255);
beginShape();
vertex(x-50,y-6);
vertex(x-40,y-6);
vertex(x-50,y+10);
vertex(x-55,y-6);
endShape(CLOSE);





beginShape(); //dent2
vertex(x-36, y+17);
vertex(x-36, y+28);
vertex(x-38, y+43);
vertex(x-29,y+35);
vertex(x-21, y+11);
vertex(x-23, y-6);
vertex(x-45, y-6);
vertex(x-38, y+10);
endShape(CLOSE);

beginShape(); //dent3
vertex(x-104.0, y+83);
vertex(x-106, y+73);
vertex(x-107,y+63);
vertex(x-102, y+39);
vertex(x-114.0, y+53);
vertex(x-122, y+73);
vertex(x-121, y+90);
vertex(x-97, y+90);
endShape(CLOSE);

stroke(5);
fill(#E86978);
beginShape();
curveVertex(x-85, y+66);
curveVertex(x-147, y+93);
curveVertex(x-137,y+65);
curveVertex(x-113, y+42);
curveVertex(x-55, y+30);
curveVertex(x-93.0, y+57);
curveVertex(x-44.0, y+30);
curveVertex(x-27.0, y+64);
curveVertex(x-71, y+80);
curveVertex(x-119, y+109);
curveVertex(x-149, y+92);
curveVertex(x-156, y+72);
endShape();

stroke(10);

fill(255);
beginShape(); //dent2
vertex(x-36, y+17);
vertex(x-36, y+28);
vertex(x-38, y+43);
vertex(x-29,y+35);
vertex(x-21, y+11);
vertex(x-23, y-6);
vertex(x-45, y-6);
vertex(x-38, y+10);
endShape(CLOSE);


fill(255);
beginShape(); //dent1
vertex(x-141, y+25.0);
vertex(x-131, y+34.0);
vertex(x-125, y+39.0);
vertex(x-128, y+25.0);
vertex(x-131, y+10.0);
vertex(x-127, y-6.0);
vertex(x-148, y-6.0);
vertex(x-144, y+18.0);
endShape(CLOSE);

beginShape();
vertex(x-26, y+83);
vertex(x-30, y+74);
vertex(x-31, y+66);
vertex(x-32.0, y+51);
vertex(x-41.0, y+67);
vertex(x-44.0, y+80);
vertex(x-40, y+91);
vertex(x-20, y+91);
endShape(CLOSE);



fill(255);
beginShape();
vertex(x-128,y-6);
vertex(x-115,y-6);
vertex(x-120,y+10);
vertex(x-128,y-6);
endShape(CLOSE);

fill(255);
beginShape();
vertex(x-115,y-6);
vertex(x-103,y-6);
vertex(x-110,y+10);
vertex(x-115,y-6);
endShape(CLOSE);

fill(255);
beginShape();
vertex(x-103,y-6);
vertex(x-90,y-6);
vertex(x-100,y+10);
vertex(x-105,y-6);
endShape(CLOSE);

fill(255);
beginShape();
vertex(x-90,y-6);
vertex(x-80,y-6);
vertex(x-90,y+10);
vertex(x-95,y-6);
endShape(CLOSE);


fill(255);
beginShape();
vertex(x-80,y-6);
vertex(x-70,y-6);
vertex(x-80,y+10);
vertex(x-85,y-6);
endShape(CLOSE);


fill(255);
beginShape();
vertex(x-70,y-6);
vertex(x-60,y-6);
vertex(x-70,y+10);
vertex(x-75,y-6);
endShape(CLOSE);

fill(255);
beginShape();
vertex(x-60,y-6);
vertex(x-50,y-6);
vertex(x-60,y+10);
vertex(x-65,y-6);
endShape(CLOSE);

fill(255);
beginShape();
vertex(x-90,y+90);
vertex(x-90,y+90);
vertex(x-80,y+80);
vertex(x-75,y+90);
endShape(CLOSE);


fill(0);

beginShape();
vertex(x-75, y-81);
vertex(x-105, y-88);
vertex(x-93.0, y-96);
vertex(x-67.0, y-72);
vertex(x-76.0, y-81);
endShape();

fill(#FAFF71);
beginShape();
vertex(x-30, y-90);
vertex(x-36, y-69);
vertex(x-50, y-70);
vertex(x-49.0, y-79);
vertex(x-52.0, y-69);
vertex(x-64, y-70);
vertex(x-60, y-87);
endShape();


fill(0);
beginShape();
vertex(x-9, y-93);
vertex(x-36, y-69);
vertex(x+2, y-90);
vertex(x+15,y-95);
vertex(x+26, y-95);
vertex(x+23, y-108);
vertex(x-4.0, y-100);
endShape();

stroke(5);
fill(#FFDE21);
beginShape();
vertex(x+39, y-115);
vertex(x+36, y-105);
vertex(x+49, y-100);
vertex(x+65, y-109);
vertex(x+87, y-121);
vertex(x+64, y-108);
vertex(x+66, y-95);
vertex(x+76, y-92);
vertex(x+64, y-84);
vertex(x+50, y-86);
vertex(x+53, y-80);
endShape();

fill(#FFDE21);
beginShape();
vertex(x+99, y+61);
vertex(x+83, y+48);
vertex(x+79, y+37);
vertex(x+65, y+29);
vertex(x+79, y+38);
vertex(x+71, y+51);
vertex(x+60, y+48);
vertex(x+53, y+57);
vertex(x+61, y+49);
vertex(x+52, y+40);
endShape();







}
