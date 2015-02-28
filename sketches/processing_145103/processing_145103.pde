
void setup(){
size(400,400);

background(250);
}

void draw() {
fill(220);
rect(150,150,100,100);

line(220,120,210,150);
line(200,150,200,190);
line(200,190,150,230);

// nieten
fill(0);
noStroke();
ellipse(195,160,2,2);
ellipse(195,168,2,2);
ellipse(195,176,2,2);
ellipse(195,184,2,2);

ellipse(205,160,2,2);
ellipse(205,168,2,2);
ellipse(205,176,2,2);
ellipse(205,184,2,2);

ellipse(190,190,2,2);
ellipse(180,198,2,2);
ellipse(170,206,2,2);
ellipse(160,214,2,2);

ellipse(190,207,2,2);
ellipse(180,215,2,2);
ellipse(170,225,2,2);
ellipse(200,200,2,2);


// Augen


noStroke();
ellipse(map(mouseX,0,400,165,185),map(mouseY,0,400,165,185),5,5);
ellipse(map(mouseX,0,400,215,235),map(mouseY,0,400,165,185),5,5);

  
noFill();
stroke(0);
ellipse(175,175,30,30);
ellipse(225,175,30,30);
 
if (mousePressed) {
fill(0);
ellipse(map(mouseX,0,400,165,185),map(mouseY,0,400,165,185),15,15);
ellipse(map(mouseX,0,400,215,235),map(mouseY,0,400,165,185),15,15);

}




//kugel der Antenne
fill(0);
ellipse(220,120,10,10);

line(180,230,220,230);

line(160,155,180,160);
line(220,160,240,155);
}
