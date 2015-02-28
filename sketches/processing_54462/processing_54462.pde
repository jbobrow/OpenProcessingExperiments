
size(700, 400);
smooth();
strokeWeight(15);
background(193, 242, 159);
ellipseMode(RADIUS);

//Neck

stroke(150);                  //Set stroke to grey
line(266, 270, 266, 162);     //Left
line(276, 257, 276, 162);     //Middle
line(286, 257, 286, 162);     //Right

//Antennae
line(200, 155, 246, 112);     //Small
line(276, 155, 330, 30);      //Tall
line(276, 155, 342, 190);     //Medium
line(245, 155, 335, 100);

//Body
noStroke();                   //Disable Stroke
fill(102);                    //Set fill to grey
ellipse(275, 330, 33, 33);    //Antigravity orb
fill(102);                    //Set fill to grey
rect(230, 274, 90, 6);        //Grey stripe
fill(0);                      //Set fill to black
rect(255, 250, 45, 60);      //Main body

//Head
fill(0);                      //Set fill to black
ellipse(276, 155, 60, 60);    //Head
fill(255);                    //Set fill to white
ellipse(288, 150, 14, 14);    //Large eye
fill(0);                      //Set fill to black
ellipse(288, 150, 3, 3);      //Pupil
fill(153);                    //Set fill to light grey
ellipse(263, 148, 5, 5);      //Small eye 1
ellipse(296, 130, 4, 4);      //Small eye 2
ellipse(305, 162, 3, 3);      //Small eye 3

