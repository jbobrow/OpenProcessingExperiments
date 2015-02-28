
size(600, 600);
background(255);
smooth(); 


strokeCap(SQUARE);
//line
strokeWeight(5);
line(240,180,200,280);
//line
strokeWeight(4);
line(80,160,140,260);
//line
strokeWeight(2);
line(200,500,280,560);
//line
strokeWeight(4);
line(340,460,300,500);
//line
strokeWeight(6);
line(280,520,420,480);

//vertex
noStroke();
fill(0);
beginShape();
vertex(100,280);
vertex(520,140);
vertex(500,280);
vertex(440,300);
vertex(420,240);
vertex(120,340);
vertex(100,280);
endShape(CLOSE);

//quad
noStroke();
fill(50);
quad(180,280,380,360,240,480,140,440);
//quad
fill(150);
quad(160,200,180,180,240,240,220,260);
//quad
fill(0);
quad(80,460,100,460,100,480,80,480);
//quad
fill(30);
quad(380,540,420,520,440,560,420,580);
//quad
fill(120);
quad(460,540,480,540,480,560,460,560);


//vertex

fill(30);
beginShape();
vertex(300,20);
vertex(360,0);
vertex(600,0);
vertex(640,40);
vertex(340,140);
vertex(300,20);
endShape(CLOSE);

