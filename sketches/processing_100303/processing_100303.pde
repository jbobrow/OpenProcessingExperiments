
//課題3 ＜イチゴ模様＞
//1223010 鈴木百合彩

void setup(){
  size(400,400);
  strokeWeight(10);
}

void draw(){
  background(70,240,60);               //後にヘタ部分
  /*イチゴの果肉部分*/
  noStroke();
  fill(255,0,0);
  rect(0,150,width,height);            //果肉の下側
  for(int i=0;i<8;i++){
    stroke(0);
    arc(i*50+25,150,50,50,PI,PI*2);    //ヘタとの境界線付近
  }
  /*イチゴのつぶつぶ*/
  for(int i=0;i<8;i++){
    for(int j=0;j<5;j++){
      fill(0);
      ellipse(i*50+25,180+j*50,5,5);
      ellipse(i*50+50,200+j*50,5,5);
    }
  }
}
