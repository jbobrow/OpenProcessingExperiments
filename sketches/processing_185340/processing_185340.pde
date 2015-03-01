
void setup(){
size(1000,750);
smooth();
frameRate(20); 
}

void draw(){
background(250); 
rectMode(CENTER);
ellipseMode(CENTER);


// Head
strokeWeight(2);
arc(mouseX,mouseY,150,150,PI,TWO_PI); //head
//arc(250,100,150,150,PI,TWO_PI); //head
line(mouseX-10,mouseY-50,mouseX-60,mouseY-90); //left antenna
line(mouseX+10,mouseY-50,mouseX+60,mouseY-90); //right antenna
quad(mouseX-74.5,mouseY,mouseX+74.5,mouseY,mouseX+55,mouseY+15,mouseX-55,mouseY+15); //jaw
//quad(174.5,100,325.5,100,305,115,195,115); //jaw
fill(200);
strokeWeight(0);
triangle(mouseX-20,mouseY-10,mouseX-30,mouseY-25,mouseX-40,mouseY-10); //left eye
//triangle(230,90,220,75,210,90); //left eye
triangle(mouseX+20,mouseY-10,mouseX+30,mouseY-25,mouseX+40,mouseY-10); //right eye
//triangle(290,90,280,75,270,90); //right eye
rect(mouseX,mouseY-5,20,2.5); //mouth
//rect(250,92.5,20,2.5); //mouth

ellipse(mouseX-60,mouseY-90,5,5); //left ball
ellipse(mouseX+60,mouseY-90,5,5); //right ball
if (mousePressed){

fill(255,0,0)
textSize(35);
text( "Hello, I am ROB-0", mouseX +50,mouseY +5);
}

smooth(BEVEL);
fill(50);
stroke(50);
//strokeWeight(10);

// Leg/Wheele
quad(mouseX-95,mouseY+280,mouseX+95,mouseY+280,mouseX+80,mouseY+315,mouseX-80,mouseY+315); //platform
//quad(155,380,345,380,330,415,170,415); //platform
triangle(mouseX-75,mouseY+320,mouseX+75,mouseY+320,mouseX,mouseY+400); //leg
//triangle(175,420,325,420,250,500); //leg
fill(200);
ellipse(mouseX,mouseY+410,10,10); //dot
//ellipse(250,510,10,10); //dot
fill(50);

// Body
quad(mouseX-125,mouseY+25,mouseX+125,mouseY+25,mouseX+100,mouseY+275,mouseX-100,mouseY+275); //body
//quad(125,125,375,125,350,375,150,375); //body
strokeWeight(50);
line(mouseX-125,mouseY+50,mouseX-175,mouseY+200); //left arm
//line(125,150,75,300); //left arm
line(mouseX+125,mouseY+50,mouseX+175,mouseY+200); //right arm
//line(375,150,425,300); //right arm
}

void keyPressed(){
background(250);
}

void mousePressed(){
println("Hello, I am ROB-0");

}
