

void setup(){
//es pot canviar "size" i el dibuix continua igual(nomes canvia el tamany del fons) ja que he donat valors a "a" i "b" i no ho he referenciat respecte size.
size(1000,1000);
}

void draw(){
int a;
int b;

a=300;
b=300;
background(255);

strokeWeight(4);
stroke(0,0,0);
fill(35,175,14);

//orelles
triangle(mouseX-150,mouseY-250,mouseX-10,mouseY+10,mouseX-200,mouseY+10);
triangle(mouseX+150,mouseY-250,mouseX+10,mouseY+10,mouseX+200,mouseY+10);

//cap
ellipse(mouseX,mouseY,a+a/2,b+b/2);

//front
arc(mouseX,mouseY-170,a/1.6, b/1.7, -PI, 0);

//ull
fill(255,255,255);
ellipse(mouseX,mouseY-80,a/1.5,b/1.5);

//blau Ull
fill(27,178,203);
ellipse(mouseX,mouseY-80,a/3,b/3);

//nineta Ull
fill(0,0,0);
ellipse(mouseX,mouseY-80,a/6,b/6);

//Brillo Ull
fill(255,255,255);
ellipse(mouseX+10,mouseY-90,a/20,b/20);


//boca
fill(35,175,14);
arc(mouseX,mouseY+60,a/1.2,b/1.2,0,PI*1);

noCursor();

}

