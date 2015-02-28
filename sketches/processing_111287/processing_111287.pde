
void setup (){

//Background + size
size(600, 600) ; 
background (2, 29, 106) ;
//Neck
stroke(18,27, 180);
ellipse(300,500,600,500);

// Laying stroke and outline of face
stroke(18, 27, 180) ; 
ellipse(300, 300, 500, 500) ;

// Eyes outline
fill(0,0,0);
ellipse (200,200,75, 75);
ellipse (400,200,75,75);

//nose
fill(255,128,0);
quad(300,250,350,350,300,375,250,350);

// base of tongue
fill(255,0,17); 
arc(300,450,150,110,-0.7, PI+QUARTER_PI, OPEN);

// Mouth
stroke(0,0,0); 
strokeWeight(4);
line(200,411,400,417);

//crease of tongue
stroke(0,0,0);
strokeWeight(3);
line(300,425,300,490);

//Tophat
fill(0,0,0);
rect(130,20,338,100);
stroke(0,0,0);
strokeWeight(16);
line(100,120,500,120);

//arms
strokeWeight(14);
stroke(139,82,25);
line(75,550,25,400);
line(525,550,575,400);

//fingers
strokeWeight(10);
line(25,400,45,375);
line(25,400,24,370);
line(23,400,3,365);

line(575,400,555,375);
line(575,400,576,370);
line(575,400,597,365);

//SNOW 
stroke(255,255,255);
point(50,50);
point(75,100);
point(25,75);
point(25,250);
point(60,210);
point(30,300);
point(10,10);
point(510,25);
point(550,75);
point(560,200);
point(525,300);
point(590,310);
point(585,15);
point(570,150);


}


