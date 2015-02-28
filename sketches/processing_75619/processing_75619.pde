
int[][] men = new int[6][9];
int[] yo = {1,2,3,4};

void setup(){
  size(440, 440, P3D);
  
  for(int i=0;i<6;i++){
    for(int j=0;j<9;j++){
      men[i][j]=i; //全ての面の色情報配列
    }
  }

}

int count=0;
//白、青、赤、緑、黄色、オレンジ、黒
color[] ctable = {#FFFFFF,#0067C0,#ED1A3D,#008000,#FFD400,#f39800,#000000,#9932cc};
int c=0;
float alpha=255;
int xkaku=-45;
int stage=1;
int dx=0; //どこの列が回るか
int which=0;//どちらの方向に回るか
void draw(){
 switch(stage){
   case 1: //最初の画面と
   case 2: //タテヨコの動かす場所を指定した場合
   case 3: //奥回転の場合
   case 4: //ぐるぐる
     background(255);
     pushMatrix();
       boxes();//以上の時は普通に描画
     popMatrix();
     break;
   case 5: //横回転
     translate(width/2, height/2, 0);
     background(255);
     pushMatrix();
       yoko();
     popMatrix();
     pushMatrix();
       yokorem();
     popMatrix();  
   
     count+=2;
     if(count>90){
       cychange();
       stage=1;
       count=0;
       dx=0;
       which=0;
     }
     break;
   case 6: //タテ回転
     translate(width/2, height/2, 0);
     background(255);
     pushMatrix();
       tate();
     popMatrix();
     pushMatrix();
       taterem();
     popMatrix();  
     count+=2;
     if(count>90){
       ctchange();
       stage=1;
       count=0;
       dx=0;
       which=0;
     }
     break;
   case 7: //奥回転
     translate(width/2, height/2, 0);
     background(255);
     pushMatrix();
       oku();
     popMatrix();
     pushMatrix();
       okurem();
     popMatrix();  
     count+=2;
     if(count>90){
       cochange();
       stage=1;
       count=0;
       dx=0;
       which=0;
     }
     break;
   case 8: //ランダムセット
     background(255);
     pushMatrix();
       //load();
     popMatrix();
     int s=0;
     for(int d=0;d<20;d++){
       dx=int(random(3));
       which=int(random(1,3));
       s=int(random(3));
       
       if(s==0){
         ctchange();
       }else if(s==1){
         cychange();
       }else if(s==2){
         cochange();
       }else{
         print("s");
       }
       stage=1;
     }
     break;
 }
}


void boxes(){
  translate(width/2, height/2, 0);
    if(stage==1 || stage==2 || stage==3){
      rotateX(radians(xkaku));
      rotateY(radians(225));//225
    }else if(stage==4){
      rotateX(map(mouseY, 0, height, PI, -PI));
      rotateY(map(mouseX, 0, width, -PI, PI));
    }
    scale(30, 30, 30);
    translate(-2,-4,2);
   
    for(int i=0;i<2;i++){
      for(int d=0;d<9;d++){
        if(d!=0 && d%3==0){
          translate(2,0,6);
        }
        if(i==0){
          c=men[0][d];
        }else{
          c=men[5][d];
        }
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
        endShape();
        translate(0,0,-2);
      }
      if(i==0)translate(-4,6,6);
    }
   
    translate(2,-4,6);
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0){
        translate(0,2,6);
      }
      c=men[yo[0]][d];
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
      translate(0,0,-2);
    }
    
    translate(-2,-4,2);
    rotateY(radians(270));
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0){
        translate(0,2,-6);
      }
      c=men[yo[1]][d];
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
      translate(0,0,2);
    }
   
    translate(0,-4,-2);
    rotateY(radians(90));
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0){
        translate(0,2,-6);
      }
      c=men[yo[2]][d];
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
      translate(0,0,2);
    }
   
    translate(0,-4,-2);
    rotateY(radians(90));
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0){
        translate(0,2,-6);
      }
      c=men[yo[3]][d];
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
      translate(0,0,2);
    }
}

