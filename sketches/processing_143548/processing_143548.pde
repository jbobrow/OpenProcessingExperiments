
float nuvlloc1 = 200;
float nuvlloc2 = 500;
float nuvlloc3 = 700;
float nuvlloc4 = 900;
float posiciox= 0;
float posicioy= 0;
int color1=0;
int color2=0;
int color3=0;
int llargarbre = 800;
int centrearbre = 400;
int altnuv = 80;

float posx3= 900;
float posy3= 250;
float posx2 = posx3;
float posy2 = posy3;

void setup() {
  size(1000,600);
  background(0,255,255);
}

void draw(){
if (mouseX < 400) {
  
  noStroke();
fill(0,255,255);
rect(0, 0, 800, 600);
rect(800, 0, 1000, 160);
rect(800, 450, 1000, 600);

//arbre
fill(140,100,0);
rect(875,260,50,500,10);

fill(0,random(100,255),0);
ellipse(posx3, posy3, 20, 20);
  posx3=posx3+random(0,40)-20;
  posy3=posy3+random(0,40)-20;
  if (sqrt(sq(posx3-posx2)+sq(posy3-posy2))>80) {posx3=posx2; posy3=posy2;}
  
  //nuvols//
  fill(255);
  ellipse(nuvlloc1,altnuv,180,110);
  nuvlloc1 = nuvlloc1-random(30,40);
  if(nuvlloc1<-100) {nuvlloc1 = 1100;}
  
  ellipse(nuvlloc2,altnuv,200,130);
  nuvlloc2 = nuvlloc2-random(20,30);
  if(nuvlloc2<-100) {nuvlloc2 = 1100;}
  
  ellipse(nuvlloc3,altnuv,220,150);
  nuvlloc3 = nuvlloc3-random(10,20);
  if(nuvlloc3<-100) {nuvlloc3 = 1100;}
  
  ellipse(nuvlloc4,altnuv,160,90);
  nuvlloc4 = nuvlloc4-random(40,50);
  if(nuvlloc4<-100) {nuvlloc4 = 1100;}
  
  
  //gespa1//
  strokeWeight(2);
  stroke(0,255,0);
  for (int i = 0; i < 1000; i = i+1) {
    line(i, height, i, random(height-120, height-80));
}

//llumraig//
strokeWeight(3);
stroke(255,200,0);
line(mouseX+200, 220, random(mouseX+100, mouseX+300), random(160, 180));
line(mouseX+200, 220, random(mouseX+100, mouseX+300), random(160, 180));
line(mouseX+200, 220, random(mouseX+100, mouseX+300), random(160, 180));
line(mouseX+200, 220, random(mouseX+100, mouseX+300), random(160, 180));
line(mouseX+200, 220, random(mouseX+100, mouseX+300), random(160, 180));

//llum//
stroke(0,0,0);
fill(255,255,0);
ellipse(mouseX+200, 250, 50, 100);

//cos//
noStroke();
fill(255,0,0);
rect(mouseX, 350, 400, 150, 25);
ellipse(mouseX+200, 350, 300, 250);

//rodes//
noStroke();
fill(0,0,0);
ellipse(mouseX+100, 500, 80, 80);
ellipse(mouseX+300, 500, 80, 80);

//logo//
fill(255,255,255);
rect(mouseX+200, 400, 30, 30);
rect(mouseX+260, 400, 30, 30);
rect(mouseX+320, 400, 30, 30);

//lvidre//
fill(0,0,255);
rect(mouseX+180, 270, 120, 80, 5, 50, 5, 5);

//text//
fill(255,255,255);
textSize(38);
text("080",mouseX+70,430);

//gespa2//
  strokeWeight(2);
  stroke(0,255,0);
  for (int i = 0; i < 1000; i = i+1) {
    line(i, height, i, random(height-80, height-50));
  }
}

else {
  background(0,255,255);
  textSize(75);
  fill(255, 0, 0);
  text("Ves amb compte!", 150, 300); 
}

}


