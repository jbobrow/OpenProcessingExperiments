
/*space invaders character
drawn with basic shapes rect function*/

size(250,250);
background(255,230,36);
smooth();
noStroke();

//draw body
fill(0,190,240); // light blue color
rect(75,50,100,20); //top rect
rect(50,70,150,30); //second row rect
rect(30,100,190,60); //third row rect
rect(90,160,30,20); //tentacle block 1 left
rect(60,180,30,20); //tentacle block 2 left
rect(30,200,30,20); //tentacle block 3 left
rect(130,160,30,20); //tentacle block 1 right
rect(160,180,30,20); //tentacle block 2 right
rect(190,200,30,20); //tentacle block 3 right

//top black block
fill(0);
rect(105,30,10,40);
rect(135,30,10,40);

fill(255); //white color
stroke(0);
strokeWeight(2);
rect(75,100,40,30); //square eyeball left
rect(135,100,40,30); //square eyeball right
rect(120,160,10,30); //teeth

noStroke();
fill(255,0,0); //red color
rect(80,110,20,20); //iris left
rect(140,110,20,20); //iris right



