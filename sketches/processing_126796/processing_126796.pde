
int Y;
int X;




void setup(){
  background(255);
  size(500,500);
  X=height/2;
}

void draw(){
for (int i = 1; i < 5; i = i + 1){ 
teken((i*100),X);
}
}

void teken(int monsterX, int monsterY){
noStroke();
ellipseMode(CENTER);
rectMode(CENTER);

//body
fill(242,115,17);
ellipse(monsterX,monsterY,80,60);

//face
fill(255,237,183);
ellipse(monsterX,monsterY-40,70,58);

//mouth
fill(0);
rect(monsterX,monsterY-20,10,1);

//hatleft
fill(65,193,60);
rect(monsterX-34,monsterY-40,17,28);

//hatright
fill(65,193,60);
rect(monsterX+34,monsterY-40,17,28);

//hat
fill(65,193,60);
rect(monsterX,monsterY-66,70,26);

//hatinside
fill(43,117,48);
rect(monsterX,monsterY-60,60,14);

//lefteye
fill(255,255,255);
ellipse(monsterX-9,monsterY-42,18,22);

//righteye
fill(255,255,255);
ellipse(monsterX+9,monsterY-42,18,22);

//lefteyepupil
fill(0);
ellipse(monsterX-4,monsterY-42,2,2);

//righteyepupil
fill(0);
ellipse(monsterX+4,monsterY-42,2,2);

//pants
fill(21,114,92);
rect(monsterX,monsterY+25,60,22);

//righthand
fill(65,193,60);
ellipse(monsterX+30,monsterY+10,20,20);

//lefthand
fill(65,193,60);
ellipse(monsterX-30,monsterY+10,20,20);

//shoes
fill(40,40,40);
rect(monsterX,monsterY+36,70,4);
}

