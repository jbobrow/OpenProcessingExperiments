
void setup(){
size(600,431);
background(234,222,199);
smooth();
}
void draw(){
//right rainbow
int RRCX=367;
int RRCY=223;
int RROR=280;
int RRMR=RROR-95;
int RRIR=RRMR-38;
strokeWeight(10);
noFill();
stroke(190,95,65);
ellipse(RRCX,RRCY,RROR,RROR); 
fill(220,225,235,200);
stroke(233,187,69);
ellipse(RRCX,RRCY,RRMR,RRMR);
strokeWeight(1);
stroke(155,74,34);
noFill();
ellipse(RRCX,RRCY,RRMR-10,RRMR-10);

//triangle
strokeWeight(2);
stroke(0);
fill(92,118,87);
quad(243,30,500,431,301,431,201,62);
fill(170,111,41);
noStroke();
quad(201,62,301,431,0,431,0,200);
strokeWeight(7);
stroke(5,2,0);
line(188,0,301,431);

//lines
noStroke();
fill(237,229,123);
quad(14,73,105,-3,141,0,24,84);
strokeCap(ROUND);
stroke(0);
line(14,73,105,-3);

noStroke();
fill(161,174,103);
quad(263,0,297,0,465,102,484,119);
strokeCap(ROUND);
strokeWeight(5);
stroke(0);
line(294,-4,458,98);

//chessboard
int CHBPX=462;
int CHBPY=14;
int CHBUX=31;
int CHBUY=53;
strokeWeight(5);
fill(255);
quad(CHBPX-CHBUX,CHBPY-CHBUY,650,-50,650,230,CHBPX+5*CHBUX,CHBPY+5*CHBUY);

strokeWeight(3);
fill(0);
quad(CHBPX,CHBPY,CHBPX+CHBUY,CHBPY-CHBUX,CHBPX+CHBUY+CHBUX,CHBPY-CHBUX+CHBUY,CHBPX+CHBUX,CHBPY+CHBUY);
line(CHBPX+2*CHBUX,CHBPY+2*CHBUY,CHBPX+2*CHBUY+2*CHBUX,CHBPY-2*CHBUX+2*CHBUY);
line(CHBPX+CHBUY+CHBUX,CHBPY-CHBUX+CHBUY,CHBPX+CHBUY+4*CHBUX,CHBPY-CHBUX+4*CHBUY);
fill(100);
quad(CHBPX+CHBUY+CHBUX,CHBPY-CHBUX+CHBUY,CHBPX+2*CHBUY+CHBUX,CHBPY-2*CHBUX+CHBUY,CHBPX+2*CHBUY+2*CHBUX,CHBPY-2*CHBUX+2*CHBUY,CHBPX+CHBUY+2*CHBUX,CHBPY-CHBUX+2*CHBUY);

noStroke();
fill(72,140,184,180);
ellipse(610,140,70,177);

//mid circle
int CX=168;
int CY=228;
fill(0);
ellipse(CX,CY,220,220);
fill(85,102,152);
arc(CX,CY,210,210,-PI/12,PI/10);
arc(CX,CY,210,210,3.5*PI/10,3*PI/4);
arc(CX,CY,210,210,-3*PI/4,-2*PI/5);
fill(227,209,93);
arc(CX,CY,210,210,13*PI/14,TWO_PI-13*PI/14);
arc(CX,CY,210,210,-PI/6,-3*PI/24);


fill(255);
arc(CX,CY,210,210,PI/2,5*PI/8);
arc(CX,CY,210,210,-11*PI/16,-5*PI/8);

strokeWeight(3);
stroke(0);
line(CX,CY,168,335);
line(CX,CY,158,333);
line(CX,CY,145,331);
line(CX,CY,135,329);
line(CX,CY,125,327);

line(CX,CY,127,129);
line(CX,CY,120,135);
line(CX,CY,111,140);

strokeWeight(3);
stroke(0);
fill(255);
ellipse(CX,CY,175,175);

//target
int CCX=186;
int CCY=220;
fill(0);
ellipse(CCX,CCY,32,32);

fill(0);
noStroke();
arc(203,185,550,550,-7*PI/24,-3*PI/12);
fill(234,222,199);
arc(203,185,388,388,-7*PI/24,-3*PI/12);
fill(211,61,18);
arc(203,185,340,340,-7*PI/24,-3*PI/12);
fill(255);
arc(203,185,204,204,-7*PI/24,-3*PI/12);
fill(0);
arc(203,185,110,110,-7*PI/24,-3*PI/12);
fill(211,61,18);
arc(203,185,103,103,-7*PI/24,-3*PI/12);

fill(211,61,18);
arc(151,207,280,280,22*PI/20,23*PI/20);
fill(255);
arc(151,207,252,252,22*PI/20,23*PI/20);
fill(0);
arc(151,207,173,173,22*PI/20,23*PI/20);
fill(211,61,18);
arc(151,207,165,165,22*PI/20,23*PI/20);

fill(227,209,93);
arc(217,256,440,440,6*PI/24,7*PI/24);
fill(255);
arc(217,256,360,360,6*PI/24,7*PI/24);
fill(211,61,18);
arc(217,256,110,110,6*PI/24,7*PI/24);

stroke(0);
line(54,175,60,162);
line(49,172,55,159);
strokeWeight(4);
line(43,170,50,156);

line(307,373,321,360);
strokeWeight(10);
line(320,387,332,375);
strokeWeight(6);
line(329,401,345,386);

//bars
stroke(0);
strokeWeight(3);
quad(342,431,600,236,600,271,397,431);
fill(0);
noStroke();
quad(500,285,507,266,600,293,600,319);

//taichi
fill(0);
stroke(0);
strokeWeight(3);
int A=238;
arc(RRCX,RRCY,80,80,radians(A),radians(A+180));
fill(255);
arc(RRCX,RRCY,80,80,radians(A+180),radians(A+360));
}
void keyPressed(){
  saveFrame("Kandisky.jpg");
}



