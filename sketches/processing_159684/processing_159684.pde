
size(800,800);
background (232,0,4);


// inception square 
fill(0,25);
stroke(255,255,255);
strokeWeight(10);
rect ( 50, 50, 700, 700);
fill(0,35);
stroke(255,255,255);
strokeWeight(10);
rect ( 100, 100, 600, 600);
fill(0,45);
stroke(255,255,255);
strokeWeight(10);
rect ( 150, 150, 500, 500);
fill(0,55);
stroke(255,255,255);
strokeWeight(10);
rect ( 200, 200, 400, 400);
fill(0,65);
stroke(255,255,255);
strokeWeight(10);
rect ( 250, 250, 300, 300);
fill(0,75);
stroke(255,255,255);
strokeWeight(10);
rect ( 300, 300, 200, 200);
fill(0,85);
stroke(255,255,255);
strokeWeight(10);
rect ( 350, 350, 100, 100);


fill(255,255,255);
textFont(createFont("Helvetica",200));
textAlign(CENTER);
text("||", width/2, height/3);


fill(255,255,255);
textFont(createFont("Helvetica",200));
textAlign(CENTER);
text("||", width/2, height/3.5);

fill(255,0,0);
textFont(createFont("Helvetica",200));
textAlign(CENTER);
text("||", width/2, height/3.5);

fill(255,255,255);
textFont(createFont("Helvetica",200));
textAlign(CENTER);
text("||||", width/2, height/2.5);

fill(255,0,0);
textFont(createFont("Helvetica",200));
textAlign(CENTER);
text("||||", width/2, height/2.5);

fill(255,0,0);
textFont(createFont("Helvetica",300));
textAlign(CENTER);
text("~~~~~", width/2, height/2.3);

fill(224,0,0);
textFont(createFont("Helvetica",250));
textAlign(CENTER);
text("~~~~~", width/2, height/2.3);

fill(255,0,0);
textFont(createFont("Helvetica",200));
textAlign(CENTER);
text("||||", width/2, height*.75);

fill(255,0,0);
textFont(createFont("Helvetica",200));
textAlign(CENTER);
text("||", width/2, height*.85);

fill(255,0,0);
textFont(createFont("Helvetica",300));
textAlign(CENTER);
text("~~~~~", width/2, height*.85);

fill(224,0,0);
textFont(createFont("Helvetica",250));
textAlign(CENTER);
text("~~~~~", width/2, height*.85);



strokeWeight(1);
fill(0,45);
triangle(400,400,22,172,22,22);
triangle(400,400,22,272,22,72);
triangle(400,400,22,372,22,122);
triangle(400,400,22,472,22,172);
stroke (255,0,0);
triangle(400,400,22,572,22,222);
triangle(400,400,22,672,22,272);
stroke(255,255,255);
triangle(400,400,22,772,22,322);
triangle(400,400,22,872,22,372);
triangle(400,400,22,972,22,422);

stroke(255,255,255);
triangle(400,400,778,172,778,22);
triangle(400,400,778,272,778,72);
triangle(400,400,778,372,778,122);
triangle(400,400,778,472,778,172);
stroke (255,0,0);
triangle(400,400,778,572,778,222);
triangle(400,400,778,672,778,272);
stroke(255,255,255);
triangle(400,400,778,772,778,322);
triangle(400,400,778,872,778,372);
triangle(400,400,778,972,778,422);

//piano
stroke(255,255,255);
strokeWeight(1);
rect(50,150,50,550);

stroke(255,255,255);
strokeWeight(1);
rect(0,200,50,450);

stroke(255,255,255);
strokeWeight(1);
rect(700,150,50,550);

stroke(255,255,255);
strokeWeight(1);
rect(750,200,50,450);


fill(0,25);
strokeWeight(1);
stroke(255,0,0);
ellipse (width/2, height/2,width/2, height/2);
fill(0,35);
stroke(255,255,255);
ellipse (width/2, height/2,width/2.5, height/2.5);
fill(0,45);
stroke(255,0,0);
fill(0,55);
ellipse (width/2, height/2,width/3, height/3);
fill(0,65);
stroke(255,255,255);
ellipse (width/2, height/2,width/3.5, height/3.5);
fill(0,75);
stroke(255,0,0);
ellipse (width/2, height/2,width/4, height/4);
fill(0,85);
stroke(255,255,255);
ellipse (width/2, height/2,width/4.5, height/4.5);
fill(0,95);
stroke(255,0,0);
ellipse (width/2, height/2,width/5, height/5);

