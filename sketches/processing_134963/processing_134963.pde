
int xLoc;

/*int boxAX=0;
int boxAY=100;
int boxAW = 100;
 
int boxBX = boxAX;
int boxBY =boxAY + 20;
int boxBW = 200;
 
int boxCX = boxBX;
int boxCY = boxBY + 20;
int boxCW = 150;
 
 int boxDX = boxCX;
int boxDY = boxCY + 20;
int boxDW = 250;*/

void setup(){
size(600, 800);
}

void draw (){
background(0,0,0);


stroke(225,255,255);
line(300,0,xLoc,450);

noStroke();
fill(156,91,34);
rect(0,725,50,75);
fill(77,113,74,191);
rect(45,725,55,75);
fill(185,182,81);
rect(100,725,50,75);
fill(170,70,67);
rect(150,725,50,75);
fill(49,66,129);
rect(200,725,50,75);
fill(98,103,227);
rect(250,725,100,75);
fill(34,98,31);
rect(350,725,50,75);
fill(218,227,105);
rect(400,725,50,75);
fill(162,112,64,191);
rect(445,725,55,75);
fill(185,75,88);
rect(500,725,50,75);
fill(124,31,31);
rect(550,725,50,75);
fill(33,33,30);
rect(550,0,50,50);
fill(71,71,65);
rect(550,50,50,50);
fill(115,115,104);
rect(550,100,50,50);
fill(166,166,150);
rect(550,150,50,50);

fill(14,30,166);
ellipse(xLoc,500,175,175);
fill(232,197,12);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
fill(255,0,0);
ellipse(xLoc,500,50,50);

xLoc=mouseX;

if(mouseX<50 && mouseX>0 && mouseY>725 && mouseY<800){
  fill(156,91,34);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
fill(255,0,0);
ellipse(xLoc,500,50,50);
}

else if(mouseX>50 && mouseX<100 && mouseY>725 && mouseY<800){
   fill(156,91,34);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
fill(255,0,0);
ellipse(xLoc,500,50,50);
}

else if(mouseX>100 && mouseX<150 && mouseY>725 && mouseY<800){
  fill(185,182,81);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
fill(255,0,0);
ellipse(xLoc,500,50,50);
}

else if(mouseX>150 && mouseX<200 && mouseY>725 && mouseY<800){
  fill(185,182,81);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
  fill(170,70,67);
ellipse(xLoc,500,50,50);
}

else if(mouseX>200 && mouseX<250 && mouseY>725 && mouseY<800){
  fill(49,66,129);
ellipse(xLoc,500,175,175);
fill(185,182,81);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
  fill(170,70,67);
ellipse(xLoc,500,50,50);
}

else if(mouseX>250 && mouseX<350 && mouseY>725 && mouseY<800){
  fill(98,103,227);
ellipse(xLoc,500,175,175);
fill(185,182,81);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
  fill(170,70,67);
ellipse(xLoc,500,50,50);
}

else if(mouseX>350 && mouseX<400  && mouseY>725 && mouseY<800){
    fill(98,103,227);
ellipse(xLoc,500,175,175);
fill(185,182,81);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
  fill(170,70,67);
ellipse(xLoc,500,50,50);
}

else if(mouseX>400 && mouseX<450 && mouseY>725 && mouseY<800){
  fill(98,103,227);
ellipse(xLoc,500,175,175);
  fill(218,227,105);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
fill(170,70,67);
ellipse(xLoc,500,50,50);
}

else if(mouseX>450 && mouseX<500 && mouseY>725 && mouseY<800){
    fill(98,103,227);
ellipse(xLoc,500,175,175);
  fill(218,227,105);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
fill(170,70,67);
ellipse(xLoc,500,50,50);
}

else if(mouseX>500 && mouseX<550 && mouseY>725 && mouseY<800){
     fill(98,103,227);
ellipse(xLoc,500,175,175);
  fill(218,227,105);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
  fill(185,75,88);
ellipse(xLoc,500,50,50);
}

else if(mouseX>550 && mouseX<600 && mouseY>725 && mouseY<800){
     fill(98,103,227);
ellipse(xLoc,500,175,175);
  fill(218,227,105);
ellipse(xLoc,500,150,150);
fill(255,255,255);
ellipse(xLoc,500,125,125);
  fill(124,31,31);
ellipse(xLoc,500,50,50);
}
}
// Kilma af Klint is the abstract artist whose style I decided to replicate for this project. She uses a lot of circles often near the center of the page and sometimes they have lines that connect them to the top of the page. She also likes to use rectangles or circles in a gride like pattern. She loves color and often uses a rainbow color scheme with a black or white background. For these reasons I came up with my composition.



