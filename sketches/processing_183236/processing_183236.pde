
/*=====================
Jasmine Rajavadee.
rajavadeej@yahoo.com
Art 3001; Internet art; Florence Gouvrit
Robot Project, 01/21/2015 through 01/26/2015

It's a robot with a flower on its head. 

=======================*/ 
int c1 = 25; //petals, arm joints
int legj = 40; //Leg joints
int eyes1 = 50; //eye shape

size(600, 900); 
background(247, 231, 170); 
smooth(); 
/////////////////////////////////////
 
stroke(100); 
//body 
fill(200); 
rect(275, 350, 50, 50); 
fill(232, 188, 75); 
triangle(200, 400, 400, 400, 300, 550); 
fill(86, 140, 180);
arc(300, 550, 50, 50, PI, TWO_PI); 
fill(200); 
rect(190, 550, 220, 35); 

//flower
fill(90, 255, 90); 
stroke(17, 62, 8); 
triangle(300, 190, 350, 150, 325, 180); 
triangle(300, 190, 250, 150, 275, 180); 
strokeWeight(3); 
line(300, 190, 300, 100); 
stroke(100); 
strokeWeight(1); 
fill(242, 237, 71); 
ellipse(300, 100, 50, 50); 
fill(90, 229, 193); 
ellipse(300, 50, c1, c1); 
ellipse(250, 100, c1, c1); 
ellipse(350, 100, c1, c1); 
ellipse(275, 140, c1, c1); 
ellipse(325, 140, c1, c1); 
ellipse(265, 65, c1, c1); 
ellipse(335, 65, c1, c1); 

//legs
fill(200); 
rect(200, 585, 30, 100); 
rect(370, 585, 30, 100); 
fill(183, 39, 39); 
quad(200, 705, 230, 705, 250, 820, 180, 820); 
quad(370, 705, 400, 705, 420, 820, 350, 820); 
fill(86, 140, 180); 
ellipse(215, 590, legj, legj); 
ellipse(385, 590, legj, legj); 
ellipse(215, 700, legj, legj); 
ellipse(385, 700, legj, legj); 

//arms
strokeWeight(3); 
stroke(21, 72, 131); 
line(210, 420, 120, 500); 
line(390, 420, 480, 500);  
strokeWeight(1); 
stroke(100); 
fill(86, 140, 180); 
ellipse(210, 420, c1, c1); 
ellipse(390, 420, c1, c1); 
ellipse(165, 460, c1, c1); 
ellipse(435, 460, c1, c1); 
fill(183, 39, 39); 
triangle(420, 530, 510, 450, 600, 600); 
ellipse(100, 520, 200, 100); 

//head
fill(232, 188, 75); 
rect(200, 225, 200, 150, 0, 0, 10, 10); 
fill(183, 39, 39); 
rect(170, 190, 260, 35, 0, 0, 20, 20); 
fill(240); 
rect(210, 235, 180, 130, 25); 
fill(0, 185, 255);  
ellipse(250, 290, eyes1, eyes1); //backup eyes
ellipse(350, 290, eyes1, eyes1); //backup eyes 
arc(250, 290, eyes1, eyes1, QUARTER_PI, PI+2.34, PIE); 
arc(350, 290, eyes1, eyes1, QUARTER_PI, PI+2.34, PIE); 
