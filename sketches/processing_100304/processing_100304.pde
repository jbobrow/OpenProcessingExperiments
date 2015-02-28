
//課題3 ローソン征服模様
//1223010 鈴木百合彩

void setup(){
  size(400,400);                   //画面サイズ400×400
}

void draw(){
  background(255);
  noStroke();
  /*ストライプ模様を描画*/
  for(int i=0;i<10;i++){   
    fill(80,200,240);             //水色
    rect(i*80,0,40,height);       //ストライプの色付き部分
  } 
  /*ジッパー*/
  fill(255,40,160);
  rect(width/2-15,0,30,height);   //布部分
  /*ジッパーのかみ合わせ部分*/
  for(int i=0;i<20;i++){
    strokeWeight(2);
    stroke(250,170,220);
    line(width/2-15,i*20,width/2+15,i*20);
  }
  /*ジッパーの持ち手とすべる部分*/
  rect(width/2-5,0,10,height);
  triangle(width/2,0,width/2-10,50,width/2+10,50);
  /*袖を作るために切り取り*/
  fill(250,250,170);
  rect(width-60,220,80,180);
  rect(0,220,60,180);
}
