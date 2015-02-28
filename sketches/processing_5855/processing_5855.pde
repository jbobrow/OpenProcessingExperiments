
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

void setup(){
size(600,600);
smooth();
noStroke();
frameRate(30);
}


void draw(){
background(93,105,209);
ellipseMode(CENTER);

//hoofd
fill(255);
//ellipseMode(CENTER);
ellipse(mouseX,mouseY,100,100);
//oor links
ellipse(mouseX-30,mouseY-75,50,90);
//oor rechts
ellipse(mouseX+30,mouseY-75,50,90);
//buik
ellipse(mouseX,mouseY+100,120,150);
//voetje rechts
ellipse(mouseX+30,mouseY+180,40,70);
//voetje links
ellipse(mouseX-30,mouseY+180,40,70);
//handje links
ellipse(mouseX-55,mouseY+65,50,50);
//handje rechts
ellipse(mouseX+55,mouseY+65,50,50);
//invullig oor links
fill(242,130,170);
ellipse(mouseX-30,mouseY-75,30,70);
//invulling oor rechts
ellipse(mouseX+30,mouseY-75,30,70);
//
ellipse(mouseX-30,mouseY+180,25,55);
//
ellipse(mouseX+30,mouseY+180,25,55);
fill(0);
ellipse(mouseX-10,mouseY-10,6,6);
ellipse(mouseX+10,mouseY-10,6,6);
}



