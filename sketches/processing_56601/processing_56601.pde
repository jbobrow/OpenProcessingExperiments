
int neckH = 200;
int x = 260;
PImage landscape;

void setup() {
size(1024,768);
smooth();
landscape  = loadImage("street.jpg");
}

void draw() {
  background(landscape);
  int targetX = mouseX;
  //x+= (targetX-x) * easing;
  
  if (mousePressed) {
    neckH = 380;
  } else {
    neckH = 460;
  }
  
  
//neck
fill(0,110,100);
rect(193,neckH + 58,15,neckH-100);

//head
fill(0,104,139);
ellipse(200, neckH, 120,120);

fill(0);
rect(155,neckH-80,5,20);  //eyelashes
rect(165,neckH-78,5,20);
rect(175,neckH-76,5,20);

fill(135,206,255);  //large eye
ellipse(160,neckH-40,50,50);
fill(0);
ellipse(155,neckH-45,32,32);
fill(200);
ellipse(155,neckH-45,12,12);

fill(0);            //small eye
ellipse(235,neckH-10,32,32);
fill(200);
ellipse(235,neckH-10,12,12);
//mouth
fill(0);
strokeJoin(ROUND);
rect(180,neckH+20,60,20);

//leg
fill(0,104,139);
rect(160,450+x,60,40);
fill(0,110,100);
rect(193,380+x,15,30);


//body

fill(0);
beginShape();
vertex(160,300+x);
vertex(300,300+x);
vertex(300, 250+x);
vertex(350,250+x);
vertex(350,350+x);
vertex(260,350+x);
vertex(260,360+x);
vertex(330,360+x);
//vertex(
vertex(330,370+x);
vertex(260,370+x);
vertex(260,380+x);
vertex(350,380+x);
vertex(350,420+x);
vertex(160,420+x);
endShape(CLOSE);

fill(135,206,255);
for (int i = 200; i < 320; i += 20) {ellipse(i, 320+x, 10,10);}
for (int i = 200; i < 320; i += 20) {ellipse(i, 400+x, 10,10);}


//ARMS
//left
//wrist
fill(0,110,100);
rect(145,350+x,30,10);

fill(0,104,139);
beginShape();
vertex(120, 340+x);
vertex(150,340+x);
vertex(150,380+x);
vertex(130,380+x);
vertex(130,370+x);
vertex(140,370+x);
vertex(140,350+x);
vertex(130,350+x);
vertex(130,360+x);
vertex(120,360+x);
endShape(CLOSE);
//right

}

