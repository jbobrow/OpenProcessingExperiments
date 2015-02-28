
//Lia Bogoev
//4.112 Project 1
//Arginine Methylation
import netscape.javascript.*;
import processing.pdf.*;

int linenumber = 100;
int linelength = 80;

int foo = 0;
float Angle;
spring[] springs = new spring[linenumber];


void setup() {
 size(800,600);

 smooth();
 
 for (int i = 0; i < linenumber; i++) {
   Angle = random(2*PI);
   springs[i] = new spring(random(width), random(height), Angle);
  }
}



void draw() {
  background(255, 255, 255);
  for (int k = 0; k < linenumber ; k++) {
    springs[k].render();
    for (int q = 0; q < linenumber; q++) {
      if (dist(springs[q].Xpos, springs[q].Ypos, springs[k].Xpos, springs[k].Ypos) < 100 && dist(springs[q].Xpos, springs[q].Ypos, springs[k].Xpos, springs[k].Ypos) > 30) {
        strokeWeight(1);
        line(springs[q].Xpos, springs[q].Ypos, springs[k].Xpos, springs[k].Ypos);
        //bezier(springs[q].Xpos, springs[q].Ypos, springs[q].Xpos + sin(Angle)*linelength, springs[q].Ypos + cos(Angle)*linelength, springs[k].Xpos, springs[k].Ypos, springs[k].Xpos + sin(Angle)*linelength, springs[k].Ypos + cos(Angle)*linelength);
      }
      if (dist(springs[q].Xpos, springs[q].Ypos, springs[k].Xpos, springs[k].Ypos) < 30) {
        strokeWeight(2);
        //line(springs[q].Xpos, springs[q].Ypos, springs[k].Xpos, springs[k].Ypos);
        bezier(springs[q].Xpos, springs[q].Ypos, springs[q].Xpos + sin(Angle)*linelength, springs[q].Ypos + cos(Angle)*linelength, springs[k].Xpos, springs[k].Ypos, springs[k].Xpos + sin(Angle)*linelength, springs[k].Ypos + cos(Angle)*linelength);
      }
    }
  }
}

//pressing "p" saves to PDF 
void keyPressed() {
  if (key == 'p') {
     endRecord();
     ++foo;
     beginRecord(PDF, "pic"+str(foo)+".pdf");
  }
}


