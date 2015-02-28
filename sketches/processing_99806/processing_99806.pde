
void setup(){
size(500,500);
line (250,0,250,500);
line(0,250,500,250);
background(250,250,210);
noStroke();
fill(205,38,38,255);
ellipse(100,100,100,100);
fill(205,38,38,225);
triangle(100,100,500,0,500,75);
triangle(100,100,500,300,500,400);
triangle(100,100,300,500,200,500);
triangle(100,100,50,500,-25,500);
triangle(100,100, 250,0,200,0);
triangle(100,100,125,0,115,0);
triangle(100,100,75,0,70,0);
triangle(100,100,5,0,0,0);
triangle(100,100,0,101,0,103);
noStroke();
fill(0,0,0,200);
rect(450,450,100,100);
rect(400,400,50,50);
rect(350,350,25,25);
rect(300,300,13,13);
rect(250,250,6,6);
rect(200,200,3,3);
rect(150,150,1.5,1.5);
ellipse(500,500,50,50);
ellipse(200,300,75,75);
ellipse(400,100,100,100);
ellipse(450,350,150,150);
ellipse(150,550,200,200);

}

void draw(){
if ((mouseX < 250) && (mouseY <250)){
noStroke();
line (250,0,250,500);
line(0,250,500,250);
background(250,250,210);
noStroke();
fill(205,38,38,225);
triangle(mouseX,mouseY,500,0,500,75);
triangle(mouseX,mouseY,500,300,500,400);
triangle(mouseX,mouseY,300,500,200,500);
triangle(mouseX,mouseY,50,500,-25,500);
triangle(mouseX,mouseY, 250,0,200,0);
triangle(mouseX,mouseY,125,0,115,0);
triangle(mouseX,mouseY,75,0,70,0);
triangle(mouseX,mouseY,5,0,0,0);
triangle(mouseX,mouseY,0,101,0,103);
noStroke();
fill(0,0,0,200);
rect(450,450,100,100);
rect(400,400,50,50);
rect(350,350,25,25);
rect(300,300,13,13);
rect(250,250,6,6);
rect(200,200,3,3);
rect(150,150,1.5,1.5);
ellipse(500,500,50,50);
ellipse(200,300,75,75);
ellipse(400,100,100,100);
ellipse(450,350,150,150);
ellipse(150,550,200,200);

fill(205,38,38);
ellipse(mouseX,mouseY,100,100);


}
else if((mouseX>=200) && (mouseY <=200)){
noStroke();
background(250,250,210);
noStroke();
fill(205,38,38,255);
ellipse(100,100,100,100);
fill(205,38,38,225);
triangle(100,100,500,0,500,75);
triangle(100,100,500,300,500,400);
triangle(100,100,300,500,200,500);
triangle(100,100,50,500,-25,500);
triangle(100,100, 250,0,200,0);
triangle(100,100,125,0,115,0);
triangle(100,100,75,0,70,0);
triangle(100,100,5,0,0,0);
triangle(100,100,0,101,0,103);
noStroke();
fill(0,0,0,200);
rect(450,450,100,100);
rect(400,400,50,50);
rect(350,350,25,25);
rect(300,300,13,13);
rect(250,250,6,6);
rect(200,200,3,3);
rect(150,150,1.5,1.5);
ellipse(500,500,50,50);
ellipse(200,300,75,75);

ellipse(mouseX,mouseY,100,100);
ellipse(450,350,150,150);
ellipse(150,550,200,200);

}

else if((mouseX>200) && (mouseY>200)){
noStroke();
background(250,250,210);
noStroke();
fill(205,38,38,255);
ellipse(100,100,100,100);
fill(205,38,38,225);
triangle(100,100,500,0,500,75);
triangle(100,100,500,300,500,400);
triangle(100,100,300,500,200,500);
triangle(100,100,50,500,-25,500);
triangle(100,100, 250,0,200,0);
triangle(100,100,125,0,115,0);
triangle(100,100,75,0,70,0);
triangle(100,100,5,0,0,0);
triangle(100,100,0,101,0,103);
noStroke();
fill(205,38,38,200);
rect(mouseX,mouseY,100,100);
fill(0,0,0,200);
rect(mouseX,400,50,50);
rect(mouseY,350,25,25);
rect(300,mouseY,13,13);
rect(250,mouseX,6,6);
rect(mouseX,mouseY,3,3);
rect(mouseY,150,1.5,1.5);
ellipse(500,500,50,50);
ellipse(200,300,75,75);
ellipse(400,100,100,100);
ellipse(450,350,150,150);
ellipse(150,550,200,200);



}
else if((mouseX<=200) && (mouseY>=200)){
noStroke();
size(500,500);
line (250,0,250,500);
line(0,250,500,250);
background(250,250,210);
noStroke();
fill(205,38,38,255);
ellipse(100,100,100,100);
fill(205,38,38,225);
triangle(100,100,500,0,500,75);
triangle(100,100,500,300,500,400);
triangle(100,100,300,500,200,500);
triangle(100,100,50,500,-25,500);
triangle(100,100, 250,0,200,0);
triangle(100,100,125,0,115,0);
triangle(100,100,75,0,70,0);
triangle(100,100,5,0,0,0);
triangle(100,100,0,101,0,103);
noStroke();
fill(0,0,0,200);
rect(450,450,100,100);
rect(400,400,50,50);
rect(350,350,25,25);
rect(300,300,13,13);
rect(250,250,6,6);
rect(200,200,3,3);
rect(150,150,1.5,1.5);
float x;
float ix;
x=mouseX;
ix=width-mouseX;
ellipse(mouseX,mouseY,50,50);
ellipse(mouseY,300,x,x);
ellipse(x,mouseX,100,100);
ellipse(mouseX,350,150,150);
ellipse(ix,height/2,x,x);

}
}
