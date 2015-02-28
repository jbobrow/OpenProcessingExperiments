
/*
Interaction Venice logo design

The logo of the interaction course, comes out combining 
different logo that each student create for himself/herself.

This is the application with which each student can create 
his personal shape.

names: carla felicetti, taja luxa, helena principato
date: 19/10/2012

Version: 1 

*/

/*import processing.pdf.*;

boolean pdfCheck = false;*/

int d = 80;
int counter = 0;


int[] r = { 
  255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
  255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
  255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
  255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
  255, 255, 255, 255, 255, 255, 255, 255, 255, 255
};

int[] g = { 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

int[] b = { 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

void setup() {
  size(400, 400, P2D);

  stroke(0);
  
}

void draw() {
  /*if(pdfCheck){
    beginRecord(PDF, "file.pdf");
  }*/
  
  counter = 0;
  for (int y = 0; y < height; y = y + d) {
    for (int x = 0; x < width; x = x + d) {
      // bottom-left triangle
      fill(r[counter], r[counter], r[counter]);

      triangle(x, y, x + d, y + d, x, y + d);
      fill(0);
      text(counter, x, y + d);

      if (dist(mouseX, mouseY, x + 28, y + 60) < 30 && mousePressed) {
        println(counter);
        r[counter] = 0;
      }

      counter++;

      fill(r[counter], r[counter], r[counter]);

      triangle(x, y, x + d, y, x + d, y + d);
      fill(0);
      text(counter, x + d/2, y + 10);

      if (dist(mouseX, mouseY, x + 60, y + 28) < 30 && mousePressed) {
        println(counter);
        r[counter] = 0;
      }

      counter++;
    }
  }
  
 /* if(pdfCheck){
    endRecord();
    pdfCheck = false;
  }*/
}

/*void mousePressed(){
  pdfCheck = true;
}
*/
