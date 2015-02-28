
/*****************************
 //　　データ操作
 //
 *******************************/
void readdata() {
  //イベントキャラクタ座標計算
  mdkx=MAPX/3-WNDW-2;
  msnx=4;
  goalx=MAPX-WNDW-2;
  shalx=MAPX/3*2-WNDW-2;

  //マップ初期化と作成
  for (int j=0;j<MAPY;j++)
    for (int i=0;i<MAPX;i++)
      mp[j][i]=0;
  for (int i=3;i<MAPX-WNDW;i++)  
    if (!((int)random(4)==2)||mp[2][i-1]==0)
      mp[2][i]=1;  

  mp[2][mdkx]=1;
  mp[2][mdkx+1]=0;
  mp[2][mdkx+2]=0;
  mp[2][shalx]=1;
  mp[2][goalx]=1;
  for (int j=2;j<5;j++)
    for (int i=3;i<7;i++)
      mp[j][i]=1;
  for (int i=0;i<MAPX;i++)
    if (mp[2][i]==1)
      mp[1][i]=(int)random(2)+3;
  for (int i=7;i<MAPX;i++)
    if (mp[2][i]==1)
      if ((int)random(3)==2)mp[3][i]=2;
      else mp[3][i]=1;
  for (int i=7;i<MAPX;i++)
    if (mp[3][i]==1)
      if ((int)random(3)==2)mp[4][i]=2;
      else mp[4][i]=1;

  //イベントキャラクタ用の足場
  for (int i=3;i<5;i++) {     
    mp[i][mdkx]=1;
    mp[i][goalx]=1;
    mp[i][shalx]=1;
  }
  //イベントキャラクタ配置
  cct[0].setyellow();
  cct[1].setpink();

  cct[5].setshal();


  //スプライト読み込み    
  for (int i=0;i<SPGNUM;i++) 
    sprits[i]=createImage(24, 24, ARGB);
  for (int i=0;i<10;i++) 
    sprits[i+(i/2)*2].copy(chara, i*24, 0, 24, 24, 0, 0, 24, 24);    
  for (int i=0;i<11;i++)  
    sprits[i+20].copy(chara, i*24, 24, 24, 24, 0, 0, 24, 24);

  sprits[30].copy(chara, 240, 24, 24, 24, 0, 0, 24, 24);//尻尾 
  sprits[31].copy(chara, 240, 0, 24, 24, 0, 0, 24, 24);//鉄砲  
  for (int i=0;i<24;i++) //反転
    sprits[32].copy(sprits[31], i, 0, 1, 24, 23-i, 0, 1, 24);    
  sprits[33].copy(chara, 96, 24, 24, 24, 0, 0, 24, 24);//グリーフシード
  sprits[34].copy(chara, 264, 0, 24, 24, 0, 0, 24, 24);//ゲート
  //反転スプライト作成部分
  for (int k=0;k<20;k+=4)
    for (int j=0;j<2;j++)
      for (int i=0;i<24;i++) 
        sprits[j+2+k].copy(sprits[j+k], i, 0, 1, 24, 23-i, 0, 1, 24);
}

int [] sortq=new int[CRNUM];
boolean[] qflg=new boolean[CRNUM];

void sortsprite() {
  int num=0;
  int count=0;
  float minimam;
  int n;

  for (int i=0;i<CRNUM;i++) {
    sortq[i]=-1;
    if (cct[i].flg!=0) {  
      sortq[count]=i;
      count++;
    }
  }

  for (int i=0;i<count;i++) {
    minimam=cct[sortq[i]].ypos;   
    num=i;  
    for (int j=i+1;j<count;j++)
      if (minimam>cct[sortq[j]].ypos) {
        num=j;
        minimam=cct[sortq[j]].ypos;
      }
    if (num!=i) {
      n=sortq[i];
      sortq[i]=sortq[num];
      sortq[num]=n;
    }
  }
}


