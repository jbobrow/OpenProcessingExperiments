
size(720, 480);
smooth();
strokeWeight(2);
background(0);
ellipseMode(RADIUS);

fill(80);                  //fill dark grey
ellipse(400, 90, 30, 30);  //floating orb

//Neck
strokeWeight(6);
stroke(255);                //stroke white
line(266, 257, 266, 162);  //left
stroke(0, 0, 255);         //stroke blue
line(276, 257, 276, 162);  //middle
stroke(255);                //stroke white
line(286, 257, 286, 162);  //right

//antennae
strokeWeight(2);
line(276, 155, 246, 112);  //small
strokeWeight(4);
line(276, 155, 306, 56);  //tall
strokeWeight(2);
line(276, 155, 342, 170);  //medium

//Body
noStroke();
fill(180);    //stroke grey
ellipse(264, 377, 33, 33);  //antigravity orb
fill(255, 0, 0);    //fill red
rect(219, 257, 90, 120);  //main body
fill(255);                //fill white
rect(219, 274, 90, 6);  //white stripe
fill(0, 0, 255);               //fill blue
rect(219, 294, 90, 20);  //grey stripe

//Head
fill(255, 0, 0);        //fill red
ellipse(276, 155, 45, 45); //head
fill(255);                 //set fill to white
ellipse(288, 150, 14, 14);   //large eye
fill(0);                     //fill black
ellipse(288, 150, 6, 6);    //pupil
fill(0, 0, 255);                  //fill blue
ellipse(263, 148, 5, 5);     //small eye 1
ellipse(296, 130, 4, 4);     //small eye 2
ellipse(305, 162, 3, 3);    //small eye 3

