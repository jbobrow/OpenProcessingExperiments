
size(400, 300);
background(132, 224, 255);

//sun
noStroke();
fill(255, 214, 0);
ellipse(250, 100, 120, 120);

fill(255, 236, 0);
ellipse(238, 88, 80, 80);

fill(255, 249, 69);
ellipse(230, 80, 50, 50);

//sand landscape
noStroke();
fill(255, 243, 183);
beginShape();
vertex(0, 100);
vertex(130, 110);
vertex(310, 100);
vertex(400, 110);
vertex(400, 300);
vertex(0, 300);
endShape(CLOSE);

rectMode(CORNER)
fill(255, 231, 169)
rect(0, 230, 400, 100)
fill(245, 213, 162)
rect(0, 270, 400, 50)
//pyramid back
noStroke();
fill(237, 193, 134);
triangle(140, 130, 240, 130, 190, 70);

fill(189, 110, 72);
triangle(140, 130, 190, 70, 140, 110);

//pyramid front
noStroke();
fill(255, 215, 156);
triangle(20, 160, 180, 160, 100, 50);

fill(212, 123, 81);
triangle(20, 160, 100, 50, 0, 130);

//front grass thing
noStroke();
fill(29, 64, 49);
beginShape();
vertex(100, 300);
vertex(180, 250);
vertex(310, 270);
vertex(400, 220);
vertex(400, 300);
endShape(CLOSE);

//leaf and grass folds
noStroke();
fill(71, 158, 121);
triangle(200, 250, 210, 230, 215, 240);
triangle(340, 255, 340, 240, 350, 260);
triangle(390, 230, 390, 255, 380, 240);

//grass blades and flower stems
noStroke();
fill(116, 237, 198);
triangle(250, 300, 260, 300, 210, 230);

fill(108, 219, 183);
triangle(220, 300, 240, 300, 240, 220);

fill(98, 199, 166);
triangle(265, 300, 295, 300, 280, 230);

fill(98, 217, 166);
triangle(280, 300, 300, 300, 310, 220);

fill(116, 237, 198);
triangle(315, 300, 340, 300, 340, 240);

fill(98, 199, 166);
triangle(400, 290, 400, 270, 370, 220);

//green lines under the flowers
stroke(71, 158, 121);
line(240, 220, 230, 215);
line(240, 220, 250, 215);
line(310, 220, 320, 220);
line(310, 220, 300, 215);
line(370, 220, 380, 220);
line(370, 220, 365, 225);

//other flower petals
noStroke();
fill(247, 62, 23);
triangle(240, 220, 245, 195, 255, 200);
triangle(240, 220, 225, 200, 240, 200);
triangle(310, 220, 300, 200, 310, 205);
triangle(310, 220, 330, 200, 320, 190);
triangle(370, 220, 350, 220, 360, 210);
triangle(370, 220, 380, 210, 370, 205);

//middle petal of each flower
stroke(166, 42, 15);
fill(247, 62, 23);
triangle(240, 220, 230, 190, 245, 195);
triangle(310, 220, 310, 200, 320, 190);
triangle(370, 220, 350, 210, 370, 210);

//dark section of petals
noStroke();
fill(166, 42, 15);
triangle(245, 195, 230, 190, 250, 190);
triangle(300, 200, 310, 205, 310, 200);
triangle(310, 200, 310, 195, 320, 190);
triangle(370, 210, 370, 200, 350, 210);

/*The inspiration for my project was Mark Webster.  
Many of his works are very geometric landscapes, including 
deserts, ocean scenes, and a  distinct flower design that 
appears in many of his pieces.
I attempted to reflect this artist's style with the similar
layout that his uses as well as the color scheme that he 
uses for this type of landscape.  As well as using the same types
of geometric shapes found in many of Webster's works.
I also did my best to recreate my own version of Webster's 
signature flower.*/

