
int Y_AXIS = 1;
int X_AXIS = 2;

void setup() {
size(400,400);
color b1 = color(200, 230, 255);
color b2 = color(100, 150, 210);
setGradient(0, 0, width, height, b1, b2, Y_AXIS);
}

void draw() {
  smooth();
  noStroke();
  
//neck
  fill(245,200,180);
  rect(125,180,150,230);
  fill(245,210,190);
  rect(145,190,110,230);
  fill(245,170,160);
  ellipse(200,255,140,130);

//shoulders
  fill(245,200,180);
  ellipse(200,430,500,200);
  fill(245,210,190);
  ellipse(200,430,400,200);

 //ears
  fill(245,200,180);
  ellipse(100,150,80,80);
  ellipse(300,150,80,80);
  ellipse(100,175,60,60);
  ellipse(300,175,60,60);
  fill(255,220,200);
  ellipse(100,150,70,70);
  ellipse(300,150,70,70);
  ellipse(100,175,50,50);
  ellipse(300,175,50,50);
  fill(245,190,170);
  ellipse(105,150,70,60);
  ellipse(295,150,70,60);
  ellipse(105,175,50,40);
  ellipse(295,175,50,40);
//head
  fill(245,200,180);
  ellipse(200,180,220,230);
  ellipse(200,120,250,280);
  fill(245,210,190);
  ellipse(200,180,170,220);
  ellipse(200,120,230,270);
//cheeks
  fill(255,220,200);
  ellipse(130,170,80,80);
  ellipse(270,170,80,80);
  fill(255,230,220);
  ellipse(120,165,50,50);
  ellipse(280,165,50,50);
  fill(255,245,240);
  ellipse(120,160,30,30);
  ellipse(280,160,30,30);
  fill(255);
  ellipse(120,160,10,10);
  ellipse(280,160,10,10);
//chin/forehead
  fill(255,220,200);
  ellipse(200,60,150,150);
  ellipse(200,275,50,30);
  fill(255,230,220);
  ellipse(200,0,100,80);
  ellipse(200,275,40,20);
//mouth
  fill(235,180,140,200);
  ellipse(200,250,60,35);
  fill(235,100,100);
  ellipse(200,245,60,30);
  fill(255,150,150);
  ellipse(200,240,80,30);
  fill(235,100,100);
  ellipse(200,235,60,20);
  fill(255,150,150);
  ellipse(200,230,90,15);
//nose
//shadow
  fill(235,180,140,100);
  ellipse(200,200,50,50);
  fill(215,180,160);
  ellipse(200,200,20,40);
//bridge  
  fill(255,220,200);
  ellipse(183,190,30,30);
  ellipse(217,190,30,30);
  fill(255,230,220);
  ellipse(183,190,20,20);
  ellipse(217,190,20,20);
  fill(255,245,240);
  ellipse(183,187,10,10);
  ellipse(217,187,10,10);
 //nose-middle
  fill(255,220,200);
  rect(180,100,40,90);
  ellipse(200,190,40,40);
      fill(0,0,0,100);
  ellipse(180,201,10,5);
  ellipse(220,201,10,5);
  fill(255,230,220);
  rect(188,110,25,80);
  ellipse(200,190,30,30);
  fill(255,245,240);
  rect(193,117,16,60);
  ellipse(200,185,18,18);
  fill(255);
  ellipse(205,190,10,10);
  
//drawing eyes - left
//eyebrow
  fill(100,10,10);
  ellipse(138,110,70,60);
//eyelid
  fill(245,200,170);
  ellipse(138,116,70,60);
  fill(255,230,200);
  ellipse(138,116,60,40);
  fill(255,240,230);
  ellipse(138,116,60,35);
//whites
  fill(255,200,200);
  ellipse(138,120,60,30);
  fill(255);
  ellipse(138,119,55,28);
//iris
  fill(100,150,255);
  ellipse(138,119,30,30);
  fill(60,200,240);
  ellipse(138,119,27,27);
  fill(60,20,100);
  ellipse(138,118,23,23);
  fill(40,100,255);
  ellipse(138,119,20,20);
//pupil
  fill(0);
  ellipse(138,118,17,17);
//shine
  fill(255,200);
  ellipse(136,114,5,5);
  fill(255,240);
  ellipse(128,112,10,10);
  
//drawing eyes - right
//eyebrow
  fill(100,10,10);
  ellipse(135+127,110,70,60);
//eyelid
  fill(245,200,170);
  ellipse(120+142,116,70,60);
  fill(255,230,200);
  ellipse(120+142,116,60,40);
  fill(255,240,230);
  ellipse(120+142,116,60,35);
//whites
  fill(255,200,200);
  ellipse(120+142,120,60,30);
  fill(255);
  ellipse(120+142,119,55,28);
//iris
  fill(100,150,255);
  ellipse(120+142,119,30,30);
  fill(60,200,150);
  ellipse(120+142,119,27,27);
  fill(60,20,100);
  ellipse(120+142,118,23,23);
  fill(40,100,255);
  ellipse(120+142,119,20,20);
//pupil
  fill(0);
  ellipse(120+142,118,17,17);
//shine
  fill(255,200);
  ellipse(117+142,114,5,5);
  fill(255,240);
  ellipse(110+142,112,10,10);
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
  if(axis == Y_AXIS){
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }  
  }  
}


 

