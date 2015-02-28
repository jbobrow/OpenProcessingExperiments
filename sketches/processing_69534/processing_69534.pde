
//Dominique A., Penguin, CP1, Mod 16-17

size(350,380);
background(61,66,162);
smooth();
strokeWeight(3);
//left wing
fill(69,245,170);
ellipse(100,230,110,69);
//body
fill(93,180,255);
ellipse(150,270,150,150);
//head
fill(150,252,92);
ellipse(150,150,120,120);
//eye balls
fill(250,250,250);
ellipse(121,121,20,20);
ellipse(155,145,20,20);
//eye pupil
fill(18,25,198);
ellipse(119,123,9,9);
ellipse(153,147,9,9);
//right wing
fill(175,222,60);
ellipse(220,220,110,69);
//beak
stroke(170,157,7);
fill(144,133,4);
beginShape();
vertex(100,150);
vertex(120,150);
vertex(140,175);
endShape(CLOSE);
//lightning
quad(110,20,50,30,120,50,10,140);
//right eyebrow
beginShape();
vertex(160,100);
vertex(200,130);
endShape(CLOSE);
//left eyebrow
beginShape();
vertex(150,100);
vertex(100,100);
endShape(CLOSE);
//right foot
fill(190,193,29);
ellipse(170,300,69,49);
//left foot
fill(190,193,29);
ellipse(100,300,69,49);
//stick
stroke(255,255,255);
beginShape();
vertex(250,290);
vertex(250,160);
endShape(CLOSE);
//lollipop
stroke(224,0,26);
fill(255,3,32);
ellipse(250,160,40,40);
//sandbox
stroke(96,3,160);
fill(232,7,157);
rect(60,320,290,50);