void tate(){
  rotateX(radians(xkaku));
  rotateY(radians(225));
  scale(30, 30, 30);
  translate(-2,-4,2);
    
  for(int i=0;i<2;i++){
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0) translate(2,0,6);
      if(i==0){
        c=men[0][d];
      }else{
        c=men[5][d];
      }

      if(d!=dx && d!=dx+3 && d!=dx+6){
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
        endShape();
      }
      translate(0,0,-2);
   }
   if(i==0)translate(-4,6,6);
 }
 translate(2,-4,6);
 for(int d=0;d<9;d++){
   if(d!=0 && d%3==0) translate(0,2,6);
     c=men[yo[0]][d];
     if(d!=dx && d!=dx+3 && d!=dx+6){
       beginShape(QUADS);
         fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
       endShape();
     }
     translate(0,0,-2);
   }
   translate(-2,-4,2);
   rotateY(radians(270));
   
   if(dx!=2){
     for(int d=0;d<9;d++){
       if(d!=0 && d%3==0) translate(0,2,-6);
       c=men[yo[1]][d];
       beginShape(QUADS);
         fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
       endShape();
       translate(0,0,2);
     }
   }
   if(dx==1){
     pushMatrix();
    translate(6,-2,-4);
     c=6;
    beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-3, 3, -3); vertex(-3, 3, 3); vertex(-3, -3, 3); vertex(-3, -3, -3);
      endShape();
      popMatrix();
   }else if(dx==2){
     translate(0,4,6);
     pushMatrix();
    translate(4,-2,-4);
     c=6;
    beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-3, 3, -3); vertex(-3, 3, 3); vertex(-3, -3, 3); vertex(-3, -3, -3);
      endShape();
      popMatrix();
   }
 
   translate(0,-4,-2);
   rotateY(radians(-270));
   for(int d=0;d<9;d++){
     if(d!=0 && d%3==0) translate(0,2,-6);
     c=men[yo[2]][d];
     if((dx==0 && (d!=dx+2 && d!=dx+5 && d!=dx+8)) || (dx==1 && (d!=dx && d!=dx+3 && d!=dx+6)) ||(dx==2 && (d!=dx-2 && d!=dx+1 && d!=dx+4))){
       beginShape(QUADS);
         fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
       endShape();
     }
     translate(0,0,2);
  }
}

void yoko(){
    rotateX(radians(xkaku));
  rotateY(radians(225));
  scale(30, 30, 30);
  translate(-2,-4,2);
    
  for(int i=0;i<2;i++){
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0) translate(2,0,6);
      if(i==0){
        c=men[0][d];
      }else{
        c=men[5][d];
      }
      if(d!=3*dx && d!=3*dx+1 && d!=3*dx+2){
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
        endShape();
      }
      translate(0,0,-2);
   }
   if(i==0)translate(-4,6,6);
 }
  translate(2,-4,6);
 for(int d=0;d<9;d++){
   if(d!=0 && d%3==0) translate(0,2,6);
     c=men[yo[0]][d];
     if(dx!=2){
       beginShape(QUADS);
         fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
       endShape();
     }
     translate(0,0,-2);
   }
   
   translate(-2,-4,2);
   rotateY(radians(270));
     for(int d=0;d<9;d++){
       if(d!=0 && d%3==0) translate(0,2,-6);
       c=men[yo[1]][d];
       if(d!=2-dx && d!=2-dx+3 && d!=2-dx+6)
       beginShape(QUADS);
         fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
       endShape();
       translate(0,0,2);
     }
   
 
   translate(0,-4,-2);
   rotateY(radians(-270));

  if(dx==1){
     pushMatrix();
    translate(4,2,2);
     c=6;
    beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-3, 3, -3); vertex(-3, 3, 3); vertex(-3, -3, 3); vertex(-3, -3, -3);
      endShape();
      popMatrix();
   }else if(dx==2){
     pushMatrix();
    translate(6,2,2);
     c=6;
    beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-3, 3, -3); vertex(-3, 3, 3); vertex(-3, -3, 3); vertex(-3, -3, -3);
      endShape();
      popMatrix();
   }

    translate(0,0,4);
    rotateY(radians(90));
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0) translate(0,2,-6);
      c=men[yo[3]][d];
      if(d==0)c=6;
      if(d==1)c=7;
      if(d!=dx && d!=dx+3 && d!=dx+6){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
      }
      translate(0,0,2);
    } 
}

