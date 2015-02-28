
//copyright Risa Hiyama 2014
size(400, 400); 
background(0,0,0);
//draw a frame
fill(250,250,250);
ellipse(200, 200, 350,350);
noStroke();

//R
//quad
fill(61, 61, 61);
//HELP!! how do i make the corner round?
quad(150, 200, 180, 200, 140, 264, 110, 264);
//right
fill(61, 61, 61);
rect(165, 133, 25, 133, 13);
//fix r 
fill(61, 61, 61);
rect(145, 133, 35, 75);
//round 
fill(61, 61, 61);
ellipse(145, 171, 75,75);
//round 
//fill(250,250,250);
//ellipse(145, 179, 15,15);

//H
//left
fill(61, 61, 61);
rect(195, 133, 25, 133, 13);
//right
fill(61, 61, 61);
rect(250, 133, 25, 133, 13);
//horizontal
fill(61, 61, 61);
rect(200, 190, 60, 25, 13);
//cover with white
fill(250,250,250);
//HELP!!! how do i reset this in the future?
rect(245, 100, 30, 70);


//flower
//stem
fill(38, 38, 38);
rect(262,130,2,40);
//leaf 
//HELP!! What is the best way to draw a leaf?
//HELP!! how do you make the color transparence?
//HELP!!when you use noStroke() how do you put it back to stroke();
//ANSWER!! write stroke( some color); 
fill(38, 38, 38);
quad(263, 159, 267, 147, 279, 143,274, 156);
//petal 
fill(255, 185, 15);
stroke(255, 185, 15);
ellipse(263, 136, 9, 9);
ellipse(255, 132, 9, 9);
ellipse(271, 132, 9, 9);
ellipse(255, 123, 9, 9);
ellipse(271, 123, 9, 9);
ellipse(263, 119, 9, 9);
//center
ellipse(263, 127, 14, 14);
// Saves a JPG file named "hw1.jpg"
save("hw1.jpg");




