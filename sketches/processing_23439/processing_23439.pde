
size(500,500); //creates a canvas 300x300pix
fill(0,76);//colours the objects on black and transparancy
smooth(); //smooths the edges of the object
noStroke(); //removes the outline of the shapes

color ruby = color(55,24,24,160); // RGB color numbers, the 4th is the transparency=160

color pink= color(237,159,176,100);
background (pink); //background colour


   
   
for (int i = 20; i < width; i += 20){ //loop for a repeating ellipse pattern.

  for(int a=20; a < height; a += 20){
    
  

ellipse (i,a,40,40);
   fill (ruby);

  }
}  

fill(178,160,160);
noStroke();
ellipse(250,210,250,250); //head

//color white = color(252,252,255, 190);

fill(178,160,160);
triangle(146, 160, 158, 50, 202, 160); //ears

fill(178,160,160);
triangle(300, 160, 332, 50, 356, 160); //ears

fill(178,160,160);
noStroke();
rect(225, 320, 60, 90); //body

fill(8,0,0);
ellipse(215,150,65,65); //eye

fill(8,0,0);
ellipse(285,150,20,20); // Right eye

fill(55,24,24);
ellipse(215,150,50,50); //eye

fill(237,159,176,100);
ellipse(215,150,30,30); //eye

fill(8,0,0);
arc(250, 255, 50, 50, 0, PI); //mouth

stroke(126);
strokeWeight(4);
line(225,360,80,90); //arms

stroke(126);
strokeWeight(4);
line(285,360,450,90); //arms

fill(178,160,160);
noStroke();
arc(225, 400, 50, 50, 0, PI); //feet

fill(178,160,160);
noStroke();
arc(285, 400, 50, 50, 0, PI); //feet