void oku(){
  rotateX(radians(xkaku));
  rotateY(radians(225));
  scale(30, 30, 30);
  translate(-2,-4,2);
    
  if((xkaku<0 && dx!=0)){
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0){
        translate(2,0,6);
      }
      c=men[0][d];
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
      endShape();  
      translate(0,0,-2);
    }
    translate(-4,6,6);
  }else{
    translate(0,6,0);
  }
   
  if( (xkaku>0 && dx!=2)){
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0){
        translate(2,0,6);  
      }
      c=men[5][d];
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
      endShape();      
      translate(0,0,-2);
     }
  }else{
     translate(4,0,-6);
  }
 
  if(xkaku<0){
    if(dx==0){
      pushMatrix();
        translate(-2,-6,4);
        c=6;
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(3, 3, 3); vertex(-3, 3, 3); vertex(-3, 3, -3); vertex(3, 3, -3);
        endShape();
      popMatrix();
    }else if(dx==1){
      pushMatrix();
        translate(-2,-4,4);
        c=6;
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(3, 3, 3); vertex(-3, 3, 3); vertex(-3, 3, -3); vertex(3, 3, -3);
        endShape();
      popMatrix();
    }
  }else{
    if(dx==1){
      pushMatrix();
        translate(-2,-6,4);
        c=6;
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(3, 3, 3); vertex(-3, 3, 3); vertex(-3, 3, -3); vertex(3, 3, -3);
        endShape();
      popMatrix();
    }else if(dx==2){
      pushMatrix();
        translate(-2,-4,4);
        c=6;
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(3, 3, 3); vertex(-3, 3, 3); vertex(-3, 3, -3); vertex(3, 3, -3);
        endShape();
      popMatrix();
    }
  }
  translate(2,-4,6);
 
  for(int d=0;d<9;d++){
    if(d!=0 && d%3==0){
      translate(0,2,6);
    }
    c=men[yo[0]][d];
    if(d!=3*dx && d!=3*dx+1 && d!=3*dx+2){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
    }
    translate(0,0,-2);
  }
   
  translate(-2,-4,2);
  rotateY(radians(270));
  for(int d=0;d<9;d++){
    if(d!=0 && d%3==0){
      translate(0,2,-6);
    }
    c=men[yo[1]][d];
    if(d!=3*dx && d!=3*dx+1 && d!=3*dx+2){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
    }
    translate(0,0,2);
  }
  
  translate(0,-4,-2);
  rotateY(radians(-270));
  for(int d=0;d<9;d++){
     if(d!=0 && d%3==0){
       translate(0,2,-6);
     }
     c=men[yo[2]][d];
     if((d!=3*dx && d!=3*dx+1 && d!=3*dx+2)){
       beginShape(QUADS);
         fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
       endShape();
     }
     translate(0,0,2);
  }
 
  translate(0,-4,-2);
  rotateY(radians(90));
  for(int d=0;d<9;d++){
    if(d!=0 && d%3==0){
      translate(0,2,-6);
    }
    c=men[yo[3]][d];
    if(d!=3*dx && d!=3*dx+1 && d!=3*dx+2){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
    }
    translate(0,0,2);
  }
}

void taterem(){
  rotateX(radians(xkaku));
  rotateY(radians(225));
  if(which==1){
    rotateZ(radians(-count));
  }else if(which==2){
    rotateZ(radians(+count));
  }
  scale(30, 30, 30);
  translate(-2,-4,2);


  for(int i=0;i<2;i++){
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0) translate(2,0,6);
      if(i==0){
        c=men[0][d];
      }else{
        c=men[5][d];
      }
      if(d==dx || d==dx+3 || d==dx+6){
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
        endShape();
      }
      translate(0,0,-2);
    }
    if(i==0)translate(-4,6,6);
  }
   
  translate(2,-4,6);
  for(int d=0;d<9;d++){
    if(d!=0 && d%3==0) translate(0,2,6);
    c=men[yo[0]][d];
    if(d==dx || d==dx+3 || d==dx+6){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
    }
    translate(0,0,-2);
  }
   
  translate(-2,-4,2);
  rotateY(radians(270));

  if(dx==2){
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0) translate(0,2,-6);
      c=men[yo[1]][d];
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
    translate(0,0,2);
    }
  }else if(dx==0){
    translate(0,4,6);
     pushMatrix();
    translate(6,-2,-4);
     c=6;
    beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-3, 3, -3); vertex(-3, 3, 3); vertex(-3, -3, 3); vertex(-3, -3, -3);
      endShape();
      popMatrix();
   }else if(dx==1){
     translate(0,4,6);
     pushMatrix();
    translate(4,-2,-4);
     c=6;
    beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-3, 3, -3); vertex(-3, 3, 3); vertex(-3, -3, 3); vertex(-3, -3, -3);
      endShape();
      popMatrix();
   }
   
  translate(0,-4,-2);
  rotateY(radians(-270));

  for(int d=0;d<9;d++){
    if(d!=0 && d%3==0) translate(0,2,-6);
    c=men[yo[2]][d];
    if((dx==0 && (d==dx+2 || d==dx+5 || d==dx+8)) || (dx==1 && (d==dx || d==dx+3 || d==dx+6)) ||(dx==2 && (d==dx-2 || d==dx+1 || d==dx+4))){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
    }
    translate(0,0,2);
  }
}

