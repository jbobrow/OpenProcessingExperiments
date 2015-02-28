
//generate random
int rand1=int(random(450, 475));
int rand2=int(random(450, 475));
int rand3=int(random(450, 475));
int rand4=int(random(450, 475));
int rand5=int(random(0, 750));
int rand6=int(random(0, 255));
int rand7=int(random(0, 255));


//define canvas
size(800, 800);
noStroke();

//background
fill(rand2/2, rand6, rand7);
ellipse(400, 400, rand5, rand5);
fill(0, 0, 0);

//key head
rect(300, 100, 200, 200, 5);
beginShape();
vertex(300, 290);
vertex(350, 400);
vertex(350, 700);
vertex(450, 700);
vertex(475, 675);
vertex(rand1, 650);
vertex(475, 625);
vertex(rand2, 600);
vertex(475, 575);
vertex(rand3, 550);
vertex(475, 525);
vertex(rand4, 500);
vertex(475, 475);
vertex(475, 450);
vertex(475, 425);
vertex(475, 400);
vertex(475, 475);
vertex(475, 450);
vertex(450, 400);
vertex(500, 290);

//vertex(450,700);
vertex(300, 300);
endShape();

//keyhead
fill(255, 255, 255);
rect(350, 150, 100, 100);
