
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
line(mouseX-10,mouseY-50,pmouseX-60,mouseY-90); //left antenna
line(mouseX+10,mouseY-50,pmouseX+60,mouseY-90); //right antenna
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
ellipse(pmouseX-60,mouseY-90,5,5); //left ball
ellipse(pmouseX+60,mouseY-90,5,5); //right ball

smooth(BEVEL);
fill(50);
stroke(50);
//strokeWeight(10);

// Leg/Wheele
quad(pmouseX-95,pmouseY+280,pmouseX+95,pmouseY+280,pmouseX+80,pmouseY+315,pmouseX-80,pmouseY+315); //platform
//quad(155,380,345,380,330,415,170,415); //platform
triangle(pmouseX-75,pmouseY+320,pmouseX+75,pmouseY+320,pmouseX,pmouseY+400); //leg
//triangle(175,420,325,420,250,500); //leg
fill(200);
ellipse(pmouseX,pmouseY+410,10,10); //dot
//ellipse(250,510,10,10); //dot
fill(50);

// Body
quad(mouseX-125,mouseY+25,mouseX+125,mouseY+25,pmouseX+100,pmouseY+275,pmouseX-100,pmouseY+275); //body
//quad(125,125,375,125,350,375,150,375); //body
strokeWeight(50);
line(mouseX-125,mouseY+50,pmouseX-175,pmouseY+200); //left arm
//line(125,150,75,300); //left arm
line(mouseX+125,mouseY+50,pmouseX+175,pmouseY+200); //right arm
//line(375,150,425,300); //right arm
}

void keyPressed(){
background(250);
}

void mousePressed(){
println("Hello, I am ROB-0");
}
