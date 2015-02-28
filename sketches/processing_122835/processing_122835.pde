
void setup() {
size(500,500);
}
 
void draw() {
background(255);
stroke(0);
strokeWeight(2);
line(mouseX +20,mouseY +10,mouseX +45,mouseY+35);
line(mouseX+145,mouseY+10,mouseX+125,mouseY+35);
fill(mouseX,mouseY,0,220);                       //verandert van kleur\\
ellipse(mouseX+20,mouseY+10,20,20);
ellipse(mouseX+145,mouseY+10,20,20);        //stokbolletjes\\
 
 
fill(255,0,0,220);
ellipse(mouseX+80,mouseY+84,145,120);  //face\\
 
fill(mouseX,mouseY,180,230);                       //verandert van kleur\\
ellipse(mouseX+20,mouseY+70,40,40);  //eyes\\
ellipse(mouseX+145,mouseY+70,40,40);
 
stroke(0);
line(mouseX+30,mouseY+110,mouseX+130,mouseY+110);  //mouth\\
 
}
