
int eSize = 10;

size(400, 565);
background(255);
smooth();


strokeWeight(3);　　//空に使った
for(int x=0; x<550; x+=5) {
  fill(255, x, 52);
  ellipse(x, x, eSize*100, eSize*100);
}


noStroke();　　　//背景と同色にして穴を開けた
fill(255, 255, 52);
ellipse(25, 8, 135, 135);

stroke(255, 255, 52);　　//穴の通路
strokeWeight(20);
line(80, 20, 140, 60);

noStroke();
fill(255, 255, 52);
ellipse(180, 90, 140, 140);

stroke(255, 255, 52);
strokeWeight(50);
line(200, 250, 180, 80);

noStroke();　　　　　//エル・リシツキーの作品
fill(170, 0, 0);
triangle(150,100,210,100,200,280);

stroke(100, 20, 200);
strokeWeight(3);
line(280, 200, 270, 230);

stroke(25, 100, 52);
strokeWeight(3);
line(180, 300, 190, 310);

stroke(20, 100, 52);
strokeWeight(1);
line(275, 195, 265, 225);


for(int x = 0; x <= width; x += 40){　　　//　真ん中のぽつぽつした電線のような？
    if(x == width/2){
    fill(190, 40, 30);
  }  
   else{
   fill(0);
 }

 ellipse(x, height/2, eSize, eSize);
 noStroke();
 println("x=" + x);
}


noStroke();　//　建物
fill(175, 0, 0);
rect(200, 300, 80, 270);

fill(0);　//　窓
rect(270, 300, 40, 270);


noStroke();
fill(200, 140, 0);
rect(290, 350, 180, 270);

fill(0);
rect(370, 350, 50, 270);

fill(255);
rect(210, 310, 50, 10);

fill(255);
rect(230, 330, 30, 5);



noStroke();
fill(20, 80, 10);
rect(170, 400, 80, 270);

fill(0);
rect(150, 400, 40, 270);


fill(255);
rect(210, 455, 10, 10);





noStroke();
fill(0);
rect(60, 450, 60, 150);

fill(20, 70, 110);
rect(120, 450, 90, 150);

fill(255);
rect(125, 450, 10, 10);

fill(255);
rect(200, 410, 10, 10);


