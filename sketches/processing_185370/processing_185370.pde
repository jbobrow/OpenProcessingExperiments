
float mx;
float my;

void setup(){
size(1000,750);
smooth();
frameRate(20); 
}

void draw(){
background(250); 
rectMode(CENTER);
ellipseMode(CENTER);
mx = mouseX;
my = mouseY;


// Head
strokeWeight(2);
arc(mx,my,150,150,PI,TWO_PI); //head
//arc(250,100,150,150,PI,TWO_PI); //head
line(mx-10,my-50,mx-60,my-90); //left antenna
line(mx+10,my-50,mx+60,my-90); //right antenna
quad(mx-74.5,my,mx+74.5,my,mx+55,my+15,mx-55,my+15); //jaw
//quad(174.5,100,325.5,100,305,115,195,115); //jaw
fill(200);
strokeWeight(0);
triangle(mx-20,my-10,mx-30,my-25,mx-40,my-10); //left eye
//triangle(230,90,220,75,210,90); //left eye
triangle(mx+20,my-10,mx+30,my-25,mx+40,my-10); //right eye
//triangle(290,90,280,75,270,90); //right eye
rect(mx,my-5,20,2.5); //mouth
//rect(250,92.5,20,2.5); //mouth

ellipse(mx-60,my-90,5,5); //left ball
ellipse(mx+60,my-90,5,5); //right ball
if (mousePressed){

fill(255,0,0)
textSize(35);
text( "Hello, I am ROB-0", mx +50,my +5);
}

smooth(BEVEL);
fill(50);
stroke(50);
//strokeWeight(10);

// Leg/Wheele
quad(mx-95,my+280,mx+95,my+280,mx+80,my+315,mx-80,my+315); //platform
//quad(155,380,345,380,330,415,170,415); //platform
triangle(mx-75,my+320,mx+75,my+320,mx,my+400); //leg
//triangle(175,420,325,420,250,500); //leg
fill(200);
ellipse(mx,my+410,10,10); //dot
//ellipse(250,510,10,10); //dot
fill(50);

// Body
quad(mx-125,my+25,mx+125,my+25,mx+100,my+275,mx-100,my+275); //body
//quad(125,125,375,125,350,375,150,375); //body
strokeWeight(50);
line(mx-125,my+50,mx-175,my+200); //left arm
//line(125,150,75,300); //left arm
line(mx+125,my+50,mx+175,my+200); //right arm
//line(375,150,425,300); //right arm
}

void keyPressed(){
background(250);
}

void mousePressed(){
println("Hello, I am ROB-0");

}
