
int eSize = 10;

size(600,300);
background(255);

fill(100,155,255);
noStroke();
rect(0,0,300,300);  //左後ろの水色

fill(255); //左の白い玉
noStroke();
ellipse(50,30,30,30);
ellipse(100,60,30,30);
ellipse(150,30,30,30);
ellipse(200,60,30,30);
ellipse(250,30,30,30);
ellipse(50,270,30,30);
ellipse(100,240,30,30);
ellipse(150,270,30,30);
ellipse(200,240,30,30);
ellipse(250,270,30,30);

fill(0,0,255); 
noStroke();
rect(0,100,300,100);  //左の真ん中の青

fill(0);
noStroke();
rect(300,0,600,300);  //右の背景黒

fill(#F1F20F); //右の黄色い玉
noStroke();
ellipse(350,50,30,30);
ellipse(480,30,30,30);
ellipse(400,250,30,30);
ellipse(550,280,30,30);
ellipse(520,20,30,30);
ellipse(340,280,30,30);
ellipse(500,250,30,30);
ellipse(360,200,30,30);
ellipse(600,90,30,30);
ellipse(560,220,30,30);
ellipse(420,70,30,30);

fill(#7C0B1A); //右下の赤円
noStroke();
ellipse(600,300,300,250);

stroke(0); //赤円に書いてある黒い線
strokeWeight(1);
line(453,275,600,300);
line(474,230,600,300);
line(474,130,600,300);
line(550,100,600,300);

fill(0); //右下の黒円
noStroke();
ellipse(600,300,100,100);

fill(#4B0C1F);
noStroke();
rect(300,100,600,100);  //右真ん中の赤

for(int i =0; i <= 600; i += 10) {  //真ん中の3本線
  if(300<i){
    fill(255, 600-i, 600-i);
  }else{
  
  fill(i,i,255);
  }
  ellipse(i, 100, eSize, eSize);
  ellipse(i, 200, eSize, eSize);
  ellipse(i, 150, eSize, eSize);
}

fill(#507DEA); //右真ん中の水色四角
noStroke();
rect(260,105,40,89);

fill(#F54505);   //左真ん中のオレンジ四角
noStroke();
rect(300,105,40,89);

stroke(255); //真ん中の白円
strokeWeight(3);
noFill();
ellipse(300,150,80,80);

stroke(#F0112B); //真ん中の赤円
strokeWeight(2);
noFill();
ellipse(300,150,50,50);








