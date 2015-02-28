
// Q6
// rs は int 型の配列、rs[i]には、値 i の出現回数を保存しておく
int[] rs;
void setup(){
 size(400,200);
 rs = new int[400]; //10 個の要素を確保
 for(int i=0;i<rs.length;i++){ 
   // 配列 rs の各要素の値を 0 にする
   rs[i] = 0 ; 
 }
}

void draw(){
  background(255); stroke(0); fill(128);
  //0〜～9 までの整数の乱数を発生させる 
  int r =int(random(rs.length));
  rs[r]+=1; // 値rの出現回数を1回増やす 
  int barWidth = int(width/rs.length); 
  for(int i=0;i<rs.length;i++){
    rect(barWidth*i,height-rs[i], barWidth, rs[i]);
  }
}
