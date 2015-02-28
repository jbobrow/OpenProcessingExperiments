
size(800, 800);
background(255);
smooth();
noStroke();

//背景
for(int y=0; y<=height; y+=50) {
  for(int x=0; x<=width; x+=50) {
    fill(y-150, x-150, 100, 60);
    ellipse(x, y, 100, 100);
  }
}

//太い線
strokeWeight(50);
stroke(255,200,150,100);
line(0,100,800,700);

//白線
strokeWeight(10);
stroke(255,100);
line(250,0,750,800);

//細い白線
strokeWeight(5);
line(0,250,800,600);

//色つき三角
fill(255,180);
noStroke();
triangle(230, 375, 358, 220, 486, 375); //上
triangle(430, 475, 458, 620, 586, 475); //下

//線のみ三角
noFill();
strokeWeight(3);
stroke(255,190);
triangle(50, 75, 258, 20, 296, 210); //上
strokeWeight(5);
triangle(580, 675, 710, 620, 756, 755); //下



