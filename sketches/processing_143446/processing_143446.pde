
void setup(){
size(500,500);
}
void draw(){
int a;
int b;
a=width/2;
b=height/2;

background(115,178,255);
fill(0);
fill(30,229,88);

strokeWeight(a/25);

stroke(115,178,255);

//cap
ellipse(mouseX,mouseY-65,a/1.75,b/2);

//cos
rect(mouseX-a/1.75/2,mouseY-b/2.20/2,a/1.75,b/2.20);

//cames
strokeWeight(a/1000);
stroke(30,229,88);

rect(mouseX+10,mouseY+35,a/8,b/2.5);

rect(mouseX-40,mouseY+35,a/8,b/2.5);

ellipse(mouseX+25,mouseY+135,a/8,b/8);
ellipse(mouseX-25,mouseY+135,a/8,b/8);


//braços
rect(mouseX-110,mouseY-35,a/8,b/3);
rect(mouseX+80,mouseY-35,a/8,b/3);


ellipse(mouseX-95,mouseY-37,a/8,b/8);
ellipse(mouseX-95,mouseY+47,a/8,b/8);


ellipse(mouseX+95,mouseY-37,a/8,b/8);
ellipse(mouseX+95,mouseY+47,a/8,b/8);


//antenas
rect(mouseX-20,mouseY-135,a/50,b/10);
rect(mouseX+20,mouseY-135,a/50,b/10);


fill(115,178,255);
stroke(115,178,255);
strokeWeight(a/1000);

//ulls
ellipse(mouseX+20,mouseY-100,a/17,b/17);
ellipse(mouseX-20,mouseY-100,a/17,b/17);

noCursor();

}
