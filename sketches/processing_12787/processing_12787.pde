
//background
size(600,600);
background(255);
//object1
fill(220);
strokeWeight(2);
quad(120,200,200,120,280,200,200,280);
//object2
fill(255);
strokeWeight(0);
ellipse(200,200,110,110);

//object4
strokeWeight(1);
fill(200);
quad(320,200,400,120,540,260,460,340);

//object6
fill(255);
beginShape();
vertex(500,400);
vertex(500,380);
vertex(520,380);
vertex(520,400);
vertex(540,400);
vertex(540,420);
vertex(520,420);
vertex(520,440);
vertex(500,440);
vertex(500,420);
vertex(480,420);
vertex(480,400);
vertex(500,400);
endShape();
//object5
fill(150);
triangle(240,80,420,60,320,160);


//object3
fill(70);
strokeWeight(3);
quad(200,340,300,240,380,320,280,420);

//line
line(0,280,200,280);

strokeWeight(1);
line(400,120,520,0);
line(200,340,100,440);

strokeWeight(5);
line(0,500,500,0);
strokeWeight(3);
line(200,100,500,400);



