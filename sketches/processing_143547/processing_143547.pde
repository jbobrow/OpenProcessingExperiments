
int posx, posy;

void setup() {//width és 590 i height és 380)

size(870,570);
posx=0;
posy=height/2;
}

void draw() {
background(255);

//Orejas Homer

stroke(255);
fill(255,217,15);
ellipse(mouseX-84,mouseY+40,30,30);
ellipse(mouseX+84,mouseY+40,30,30);

//Cara Homer 

stroke(255);
fill(255,217,15);
rectMode(CENTER);
fill(255,217,15);
rect(mouseX,mouseY,156,180);



//Pelitos +Calva

fill(0);
arc(mouseX,mouseY-130,60,60,3.13,TWO_PI,OPEN);
fill(255);
arc(mouseX,mouseY-130,58,58,3.13,TWO_PI,OPEN);
stroke(255);
fill(255,217,15);
arc(mouseX,mouseY-78,156,120,3.13,TWO_PI,OPEN);

//Barba Homer

stroke(0);
fill(209,178,112);
ellipseMode(CENTER);
ellipse(mouseX,mouseY+90,156,100);

//Nariz Homer

noFill();
arc(mouseX,mouseY+10,26,26, 0, PI, OPEN);

//Ojos Homer

fill(255);
ellipseMode(CENTER);
ellipse(mouseX-44,mouseY-20,80,80);
fill(255);
ellipseMode(CENTER);
ellipse(mouseX+44,mouseY-20,80,80);

//Pupilas Homer

fill(0);
ellipse(mouseX-64,mouseY-20,20,20);
fill(0);
ellipse(mouseX+26,mouseY-20,20,20);

//Rosquilla

stroke(255);
fill(245,106,106);
ellipse(mouseX-184,mouseY-20,90,90);
fill(255);
ellipse(mouseX-184,mouseY-20,26,26);

//Boca Homer

stroke(0);
fill(0);
ellipse(mouseX-44,mouseY+80,20,20);

posx=   posx+1;
}



