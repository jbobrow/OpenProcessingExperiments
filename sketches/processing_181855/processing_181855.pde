
void setup(){
  
  size (255, 255);
}

void draw(){
  
 background (mouseY, mouseX, 100);
 
//Línies
stroke(random(255), random(255), random(255));
line(mouseX-30, mouseY-30, mouseX+30, mouseY+30);

stroke(random(255), random(255), random(255));
line(mouseX+30, mouseY-30, mouseX-30, mouseY+30);
stroke(random(255), random(255), random(255));
line(mouseX-50, mouseY, mouseX+50, mouseY);

stroke(random(255), random(255), random(255));
line(mouseX, mouseY-50, mouseX, mouseY+50);

strokeWeight(4);

//triangle
stroke(random(255), random(255), random(255), 150);
fill(100, mouseY, mouseX, 150);
triangle(0, 50, 50, 0, 0, 0);
triangle(0, 205, 50, 255, 0, 255);
triangle(205, 0, 255, 50, 255, 0);
triangle(255, 205, 205, 255, 255, 255);




//Rodones
fill(mouseX, 75, mouseY);
stroke(random(50,100), random(50,100), random(50,100));
ellipse(mouseX, mouseY, mouseY/2, mouseY/2);

stroke(random(100,150), random(100,150), random(100,150));
fill(255, mouseX, mouseY);
ellipse(mouseX-30, mouseY-30, mouseY/4, mouseY/4);
ellipse(mouseX+30, mouseY-30, mouseY/4, mouseY/4);
ellipse(mouseX-30, mouseY+30, mouseY/4, mouseY/4);
ellipse(mouseX+30, mouseY+30, mouseY/4, mouseY/4);

fill(mouseX, mouseY, 255);
ellipse(mouseX+60, mouseY, random(20, 30), mouseY/3);
ellipse(mouseX-60, mouseY, random(20, 30), mouseY/3);
ellipse(mouseX, mouseY+60, mouseX/3, random(20, 30));
ellipse(mouseX, mouseY-60, mouseX/3, random(20, 30));


}
