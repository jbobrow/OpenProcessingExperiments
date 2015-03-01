
//import processing.pdf.*;

color[]beach={#ff8b00,#1bcc81,#cca014,#40f5ff,#ff7608,#1bcc81};
color[]palette=beach;

float s;
float x;
float y;

void setup(){
  size(500,500);
  background(0);
  smooth();
  //beginRecord(PDF,"arc.pdf");
}

void draw(){
  
  s = random(255);
  x = random(width);
  y = random(height);
frameRate(s);
stroke(palette[int(random(0,5))]);
line(250,x+5,y,y+5);

}

//void mouseClicked(){
  //endRecord();
  //noLoop();
 // }