void yokorem(){
  rotateX(radians(xkaku));
  rotateY(radians(225));
   if(which==1){
    rotateX(radians(-count));
  }else if(which==2){
    rotateX(radians(+count));
  }
  scale(30, 30, 30);
  translate(-2,-4,2);
    
  for(int i=0;i<2;i++){
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0) translate(2,0,6);
      if(i==0){
        c=men[0][d];
      }else{
        c=men[5][d];
      }
      if(d==3*dx || d==3*dx+1 || d==3*dx+2){
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
        endShape();
      }
      translate(0,0,-2);
   }
   if(i==0)translate(-4,6,6);
 }
  translate(2,-4,6);
 for(int d=0;d<9;d++){
   if(d!=0 && d%3==0) translate(0,2,6);
     c=men[yo[0]][d];
     if(dx==2){
       beginShape(QUADS);
         fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
       endShape();
     }
     translate(0,0,-2);
   }
   
   translate(-2,-4,2);
   rotateY(radians(270));
     for(int d=0;d<9;d++){
       if(d!=0 && d%3==0) translate(0,2,-6);
       c=men[yo[1]][d];
       if(d==2-dx || d==2-dx+3 || d==2-dx+6){
       beginShape(QUADS);
         fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
       endShape();
       }
       translate(0,0,2);
     }
   
 
   translate(0,-4,-2);
   rotateY(radians(-270));

   if(dx==0){
     pushMatrix();
    translate(4,2,2);
     c=6;
    beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-3, 3, -3); vertex(-3, 3, 3); vertex(-3, -3, 3); vertex(-3, -3, -3);
      endShape();
      popMatrix();
   }else if(dx==1){
     pushMatrix();
    translate(6,2,2);
     c=6;
    beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-3, 3, -3); vertex(-3, 3, 3); vertex(-3, -3, 3); vertex(-3, -3, -3);
      endShape();
      popMatrix();
   }

    translate(0,0,4);
    rotateY(radians(90));
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0) translate(0,2,-6);
      c=men[yo[3]][d];
      if(d==dx || d==dx+3 || d==dx+6){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
      }
      translate(0,0,2);
    }   
}

