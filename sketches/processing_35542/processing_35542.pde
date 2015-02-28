
size(500, 500);
background(200, 200, 200);
smooth();

noStroke();
fill(140, 140, 140);
ellipse(200, 130, 100, 100);
ellipse(295, 160, 100, 100); // outside circles
stroke(0, 0, 0);
strokeWeight(8);
fill(90, 90, 90);
ellipse(200, 130, 70, 70);
ellipse(295, 160, 70, 70); // inside circles
fill(0, 0, 0);
strokeWeight(3);
ellipse(200, 130, 20, 20);
ellipse(295, 160, 20, 20); //pupils
//eyes

strokeWeight(2);
noFill();
triangle(220, 210, 240, 210, 230, 230);
//nose

strokeWeight(17);
noFill();
stroke(60, 60, 60);
strokeCap(ROUND);
quad(150, 300, 300, 300, 260, 340, 190, 340);
strokeWeight(3);
stroke(0, 0, 0);
//quad(130, 290, 320, 290, 260, 350, 190, 350); //outline of mouth
//mouth

strokeCap(ROUND);
strokeWeight(8);
noFill();
arc(260, 255, 60, 50, PI, 2*PI);
arc(200, 255, 60, 50, PI, 2*PI); //first two curves
arc(135, 255, 70, 50, 0, PI);
arc(325, 255, 70, 50, 0, PI); // lower curves
arc(347, 255, 25, 25, PI, 2*PI);
arc(113, 255, 25, 25, PI, 2*PI); //tiny curves
//moustache

strokeWeight(18);
stroke(0, 0, 0);
line(150, 50, 240, 50); //left eyebrow
line(260, 80, 350, 80); //right eyebrow
//eyebrows

strokeWeight(11);
line(30, 250, 220, 480);
line(220, 480, 420, 250);
//outline of lower face (chin)

stroke(0, 0, 0);
noFill();
arc(220, 400, 90, 50, PI, 2*PI);
//curved chin

arc(420, 230, 60, 40, 3*PI/2, 5*PI/2);
arc(30, 230, 50, 40, PI/2, 3*PI/2);
//ears

line(420, 210, 380, 0);
line(30, 210, 120, 0);
line(120, 0, 380, 0);
//outline of upper face

line(180, 435, 180, 500);
line(260, 435, 260, 500);
//neck

fill(30, 30, 30);
triangle(60, 0, 120, 0, 60, 120);
triangle(380, 0, 420, 0, 410, 150);
//hair
                
