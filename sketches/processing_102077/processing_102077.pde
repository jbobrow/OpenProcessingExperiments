
// Kanagawa Institute of Technology, JAPAN 
// http://www.sato-lab.jp/imfu2013/kadai11.pdf
// Q3-1
//次の 2 つのプログラムは同じ動作をするプログラムです。空欄を埋めて、プログラムを 完成させて下さい。

int[] scores; 
PFont font; 
void setup(){
 size(400,400); smooth();
 scores = new int[5];
 scores[0] = 10000;
 scores[1] = 9000;
 scores[2] = 5000;
 scores[3] = 1000;
 scores[4]  =30;
 font = loadFont("Serif-48.vlw"); 
 textFont(font,48);
}
void draw(){
 background(255); fill(100); textAlign(CENTER); 
 rectMode(CENTER);
// float topOffset = (height - 60 * 5)/2 + textAscent();
 float topOffset = 100;
 for(int i = 0;i < 5;i++){
  text("["+str(i+1)+"] "+
   str(scores[i]),width/2,topOffset+40*i,width,60); 
 }
}
void mouseClicked(){
 int newScore = int(random(100000));
 println(newScore);
 for(int i = 0;i<5;i++){
  if(newScore >= scores[i]){
    for(int j=5-1; j>i;j--){
      scores[j] = scores[j-1]; }
      scores[i] = newScore;
      break; 
    }
  } 
}
