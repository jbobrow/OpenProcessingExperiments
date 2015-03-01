
void setup() {
  size(500, 450); ////layout
}

void draw() {
background(255,0,0); ////red

stroke(255, 255, 255); ////white outline
fill(160, 220, 90); ////green circle
ellipse(240, 200, 300, 375); ////ellipse

fill(20,235,213); ////turquoise
rect(225, 40, 35, 45); ////head
triangle(343, 300, 140, 300, 238, 200); ////skirt
rect(190, 105, 100, 125); ////body
rect(168, 130, 10, 75); ////left arm
rect(300, 130, 10, 75); ////right arm
triangle(225, 25, 220, 30, 225, 50); ////left ear
triangle(265, 30, 260, 25, 261, 50); ////right ear

stroke(0); ////black outline
fill(0,181,255); ////blue
ellipse(235, 50, 4, 4); ////left eye
ellipse(250, 50, 4, 4); ////right eye
triangle(242, 70, 250, 60, 235, 60); ////mouth
ellipse(242, 90, 20, 10); ////top ellipse neck
ellipse(242, 100, 20, 10); ////bottom ellipse neck
triangle(190, 105, 160, 125, 190, 150); ////left shoulder
triangle(290, 105, 320, 125, 290, 150); ////right shoulder
ellipse(275, 305, 20, 10); ////left shoe
ellipse(205, 305, 20, 10); ////right shoe
ellipse(308, 206, 15, 12); //// right hand
ellipse(175, 206, 15, 12); //// left hand

stroke(0); ////black outline
fill(255,50,200); ////pink 
ellipse(240, 200, 5, 7); ////3rd button
ellipse(240, 175, 5, 7); ////2nd button
ellipse(240, 150, 5, 7); ////1st button

}


