
size(600,300);
colorMode(RGB, 1000);//カラー範囲指定
background(0);//背景



//安定
noStroke();//淵に線なし
fill(0,0,0,0);//色指定
rect(300,300,300,300);//右半分座標指定


for(int i = 0 ; i < 1600; i++){//0から1600まで1ずつ増える
   noStroke();//淵を線なし
   fill(1000, random(200), 0, 900);//色指定
  ellipse(random(300) , random(300) , random(1), random(20));//円
}

//変動
noStroke();//淵に線なし
fill(0,800,800,1000);//色指定
rect(300,0,300,300);//左半分座標指定

for(int i = 0 ; i < 100; i++){//0から100まで1ずつ増える
   noStroke();//淵を線なし
   fill(random(500), 0, random(500,1000), random(255));//色指定
  ellipse(300+random(282) , random(300), 50, 50);//円
}




