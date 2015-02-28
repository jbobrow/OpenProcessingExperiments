
void setup (){
size (400,400);
smooth();
}
void draw (){
fill (49,0,0);
stroke (10);
ellipse(110,150,100,50);
ellipse(300,150,100,50);
fill (10);
stroke (10);
ellipse(110,150,100, mouseX/20);
ellipse(300,150,100, mouseY/20);
fill (0,255,0);
stroke (10);
ellipse(110,150,25,mouseX/20);
ellipse(300,150,25,mouseY/20);
fill (10);
ellipse(200,320,120,mouseX/3);
ellipse(200,320,120,mouseY/10);
stroke (10);
fill (50,0,0);
triangle(10,130,400,20,20,20);
triangle(200,130,400,20,20,20);
triangle(300,130,400,20,20,20);
triangle(400,130,400,20,20,20);
fill (10,0,0);
stroke (10);
arc(200,230,80,90,3.14,6.28);
fill (25,0,0);
stroke (10);
ellipse(340,240,5,5);
ellipse(90,240,5,5);
ellipse(330,241,5,5);
ellipse(80,241,5,5);
}








