
size (300, 300);
background(165, 8, 58);

//face shape
fill(60, 206, 68);
noStroke();
ellipse( 150, 129, 226, 160);
scale(1, -1);
translate(0, -height);
smooth();
triangle(50, 133, 250, 133, 150, 30);
smooth();


//eyeball
fill(255, 255, 255); 
ellipse(205, 240, 80, 60);
ellipse(100, 240, 80, 60);


//pupils
fill(0,0,0); 
ellipse(205, 240, 22, 22);
ellipse(100, 241, 22, 22);

//mouth
fill(229, 35, 41); 
triangle(70, 133, 230, 133, 145, 50);

//tongue

fill(232, 115, 164);
ellipse(146, 123, 68, 90);
translate(145, 135);
fill(60, 206, 68);
ellipse (05, 30, 180, 100);
translate(-85,-96);
fill(229, 67, 157); 
rect(84, 60, 5, 16, 40); 


//eye lines
pushMatrix();
stroke(0,0,0);
strokeWeight(6);
translate(125,211);
line(0,0,45,-19);
popMatrix();

translate(17,197);
pushMatrix();
stroke(0,0,0);
strokeWeight(6);
line(0,0,45,13);
popMatrix();

//Smile lines
pushMatrix();
stroke(13,157,38);
strokeWeight(4);
translate(140,-97);
line(0,0,15,-10);
popMatrix();
strokeWeight(4);
translate(3,-99);
line(0,0,-15,-7);






