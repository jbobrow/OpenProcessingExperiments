


void setup(){
  background(255);
  size(600,600);
}

void draw(){
fill(255);
rect(0,0,600,600);


strokeWeight(2);
fill(#23D824);
rect(mouseX-200,mouseY-200,20,20);
fill(#F59300);
strokeWeight(5);
rect(mouseX-185,mouseY-185,40,40);
fill(#23D824);
strokeWeight(10);
rect(mouseX-165,mouseY-165,80,80);
fill(#F59300);
strokeWeight(15);
rect(mouseX-125,mouseY-125,160,160);
fill(#23D824);
strokeWeight(20);
rect(mouseX-45,mouseY-45,245,245);
fill(#C41010);
noStroke();
ellipse(mouseX+120,mouseY+120,70,70);
stroke(#000000);
strokeWeight(5);
noFill();
ellipse(mouseX+120,mouseY-125,100,50);
ellipse(mouseX+120,mouseY-125,50,100);
fill(#000000);

ellipse(mouseX-125,mouseY+120,110,110);
stroke(#000000);
fill(#000000);
ellipse(mouseX+120,mouseY-125,30,30);
noFill();
stroke(#000000);
triangle(mouseX+120,mouseY-125,mouseX-125,mouseY+120,mouseX+120,mouseY+120);
noFill();
stroke(#FFFFFF);
ellipse(mouseX-125,mouseY+120,100,50);
ellipse(mouseX-125,mouseY+120,50,100);
stroke(#000000);
strokeWeight(10);
line(mouseX-1600,mouseY-1600,mouseX+1600,mouseY+1600);
stroke(#FBFF1C);
strokeWeight(5);
line(mouseX-1600,mouseY-1600,mouseX+1600,mouseY+1600);
fill(#000000);
stroke(#000000);
triangle(mouseX+120,mouseY+120,mouseX+120,mouseY-50,mouseX-50,mouseY+120);
fill(#C41010);
triangle(mouseX+120,mouseY+120,mouseX+120,mouseY-30,mouseX-30,mouseY+120);
fill(#FBFF1C);
triangle(mouseX+120,mouseY+120,mouseX+120,mouseY-10,mouseX-10,mouseY+120);
noSmooth();
stroke(#000000);
strokeWeight(3);

fill(#FFFFFF);
triangle(mouseX+110,mouseY+110,mouseX+110,mouseY+15,mouseX+15,mouseY+110);
noFill();
ellipse(mouseX+120,mouseY+120,80,80);
smooth();
fill(#FBFF1C);
quad(mouseX+50,mouseY+140,mouseX+20,mouseY+140,mouseX+20,mouseY+160,mouseX+50,mouseY+180);
quad(mouseX+10,mouseY+140,mouseX-20,mouseY+140,mouseX-20,mouseY+180,mouseX+10,mouseY+160);
triangle(mouseX+15,mouseY+170,mouseX+40,mouseY+185,mouseX-10,mouseY+185);
}


