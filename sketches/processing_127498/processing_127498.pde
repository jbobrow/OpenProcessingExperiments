
int count = 0;
int no = 25;
float[][] en = new float[no][2];          //円の位置を保持する配列
float[][] enp = new float[no][2];      //円の１回前の位置を保持する配列
float[][] env = new float[no][2];        //円の速度を保持する配列 
float r, th, thr;                            //周辺の計算範囲距離，計算範囲角度
int nRate;                  //現在のframeRateで何カウントで接近するか？
int drawCount;
float[] vc = new float[2];

void setup() {
    size(500, 500);                //Canvasサイズの設定
    background(225);                //背景色の設定
    int fr = 10;                    //frameRateの設定
    frameRate(fr);                  //frameRateの設定
    for(int i=0; i<no; i++){
        en[i][0] = int(random(0,500));
        en[i][1] = int(random(0,500));      //円の初期位置
        enp[i][0] = en[i][0]-random(-50,50);                          //円の１回前の初期位置
        enp[i][1] = en[i][1]-random(-50,50);                          //円の１回前の初期位置
        //env[i][0] = 10;              //円の速度の初期値
        //env[i][1] = 0;                              //円の速度の初期値
        ellipse(en[i][0], en[i][1], 20, 20);        //円の描画
    }
  r = 120;                    //周辺の計算範囲距離
  th = 90;                //周辺の計算範囲角度
  thr = th/180*PI;        //radへ変換
  //println(thr);
  int sec = 3;            //何秒で計算位置へ移動するか？
  nRate = sec * fr;        //現在のframeRateで何カウントで接近するか？
  drawCount = 0;
}

void draw() {
    drawCount++;

    background(225);
    for(int i=0; i<no; i++){
        env[i][0] = en[i][0] - enp[i][0];
        env[i][1] = en[i][1] - enp[i][1];
        enp[i][0] = en[i][0];
        enp[i][1] = en[i][1];
    }
    for(int i=0; i<no; i++){
      vc = cohesion(i);
/*    float[] sum = new float[2];
    float[] ave = new float[2];
        sum[0] = 0;
        sum[1] = 0;
        ave[0] = 0;
        ave[1] = 0;
        count = 0;
        for(int j=0; j<no; j++){
            if(j!=i){
                float dex = en[i][0]-en[j][0];
                float dey = en[i][1]-en[j][1];
                float d = sqrt(pow(dex, 2)+pow(dey, 2));
                if(d < r){
                    float innerProduct = env[i][0]*dex+env[i][1]*dey;
                    float absa = sqrt(pow(env[i][0], 2)+pow(env[i][1], 2));
                    float absb = d;
                    float theta = acos(innerProduct/absa/absb);
                    if(theta <= thr){
                        count++;
                        sum[0] = sum[0] + en[j][0];
                        sum[1] = sum[1] + en[j][1];
                    }
                }    
            };
        };
      if(count != 0){
          ave[0] = sum[0]/count;
          ave[1] = sum[1]/count;
          en[i][0] += env[i][0]+(ave[0]-en[i][0])/(float(nRate));
          en[i][1] += env[i][1]+(ave[1]-en[i][1])/(float(nRate));
      }else{
          en[i][0] += env[i][0];
          en[i][1] += env[i][1];
      };
*/
      en[i][0] += env[i][0]+vc[0];
      en[i][1] += env[i][1]+vc[1];
      if(en[i][0] > width){
        en[i][0] -= width;
      }else{
        if(en[i][0] < 0){
          en[i][0] += width;
        }
      }
      if(en[i][1] > height){
        en[i][1] -= height;
      }else{
        if(en[i][1] < 0){
          en[i][1] += height;
        }
      }
      ellipse(en[i][0], en[i][1], 20, 20);
    };
}

float[] cohesion(int i){
    float[] sum = new float[2];
    float[] ave = new float[2];
    float[] vcohesion = new float[2];
      sum[0] = 0;
      sum[1] = 0;
      ave[0] = 0;
      ave[1] = 0;
      count = 0;
      for(int j=0; j<no; j++){
          if(j!=i){
              float dex = en[i][0]-en[j][0];
              float dey = en[i][1]-en[j][1];
              float d = sqrt(pow(dex, 2)+pow(dey, 2));
              if(d < r){
                  float innerProduct = env[i][0]*dex+env[i][1]*dey;
                  float absa = sqrt(pow(env[i][0], 2)+pow(env[i][1], 2));
                  float absb = d;
                  float theta = acos(innerProduct/absa/absb);
                  if(theta <= thr){
                      count++;
                      sum[0] = sum[0] + en[j][0];
                      sum[1] = sum[1] + en[j][1];
                  }
              }    
          };
      };
    if(count != 0){
        ave[0] = sum[0]/count;
        ave[1] = sum[1]/count;
        vcohesion[0] = (ave[0]-en[i][0])/(float(nRate));
        vcohesion[1] = (ave[1]-en[i][1])/(float(nRate));
    }else{
        vcohesion[0] = 0;
        vcohesion[1] = 0;
    };
    return vcohesion;
}

