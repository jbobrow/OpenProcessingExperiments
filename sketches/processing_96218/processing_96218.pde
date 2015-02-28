
void setup(){
  
  size(800,800);
background(30,140,20);
  
}

void draw(){
  fill(255);
  rect(-10,-10,810,810);
  fill(255,0,0);
triangle(mouseX-110,mouseY-80,mouseX-80,mouseY-110,mouseX-80,mouseY-50);  triangle(mouseX-70,mouseY-80,mouseX-100,mouseY-110,mouseX-100,mouseY-50);
stroke(0,0,255);
 
line(mouseX-80,mouseY-90,mouseX-30,mouseY-90);
line(mouseX-80,mouseY-70,mouseX+260,mouseY-70);

 line(mouseX-30,mouseY-90,mouseX-30,mouseY+30);

stroke(255,0,255);
fill(34,54,56);
ellipse(mouseX-70,mouseY+30,80,50);
 
strokeWeight(3);
 
fill(32,221,10);
triangle(mouseX+130,mouseY+130,mouseX+130,mouseY-70,mouseX-70,mouseY+130);
 
fill(30,30,255);
triangle(mouseX+125,mouseY+125,mouseX+125,mouseY-30,mouseX-30,mouseY+125);
 
fill(32,221,10);
triangle(mouseX+120,mouseY+120,mouseX+120,mouseY+10,mouseX+10,mouseY+120);
 
fill(30,30,255);
triangle(mouseX+115,mouseY+115,mouseX+115,mouseY+50,mouseX+50,mouseY+115);

}

 