void okurem(){
  rotateX(radians(xkaku));
  rotateY(radians(225));
   if(which==1){
    rotateY(radians(-count));
  }else if(which==2){
    rotateY(radians(+count));
  }
  scale(30, 30, 30);
  translate(-2,-4,2);

  if((xkaku<0 && dx==0)){
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0){
        translate(2,0,6);
      }
      c=men[0][d]; 
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
      endShape();     
      translate(0,0,-2);
    }
    translate(-4,6,6);
  }else{
    translate(0,6,0);
  }
 
  if( (xkaku>0 && dx==2)){
    for(int d=0;d<9;d++){
      if(d!=0 && d%3==0){
        translate(2,0,6);
      }
      c=men[5][d];
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
      endShape();
      translate(0,0,-2);
    }
  }else{
    translate(4,0,-6);
  }
 
  if(xkaku<0){
    if(dx==1){
      pushMatrix();
        translate(-2,-6,4);
        c=6;
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(3, 3, 3); vertex(-3, 3, 3); vertex(-3, 3, -3); vertex(3, 3, -3);
        endShape();
      popMatrix();
    }else if(dx==2){
      pushMatrix();
        translate(-2,-4,4);
        c=6;
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(3, 3, 3); vertex(-3, 3, 3); vertex(-3, 3, -3); vertex(3, 3, -3);
        endShape();
        popMatrix();
    }
  }else{
    if(dx==0){
      pushMatrix();
        translate(-2,-6,4);
        c=6;
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(3, 3, 3); vertex(-3, 3, 3); vertex(-3, 3, -3); vertex(3, 3, -3);
        endShape();
      popMatrix();
    }else if(dx==1){
      pushMatrix();
        translate(-2,-4,4);
        c=6;
        beginShape(QUADS);
          fill(ctable[c], alpha); vertex(3, 3, 3); vertex(-3, 3, 3); vertex(-3, 3, -3); vertex(3, 3, -3);
        endShape();
      popMatrix();
    }
  }
 
  translate(2,-4,6);
  for(int d=0;d<9;d++){
    if(d!=0 && d%3==0){
      translate(0,2,6);
    }
    c=men[yo[0]][d];
    if(d==3*dx || d==3*dx+1 || d==3*dx+2){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
    }
    translate(0,0,-2);
  }
 
  translate(-2,-4,2);
  rotateY(radians(270));
  for(int d=0;d<9;d++){
    if(d!=0 && d%3==0){
      translate(0,2,-6);
    }
    c=men[yo[1]][d];
    if(d==3*dx || d==3*dx+1 || d==3*dx+2){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
    }
    translate(0,0,2);
  }
   
  translate(0,-4,-2);
  rotateY(radians(-270));

  for(int d=0;d<9;d++){
    if(d!=0 && d%3==0){
      translate(0,2,-6);
    }
    c=men[yo[2]][d];
    if((d==3*dx || d==3*dx+1 || d==3*dx+2)){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
    }
    translate(0,0,2);
  }

  translate(0,-4,-2);
  rotateY(radians(90));
  for(int d=0;d<9;d++){
    if(d!=0 && d%3==0){
      translate(0,2,-6);
    }
    c=men[yo[3]][d];
    if(d==3*dx || d==3*dx+1 || d==3*dx+2){
      beginShape(QUADS);
        fill(ctable[c], alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      endShape();
    }
    translate(0,0,2);
  }
}

void ctchange(){
  int temp=0;
  if(which==2){
    for(int i=0;i<3;i++){
      temp=men[0][dx+i*3];
      men[0][dx+i*3]=men[yo[2]][(8-dx)-(3*i)];
      men[yo[2]][(8-dx)-3*i]=men[5][6+dx-3*i];
      men[5][6+dx-3*i]=men[yo[0]][dx+i*3];
      men[yo[0]][dx+i*3]=temp;
    }
    if(dx!=1){
      int n=0;
      if(dx==0){
        n=yo[4-1];
      }else{
        n=yo[2-1];
        
      }
      temp=men[n][0];
      men[n][0]=men[n][2];
      men[n][2]=men[n][8];
      men[n][8]=men[n][6];
      men[n][6]=temp;
      temp=men[n][1];
      men[n][1]=men[n][5];
      men[n][5]=men[n][7];
      men[n][7]=men[n][3];
      men[n][3]=temp;
   }
  }else{
    for(int i=0;i<3;i++){
      temp=men[0][dx+i*3];
      men[0][dx+i*3]=men[yo[0]][dx+i*3];
      men[yo[0]][dx+i*3]=men[5][6+dx-3*i];
      men[5][6+dx-3*i]=men[yo[2]][8-dx-3*i];
      men[yo[2]][8-dx-3*i]=temp;
    }
    if(dx!=1){
      int n=0;
      if(dx==0){
        n=yo[4-1];
      }else{
        n=yo[2-1];
      }
      temp=men[n][0];
      men[n][0]=men[n][6];
      men[n][6]=men[n][8];
      men[n][8]=men[n][2];
      men[n][2]=temp;
      temp=men[n][1];
      men[n][1]=men[n][3];
      men[n][3]=men[n][7];
      men[n][7]=men[n][5];
      men[n][5]=temp;
    }
  }
}

