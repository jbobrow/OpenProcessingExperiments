
void setup()
{
  size(600, 600);
  smooth();

}

void draw() {
  background(255);
  

  pushMatrix();
  translate(320, 300);
  fill(#FF0009);
  noStroke();
  rotate(radians(40));

  ellipse(0, 0, 100, 150);
  popMatrix();
  
   pushMatrix();
  translate(270, 300);
  fill(#FF0009);
  noStroke();
  rotate(radians(320));

  ellipse(0, 0, 100, 150);
  popMatrix();
  
fill(#030303);
triangle(mouseX-50,mouseY+-100, mouseX+100,mouseY +60, mouseX+5,mouseY-100);
if(mousePressed){  fill(#FFFFFF);
rect(0,0,width,height);
fill(#FF0009);
  triangle(50,20, 40,10, 5,60);
    triangle(130,100, 70,50, 50,90);
    triangle(100,60, 160,30, 130,80);
    triangle(100,60, 160,30, 130,80);
     triangle(130,90, 190,10, 160,80);
     triangle(140,150, 230,20, 200,120);
     triangle(160,190, 230,155, 280,200);
     triangle(370,140, 280,199, 340,100);
     triangle(50,360, 40,330, 30,333);
     triangle(90,300, 149,279, 79,333);
     triangle(300,300, 246,346, 279,344);
     triangle(300,279, 345,236, 279,399);
     triangle(356,386, 322,368, 389,322);
      triangle(296,346, 268,345, 330,489);
       triangle(306,319, 199,345, 111,391);
       triangle(144,400, 96,300, 26,391);
       triangle(444,560, 387,312,490,333);
       triangle(520,300, 493,490,344,377);
 }
}


