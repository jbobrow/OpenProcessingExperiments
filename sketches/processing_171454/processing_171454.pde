
int eSize=20;//円の直径

size(600, 300);
background(0);
smooth();


//////////////////安定//////////////////

//背景色
fill(0, 50, 130, 150);
noStroke();
rect(0, 0, 300, 300);

//あわ
for (int y=-8; y<=340; y+=10) {
  for (int x=-8; x<=310; x+=10) {
    stroke(255, 255, 255, 70);
    noFill();
    ellipse(x, y, eSize, eSize);
    fill(0, y, y, 100);
  }
}
//円
for (int x= 10; x <= 425; x+=2) { 
  stroke(x+100, x-120, x-180, x-150); 
  noFill(); 
  ellipse(150, 150, x, x);
}


//////////////////変動//////////////////

//背景カンバス
fill(255);
rect(300, 0, 300, 300);

//背景色
fill(200, 0, 200, 160);
rect(300, 0, 300, 300);

//多角形
for (int i=0; i<=300; i+=2) {
  stroke(0, 0, 0, 20); 
  noFill();
  beginShape();
  vertex(random(300)+300, random(300));//点
  vertex(random(300)+300, random(300));//辺
  vertex(random(300)+300, random(300));//三角形
  vertex(random(300)+300, random(300));//四角形
  vertex(random(300)+300, random(300));
  vertex(random(300)+300, random(300));
  vertex(random(300)+300, random(300));
  vertex(random(300)+300, random(300));
  vertex(random(300)+300, random(300));
  vertex(random(300)+300, random(300));
  vertex(random(300)+300, random(300));
  vertex(random(300)+300, random(300));
  vertex(random(300)+300, random(300));
  vertex(random(300)+300, random(300));
  vertex(random(300)+300, random(300));//十五角形
  endShape(CLOSE);
}

//正方形
for (int i=0; i<=300; i+=1) {
  rectMode(CENTER);
  stroke(100-i, 100-i, 100-i, i-170); 
  noFill();
  rect(450, 150, i, i);
}










/*
for (int x= 10; x <= 450; x+=10) {
 stroke(x+100, x-20, x-50, x-150); 
 noFill(); 
 ellipse(450, 150, x, x);
 }
*/
/*
fill(50, 250, 180, 50);
 ellipse(60, 60, 400, 400);
 ellipse(240, 240, 400, 400);
 */



