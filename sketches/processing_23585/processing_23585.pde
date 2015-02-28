


int x=400;
int y=200;


void setup() {
  
size(800,500);
background(126, 8, 255);
smooth();

//body

rectMode(CENTER);
rect(x,y,100,200);
fill(255, 0,0, 180);
noStroke();
//bottom 
triangle(x,y-1,x-50,y+70,x+50,y+70);
triangle(x,y+100,x-50,y+70,x+50,y+70);
//top
triangle(x,y+1,x+50,y-70,x-50,y-70);
triangle(x,y-100,x+50,y-70,x-50,y-70);
fill(250);
stroke(0);

//head

ellipse(x,y-120,80,80);

strokeWeight(3);
ellipse(x-20,y-120,10,10);
ellipse(x+20,y-120,10,10);
strokeWeight(0);

//nose

fill(255, 0, 0, 160);
beginShape(); 
vertex(x,36); 
vertex(x-2,82);
vertex(x-5,90);
vertex(x-3,110);
vertex(x,105);
vertex(x+3,110);
vertex(x+5,90);
vertex(x+2,82);
endShape(CLOSE);

//right arm
triangle(x-50,y-90,x-50,y-40,x-150,y-120);
//left arm
triangle(x+50,y-90,x+50,y-40,x+150,y-120);
//right leg
triangle(x-50,y+100, x-100,y+240, x-30,y+100);
//left leg
triangle(x+50,y+100, x+100,y+240, x+30,y+100);

}





void draw() 
{ 
fill(255);
rectMode(CENTER);
rect(x,y,100,200);
fill(255, 0,0, 180);
noStroke();
//bottom 
triangle(x,y-1,x-50,y+70,x+50,y+70);
triangle(x,y+100,x-50,y+70,x+50,y+70);
//top
triangle(x,y+1,x+50,y-70,x-50,y-70);
triangle(x,y-100,x+50,y-70,x-50,y-70);
fill(250);
stroke(0);

//head

ellipse(x,y-120,80,80);

strokeWeight(3);
ellipse(x-20,y-120,10,10);
ellipse(x+20,y-120,10,10);
strokeWeight(0);

//nose

fill(255, 0, 0, 160);
beginShape(); 
vertex(x,36); 
vertex(x-2,82);
vertex(x-5,90);
vertex(x-3,110);
vertex(x,105);
vertex(x+3,110);
vertex(x+5,90);
vertex(x+2,82);
endShape(CLOSE);

//right arm
triangle(x-50,y-90,x-50,y-40,x-150,y-120);
//left arm
triangle(x+50,y-90,x+50,y-40,x+150,y-120);
//right leg
triangle(x-50,y+100, x-100,y+240, x-30,y+100);
//left leg
triangle(x+50,y+100, x+100,y+240, x+30,y+100);

noStroke();


fill(190,250,0);
triangle(mouseX, mouseY,x-23,y-120,x-18,y-115);
triangle(mouseX, mouseY,x+23,y-120,x+18,y-115);
ellipse(x-20,y-120,10,10);
ellipse(x+20,y-120,10,10);
}

