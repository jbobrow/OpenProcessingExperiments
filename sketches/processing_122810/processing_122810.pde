
void setup() {
size(300,300);
}

void draw() {
background(255);
stroke(0);
strokeWeight(2);
line(mouseX +20,mouseY +10,mouseX +45,mouseY+35);
line(mouseX+145,mouseY+10,mouseX+125,mouseY+35);
fill(0,255,0,220);    //stokbolletjes\\
ellipse(mouseX+20,mouseY+10,20,20);
ellipse(mouseX+145,mouseY+10,20,20);


fill(255,0,0,220);
ellipse(mouseX+80,mouseY+84,145,120);  //face\\

fill(0,0,255);
ellipse(mouseX+20,mouseY+70,40,40);  //eyes\\
ellipse(mouseX+145,mouseY+70,40,40);

stroke(0);
line(mouseX+30,mouseY+110,mouseX+130,mouseY+110);  //mouth\\

println("i'm an alien");
}
