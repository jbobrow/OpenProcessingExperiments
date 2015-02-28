
void setup(){
  


size(700,700);
}

void draw (){
  


int a;
int b;
a=width/2;
b=height/2;
 
background(5,219,247);
 
fill(67,191,6);

//orellas
ellipse(mouseX-120,mouseY-230,a/3.5,b/3.5);
ellipse(mouseX+100,mouseY-240,a/4,b/4);

 //rellenoorelles
fill(0,0,0);
ellipse(mouseX-120,mouseY-230,a/5,b/5);
ellipse(mouseX+100,mouseY-240,a/6,b/6);
 rotate(-0.05);
fill(67,191,6);

 
 //cap
 ellipse(mouseX,mouseY,a+a/2,b+b/4);
fill(255,255,255);
 
 //ellpseulls
 ellipse(mouseX-180,mouseY-10,a/3.25,b/3.25);
ellipse(mouseX+190,mouseY-20,a/3.25,b/3.25);
rotate(-0.05);

 //nas
fill(93,242,20);
 ellipse(mouseX,mouseY+20,a/1.60,b/2.20);
 
 
 //foratsnas
fill(5,5,5);
ellipse(mouseX+35,mouseY+20,a/7,b/6);
ellipse(mouseX-35,mouseY+20,a/7,b/6);
noStroke();
 
 //bolasulls
fill(5,5,5);
ellipse(mouseX+195,mouseY-20,a/12,b/12);
ellipse(mouseX-175,mouseY+10,a/12,b/12);
noCursor();
}

