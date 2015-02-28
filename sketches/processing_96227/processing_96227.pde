
void setup(){
  
size(260,260);
background(240,120,7);
}

void draw(){
    
  fill(255);
triangle(0,260,130,0,260,260);

fill(240,120,7);
rect(0,250,0,260,260,250,260,260);
strokeWeight(6);
line(150,240,180,240);
line(150,240,120,220);
line(120,220,105,180);
line(105,180,90,175);
line(90,175,80,140);
line(80,140,95,145);
line(95,145,80,100); 
line(180,240,210,220);
line(210,220,220,150);

strokeWeight(4);
line(mouseX-130+130,mouseY-130+155,mouseX-130+130,mouseY-130+105);
line(mouseX-130+105,mouseY-130+130,mouseX-130+155,mouseY-130+130);
line(mouseX-130+110,mouseY-130+140,mouseX-130+150,mouseY-130+120);
line(mouseX-130+120,mouseY-130+150,mouseX-130+140,mouseY-130+110);
line(mouseX-130+150,mouseY-130+140,mouseX-130+110,mouseY-130+120);
line(mouseX-130+120,mouseY-130+110,mouseX-130+140,mouseY-130+150);
ellipse(mouseX,mouseY,30,30);
 
 fill(mouseX,mouseY,0,255);
ellipse(mouseX,mouseY,30,30);
fill(0);
ellipse(mouseX,mouseY,8,8);

fill(0);
ellipse(160,60,180,80);
noStroke();
fill(240,120,7);
triangle(0,0,130,0,0,265);
triangle(130,0,260,0,260,260);
strokeWeight(15);
stroke(240,120,7);
line(0,260,260,260);

 
noFill();
strokeWeight(9);
stroke(0);
triangle(10,250,130,10,250,250);

strokeWeight(5);

}



