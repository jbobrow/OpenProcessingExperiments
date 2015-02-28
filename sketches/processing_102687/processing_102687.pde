
void setup() {
smooth();
size(800,700);
PImage img;
img = loadImage("museu-oscar-niemeyer.jpg");
background(img);
}

void draw() {
//calçada
strokeWeight(4);
noStroke();
fill(#698BB7);
quad(0,550,800,300,800,700,0,700);
stroke(0);
line(0,550,800,300);

//tubo do onibus
noStroke();
fill(80);
quad(250,445,445,395,450,505,250,555);
stroke(0);
strokeWeight(4);
ellipseMode(CENTER);
ellipse(250,500,110,110);
line(250,445,445,395);
line(250,555,450,505);
strokeWeight(4);
noFill();
fill(80);
arc(450,450,110,110,radians(264), radians(420) , OPEN);
noStroke();
triangle(445,395,400,600,515,600);
noFill();
stroke(8);
arc(330,480,110,112,radians(280), radians(420), OPEN);
arc(370,469,110,115,radians(280), radians(420), OPEN);
strokeWeight(6);
line(306,500,502,450);
fill(0);
quad(210,550,290,550,300,570,200,570);
stroke(#698BB7);
line(210,560,290,560);

//rua
noStroke();
fill(#2C3B55);
triangle(0,700,800,430,800,700);
strokeWeight(4);
stroke(255,160,1);
line(0,700,800,430);
stroke(255);
line(400,700,500,665);
line(550,650,650,610);
line(700,590,783,555);



//onibus
stroke(0);
strokeWeight(1);
fill(0);
ellipse(430,600,33,33);
fill(200);
quad(400,600,500,610,500,510,400,500);
fill(200);
quad(400,500,550,450,650,460,500,510);
quad(500,610,650,550,650,460,500,510);
fill(0);
ellipseMode(RADIUS);
ellipse(525,603,20,20);
fill(210);
ellipseMode(CENTER);
ellipse(525,603,25,25);
fill(200,233,245);
quad(402,565,498,575,498,513,402,503);   //parabrisa
quad(510,515,540,506,540,540,510,550);   //janela1
quad(555,503,585,493,585,528,555,536);   //janela2
quad(600,490,628,480,628,515,600,523);   //janela3
fill(0);
ellipseMode(RADIUS);
ellipse(620,565,20,20);
fill(210);
ellipseMode(CENTER);
ellipse(620,565,25,25);
ellipseMode(CENTER);
fill(#FCCD30);
ellipse(420,585,22,22);
ellipse(480,590,22,22);

}


