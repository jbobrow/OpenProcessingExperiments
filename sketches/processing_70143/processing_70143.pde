
void setup() {
  
size (600,600);
smooth();
frameRate(30);
}

void draw() {
  
 //backgrond move 
background(255);
fill(mouseX,0,mouseY);
rect(mouseX+100,mouseY,1800,1800);
  

//drawing circles
ellipseMode(CENTER);
noStroke();
fill(255,71,24);
ellipse(300,300,500,500);
fill(255);
ellipse(300,300,450,450);
fill(0);
ellipse(300,300,400,400);
fill(255);
ellipse(300,300,350,350);
fill(0);
ellipse(300,300,300,300);
fill(255);
ellipse(300,300,250,250);
fill(0);
ellipse(300,300,200,200);
fill(255);
ellipse(300,300,150,150);
fill(0);
ellipse(300,300,100,100);
fill(255);
ellipse(300,300,50,50);


//the peace lines
stroke(255);
line(300,0,300,300);
line(300,300,0,600);
line(300,300,600,600);

//triangle
fill(255,255,255,170);
triangle(300,300,0,600,600,600);
fill(0,0,255,200);
triangle(300,350,50,600,550,600);


//rectangle
fill(255,255,255,170);
noStroke();
rectMode(CENTER);
rect(300,0,50,650);

//lines
stroke(0);
line(300,300,0,600);
line(300,300,600,600);
line(300,300,0,660);
line(300,300,550,600);

stroke(0);
line(300,0,300,300);
line(300,300,275,0);
line(300,300,325,0);


}




