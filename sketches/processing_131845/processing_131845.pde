
/* @pjs preload= "delete.png"; */
/* @pjs preload= "glitch.jpg"; */

size(720, 400);
  smooth();
  PImage img;
img = loadImage("glitch.jpg");
image(img, 0, 0);


  
//big building
fill(255, 175, 113);
rect(100, 50, 150, 300);

fill(234, 213, 135);
rect(125, 75, 25, 25);
rect(200, 75, 25, 25);
rect(125, 125, 25, 25);
rect(200, 125, 25, 25);
rect(125, 175, 25, 25);
rect(200, 175, 25, 25);
rect(125, 225, 25, 25);
rect(200, 225, 25, 25);
rect(110, 260, 40, 80);
rect(200, 260, 40, 80);
rect(160, 300, 30, 50);

//art building
fill(136, 213, 232);
rect(250, 100, 150, 250);

fill(27, 103, 121);
quad(250, 100, 400, 120, 400, 250, 250, 120);

fill(151, 175, 180);
quad(280, 146, 400, 250, 300, 350, 250, 300);

//apartment building 
fill(240, 230, 194);
rect(400, 200, 250, 150);
line(425, 200, 425, 170); //banner line
line(625, 200, 625, 170); //banner line


strokeWeight(8);
stroke(255, 200, 0);
rect(415, 50, 220, 120); //banner
PImage img1;
img1 = loadImage("delete.png");
image(img1, 415, 50);



//windows
strokeWeight(1);
stroke(0);
line(400, 250, 650, 250);
line(400, 300, 650, 300);

fill(234, 213, 135);
rect(410, 210, 35, 30);
rect(510, 210, 35, 30);
rect(605, 210, 35, 30);

rect(410, 260, 35, 30);
rect(510, 260, 35, 30);
rect(605, 260, 35, 30);

rect(410, 310, 35, 30);
rect(605, 310, 35, 30);

//main door
noStroke();
fill(232, 131, 73);
rect(510, 310, 35, 40);
fill(67, 28, 6);
ellipse(540, 335, 5, 5);


//stairs
stroke(160, 69, 16);
fill(227, 127, 69);

quad(455, 200, 465, 200, 435, 250, 425, 250);
quad(425, 250, 435, 250, 465, 300, 455, 300); 
quad(455, 300, 465, 300, 435, 350, 425, 350);
quad(585, 200, 595, 200, 625, 250, 615, 250);
quad(615, 250, 625, 250, 595, 300, 585, 300);
quad(585, 300, 595, 300, 625, 350, 615, 350);


//trees
noStroke();
fill(180, 201, 112);
ellipse(575, 250, 40, 100);
ellipse(300, 250, 40, 100);
ellipse(90, 250, 40, 100);

fill(90, 57, 7);
rect(573, 300, 4, 50);
rect(298, 300, 4, 50);
rect(88, 300, 4, 50);




