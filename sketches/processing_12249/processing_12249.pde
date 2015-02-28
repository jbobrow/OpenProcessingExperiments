

void setup() {
size(800,600);
}

void draw() {
  smooth();
frameRate(30);
noStroke();
  
//background
background(19,27,108);

//moon
fill(254,252,255);
ellipse(400,300,100,100);
  
scale(.50);
translate(mouseX-100, mouseY-100);
//}

//front wings
fill(220,235,247,90);
arc(638, 320, 400,280, PI, TWO_PI-PI/2);

//back wing
fill(220,235,247,50);
arc(590,290,380,400,PI,TWO_PI-PI/2);

//tail
fill(98,161,242);
arc(730,550,130,500,TWO_PI-PI/2, TWO_PI);
fill(19,27,100);
arc(760,550,20,50,TWO_PI-PI/2, TWO_PI);

//back ear
fill(148,46,216);
arc(280,175,37,90, PI,TWO_PI-PI/2);

//horn
fill(180,244,255);
triangle(370,200,270,200,100,100);

//back flank
fill(141,46,219);
ellipse(370,450,67,86);

//back buttox
fill(141,48,209);
ellipse(630,375,160,160);

//background-back leg
fill(121,35,193);
triangle(500,600,600,375,740,300);

//background-front leg
fill(121,35,193);
triangle(250,550,400,410,400,480);

//background-back knee
fill(172,88,229);
rect(510,540,37,46);

//background-back ankle
fill(197,115,252);
triangle(375,650,520,580,540,600);

//torso
fill(175,92,234);
ellipse(500,400,350,175);

//front buttox
fill(175,92,234);
ellipse(670,400,190,190);

//Neck
arc(340, 400, 250, 450, TWO_PI-PI/2, TWO_PI);

//face
ellipse(300,220,100,100);
rect(210,210,90,45);

//eye
fill(0);
ellipse(292,202,25,20);
fill(156,248,252);
ellipse(292,202,15,10);


//nose
fill(121,35,193);
triangle(180,260,280,190,210,215);
arc(190, 250, 50, 50, 0, PI/2);

//forefront-front flank
fill(203,143,252);
ellipse(430,480,70,90);

//front leg
fill(203,143,252);
triangle(300,630,420,460,450,500);

//foreground-back leg
fill(196,143,240);
triangle(550,640,650,350,700,450);

//foreground-back knee
fill(191,122,237);
rect(550,580,40,50);

//foreground-back ankle
fill(214,168,245);
triangle(400,700,550,610,570,630);

//foreground-front knee
ellipse(310,620,30,30);

//background-front knee
ellipse(250,550,30,30);

//foreground-front ankle
fill(205,135,252);
triangle(280,750,330,600,300,600);

//foreground-back ankle
fill(197,115,252);
triangle(200,700,245,520,280,500);

//ears
fill(172,73,240);
arc(310,180,40,100,TWO_PI-PI/2, TWO_PI);

}




