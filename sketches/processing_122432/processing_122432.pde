
int monsterY;
int monsterX;

void setup(){
  size(200,200);
  monsterY=height/2;
  monsterX=width/2;
}

void draw(){
background(255,255,255);
monsterY = monsterY - 1;
if (monsterY == -100) { monsterY = height/2;}

//body
noStroke();
fill(242,115,17);
ellipseMode(CENTER);
ellipse(mouseX,monsterY,80,60);

//face
noStroke();
fill(255,237,183);
ellipseMode(CENTER);
ellipse(mouseX,monsterY-40,70,58);

//mouth
noStroke();
fill(0);
rectMode(CENTER);
rect(mouseX,monsterY-20,10,1);

//hatleft
noStroke();
fill(65,193,60);
rectMode(CENTER);
rect(mouseX-34,monsterY-40,17,28);

//hatright
noStroke();
fill(65,193,60);
rectMode(CENTER);
rect(mouseX+34,monsterY-40,17,28);

//hat
noStroke();
fill(65,193,60);
rectMode(CENTER);
rect(mouseX,monsterY-66,70,26);

//hatinside
noStroke();
fill(43,117,48);
rectMode(CENTER);
rect(mouseX,monsterY-60,60,14);

//lefteye
noStroke();
fill(255,255,255);
ellipseMode(CENTER);
ellipse(mouseX-9,monsterY-42,18,22);

//righteye
noStroke();
fill(255,255,255);
ellipseMode(CENTER);
ellipse(mouseX+9,monsterY-42,18,22);

//lefteyepupil
noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(mouseX-4,monsterY-42,2,2);

//righteyepupil
noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(mouseX+4,monsterY-42,2,2);

//pants
noStroke();
fill(21,114,92);
rectMode(CENTER);
rect(mouseX,monsterY+25,60,22);

//righthand
noStroke();
fill(65,193,60);
ellipseMode(CENTER);
ellipse(mouseX+30,monsterY+10,20,20);

//lefthand
noStroke();
fill(65,193,60);
ellipseMode(CENTER);
ellipse(mouseX-30,monsterY+10,20,20);

//shoes
noStroke();
fill(40,40,40);
rectMode(CENTER);
rect(mouseX,monsterY+36,70,4);

monsterY--;

}  


