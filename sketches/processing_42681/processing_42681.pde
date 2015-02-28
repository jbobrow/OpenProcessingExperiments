
/*
Author: Anita Chen
 Purpose: class exercises-bouncing ball
 Concept: 1.球撞到邊界,球的直徑會改變
 2.球撞到邊界,有爆炸的效果(背景會閃爍變化)
 3.球的顏色隨x,y位置改變
 Reference:http://www.openprocessing.org/visuals/?visualID=42444
 */
float []x= new float[15];
float []y= new float[15];
float []w= new float[15];
float []h= new float[15];
float []dia= new float[15];
float []rad= new float[15];
void setup() {
  size(300, 300);
  noStroke();
  for (int i=0;i<15 ;i++) { 
    x[i]=random(rad[i], width-rad[i]);
    y[i]=random(rad[i], height-rad[i]);
    w[i]=random(10);
    h[i]=random(10);
    dia[i]=random(5, 20);
    rad[i]=dia[i]/2;
  }
}

void draw() {
  smooth();
  for (int i=0;i<15;i++) { 
    fill(0, 80);//球變多之後尾巴就看不見
    if (dia[i]==0) {
      fill(0, 80);//當dia為0時不爆炸的效果
    }
    else if (x[i]<= rad[i] || x[i]>=width-rad[i]||y[i] <= rad[i] || y[i]>=height-rad[i] ) {
      fill(255, (dia[i]*40));//撞擊邊界之後爆炸的效果dia越大透明越低
    }
    rect(0, 0, width, height);
    fill(x[i], y[i], random(255));
    if ( x[i]<= rad[i] || x[i]>=width-rad[i]) {
      x[i]= constrain(x[i], rad[i], width-rad[i]);
      w[i]=-w[i];
      dia[i]++;
      //限定x邊界和dia遞增但沒有效果
    }
    if (y[i] <= rad[i] || y[i]>=height-rad[i]) {
      y[i]=constrain (y[i], rad[i], height-rad[i]);
      h[i]=-h[i];
      dia[i]-=2;
      //限定y邊界和dia遞增但一樣沒有效果
    }
    x[i]=x[i]+(w[i]);
    y[i]=y[i]+(h[i]);
    if (dia[i]>=30) {
      dia[i]=0;//為什麼限定dia大小但沒有限定的效果
    }
    ellipse (x[i], y[i], dia[i], dia[i]);
  }
}
/*void keyPressed() {
 saveFrame("move ball.jpg");
 }
 */

