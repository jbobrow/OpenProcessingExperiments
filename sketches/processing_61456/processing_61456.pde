
void setup() {
size(560,620);
background(150,230,80);
 
}
 
void draw() {

stroke(0);
strokeWeight(2);
fill(10,110,240);
quad(0,0,089,0,389,638,0,600);

fill(0);
ellipse(50,387,30,50);
ellipse(50,589,50,60);
ellipse(450,450,50,60);

stroke(5);
strokeWeight(1);
line(20,250,100,250);
line(60,200,60,300);
line(20,200,100,300);
line(20,300,100,200);
stroke(0);
strokeWeight(1);
line(20,250,100,250);
line(60,200,60,300);
line(20,200,100,300);
line(20,300,100,200);

stroke(0);
strokeWeight(1);
fill(0);
triangle(250,50,240,150,290,300);
fill(230,230,0);
triangle(150,100,325,100,250,300);
fill(230,230,0);
ellipse(300,150,30,30);
noFill(0);
bezier(150,100,80,100,70,120,80,180);
bezier(60,160,60,190,100,190,100,160);
line(220,120,250,50);
bezier(280,50,250,90,300,150,200,150);
bezier(335,100,450,150,470,200,425,320);
line(220,140,225,160);
line(420,300,470,305);
line(460,295,460,330);
line(450,330,490,335);
line(480,325,475,370);
fill(230,230,0);
ellipse(220,120,10,10);

fill(0);
quad(120,550,350,520,400,650,150,650);
fill(200,0,0);
quad(150,180,325,200,380,525,100,550);
line(180,550,195,500);
line(350,550,325,475);
fill(0);
triangle(200,200,290,200,250,300);
}
