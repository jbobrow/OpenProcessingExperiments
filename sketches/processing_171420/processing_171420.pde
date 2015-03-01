
int i; 
int eSize =15;


size(600, 300); 

background(0); 

rect(300, 0, 300, 300);
fill(255);
colorMode(RGB, 360); 

strokeWeight(4); 


/* ここから変動*/
translate(500, 100); //右側の絵の位置を指定

 stroke(0,40); 
for (i=0; i<360; i++) { 
 
  rotate(PI/60);//図形を指定した数だけ回転させる
  fill(255,235,5, 10);//外側の黄色い四角の部分
  rect(50, 70, 30, 150); 
     
  rotate(PI/30);    
  fill(10, 0, 250, 10);//中心の淵有の部分
  rect(10, 10, 40, 10);
}


for (i=0; i<360; i++) { 
noStroke();  
  rotate(PI/15);
  fill(100, 0, 250, 20);//外側から二番目の紫の部分
  rect(20,55,100,20);
  }

/* ここまで変動*/

/* ここから安定*/
fill(360);
rect(-500, -100,300 , 300);//黒の背景
translate(-500, -100);
colorMode(RGB, 360);
noStroke();
for(int y=0; y<300; y+=10) {  //左側の背景
  
for(int x=0; x<300; x+=10) {    
  fill(0,0, y+100, 100);
  rect(x,y, eSize, eSize);
 }
 
}
translate(125, 105); //左側の図形の位置を指定
for (i=0; i<360; i++) { 
  noStroke();  
 rotate(PI/10);

  fill(70, 100, i, 10);
  ellipse(20, 20, 10, 10);

  fill(100, 100, i, 10);
  ellipse(40, 40, 10, 10);

  fill(310, 330, i, 10);
  ellipse(60, 60, 20, 20);


  fill(330, 360, i, 10);
  ellipse(80, 80, 30, 30);

}

translate(-50, 50); //左側の図形の位置を指定
for (i=0; i<360; i++) { 
  noStroke();    
 rotate(PI/10);


  fill(70, 100, i, 20);
  ellipse(20, 20, 10, 10);

  fill(100, 100, i, 20);
  ellipse(40, 40, 10, 10);

  fill(310, 330, i, 30);
  ellipse(60, 60, 20, 20);

  fill(350, 340, i, 30);
  ellipse(80, 80, 30, 30);

} 

translate(90, 130); //左側の図形の位置を指定
for (i=0; i<360; i++) { 
  noStroke();  
 rotate(PI/10);

  fill(70, 100, i, 100);
  ellipse(20, 20, 10, 10);

  fill(100, 100, i, 100);
  ellipse(40, 40, 10, 10);

  fill(310, 330, i, 100);
  ellipse(60, 60, 20, 20);

  fill(350, 340, i, 80);
  ellipse(80, 80, 30, 30);


} 
/* ここまで安定*/


