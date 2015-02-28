

int r;
int g;
int b;

void setup(){
size(500,500);
frameRate(25);

r=0;
g=0;
b=0;
}


void draw(){
background(255);  
r=int(random(0, 255));
g=int(random(0, 255));
b=int(random(0, 255));


//body
fill(255);
rectMode(CENTER);
rect(mouseX,mouseY+45,50,90);

//head
fill(255);
ellipseMode(CENTER);
ellipse(mouseX,mouseY-125,190,250);


//eyes
fill(r,g,b);
ellipseMode(CENTER);
ellipse(mouseX+40,mouseY-85,50,70);
ellipse(mouseX-35,mouseY-85,50,70);




//legs
stroke(r,g,b);
strokeWeight(2);
line(mouseX-40,mouseY+115,mouseX-25,mouseY+90);
line(mouseX+40,mouseY+115,mouseX+25,mouseY+90);
}






