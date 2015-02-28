
size(600,600);
background(255);


//cross
beginShape();
fill(0);
vertex(0,100);
vertex(60,100);
vertex(60,160);
vertex(120,160);
vertex(120,220);
vertex(60,220);
vertex(60,280);
vertex(0,280);
endShape();

//r

beginShape();
vertex(100,20);
vertex(160,20);
vertex(160,40);
vertex(120,40);
vertex(120,80);
vertex(100,80);
vertex(100,20);
endShape();

fill(100);
stroke(100);
beginShape();
vertex(240,100);
vertex(250,120);
vertex(560,0);
vertex(510,0);
vertex(240,100);
endShape();


fill(70);
quad(360,100,425,80,435,120,370,140);

fill(50);

quad(340,160,600,100,603,110,343,170);


//rect(340,160,500,10);
fill(0);
//fill(150);
//stroke(150);
ellipse(570,150,20,20);



ellipse(520,605,100,100);
fill(255);
ellipse(520,605,70,70);

fill(30);
rect(320,240,140,60);

fill(0);
quad(180,360,365,300,480,460,302,670);


/*
beginShape();
vertex(,);
endShape();
*/

