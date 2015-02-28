
int H = 800; int L = 890; int M = 710;



void setup() {
  size(900, 900);

  
}

void draw() {
  background(#E69AEA);
    H = H - 10;
    L = L - 10;
    M = M - 10;

triangle(173, 200, 173, 285, 203, 285);
fill(#6A5035);
rect(163, 200, 10, 150);

//person in boat
line(250,300,250,350); fill(#EAD4BD); ellipse(250,275,50,50);line(250,325,275,300);line(250,325,225,300);

  
fill(#30FF03);
arc(175,350,200,150,0,PI);

//WATER!!

fill(#0319FF);
ellipse(0,450,75,75);ellipse(75,450,75,75);ellipse(150,450,75,75);ellipse(225,450,75,75);ellipse(300,450,75,75);ellipse(375,450,75,75);
ellipse(450,450,75,75);ellipse(525,450, 75,75);ellipse(600,450,75,75);ellipse(675,450,75,75);ellipse(750,450,75,75);ellipse(825,450,75,75);ellipse(900,450,75,75);
fill(#121476); ellipse(5,500,75,75);ellipse(80,500,75,75);ellipse(155,500,75,75);ellipse(230,500,75,75);ellipse(305,500,75,75);ellipse(380,500,75,75);
ellipse(455,500,75,75);ellipse(530,500, 75,75);ellipse(605,500,75,75);ellipse(680,500,75,75);ellipse(755,500,75,75);ellipse(830,500,75,75);ellipse(905,500,75,75);
fill(#0319FF);
ellipse(0,550,75,75);ellipse(75,550,75,75);ellipse(150,550,75,75);ellipse(225,550,75,75);ellipse(300,550,75,75);ellipse(375,550,75,75);
ellipse(450,550,75,75);ellipse(525,550, 75,75);ellipse(600,550,75,75);ellipse(675,550,75,75);ellipse(750,550,75,75);ellipse(825,550,75,75);ellipse(900,550,75,75);
fill(#121476); 
ellipse(5,600,75,75);ellipse(80,600,75,75);ellipse(155,600,75,75);ellipse(230,600,75,75);ellipse(305,600,75,75);ellipse(380,600,75,75);
ellipse(455,600,75,75);ellipse(530,600, 75,75);ellipse(605,600,75,75);ellipse(680,600,75,75);ellipse(755,600,75,75);ellipse(830,600,75,75);ellipse(905,600,75,75);
fill(#0319FF);
ellipse(0,650,75,75);ellipse(75,650,75,75);ellipse(150,650,75,75);ellipse(225,650,75,75);ellipse(300,650,75,75);ellipse(375,650,75,75);
ellipse(450,650,75,75);ellipse(525,650, 75,75);ellipse(600,650,75,75);ellipse(675,650,75,75);ellipse(750,650,75,75);ellipse(825,650,75,75);ellipse(900,650,75,75);

//the sun
fill(#F9FA08); ellipse(H, 100, 90, 90); triangle(H,10,820,55,780,55);triangle(L,100,845,80,845,120);triangle(H,190,820,145,780,145);triangle(M,100,755,120,755,80);


}

