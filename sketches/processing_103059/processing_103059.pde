
// Day12 Q5
/*
 次のプログラムは問 4 のプログラムを変更して
 作成したものです。正方形が一番下まで移動したら、
 上に戻り、再び下のほうに移動し、さらに下から上に戻る
 際に、落下する速さを乱数で変更しています。
*/
float y; // 正方形の中心の Y 座標値
float rot; // 正方形の回転角度(ラジアン)
float v; // 正方形の移動速度
void setup(){
 size(400,400); smooth();
 y = 0;
 rot = 0;
 v = random(0.5,1.5); 
}

void draw(){
 background(255);
 stroke(255,25,50); 
 fill(255,25,50); 
 rot = rot+PI/90;
 y= y + v; // (a) 
 if(y>height){ // (b) 
   y = 0;
   v= random(0.5,1.5);//(c) 
 }
 pushMatrix();
  translate(width/2,y);// (d) , (e) 
  rotate(rot); // (g) 
  rectMode(CENTER);  // (g) 
  rect(0,0,20,20);
 popMatrix();
}
