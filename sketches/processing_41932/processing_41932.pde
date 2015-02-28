
PImage bg;
PImage xh;
int tupianY = 0;
int heng = 0 ;
int youshu = 0 ;
int diheng = 550;

void setup(){
  size(600,800);
  bg = loadImage("pinkflamingo.jpg");
  image(bg,0,0);
  //frameRate(30) ;
}

void draw(){
 
  noStroke();
  fill(mouseX,255,mouseY,5);//写255的位置是green的位置
  smooth();
  
  //lian shang de shandian
  
  beginShape();
  vertex(252,140);
  vertex(171,319);
  vertex(169,346);
  vertex(170,395); 
  vertex(157,443);
  vertex(172.33,479);
  vertex(177.33,438);
  vertex(204,406); 
  vertex(190,499);
  vertex(225,547);
  vertex(266,416);
  vertex(328,294); 
  vertex(283,341);
  vertex(260,358); 
  vertex(372,165);
  vertex(334,138);
  vertex(253,140);
  endShape();
  
//shang zui chun
fill(mouseX,0,mouseY,5);
beginShape();
  vertex(295,518);
  vertex(257,519);
  vertex(259,523);
  vertex(267,527); 
  vertex(309,531);
  vertex(321,527);
  vertex(331,526);
  vertex(356,516); 
  vertex(372,506);
  vertex(353,509);
  vertex(336,512);
  vertex(321,525); 
  vertex(308,529);
  endShape();
  
  //xia zui chun
fill(mouseX,100,mouseY,5);
beginShape();
  vertex(369,515);
  vertex(340,524);
  vertex(297,534);
  vertex(281,535); 
  vertex(274,534);
  vertex(269,532);
  vertex(271,537);
  vertex(286,546); 
  vertex(306,550);
  vertex(334,545);
  vertex(358,525);
  endShape();
 
 //zuo yan
//fill(mouseX,100,mouseY,5);
//beginShape();
  //vertex(271,389);
  //vertex(254,390);
  //vertex(240,393);
  //vertex(232,397); 
  //vertex(220,396);
  //vertex(216,401);
  //vertex(225,407);
  //vertex(241,408); 
  //vertex(256,403);
  //vertex(269,395);
  //vertex(270,394);
  //endShape(); 
  
  xh = loadImage("pinkflamingo2.png");
  image(xh,0,tupianY);
  tupianY=tupianY+1;
 
 xh = loadImage("pinkflamingo2.png");
 image(xh,heng,0);
 heng = heng +1;
  
    
  xh = loadImage("pinkflamingo2.png");
  image(xh,550,youshu);
  youshu = youshu + 1;
   
  xh = loadImage("pinkflamingo2.png");
  image(xh,diheng,750);
  diheng=diheng - 1;

}


void mousePressed() {
xh = loadImage("pinkflamingo2.png");
image(xh,mouseX,mouseY);
println( "WE CAN BE HEROS! ");
}

   
//void keyPressed(){
 // background(255);
//}

