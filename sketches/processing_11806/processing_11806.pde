
// Assignment #1
// Name: Lucia Echegorri
// E-mail: lechegorri@brynmawr.edu 
// Date: September 7th, 2010

void setup() {
smooth();
noLoop();
size(600,600);
background(255);

}
void draw() {
noStroke();
//first circle
fill(250,0,0,205);
ellipse(300,200,250,250);

//second circle
fill(255,255,0,205);
ellipse(175,300,250,250);

//third circle
fill(0,0,255,205);
ellipse(425,300,250,250);

//fourth circle
fill(0,0,0,205);
ellipse(300,400,250,250);

//first overlapping circle
fill(155,0,255,205);
ellipse(150,150,250,250);

//second overlapping circle
fill(0,255,0,205);
ellipse(450,150,250,250);

//third overlapping circle
fill(255,255,255,205);
ellipse(150,450,250,250);

//fourth overlapping circle
fill(60,10,5,205);
ellipse(450,450,250,250);

//upper left triangular corner
fill(0,0,0);
triangle(0,0,0,100,100,0);
triangle(50,50,100,75,75,100);
triangle(50,50,50,105,25,105);
triangle(50,50,105,50,105,25);

//lower right triangular corner
fill(0,0,255);
triangle(600,600,500,600,600,500);
triangle(550,550,575,500,550,500);
triangle(550,550,500,575,500,550);
triangle(550,550,525,500,500,525);

//lower left triangular corner
fill(255,0,0);
triangle(0,600,100,600,0,500);
triangle(50,550,25,500,50,500);
triangle(50,550,100,575,100,550);
triangle(50,550,75,500,100,525);


//upper right triangular corner
fill(255,255,0);
triangle(600,0,600,100,500,0);
triangle(550,50,500,75,525,100);
triangle(550,50,550,105,575,105);
triangle(550,50,495,50,495,25);


}

