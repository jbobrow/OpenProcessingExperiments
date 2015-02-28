
size(720,450);
smooth();
strokeWeight(3);
background(255);
ellipseMode(RADIUS);
 
//Body
stroke(0);      //set stroke to black
fill(255);      //set fill to white
rect(290, 200, 150, 170);    //main body
 
noStroke();
fill(0, 0, 255);    //set fill to blue
rect(315, 210, 100, 10);    //rectangle detail 1
rect(315, 225, 100, 25);    //rectangle detail 2
rect(315, 255, 100, 15);    //rectangle detail 3
 
fill(0);    //set fill to black
rect(345, 280, 40, 70);    //background for white rectangle details
fill(255);    //set fill to white
for (int a = 285; a < 310; a += 8) {
  rect (350, a, 30, 7);
}    //loop for white rectangle details
for (int b = 322; b < 340; b += 8) {
  rect (350, b, 30, 7);
}    //loop for white rectangle details part two
 
//Head
stroke(0);    //set stroke to black
fill(255);     //set fill to white
arc(365, 200, 75, 75, PI, TWO_PI);    //main head
 
noStroke();
fill(0, 0, 255);    //set fill to blue
quad(344, 135, 384, 135, 394, 175, 334, 175);    //quad detail background for centre  black eye
fill(0);    //set fill to black
ellipse(364, 155, 13, 13);    //centre black eye
fill(255);    //set fill to white
ellipse(366, 157, 4, 4);    //reflection white dot
 
noStroke();
fill(0, 0, 255);    //set fill to blue
rect(334, 178, 5, 20);
rect(344, 178, 50, 20);    //rectangle detail right of head
noStroke();
fill(255, 0, 0);    //set fill to red
ellipse(379, 188, 7, 7);
 
//Arms and Legs
stroke(0);    //set stroke to black
fill(255);    //set fill to white
rect(270, 200, 20, 200);    //left arm
rect(440, 200, 20, 200);    //right arm
quad(270, 370, 290, 370, 300, 400, 260, 400);    //left tripod
quad(440, 370, 460, 370, 470, 400, 430, 400);    //right tripod
quad(355, 370, 375, 370, 385, 420, 345, 420);    //tripod leg
noStroke();
fill(0, 0, 255);    //set fill to blue
rect(270, 230, 10, 100);    //left arm blue detail
rect(450, 230, 10, 100);    //right arm blue detail

