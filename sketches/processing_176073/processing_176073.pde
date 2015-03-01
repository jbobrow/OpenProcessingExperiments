
int x,y;
int eSize;


void setup(){
 size(500,500);
 background(255);
 colorMode(RGB);
 smooth();
 noStroke();
 fill(0);
 eSize=10;
}


//----------描く(黒)
void draw(){
 if(mousePressed==true){
    ellipse(mouseX,mouseY,eSize,eSize);
  }
}


//---------キーボード
void keyPressed() {
  
  if(key == CODED) {
    if(keyCode == UP) {
      eSize ++;
    }else if (keyCode == DOWN) {
      eSize --;
    }
  }



switch(key) {
//-----リセット   
  case'0':
   background(255);
   break;

//-----消しゴム  
   case'w':
    fill(255,255,255);
    break;


//-----黒 
   case'B':
    fill(0,0,0);
    break;

//-----赤    
   case'r':
    fill(255,0,0);
    break;

//-----青  
   case'b':
    fill(0,0,255);
    break;

//-----ランダム    
  case'R':
    fill(random(255),random(255),random(255));
    break;
    
 case'a':
  fill(random(255),random(255),random(255));
  break;
 
 
  }
}


