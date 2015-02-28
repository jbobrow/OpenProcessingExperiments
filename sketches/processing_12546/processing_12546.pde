
size(600,600);
background(0);
noStroke();
smooth();

/* quad 1~10 */
fill(170);
quad(0,0, 240,0, 100,140, 0,40);
fill(100);
quad(120,140, 240,20, 246,26, 126,146);

fill(120);
quad(0,340, 200,140, 280,220, 0,500);
fill(80);
quad(380,120, 500,0, 580,0, 420,160);

fill(150);
quad(480,120, 600,0, 600,10, 485,125); 
fill(130);
quad(500,200, 600,100, 600,220, 560,260);

fill(200);
quad(440,280, 480,240, 600,360, 600,440);
fill(50);
quad(515,380, 520,375, 600,455, 600,465); 

fill(60);
quad(240,540, 250,530, 320,600, 300,600);
fill(30);
quad(80,540, 140,480, 260,600, 140,600);


/* ellipse 1~4 */
noFill();
stroke(150);
strokeWeight(4);
ellipse(290,130, 100,100);
noFill();
stroke(225);
strokeWeight(2);
ellipse(210,260, 380,380);
fill(255);
noStroke();
ellipse(375,175, 50,50);
noFill();
stroke(200);
strokeWeight(6);
ellipse(315,395, 150,150);


/* vertex */
noStroke();
fill(100);
beginShape();
vertex(320,520);
vertex(440,400);
vertex(600,560);
vertex(600,600);
vertex(400,600);
vertex(320,520);
endShape();

noStroke();
fill(255);
quad(40,330, 600,500, 600,520, 35,350); 






