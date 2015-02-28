
//int x = 190;
//int y = 490;
//int bodyH = 180;
int neckH = 193, mouseY;
//int radius = 120; 
//int ny = y - bodyHeight - neckHeight - radius; // Neck Y



float easing = 0.02;
void setup() {
size(500,500);
background(176,224,230);
smooth();
}

void draw(){
int targetX= mouseY;





//neck
fill(0,110,100);
rect(193,neckH,15,neckH);

//head
fill(0,104,139);
ellipse(200, neckH-50, 120,120);

fill(0);
rect(155,neckH-120,5,20);  //eyelashes
rect(165,neckH-128,5,20);
rect(175,neckH-126,5,20);

fill(135,206,255);  //large eye
ellipse(160,neckH-90,50,50);
fill(0);
ellipse(155,neckH-95,32,32);
fill(200);
ellipse(155,neckH-95,12,12);

fill(0);            //small eye
ellipse(235,neckH-60,32,32);
fill(200);
ellipse(235,neckH-60,12,12);

 {
//mouth

if (mousePressed) { 
  strokeWeight(10);
  strokeJoin(ROUND);
  rect(180,neckH-30,60,20);
  
} else {
strokeWeight(2);
rect(180,neckH-30,60,20);
}
}

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


