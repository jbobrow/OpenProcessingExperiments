
void setup (){
size (500, 500);
frameRate(20);



}

void draw (){
  



smooth();

if (mousePressed == true) {
  int belly =round(random (0, 2));
  if (belly==0){
  
    snake(mouseX, mouseY, 0);
  }
  if (belly==1){
    snake (mouseX, mouseY, 20);
  }
  }

}
  

void snake(int x, int y, int z){
  

//body//
strokeWeight (2);
fill (73, 103, 5);



beginShape();
curveVertex(x-10, y-30);
curveVertex(x-10, y-30);
curveVertex(x-15, y-10);
curveVertex(x-15-(z/2), y-10);
curveVertex(x-20-z, y+20);
curveVertex(x-10-(z/2), y+40);
curveVertex(x-10, y+40);
curveVertex(x-5, y+50);

curveVertex(x-20, y+55);
curveVertex(x-70, y+30);
curveVertex(x-90, y+40);


curveVertex(x-110, y+70);
curveVertex(x-80, y+50);

curveVertex(x-20, y+80);

curveVertex(x+25, y+65);
curveVertex(x+17, y+44);
curveVertex(x+17+(z/2), y+44);
curveVertex(x+5+(z*1.5), y+17);
curveVertex(x+5+(z/2), y-5);
curveVertex(x+5, y-5);

curveVertex(x+10, y-30);
curveVertex(x+10, y-30);
endShape();




//tongue//
stroke (255, 0, 0);
line (x, y-40, x, y-10);
//head//
stroke (0, 0, 0);
fill (73, 103, 5);
ellipse (x, y-50, 50, 50);

fill (255);
ellipse (x-10, y-75, 30, 25);
ellipse (x+10, y-75, 30, 25);

fill (185, 138, 34);
ellipse (x-10, y-70, 10, 10);

ellipse (x+10, y-70, 10, 10);
ellipse (x-10,y-70, 3, 3);
ellipse (x+10, y-70, 3, 3);
ellipse (x-7, y-40, 2, 2);
ellipse (x+7, y-40, 2, 2);

}

 

