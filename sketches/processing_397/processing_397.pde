
//basics

void setup() {
size(600,600);
smooth();
}

void draw() {
background(30,30,30);

ellipseMode(CENTER);

strokeWeight(100);
stroke(20,20,20);
line(0,0,600,600);

strokeWeight(100);
stroke(20,20,20);
line(0,600,600,0);

strokeWeight(60);
stroke(50,50,50);
line(0,0,600,600);

strokeWeight(60);
stroke(50,50,50);
line(0,600,600,0);

strokeWeight(0);// weird!!

noStroke();//upper skull
fill(255);
ellipse(300,200,450,400);

rectMode(CENTER);//jaw
noStroke();
fill(255);
rect(300,450,270,195);
rectMode(CORNER);

noStroke();
stroke(0);//nose
fill(0);
triangle(300,280,280,320,320,320);


strokeWeight(10);//eye socket
noStroke();
fill(210,210,210);
ellipse(200,200,200,200);

strokeWeight(10);//eyeball
stroke(0);
fill(255);
ellipse(200,200,120,120);

strokeWeight(10);//iris
stroke(0);
fill(95,40,10);
ellipse(200,200,60,60);

strokeWeight(10);//pupil
stroke(0);
fill(0);
ellipse(200,200,20,20);

strokeWeight(10);//eye socket
noStroke();
fill(210,210,210);
ellipse(400,200,200,200);

strokeWeight(10);//eyeball
stroke(0);
fill(255,200,200);
ellipse(400,200,100,100);

strokeWeight(10);//iris
stroke(0);
fill(95,40,10);
ellipse(400,200,60,60);

strokeWeight(10);//pupil
stroke(0);
fill(0);
ellipse(400,200,20,20);



// eyepatch
strokeWeight(10);
stroke(0);
fill(0);
rectMode(CENTER);
ellipse(mouseX,mouseY,200,200);
line(145,50,mouseX,mouseY);
line(mouseX,mouseY,500,295);
rectMode(CORNER);
if(mouseX>380 && mouseX < 420 && mouseY>180 && mouseY<220)//smile
{
  strokeWeight(10);//upper teeth
fill(255);
rect(200,400,50,50);

strokeWeight(10);
fill(255);
rect(200,400,50,50);

strokeWeight(10);
fill(255);
rect(250,400,50,50);

strokeWeight(10);
fill(255);
rect(300,400,50,50);

strokeWeight(10);
fill(255);
rect(350,400,50,50);
  fill(255,20,20);
 arc(300,455,200,100,0,PI);}
  
else {//frown
strokeWeight(10);//upper teeth
fill(255);
rect(200,400,50,50);

strokeWeight(10);
fill(255);
rect(200,400,50,50);

strokeWeight(10);
fill(255);
rect(250,400,50,50);

strokeWeight(10);
fill(255);
rect(300,400,50,50);

strokeWeight(10);
fill(255);
rect(350,400,50,50);

strokeWeight(10);//lower teeth
fill(255);
rect(350,450,50,50);

strokeWeight(10);
fill(255);
rect(300,450,50,50);

strokeWeight(10);
fill(255);
rect(250,450,50,50);

strokeWeight(10);
fill(255);
rect(200,450,50,50);
}
}

