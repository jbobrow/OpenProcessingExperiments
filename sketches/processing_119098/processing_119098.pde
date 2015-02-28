
//20131105 processing test - Horus Wang
//test some basical command

void setup(){
size(600,600);
background(255);
smooth();
}

void draw(){
fill(mouseX, mouseY,1.5*(mouseX+mouseY)/2);
noStroke();
ellipse(width/2,height/2,3*mouseX,3*mouseY);

}


