
int neckH = 200;



void setup() {
size(500,500);
smooth();
}

void draw() {
  background(176,224,230);
  int targetX = mouseX;
  //x+= (targetX-x) * easing;
  
  if (mousePressed) {
    neckH = 120;
  } else {
    neckH = 200;
  }
  

//neck
fill(0,110,100);
rect(193,neckH + 58,15,neckH+30);

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
rect(160,450,60,40);
fill(0,110,100);
rect(193,410,15,40);


//body

fill(0);
beginShape();
vertex(160,300);
vertex(300,300);
vertex(300, 250);
vertex(350,250);
vertex(350,350);
vertex(260,350);
vertex(260,360);
vertex(330,360);
//vertex(
vertex(330,370);
vertex(260,370);
vertex(260,380);
vertex(350,380);
vertex(350,420);
vertex(160,420);
endShape(CLOSE);

fill(135,206,255);
for (int i = 200; i < 320; i += 20) {ellipse(i, 320, 10,10);}
for (int i = 200; i < 320; i += 20) {ellipse(i, 400, 10,10);}


//ARMS
//left
//wrist
fill(0,110,100);
rect(145,350,30,10);

fill(0,104,139);
beginShape();
vertex(120, 340);
vertex(150,340);
vertex(150,380);
vertex(130,380);
vertex(130,370);
vertex(140,370);
vertex(140,350);
vertex(130,350);
vertex(130,360);
vertex(120,360);
endShape(CLOSE);
//right

}