void cychange(){
  int temp=0;
  if(which==1){
    for(int i=0;i<3;i++){
      temp=men[0][3*dx+i];
      men[0][3*dx+i]=men[yo[1]][2-dx+3*i];
      men[yo[1]][2-dx+3*i]=men[5][3*dx+2-i];
      men[5][3*dx+2-i]=men[yo[3]][dx+6-3*i];
      men[yo[3]][dx+6-3*i]=temp;
    }
    if(dx!=1){
      int n=0;
      if(dx==2){
        n=yo[1-1];
      }else{
        n=yo[3-1];
      }
      temp=men[n][0];
      men[n][0]=men[n][2];
      men[n][2]=men[n][8];
      men[n][8]=men[n][6];
      men[n][6]=temp;
      temp=men[n][1];
      men[n][1]=men[n][5];
      men[n][5]=men[n][7];
      men[n][7]=men[n][3];
      men[n][3]=temp;
    }
  }else{
    for(int i=0;i<3;i++){
      temp=men[0][3*dx+i];
      men[0][3*dx+i]=men[yo[3]][dx+6-3*i];
      men[yo[3]][dx+6-3*i]=men[5][3*dx+2-i];
      men[5][3*dx+2-i]=men[yo[1]][2-dx+3*i];
      men[yo[1]][2-dx+3*i]=temp;
    }
    if(dx!=1){
      int n=0;
      if(dx==2){
        n=yo[1-1];
      }else{
        n=yo[3-1];
      }
      
      temp=men[n][0];
      men[n][0]=men[n][6];
      men[n][6]=men[n][8];
      men[n][8]=men[n][2];
      men[n][2]=temp;
      temp=men[n][1];
      men[n][1]=men[n][3];
      men[n][3]=men[n][7];
      men[n][7]=men[n][5];
      men[n][5]=temp;
    }
  }
}

void cochange(){
  int temp=0;
   if(which==2){
    for(int i=0;i<3;i++){
     temp=men[yo[0]][3*dx+i];
     men[yo[0]][3*dx+i]=men[yo[3]][3*dx+i];
     men[yo[3]][3*dx+i]=men[yo[2]][3*dx+i];
     men[yo[2]][3*dx+i]=men[yo[1]][3*dx+i];
     men[yo[1]][3*dx+i]=temp;
    }
    if(dx!=1){
      int n=0;
      if(dx==2){
        n=5;
      }else{
        n=0;
      }
      temp=men[n][0];
      men[n][0]=men[n][2];
      men[n][2]=men[n][8];
      men[n][8]=men[n][6];
      men[n][6]=temp;
      temp=men[n][1];
      men[n][1]=men[n][5];
      men[n][5]=men[n][7];
      men[n][7]=men[n][3];
      men[n][3]=temp;
    }
  }else{
    for(int i=0;i<3;i++){
      temp=men[yo[0]][3*dx+i];
      men[yo[0]][3*dx+i]=men[yo[1]][3*dx+i];
      men[yo[1]][3*dx+i]=men[yo[2]][3*dx+i];
      men[yo[2]][3*dx+i]=men[yo[3]][3*dx+i];
      men[yo[3]][3*dx+i]=temp;
    }
    if(dx!=1){
      int n=0;
      if(dx==2){
        n=5;
      }else{
        n=0;
      }
      temp=men[n][0];
      men[n][0]=men[n][6];
      men[n][6]=men[n][8];
      men[n][8]=men[n][2];
      men[n][2]=temp;
      temp=men[n][1];
      men[n][1]=men[n][3];
      men[n][3]=men[n][7];
      men[n][7]=men[n][5];
      men[n][5]=temp;
    }
  }
}

