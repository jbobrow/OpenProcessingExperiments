
// Q4
float y; // 正方形の中心の Y 座標値
float rot; // 正方形の回転角度(ラジアン) 
void setup(){
 size(400,400); smooth();
 y = 0;
 rot = 0;
}
void draw(){
 background(255); 
 stroke(255,25,50); 
 fill(255,25,50);
 y = y+1;
 rot = rot+PI/90;
// rot = rot+PI/900;
// rot = rot+PI/9;
 pushMatrix();
   translate( width/2, y); //(a) , (b) 
   rotate( rot ); //(c)
   rectMode(CENTER); // (d) 
   rect(0,0,20,20); 
 popMatrix();
}
