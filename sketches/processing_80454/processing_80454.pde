
import netscape.javascript.*;

void setup (){
size(850,500); //width, height
background(56,192,240);
}

void draw(){
  
//fill(216,216,46,50);
stroke(15,14,106);

ellipse(random(1000),random(1000),100,100);
strokeWeight (2);

//fill(0,9);
rect(0,0, width, height);
stroke(226,229,201);
line(random(400),(400),random(850),(400));
ellipse(random(1000),random(100),random(30),random(30));

//fill((frameCount + 50)% 34,233,242);//
stroke(214,19,23);

line(random(1000),random(100),400,400);
strokeWeight (2);
ellipse(400,400,60,60);


frameRate(15)
;

fill(17,36,237);
ellipse(250,250,20,20);
ellipse(450,450,20,20);
ellipse(700,150,5,5);
ellipse(600,40,30,30);

fill(234,241,23);
ellipse(300,200,10,10);
ellipse(450,50,10,10);
ellipse(550,300,35,35);
ellipse(100,100,5,5);

fill(19,229,213);
ellipse(775,200,25,25);
ellipse(100,400,10,10);
ellipse(65,300,22,22);

fill(193,6,137);
ellipse(735,375,22,22);

ellipse(165,75,35,35);

fill(mouseX,mouseY,mouseX);
}