void keyReleased() {
  switch(stage){
    case 1:
    //通常画面。各キーに対応した場所を保存、ステージ変更
    if(key==CODED){
      int temp;
      int n=0;
      switch(keyCode){
          case UP:
            xkaku=45;
            break;
          case DOWN:
            xkaku=-45;
            break;
          case RIGHT:
            for(int i=0;i<2;i++){
              temp=men[n][0];
              men[n][0]=men[n][2];
              men[n][2]=men[n][8];
              men[n][8]=men[n][6];
              men[n][6]=temp;
              temp=men[n][1];
              men[n][1]=men[n][5];
              men[n][5]=men[n][7];
              men[n][7]=men[n][3];
              men[n][3]=temp;
              n=5;
            }
            temp=yo[0];
            yo[0]=yo[3];
            yo[3]=yo[2];
            yo[2]=yo[1];
            yo[1]=temp;
            break;
          case LEFT:
            for(int i=0;i<2;i++){
              temp=men[n][0];
              men[n][0]=men[n][6];
              men[n][6]=men[n][8];
              men[n][8]=men[n][2];
              men[n][2]=temp;
              temp=men[n][1];
              men[n][1]=men[n][3];
              men[n][3]=men[n][7];
              men[n][7]=men[n][5];
              men[n][5]=temp;
              n=5;
            }
            temp=yo[0];
            yo[0]=yo[1];
            yo[1]=yo[2];
            yo[2]=yo[3];
            yo[3]=temp;
            break;
      }
    }else{
      switch(key){
        case 'o':
          stage=4;
          break;
        case 'd':
          dx=6;
          stage=2;
          break;
        case 'w':
          dx=2;
          stage=2;
          break;
        case 'x':
          dx=8;
          stage=2;
          break;
        case 'a':
          dx=4;
          stage=2;
          break;
        case 'q':
          dx=1;
          stage=2;
          break;
        case 'e':
          dx=3;
          stage=2;
          break;
        case 'z':
          dx=7;
          stage=2;
          break;
        case 'c':
          dx=9;
          stage=2;
          break;
        case 's':
          dx=5;
          stage=3;
          break;
        case ' ':
          stage=8;
          break;
      }
    }
    break;
    case 2:
      //タテ、もしくはヨコの変化の受付
      if(key == CODED){
        switch(keyCode){
          case UP:
            if(dx==4){
              dx=0;
            }else if(dx==2 || dx==8){
              dx=1;
            }else if(dx==6){
              dx=2;
            }
            which=1;//up
            stage=6;
            break;
          case DOWN:
            if(dx==4){
              dx=0;
            }else if(dx==2 || dx==8){
              dx=1;
            }else if(dx==6){
              dx=2;
            }
            which=2;//up
            stage=6;
            break;
          case LEFT:
            if(dx==2){
              dx=0;
            }else if(dx==4 || dx==6){
              dx=1;
            }else if(dx==8){
              dx=2;
            }
            which=1;//left
            stage=5;
            break;
          case RIGHT:
            if(dx==2){
              dx=0;
            }else if(dx==4 || dx==6){
              dx=1;
            }else if(dx==8){
              dx=2;
            }
            which=2;//left
            stage=5;
            break;
          }
      }else{
        switch(key){
          case 'e':
            if(dx==6 || dx==9){
              dx=2;
              which=1;
              stage=6;
            }else if(dx==2 || dx==1){
              dx=0;
              which=2;
              stage=5;
            }
            break;
        case 'q':
          if(dx==2 || dx==3){
            dx=0;
            which=1;
            stage=5;
          }else if(dx==4 ||dx==7){
            dx=0;
            which=1;
            stage=6;
          }
          break;
        case 'z':
          if(dx==4 ||dx==1){
            dx=0;
            which=2;
            stage=6;
          }else if(dx==8 ||dx==9){
            dx=2;
            which=1;
            stage=5;
          }
          break;
        case 'c':
          if(dx==6 || dx==3){
            dx=2;
            which=2;
            stage=6;
          }else if(dx==8 || dx==7){
            dx=2;
            which=2;
            stage=5;
          }
          break;
        case 'x':
          if(dx==2){
            dx=1;
            which=2;
            stage=6;
          }else if(dx==7){
            dx=2;
            which=2;
            stage=5;
          }else if(dx==9){
            dx=2;
            which=1;
            stage=5;
          }
          break;
        case 'w':
          if(dx==8){
            dx=1;
            which=1;
            stage=6;
          }else if(dx==1){
            dx=0;
            which=2;
            stage=5;
          }else if(dx==3){
            dx=0;
            which=1;
            stage=5;
          }
          break;
        case 'a':
          if(dx==6){
            dx=1;
            which=1;
            stage=5;
          }else if(dx==1){
            dx=0;
            which=2;
            stage=6;
          }else if(dx==7){
            dx=0;
            which=1;
            stage=6;
          }
          break;
        case 'd':
          if(dx==4){
            dx=1;
            which=2;
            stage=5;
          }else if(dx==3){
            dx=2;
            which=2;
            stage=6;
          }else if(dx==9){
            dx=2;
            which=1;
            stage=6;
          }
          break;
        }
      } 
      break;
    case 3:
      //オク回転の受付
      switch(key){
        case'e':
          dx=0;
          which=1;
          stage=7;
          break;
        case'q':
          dx=0;
          which=2;
          stage=7;
          break;
        case'd':
          dx=1;
          which=1;
          stage=7;
          break;
        case'a':
          dx=1;
          which=2;
          stage=7;
          break;
        case'c':
          dx=2;
          which=1;
          stage=7;
          break;
        case'z':
          dx=2;
          which=2;
          stage=7;
          break;
        default:
          dx=0;
          stage=1;
      }
      break;
    case 4:
      //ぐるぐる回転モードから復帰待ち
      if(key=='b'){
        stage+=1;
      }
      break;
    }
}




