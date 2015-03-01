
  size(600, 300);
colorMode(RGB, 255);

fill(0, 0, 0);
rect(0, 0, 300, 300); //安定　背景

strokeWeight(1);
stroke(255,255,255);
line(0,150,300,150); //白ライン　横

fill(0, 0, 0);
rect(300, 0, 300, 600); //変動 背景

stroke(255);
strokeWeight(2);
line(301, 1, 600, 301); //斜め左からのライン

stroke(255);
strokeWeight(2);
line(600, 1, 301, 301); //斜め右からのライン

rectMode(CENTER);
fill(255, 255, 255);
rect(450, 150, 43, 43); //中央白四角

noFill();

stroke(225, 225, 255);
strokeWeight(4);
rect(450, 150, 70, 70);

stroke(200, 200, 200);
strokeWeight(8);
rect(450, 150, 120, 120);

stroke(125, 125, 125);
strokeWeight(15);
rect(450, 150, 200, 200); 

stroke(75);
strokeWeight(20);
rect(450, 150, 281, 281);//白からグレーの枠ｘ4




