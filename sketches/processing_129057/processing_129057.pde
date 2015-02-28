
void setup() {

background(35,132,100);
smooth();
size(1000,1000);
frameRate(12);
}

void draw() {
strokeWeight(1);
stroke(0,0,0);
fill(0,213,251);
textSize(150);
text("ROBO",250,950);

line(450, 600, 350, 800);
line(550, 600, 650, 800);

fill(27,232,21);
ellipse(350, 800, 50, 30);
ellipse(650, 800, 50, 30);

noStroke();
fill(0,213,251);
rect(0,0,1000,425);


fill(233,255,0);
arc(0,0,300,300,0,HALF_PI);
stroke(0,0,0);

strokeWeight(5);
stroke(233,255,0);
line(0,0,50,345);
line(0,0,100,330);
line(0,0,150,315);
line(0,0,200,300);
line(0,0,250,285);
line(0,0,300,270);
line(0,0,350,255);
line(0,0,400,240);
line(0,0,500,225);
line(0,0,600,210);
line(0,0,700,195);
line(0,0,800,165);
line(0,0,900,135);
line(0,0,1000,100);
line(0,0,1000,50);

strokeWeight(1);
stroke(0,0,0);
fill(162,155,137);
triangle(774,500,837,300,900,500);

fill(147,147,147);
rect(850,450,25,50);
fill(182,245,249);
rect(810,425,20,20);
rect(837,390,20,20);
 
strokeWeight(1);
stroke(0,0,0);
fill(27,232,21);
quad(425,350,425,200,575,200,575,350);
fill(227,103,136);
rect(440,300, 120, 30);
 
 fill(255,255,255);
 triangle(440,300,448,300,444,320);
 triangle(448,300,456,300,452,320);
 triangle(456,300,464,300,460,320);
 triangle(464,300,472,300,468,320);
 triangle(472,300,480,300,476,320); 
 triangle(480,300,488,300,484,320);
 triangle(488,300,496,300,492,320);
 triangle(496,300,504,300,500,320);
 triangle(504,300,512,300,508,320);
 triangle(512,300,520,300,516,320); 
 triangle(520,300,528,300,524,320)
 triangle(528,300,536,300,532,320)
 triangle(536,300,544,300,540,320)
 triangle(544,300,552,300,548,320)
 triangle(552,300,560,300,556,320)
 
fill(26,54,221);
ellipse(500, 500, 300, 300);
fill(122,34,223);
ellipse(500, 500, 250, 250);
fill(230,37,147);
ellipse(500, 500, 200, 200);
fill(244,56,16);
ellipse(500, 500, 150, 150);
fill(240,133,14);
arc(500, 500, 100, 100, 0, TWO_PI);
fill(231,242,36);
arc(500, 500, 50, 50, 0, TWO_PI);
line(300, 450, 700, 450);
fill (255,255,255);
ellipse(460, 250, 50, 50);
ellipse(540, 250, 50, 50);
fill(0,0,0);
ellipse(460, 250, 15, 15);
ellipse(540, 250, 15, 15);
fill(27,232,21);
ellipse(300, 450, 40, 40);
ellipse(700, 450, 40, 40);
strokeWeight (5);
    var dx = random(-100,100);
    var dy = random(-100,100);
    stroke(0,0,0);
    line(837,300,837+dx,300+dy);
    var dx = random(-100,100);
    var dy = random(-100,100);
    stroke(100,100,100);
    line(837,300,837+dx,300+dy);
    var dx = random(-100,100);
    var dy = random(-100,100);
    stroke(162,155,137);
    line(837,300,837+dx,300+dy);
    
    }
