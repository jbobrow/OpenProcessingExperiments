
/*
柳樹
 practice L-system:algorithmic tree
 author:hsiu wen,ou
 reference:book-Processing Creative Coding and Computational Art-author Ira Greenberg
          processing-File=>examples=>topics=>fractals& L-system=>tree
 */
//float rad=15 ;//分岔的角度
float rad;
//float a = 100;
void setup(){
  size(800,500);
  smooth();
}
void draw(){
  background(255);
 
  stroke(204,100,0);
  float a = 30;//( mouseX/(float) height) * 40;
  rad= radians(a);//radians(a)*random(1,5) ;
  //畫出起始點
  translate(width /4,height);//生長起點
  strokeWeight(20);//樹頭最粗
  line(0,0,30,-50);
   strokeWeight(17);
   line(30,-50,50,-100);
  translate(50,-100);
  branch(150,20);//把值投入販賣機
  //branch(0,0,90);
}

void branch(float h,float s){//販賣機

  h *=0.7;//每次縮短0.7倍
  s *=0.6;//樹之每次縮減20%的寬度
  
  //開始寫遞迴的公式:重點1.要有個限制，h不能大於或小於某個值;重點2.要呼叫自己
  //最大不能超過50
if(h>2 && s>0 ){//遞迴重點1:給一個限制
  pushMatrix(); //儲存起始點(我們到哪裡),
  strokeWeight(s*0.5);
  rotate(random((-rad-0.1),(-rad+0.5)));//旋轉15度
  line(0,0,0,-h);//畫出樹枝
  translate(0,-h);//下一段樹枝的起始點
  branch(h,s);//遞迴重點2.呼叫自己,再做上面的動作
  popMatrix();
  /*
  pushMatrix(); //儲存起始點(我們到哪裡),
  strokeWeight(s*0.6);
  rotate(rad);//旋轉15度
  line(0,0,0,-h-10);//畫出樹枝
  translate(0,-h-10);//下一段樹枝的起始點
  branch(h,s);//遞迴重點2.呼叫自己,再做上面的動作
  popMatrix(); 
  */
}
if(h>1 && s>(-1)){
  pushMatrix(); //儲存起始點(我們到哪裡),
  strokeWeight(s*0.6);
  rotate(rad);//旋轉15度
  line(0,0,0,-h-10);//畫出樹枝
  translate(0,-h-10);//下一段樹枝的起始點
  branch(h,s);//遞迴重點2.呼叫自己,再做上面的動作
  popMatrix(); 
  /*pushMatrix(); //儲存起始點(我們到哪裡),
  strokeWeight(s*0.5);
  rotate(random((-rad-0.1),(-rad+0.5)));//旋轉15度
  line(0,0,0,-h);//畫出樹枝
  translate(0,-h);//下一段樹枝的起始點
  branch(h,s);//遞迴重點2.呼叫自己,再做上面的動作
  popMatrix();
 */ 
}
 
/*
float x,float y,float a
  strokeWeight(5*0.6);
 // line();
  float x1=x-cos(45)*a;//x起始點扣掉x向位移量
  float y1=y-(sin(45)*a);//y起始點扣掉y向位移量

  line(x,y,x1,y1);
  if(a>50){
    //translate(x1,y1);  
    line(x1,y1,x1-cos(45)*a,y1-sin(45)*a);
  }*/
}

/*
void branch(float a,float b){
 a*=3/2;
 b -=1;
 if((a > 1) && (b > 0)) {
 pushMatrix();    // Save the current state of transformation (i.e. where are we now)
 translate(width /1.4,height);
 rotate(15);   // Rotate by theta
 line(0, 0, 0, -a);  // Draw the branch
 translate(0, -a); // Move to the end of the branch
 branch(a,b);       // Ok, now call myself to draw two new branches!!
 popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous
 
 }
 
 }
 */