fill(0,45);
stroke(255,255,255);
triangle (400,400,350,450,450,450);
stroke(255,0,0);
triangle (400,375,350,425,450,425);
stroke(255,255,255);
triangle (400,375,350,325,450,325);
stroke(255,0,0);
triangle (400,400,350,350,450,350);

beginShape();
curveVertex(400,350);
curveVertex(400,350);
curveVertex(400,450);
curveVertex(400,450);
endShape();

stroke(255,0,0);
strokeWeight(1);
beginShape();
curveVertex(322,400);
curveVertex(322,400);
curveVertex(400,425);
curveVertex(478,400);
curveVertex(478,400);
endShape();

stroke(255,0,0);
strokeWeight(1);
beginShape();
curveVertex(322,425);
curveVertex(322,425);
curveVertex(400,450);
curveVertex(478,425);
curveVertex(478,425);
endShape();

strokeWeight(9);
point(400,400);

strokeWeight(9);
point(450,450);

strokeWeight(9);
point(350,350);


strokeWeight(2);
stroke(255,0,0);
ellipse(400,400,55,25);

strokeWeight(.5);
stroke(255,255,255);
ellipse(400,400,75,35);


strokeWeight(.5);
stroke(255,255,255);
ellipse(400,400,25,25);

stroke(24,255);
strokeWeight(5);
triangle( 350, 350, 100, 100,100,100);

stroke(24,255);
strokeWeight(5);
triangle( 400, 400,700, 100,700,100);



stroke(255,0,0);
strokeWeight(1);
beginShape();
curveVertex(0,425);
curveVertex(0,425);
curveVertex(400,450);
curveVertex(800,425);
curveVertex(800,425);
endShape();

stroke(255,0,0);
strokeWeight(1);
beginShape();
curveVertex(100,225);
curveVertex(100,225);
curveVertex(400,450);
curveVertex(700,225);
curveVertex(700,225);
endShape();

stroke(255,0,0);
strokeWeight(1);
beginShape();
curveVertex(100,625);
curveVertex(100,625);
curveVertex(400,450);
curveVertex(700,625);
curveVertex(700,625);
endShape();


// inception square 
strokeWeight(34);
fill(0,25);
stroke(0,100);
rect ( 50, 50, 700, 700);
fill(0,35);
rect ( 100, 100, 600, 600);
fill(0,45);
rect ( 150, 150, 500, 500);
fill(0,55);
rect ( 200, 200, 400, 400);


stroke(255,255,255);
strokeWeight(1);
rect(600,100,100,650);

stroke(255,255,255);
strokeWeight(1);
rect(100,100,100,650);

stroke(255,0,0);
strokeWeight(12);
beginShape();
curveVertex(0,425);
curveVertex(0,425);
curveVertex(400,450);
curveVertex(800,425);
curveVertex(800,425);
endShape();

stroke(235,0,0);
strokeWeight(8);
beginShape();
curveVertex(0,425);
curveVertex(0,425);
curveVertex(400,450);
curveVertex(800,425);
curveVertex(800,425);
endShape();



stroke(225,0,0);
strokeWeight(12);
beginShape();
curveVertex(0,225);
curveVertex(0,225);
curveVertex(400,250);
curveVertex(800,225);
curveVertex(800,225);
endShape();

stroke(225,0,0);
strokeWeight(5);
beginShape();
curveVertex(0,225);
curveVertex(0,225);
curveVertex(400,250);
curveVertex(800,225);
curveVertex(800,225);
endShape();

stroke(225,0,0);
strokeWeight(12);
beginShape();
curveVertex(0,625);
curveVertex(0,625);
curveVertex(400,650);
curveVertex(800,625);
curveVertex(800,625);
endShape();

stroke(225,0,0);
strokeWeight(5);
beginShape();
curveVertex(0,625);
curveVertex(0,625);
curveVertex(400,650);
curveVertex(800,625);
curveVertex(800,625);
endShape();

stroke(225,0,0);
strokeWeight(12);
beginShape();
curveVertex(0,25);
curveVertex(0,25);
curveVertex(400,50);
curveVertex(800,25);
curveVertex(800,25);
endShape();

stroke(225,0,0);
strokeWeight(5);
beginShape();
curveVertex(0,25);
curveVertex(0,25);
curveVertex(400,50);
curveVertex(800,25);
curveVertex(800,25);
endShape();






