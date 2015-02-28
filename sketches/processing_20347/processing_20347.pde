
void setup() {
size (700,300);
background (000);
colorMode(HSB, 600, 100, 600);
smooth();

}



void draw() {
println(mouseX + " " + mouseY);
base();
//minie();
//lin();
inarc();
inellip();

}

//void keyPressed() {;}
  
void mousePressed() {
 save("skecthbanner.jpeg");

background(000);

}



void base() {
  
stroke(mouseX, 60, mouseY, 100);
strokeWeight(2);
noFill();
ellipse(mouseX, mouseY, random(40), random(40));
}

 /*
void lin() {
 stroke(0, 0);
strokeWeight(0);
 line(mouseX, mouseY, mouseX+50, mouseY+50);
 }
 
void minie() {
 stroke(mouseX, 100, mouseY, 100);
 ellipse(mouseX-40, mouseY-40, random(20), random(20));
 ellipse(mouseX+40, mouseY+40, random(20), random(20));
 ellipse(mouseX+40, mouseY-40, random(20), random(20)); 
 ellipse(mouseX-40, mouseY+40, random(20), random(20));
 
 }
*/


void inarc(){
stroke(61, 97, 99, 100);
strokeWeight(1);
noFill();
arc(mouseX, mouseY, mouseX-50, mouseY-150, 0, random(2));
arc(mouseX, mouseY, mouseX-50, mouseY-150, 3, random(4));
arc(mouseX, mouseY, mouseX-150, mouseY-50, 1.5, random(6));
//arc(mouseX, mouseY, mouseX, 100, 1.5, 5);

}

void inellip(){
  
stroke(mouseX, 60, mouseY, 100);
strokeWeight(2);
noFill();
ellipse( mouseX, mouseY, mouseX, mouseY);



}







