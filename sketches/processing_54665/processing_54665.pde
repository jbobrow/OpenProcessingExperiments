
void setup () {
  size (600,600);
 frameRate(30);
 smooth();
}


void draw () {
background (76,209,205);
ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);
//draw legs and body
fill(34,240,24);
rect(pmouseX-10,pmouseY+50,5,25);
rect(pmouseX+10,pmouseY+50,5,25);
rect(pmouseX-15,pmouseY,25,5);
rect(pmouseX+15,pmouseY,25,5);
rect(pmouseX,pmouseY,25,85);
//draw antenna
ellipse(pmouseX,pmouseY-65,5,15);
fill(34,240,24);
//draw head
rect(pmouseX,pmouseY-35,50,50);
//fill eyes and eliipse 
fill(mouseX,40,mouseY);
//draw eyes and center ellipse 
rect(pmouseX-12,pmouseY-40,12,25);
rect(pmouseX+12,pmouseY-40,12,25);
ellipse(pmouseX,pmouseY+15,10,40);



}



