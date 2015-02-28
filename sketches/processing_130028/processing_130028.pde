
//Guilty Gaze
size(200, 200); //size of the window
smooth();
background(255); // background
//Draw Gaze's head
stroke(0);
strokeWeight(4);
fill(45);
rect(80, 70, 40, 30);
fill(255, 20, 40);
rect(40, 10, 120, 60, 15, 15, 15, 15);
stroke(255);
//Draw Gaze's eyes and body
stroke(0);
fill(45);
ellipseMode(CENTER);
ellipse(70, 40, 20, 20);
ellipseMode(CENTER);
ellipse(130, 40, 20, 20);
fill(255, 20, 40);
rect(70, 100, 60, 40, 15, 15, 0, 0);
//Draw Gazes' hands and legs
fill(45);
rect(140, 110, 20, 20, 7, 7, 7, 3);
rect(40, 110, 20, 20, 7, 7, 3, 7);
rect(110, 160, 20, 20, 3, 7, 7, 7);
rect(70, 160, 20, 20, 7, 3, 7, 7);
stroke(0);
fill(255);
strokeWeight(4);
triangle(100, 102, 128, 140, 72, 140);




