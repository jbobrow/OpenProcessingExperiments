
size(600,600);
background(#A8D8D2);
smooth();

//face
noStroke();
fill(#F5EBB2);

ellipse(195, 285, 85, 85); //leftear
ellipse(405, 285, 85, 85); //rightear

ellipse(300, 280, 250, 320); 
rect(175, 180, 250, 80); 

ellipse(237, 180, 125, 125); 
ellipse(362, 180, 125, 125); 
rect(237, 118, 125, 80); 

rect(255, 400, 90, 300); 


//hair
fill(#AA8335);
stroke(#815922); 

triangle(180, 280, 165, 190, 190, 155); //leftsideburn
triangle(420, 280, 435, 190, 410, 155); //rightsideburn

//leftpart
triangle(175, 235, 195, 129, 220, 160);
triangle(205, 120, 205, 205, 240, 115);
triangle(160, 210, 180, 142, 210, 130);
triangle(165, 155, 210, 115, 250, 115);

//top
triangle(330, 110, 400, 130, 420, 120);
triangle(330, 105, 370, 125, 400, 110);
triangle(270, 110, 340, 110, 380, 95);
triangle(240, 110, 310, 110, 350, 90);
triangle(230, 115, 265, 110, 310, 92);
triangle(225, 117, 250, 120, 260, 95);
triangle(220, 115, 230, 120, 240, 120);

//rightpart
triangle(360, 115, 415, 130, 440, 200);
triangle(300, 110, 380, 115, 423, 205);
triangle(330, 110, 380, 115, 425, 195);
triangle(270, 110, 340, 110, 400, 205);
triangle(240, 110, 300, 110, 350, 190);
triangle(240, 110, 270, 110, 290, 170);
triangle(220, 115, 250, 110, 260, 160);
triangle(220, 115, 240, 110, 240, 160);

//eyebrows
noStroke();
fill(#AF7319);
ellipse(255, 248, 51, 51);
ellipse(345, 248, 51, 51);
fill(#F5EBB2);
ellipse(256, 253, 55, 50);
ellipse(344, 253, 55, 50);

//whites
fill(255);
ellipse(256, 267, 45, 50);
ellipse(344, 267, 45, 50);

//iris
fill(#13BCAF);
ellipse(260, 275, 25, 25);
ellipse(340, 275, 25, 25);

//pupils
fill(0);
ellipse(261, 276, 20, 20);
ellipse(339, 276, 20, 20);

//nose
noFill();
stroke(0);
strokeWeight(2);
arc(300, 315, 50, 35, radians(0), radians(180));

//mouth
fill(#F5B4BE);
stroke(#F5A8B4);
strokeWeight(2);
arc(315, 360, 75, 75, radians(-10), radians(170));

//shirt
fill(#126F7E);
noStroke();
triangle(300, 600, 215, 540, 255, 500); 
triangle(300, 600, 385, 540, 345, 500); 

triangle(220, 465, 300, 600, 125, 500); 
triangle(380, 465, 300, 600, 475, 500); 

triangle(75, 600, 300, 600, 125, 500); 
triangle(525, 600, 300, 600, 475, 500); 

fill(#0B8BA0);
triangle(220, 455, 255, 440, 255, 500); 
triangle(220, 455, 215, 540, 255, 500); 

triangle(380, 455, 345, 440, 345, 500); 
triangle(380, 455, 385, 540, 345, 500); 



