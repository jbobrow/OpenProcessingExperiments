
void setup(){

size(500,500);
frameRate(25);
smooth();
}
 
void draw(){
  background(389,238,0,23);
ellipseMode(CENTER);
rectMode(CENTER);

//body
strokeWeight(5);
stroke(0);
fill(200,0,0);
rect(mouseX,mouseY,20,100);
rect(mouseX,mouseY,100,20);


//head
strokeWeight(5);
fill(300);
ellipse(mouseX,mouseY,60,60);

strokeWeight(2.5);
fill(300);
ellipse(mouseX,mouseY,random(90,120),random(90,120));

strokeWeight(1);
fill(300);
ellipse(mouseX,mouseY,random(150,180),random(150,180));

strokeWeight(.5);
fill(300);
ellipse(mouseX,mouseY,random(1,500),random(1,500));

//eyes
strokeWeight(1);
fill(200,0,0);
ellipse(mouseX,mouseY,8,8);

//arms
//stroke(0);
//strokeWeight(0.1);
//line(mouseX,mouseY,258,477);
//line(mouseX,mouseY,120,180);
//line(mouseX,mouseY,0,130);
//line(mouseX,mouseY,120,455);
//line(mouseX,mouseY,390,320);

//mouth
strokeWeight(.3);
fill(0);
ellipse(mouseX,mouseY,10,10);

//triangle mess
if (mousePressed){
strokeWeight(.3);
fill(300);
triangle(mouseX,mouseY,random(268,460),random(377,430),random(76,200),random(40,90));

strokeWeight(.3);
fill(300);
triangle(mouseX,mouseY,random(50,290),random(190,322),random(300,350),random(200,230));

strokeWeight(.3);
fill(300);
triangle(mouseX,mouseY,random(10,50),random(10,57),random(180,300),random(70,140));

strokeWeight(.3);
fill(300);
triangle(mouseX,mouseY,random(100,350),random(20,20),random(90,160),random(90,334));

strokeWeight(.3);
fill(300);
triangle(mouseX,mouseY,random(350,490),random(388,416),random(86,160),random(90,83));

strokeWeight(.3);
fill(300);
triangle(mouseX,mouseY,random(348,416),random(320,490),random(200,340),random(400,455));
}

//triangles static
//strokeWeight(.3);
//fill(300);
//triangle(mouseX,mouseY,90,90,423,140);

//strokeWeight(.3);
//fill(300);
//triangle(mouseX,mouseY,40,110,25,173);

//strokeWeight(.3);
//fill(300);
//triangle(mouseX,mouseY,342,239,25,400);

//glasses
strokeWeight(3);
fill(300);
rect(mouseX,mouseY,21,16);
rect(mouseX,mouseY,21,16);

//background
strokeWeight(0);
fill(200,0,0);
ellipse(1,1,8,8);
ellipse(50,50,8,8);
ellipse(100,100,8,8);
ellipse(150,150,8,8);
ellipse(200,200,8,8);
ellipse(250,250,8,8);
ellipse(300,300,8,8);
ellipse(350,350,8,8);
ellipse(400,400,8,8);
ellipse(450,450,8,8);
ellipse(500,500,8,8);

ellipse(1,500,8,8);
ellipse(50,450,8,8);
ellipse(100,400,8,8);
ellipse(150,350,8,8);
ellipse(200,300,8,8);
ellipse(250,250,8,8);
ellipse(300,200,8,8);
ellipse(350,150,8,8);
ellipse(400,100,8,8);
ellipse(450,50,8,8);
ellipse(500,1,8,8);

ellipse(500,1,8,8);
ellipse(400,100,8,8);
ellipse(300,200,8,8);
ellipse(200,300,8,8);
ellipse(100,400,8,8);
ellipse(1,500,8,8);

}


