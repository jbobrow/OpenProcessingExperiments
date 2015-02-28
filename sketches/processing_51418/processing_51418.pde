
float fishR;
float fishG;
float fishB;

void setup(){
size(1000,1000);



}

void draw(){
    background(0);
    
smooth();
//head 
fill(0);
stroke(255,250,5);
rectMode(CORNER);
rect(350,150,300,250);

//eyes
fill(250);
stroke(0);
ellipseMode(CENTER);
ellipse(400,250,100,100);
ellipse(600,250,100,100);

//pupils
stroke(0);
fill(0);
ellipse(400,250,10,10);
ellipse(600,250,10,10);

//beak
fill(255,250,5);
triangle(450,300,550,300,500,350);
stroke(0);
fill(0);
ellipse(480,320,5,5);
ellipse(520,320,5,5);
fill(255,250,5);
triangle(410,850,410,900,310,900);
triangle(590,850,590,900,690,900);

//body
fill(0);stroke(255,250,5);
ellipseMode(CORNERS);
ellipse(350,400,650,900);
fill(255);
ellipse(400,600,600,900);

//wings
stroke(255);
line(450,500,350,650);
line(550,500,650,650);


//phish
fishR = random(255);
fishG = random(255);
fishB = random(255); 
ellipseMode(CENTER);
fill(fishR,fishG,fishB);
stroke(0);

ellipse(mouseX,mouseY,200,100);
ellipse(mouseX+100,mouseY+25,25,75);
ellipse(mouseX+100,mouseY-25,25,75);
fill(0);
stroke(mouseY,150,mouseX);
ellipse(mouseX-50,mouseY,50,50);

}

