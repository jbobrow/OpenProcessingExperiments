
//yumi wang processing
// ex1_5

void setup (){

//initialise display
size(200,200);
smooth();
frameRate(30);
}

void draw(){
background(198,136,345);

//torso//
ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);


//body
stroke(0);
fill(150);
rect(100,100,20,100);

//belt
fill(12,45,98);
rect(mouseX-10,mouseY-10,20,10);

//head
fill(255);
ellipse(100,70,60,60);
//faceß
fill(0);
ellipse(81,70,16,32);
ellipse(119,70,16,32);
//torso
stroke(0);
line(90,150,80,160);
line(110,150,120,160);

stroke(0);
line(70,100,90,100);
line(130,100,90,100);

//hat
fill(115,10,220);
arc(100, 50, 60, 50, TWO_PI-PI/2, TWO_PI);
arc(100, 50, 60, 50,  PI, TWO_PI-PI/2);



triangle(30, 35, 100, 20, 170, 35);


}

