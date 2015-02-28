
void setup() {
 size(600, 600);
 background(200);
 //background(58, 191, 229, 193); //blue
smooth();
}

void draw(){

//EYES

//Antennae
strokeWeight(10);
stroke(142, 52, 144, 298); //purple
line(350, 150, 300, 300); // eye line
line(250, 150, 300, 300); //eye line

//Eye Balls
strokeWeight(1);
stroke(0); //black
fill(255); //white
ellipse(350, 150, 30, 30); 
ellipse(250, 150, 30, 30);

strokeWeight(5);
//stroke(100); // black
stroke(32, 227, 56); //green
ellipse(255, 145, 15, 15);//iris
ellipse(355, 145, 15, 15);//iris
stroke(0); //black
ellipse(255, 145, 5, 5);//pupil
ellipse(355, 145, 5, 5);//pupil

//HEAD
noStroke();
fill(142, 52, 144); //purple
arc(300, 300, 150, 150, 3.3, 6.13);

//ARMS
arc(225, 325, 50, 50, 1.57, 4.71);
//arc(225, 325, 50, 50, 4.71, 1.57); why doesnt this work? 
ellipse(375, 325, 50, 50);
quad(225, 305, 225, 345, 170, 380, 155, 355);
quad(375, 305, 375, 345, 455, 380, 455, 355);
//hand
strokeWeight(0.5);
stroke(0); //black
fill(11, 139, 216); //blue
ellipse(162, 367, 30, 30);
ellipse(447, 367, 30, 30);
fill(200);
noStroke();
triangle(162, 367, 132, 387, 150, 355);
triangle(447, 367, 480, 387, 460, 355);


//LEGS 
strokeWeight(9);
stroke(0); //black
fill(11, 139, 216); //blue
ellipse(262.5, 440, 95, 95);
ellipse(337.5, 440, 95, 95);

//BODY
strokeWeight(2);
stroke(203, 39, 108, 334);// pink
fill(142, 52, 144, 298);// purple
rect(225, 300, 150, 50);
fill(214, 98, 11);// orange
rect(225, 350, 150, 50);
//Middlemouth
strokeWeight(6);
stroke(203, 39, 108, 334); //pink
fill(214, 98, 11); //orange
ellipse(300, 300, 60, 60);
fill(200); // grey
strokeWeight(1);
stroke(0);//back
ellipse(300, 300, 25, 25);

//Arms
noFill();
strokeWeight(2);
stroke(203, 39, 108, 334);
ellipse(225, 325, 50, 50);
ellipse(375, 325, 50, 50);



//Armholes
fill(200); // grey
strokeWeight(2);
stroke(214, 98, 11);// orange
ellipse(225, 325, 20, 20);
ellipse(375, 325, 20, 20);



//Legholes
strokeWeight(2);
fill(142, 52, 144); //purple
triangle(225, 400, 375, 400, 300, 470);
fill(200); // grey
strokeWeight(2);
stroke(214, 98, 11); //orange
ellipse(262.5, 440, 40, 40);
ellipse(337.5, 440, 40, 40);


}


