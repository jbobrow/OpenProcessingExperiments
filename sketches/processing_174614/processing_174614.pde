
int eSize , R , G , B , eR , eG , eB ,Trans ,EraserFlug;




void setup(){//初期設定

  size(500, 500);

  background(255);

  eSize = 10 ;

  R = 0;

  G = 0;

  B = 0;

  eR = 255;

  eG = 255;

  eB = 255;

  Trans = 255;

  EraserFlug = 0;

}


void draw(){//描画処理

  smooth();

  noStroke();

  fill(R , G , B, Trans);

  if (mousePressed == true){//筆を使っているとき

    if ( EraserFlug == 0){
      if(Trans == 255){
     stroke(R , G , B, Trans);//透明度が0のとき
     strokeWeight(eSize);
     
     line(mouseX, mouseY,pmouseX, pmouseY);
      }
    else{                     //透明度があるとき
    noStroke();
     ellipse(mouseX,  mouseY,  eSize,  eSize);
    }
  }
else{//消しゴムを使っているとき

    fill(eR , eG , eB);

    rect(mouseX, mouseY,10,10);

    rect(pmouseX, pmouseY,10,10);

  }
    noStroke();
  }
  fill (255, 255, 255);

  rect(0, 0,50, 50);
  
  fill(R , G , B , Trans);//現在の筆の色を表示

  ellipse(eSize/2,  eSize/2,  eSize,  eSize);
  
  fill (255, 255, 255);
  
  if ( EraserFlug == 1){//消しゴムモードなら赤い枠を表示する
  strokeWeight(1);
  stroke(255, 0, 0);
  
  rect(50, 0,49, 49);
  
   noStroke();
  }
  else {//モード解除で枠を消す
    rect(50, 0, 50, 50);
  }
  fill(eR , eG , eB);
  
  rect(60, 10 ,30, 30);
}

void keyPressed(){

  if(key == CODED){

  if(keyCode == UP && eSize < 50){   /*筆の大きさを変化させる*/

    eSize += 5;                      /* 上を押すと大きくなり */

  }                                  /* 下を押すと小さくなる */

  if(keyCode == DOWN && eSize > 10){ /*10~50pxの間で変化する */

    eSize -= 5;

  }

  }
switch(key){    /*    r,g,bそれぞれのキー押下で    */

  case 'r':     /*  筆の色のそれぞれの値を上げる   */

  if (R < 255){ /*shiftを同時に押すことで値を下げる*/

  R += 5;

  }

  break;

  case 'R':

  if (R > 0){

  R -= 5;

  }

  break;

  case 'g':

  if (G < 255){

  G += 5;

  }

  break;

  case 'G':

  if (G > 0){

  G -= 5;

  }

  break;

  case 'b':

  if (B < 255){

  B += 5;

  }

  break;

  case 'B':

  if (B > 0){

  B -= 5;

  }

  break;
  
    case '+':               /*透明度の上下を行う*/
                            /*-で透明度が上がり */
  if (Trans < 255){         /*+で透明度が下がる */

  Trans += 5;

  }

  break;

  case '-':

  if (Trans > 0){

  Trans -= 5;

  }

  break;

  case 'c'://画面のクリア

  fill (255, 255, 255);

   rect(0, 0, 500, 500);
   
   eR = 255;
   eG = 255;
   eB = 255;

   break;
   
   case 'e'://筆と消しゴムのモードの切り替え

   if(EraserFlug == 0)

   EraserFlug++;

   else

   EraserFlug = 0;

   break;

   case 's'://消しゴムに筆の色を反映させる
   
   eR = R;
   eG = G;
   eB = B;
   
    break;
    
    case 'S'://消しゴムを白くする
    
   eR = 255;
   eG = 255;
   eB = 255;

   break;
  }

}


