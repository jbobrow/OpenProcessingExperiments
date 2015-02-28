
size(200,200);
}
void draw(){
background(0);
fill(54,9,9);
rect(mouseX,mouseY,20,20);     // Startcoordinaten 20,40
rect(mouseX,mouseY+20,20,20);
rect(mouseX+20,mouseY+20,20,20);
rect(mouseX+40,mouseY,50,90);
rect(mouseX+90,mouseY+20,20,20);
rect(mouseX+110,mouseY+20,20,20);
rect(mouseX+110,mouseY,20,20);
rect(mouseX+40,mouseY+90,20,20);
rect(mouseX+70,mouseY+90,20,20);
fill(0,0,0);
triangle(mouseX+42,mouseY+2,mouseX+42,mouseY+20,mouseX+60,mouseY+10);
triangle(mouseX+70,mouseY+10,mouseX+88,mouseY+2,mouseX+88,mouseY+20);
triangle(mouseX+65,mouseY+15,mouseX+55,mouseY+55,mouseX+75,mouseY+55);
}
