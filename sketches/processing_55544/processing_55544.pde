
size (1000, 1000);
smooth();


//Arms/Legs/Neck
fill(0);
noStroke();
quad(450,400,460,400,520,600,500,600);
quad(610,610,620,620,750,510,740,500);
fill(100);
triangle(750,510,790,525,820,460);
triangle(740,500,720,460,780,420);
fill(0);
rect(500,700,10,100);
rect(570,700,10,100);
fill(100);
quad(510,800,500,800,450,820,510,820);
quad(570,800,580,800,630,820,570,820);

//Head

fill(0);
stroke(1);
strokeWeight(8);
line(445,350,445,250);
line(490,370,570,300);
fill(200);
strokeWeight(6);
ellipse(445,250,20,20);
ellipse(570,300,20,20);
noStroke();
fill(255);
ellipse(450,400,100,100);
fill(200);
stroke(100);
strokeWeight(3);
rectMode(CENTER);
rect(445,420,40,20);


//Eye
noStroke();
fill(150);
quad(450,370,430,390,300,290,370,230);
fill(255);
stroke(160);
strokeWeight(15);
ellipse(280,200,180,180);
noStroke();
fill(10);
ellipse(280,200,60,60);

//Body
fill(255);
ellipse(550,650,250,200);
fill(100);
stroke(150);
strokeWeight(3);
ellipse(600,600,50,50);
ellipse(600,700,50,50);
ellipse(630,650,50,50);
fill(200);
triangle(500,650,570,600,570,700);

