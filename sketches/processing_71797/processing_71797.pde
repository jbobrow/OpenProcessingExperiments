
//BACKGROUND AND WINDOW.

//Setting the yellow background.
size(600,600);
background(224,224,18);
//Adding the blue sky.
smooth();
noStroke();
fill(15,214,189);
quad(0,0,600,0,600,300,0,400);


//PALM TREE.

//Adding the trunk.
stroke(77,66,4); 
strokeWeight(4);
fill(142,122,7);
bezier(500,150,600,200,600,600,450,500);

//Adding the lines across trunk.
line(470,270,570,230);
line(450,380,590,350);
line(440,460,570,460);

//Palm leaves.
stroke(17,77,16);
fill(39,175,37);
triangle(500,100,350,70,200,150);
triangle(520,60,400,-200,550,-300);
triangle(550,75,700,50,800,200);

//WAVES

noFill();
stroke(15,162,141);
bezier(50,320,100,280,140,350,250,300);
translate(200,-100);
bezier(50,320,100,280,140,350,250,300);
translate(-200,-100);
bezier(50,320,100,280,140,350,250,300);

//Returning origin to (0,0).
translate(0,200);

//ABSTRACT IMAGES.

//Adding the curved brown line cutting across image.
noFill();
stroke(77,66,4);
bezier(550,500,500,200,100,400,50,70);

//Adding the curved darker yellow line across sand.
stroke(188,188,21);
bezier(75,350,100,500,300,390,350,550);

//COCONUTS.

//Adding the left coconut.
stroke(129,102,14);
fill(180,143,20);
ellipse(450,180,60,55); //Coconut lower circle.
noFill();
stroke(103,82,11);
ellipse(440,190,60,55); //Coconut upper circle.

//Adding the right coconut.
stroke(129,102,14);
fill(180,143,20);
ellipse(560,140,60,55); //Coconut lower circle.
noFill();
stroke(103,82,11);
ellipse(570,150,60,55); //Coconut upper circle.

//VOLLEYBALL.

noFill();
stroke(178,175,126);
ellipse(130,515,65,60);

fill(255,253,178); //Volleyball shape.
stroke(206,204,144);
int x = 120;
int y = 530;
ellipse(x,y,65,60);

rectMode(CENTER); //Volleyball lines.
rect(x,y,40,45);
line(112,510,112,550);
line(127,510,127,550);

