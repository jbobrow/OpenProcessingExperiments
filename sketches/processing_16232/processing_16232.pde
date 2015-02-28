
//text()
//時鐘
int s,m,h;
PFont myFont; PImage a;int x;

void setup()
{
size(600,600);
background(255);
}

void draw() {
  //backimg
  a=loadImage("img3.jpg");
x=5;
image(a,0,0,600,600);


s = second(); // Values from 0 - 59
m = minute(); // Values from 0 - 59
h = hour(); // Values from 0 - 23
stroke(255);
myFont=createFont("FFScala",15); //createFont-創造字型,FFScala字型名稱,18-字型大小
print("h="+h+"\tm="+m+"\ts="+s+"\n"); //對應的-出現在下面視窗
myclockdraw();
}

void myclockdraw()
{
translate(width/2,height/2);
fill(400,16,68,50);
ellipse(0,0,200,200);
stroke(0);
textFont(myFont); //此文件用上面創造的字型
fill(255); //字顏色
text("12",-10,-80); //-10,-80字的位置
text("三",80,0);
text("6",-10,90);
text("九",-90,0);

pushMatrix();
rotate(PI*2*s/60+PI);
stroke(255,255,255,100);
strokeWeight(2);
line(0,0,0,90);
popMatrix(); //秒針

pushMatrix();
rotate(PI*2*m/60+PI);
stroke(55,50,60,50);
strokeWeight(3);
line(0,0,0,70); //分針
popMatrix();

pushMatrix();
rotate(PI*2*h/12+PI);
stroke(255,0,0);
strokeWeight(4);
line(0,0,0,50); //時針
popMatrix();


}


