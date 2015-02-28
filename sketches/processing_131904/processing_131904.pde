
/* @pjs preload="scene.jpg"; font = "steelfish.ttf"; */

PImage scene; //scene
PFont lana; //nickname
int x=0;

void setup(){
  size (608, 608);
  background (0);
  scene = loadImage ("scene.jpg");
  lana = createFont("steelfish.ttf", 170);
  noStroke();
}

void draw(){
  
  image(scene, 0, 0); // IMAGE
  textFont(lana, 170);
  fill(#FFFFFF);
  text("LANA DEL REY", 5, 160);  
  
fill(#AA5226);
rect(220, 150, 180, 300, 200); //hair

fill(#AA5226);
rect(205, 316, 80, 90, 200); //hair detail (left)

fill(#AA5226);
rect(376, 230, 30, 100, 200);//right hair detail

fill(#AA5226);
rect(390, 260, 20, 120, 200);

fill(#AA5226);
rect(209, 313, 40, 90, 10);//hair 

fill(#FFFFFF);
ellipse(310, 415, 299, 100); //top of shirt

//fill(#FFFFFF);
//rect(115, 402, 70, 210, 10);//left sleeve

fill(#FFFFFF);
rect(158, 398, 300, 210, 10); //shirt

fill(#FFFFFF);
rect(158, 593, 300, 270); // bottom of shirt

fill(#F5CEBE);
rect(263, 293, 80, 75); //neck

//fill(#864527);
//rect(248, 290, 4, 78, 100); //left hair detail   

//println(mouseX + ", " + mouseY) ;
//ellipse(mouseX, mouseY, 10, 10);

fill(#FFD2BF);
ellipse(300, 250, 114, 170);//head

fill(#AA5226);
rect(213, 288, 30, 50, 8); //hair left

//fill(#AA5226);
//triangle(320, 225, 320, 221, 350, 225);//right eyebrow2

fill(#AA5226);
rect(320, 222, 30, 4, 80); //left eyebrow2

fill(#000000);
ellipse(335, 238, 25, 12); // above right eye (black)

fill(#FFFFFF);
ellipse(335, 240, 25, 12); // right eye (white)
 
fill(#4D2E1E);
ellipse(335, 240, 13, 12); // right pupil (brown)
 
fill(#000000);
ellipse(335, 240, 7, 5); // right pupil detail (black)

fill(#000000);
rect(258, 236, 7, 3);//left eye makeup

fill(#AA5226);
rect(257, 222, 32, 4, 80); //left eyebrow2 

//fill(#AA5226);
//triangle(252, 225, 290, 225, 290, 221); //left eyebrow

fill(#000000);
ellipse(275, 238, 25, 12); // under left eye (black)

fill(#FFFFFF);
ellipse(275, 240, 25, 12); // left eye (white)
 
fill(#4D2E1E);
ellipse(275, 240, 13, 12); // left pupil (brown)
 
fill(#000000);
ellipse(275, 240, 7, 5); // left pupil detail (black)

fill(#F5CEBE);
rect(301, 223, 10, 37); //nose

fill(#F5CEBE);
triangle(295, 279, 305, 236, 317, 279); //bottom of nose
  
fill(#D36262);
rect(285, 300, 40, 5, 7); //mouth

fill(#D36262);
triangle(285, 300, 300, 295, 310, 300); //left part of lip

fill(#D36262);
triangle(300, 300, 315, 295, 325, 300);//right part of lip

fill(#D36262);
rect(287, 300, 36, 11, 4);//bottom lip

fill(#F5CEBE);
triangle(262, 367, 305, 395, 343, 367);//bottom of neck

fill(#864527);
triangle(283, 164, 369, 270, 355, 170); //bangs2

fill(#AA5226);
triangle(294, 164, 373, 280, 362, 170); //bangs

fill(#F7F0ED);
rect(298, 392, 15, 300);//button 
  
fill(#F7F0ED);
rect(210, 520, 58, 12); //left pocket

fill(#F7F0ED);
rect(343, 520, 58, 12);//right pocket

fill(#F7F0ED);
triangle(263, 367, 266, 410, 299, 391); //left collar

fill(#F7F0ED);
triangle(343, 367, 340, 410, 310, 391);//right collar

fill(#C4494B);
rect(286, 303, 39, 1); //lip divide (red)

fill(#CBAA9C);
ellipse(301, 275, 3, 4);//left nostril

fill(#CBAA9C);
ellipse(310, 275, 3, 4);//right nostril

//fill(#000000);
//rect(290, 308, 30, 1); //under mouth

//fill(#94B7AE);
fill(#6FB6C4);
textFont(lana, 70);
text("BORN TO DIE", x, 580); //moving text
x = x + 1 ;
//println(x) ; 
if (x > 600) {
x = 0 ;
  
}
}


