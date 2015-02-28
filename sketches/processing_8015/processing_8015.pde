
/*
「葉脈拓印」：美勞課都曾經把葉子浸泡後乾燥處理留下葉脈紋路.

植物的管路可以來自同一種碎型意志，
在大尺度決定枝幹的擺狀，在小尺度則成為葉脈的分佈，
隨著演算次數逐步密集就可浮現出葉子的輪廓。
by Cheng-An Pan 2009
*/

float dergee=50 ;//右分岔的角度
float dergee2=40 ;//左分岔的角度
float ratation;
float ratation2;
//中央枝幹的曲線（是兩條貝茲曲線的控制點，分別作為上下半部）
float[][] b ={{0,-3},{0,-96},{19,-10},{-38,-104},{7,-11},{-68,-136},{-3,4},{-96,-152}};
//中央枝幹上的分段點，作為旁分支的分岔起始處
float[][] bb ={{17,-40},{24,-80},{26,-120},{18,-160},{3,-200},{-8,-240},{-19,-280},{-17,-320}};
float nS=1;//比例係數

void setup() {
  size(600, 600);
  smooth();
  noFill();
}
void draw() {
  background(16,28,45);
  frameRate(30);
  ratation = radians(dergee);//角度換算：座標旋轉時必須做角度單位換算
  ratation2 = radians(-dergee2);//角度換算：座標旋轉時必須做角度單位換算
  stroke(255);
  translate(width/2-10,600);//生長啟始點
  float ns=3.3;//自定第一個中央枝幹的比例係數
  strokeWeight(1.5); //先繪製第一個中央枝幹(下半部)
  bezier(b[0][0]*ns,b[1][0]*ns,b[2][0]*ns,b[3][0]*ns,b[4][0]*ns,b[5][0]*ns,b[6][0]*ns,b[7][0]*ns);
  strokeWeight(1.3);//先繪製第一個中央枝幹(上半部)
  bezier(b[0][1]*ns,b[1][1]*ns,b[2][1]*ns,b[3][1]*ns,b[4][1]*ns,b[5][1]*ns,b[6][1]*ns,b[7][1]*ns);
  strokeWeight(1); 
  branch(5);//呼叫碎型運算的BLOCK，()內數字為可以自定的生長比例係數
}
void branch(float ns) {  //這是碎型運算的BLOCK
  ns *= 0.66; //每次演算則將比例係數縮小
  if (ns > 0.01) {
    stroke(255,249,224);
    strokeCap(ROUND);
    noFill();
    for (int i=0; i<8; i++) { //將array中的貝茲控制點，各乘以縮小後的比例係數
    b[i][0]*=nS;//上半部
    b[i][1]*=nS;//下半部
    }
    
    //繪製中央枝幹    
    bezier(b[0][0]*ns,b[1][0]*ns,b[2][0]*ns,b[3][0]*ns,b[4][0]*ns,b[5][0]*ns,b[6][0]*ns,b[7][0]*ns);
    bezier(b[0][1]*ns,b[1][1]*ns,b[2][1]*ns,b[3][1]*ns,b[4][1]*ns,b[5][1]*ns,b[6][1]*ns,b[7][1]*ns);  

    //繪製各個旁分支
    ns *= 0.4;//再次縮小比例係數作為旁分支的比例係數
    
    pushMatrix(); //儲存當前座標狀態
    translate(bb[0][0]*ns, bb[0][1]*ns);//平移座標原點到中央枝幹上的分段點
    rotate(ratation);//旋轉座標角度
    branch(ns);   //呼叫碎型運算的BLOCK，讓各分岔點處可自成一個葉脈系統
    popMatrix();  //回到先前座標狀態

    pushMatrix();   
    translate(bb[1][0]*ns, bb[1][1]*ns);
    rotate(ratation2);
    branch(ns);   
    popMatrix();

    pushMatrix();   
    translate(bb[2][0]*ns, bb[2][1]*ns);
    rotate(ratation);
    branch(ns);   
    popMatrix();   

    pushMatrix();   
    translate(bb[3][0]*ns, bb[3][1]*ns);
    rotate(ratation2);
    branch(ns);   
    popMatrix();

    pushMatrix();   
    translate(bb[4][0]*ns, bb[4][1]*ns);
    rotate(ratation);
    branch(ns);   
    popMatrix();   

    pushMatrix();   
    translate(bb[5][0]*ns, bb[5][1]*ns);
    rotate(ratation2);
    branch(ns);   
    popMatrix();

    pushMatrix();   
    translate(bb[6][0]*ns, bb[6][1]*ns);
    rotate(ratation);
    branch(ns);   
    popMatrix();   

    pushMatrix();   
    translate(bb[7][0]*ns, bb[7][1]*ns);
    rotate(ratation2);
    branch(ns);   
    popMatrix();
  }
}




