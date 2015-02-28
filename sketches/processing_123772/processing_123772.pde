
size (400, 400);
background(90, 20, 110);

//head
stroke(255);
strokeWeight(80);
point(200, 100);

//body
stroke(255);
strokeWeight(5);
line(200, 100, 200, 300);

//legs
line(200, 300, 150, 380);
line(200, 300, 250, 380);

//arms
line(200, 225, 150, 175);
line(200, 225, 250, 175);

//face
stroke(0);
strokeWeight(2);
arc(200,110,40,40,0,PI);
fill(0);
ellipse(215,90,10,10);
ellipse(185,90,10,10);


//ice cream
fill(255,0,165);
stroke(255,0,165);
ellipse(150,145,10,10);

//ice cream cone
fill(180, 110, 50);
stroke(180, 110, 50);
beginShape();
vertex(150, 175);
vertex(155, 150);
vertex(145, 150);
vertex(150, 175);
endShape();

//ice cream shop
fill(255,0,0);
stroke(255,0,0);
rect(10,250,125,100);
fill(255);
stroke(255);
rect(80,300,25,50);
rect(30,300,20,20);
textSize(20);
text("ICE CREAM",20,275);
