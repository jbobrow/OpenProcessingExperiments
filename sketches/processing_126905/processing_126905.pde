
int counter;
void setup() {
  size(500, 500);            //grootte van het document
 
}

//referentiepunt:250,250
void draw() {
  background(255);           //een witte achtergrond
fill(9,122,220);             
stroke(8,99,179);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,250,200);



stroke(0);
strokeWeight(8);
line(mouseX-125,mouseY,mouseX-170,mouseY-70);
stroke(0);



stroke(9,72,127);
strokeWeight(2);
fill(251,251,238);
ellipse(mouseX-50,mouseY-65,100,100);
ellipse(mouseX+50,mouseY-55,80,80);


fill(0);
stroke(236,27,32);
strokeWeight(3);
ellipse(mouseX-50,mouseY-50,45,45);
ellipse(mouseX+50,mouseY-45,40,40);

println("blauw");
}

