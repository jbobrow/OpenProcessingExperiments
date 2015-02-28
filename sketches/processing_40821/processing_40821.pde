
void setup ( ) {
size (550, 350);
background (100);

A1= 0;
A2= 0;
A3= 0;
}

int A1;
int A2;
int A3;

void draw ( ) {

fill(#FF9933,12);
ellipse (mouseX +1 , mouseY -1, 75, 75);  
  
delay(10);
stroke(255,10,10,5);
fill(220,15, 0, 10);
ellipse(100, 100, 175, 175);
fill(175,15,0,10);
ellipse(100, 100, 90, 90);
fill(125,15,0,10);
ellipse(50, 50, 40, 40);
fill(100,15,0,0);
ellipse(225,150,250,250);
fill(215,15,0,5);
ellipse(375,275,200,200);
fill(100,15,0,0);
ellipse(400,300,250,250);
fill(220,15, 0, 10);
ellipse(100, 100, 175, 175);
fill(175,15,0,10);
ellipse(137, 299, 190, 190);
fill(125,15,0,10);
ellipse(450, 350, 400, 400);
fill(100,15,0,0);
ellipse(25,227,199,199);
fill(165,15,0,5);
ellipse(123,10,90,90);
fill(100,15,0,0);
ellipse(325,100,325,325);


fill(200,2);
ellipse(50,A1 + 1,100,100);
A1 ++;
fill(200,2);
ellipse(150,A1 + 1,100,100);
A1 ++;

fill(200,2);
ellipse(250,A2 + 1,175,175);
A2 ++;
fill(200,2);
ellipse(350,A2 + 1,225,225);
A2 ++;

fill(200,2);
ellipse(375,A3 + 1,175,175);
A3 ++;
fill(200,2);
ellipse(450,A3 + 1,225,225);
A3 ++;

}




void mousePressed(){
  fill(#33FFFF,30); 
  ellipse(mouseX,mouseY,250,250);
}

