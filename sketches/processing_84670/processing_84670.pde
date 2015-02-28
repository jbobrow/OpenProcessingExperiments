
CircleButton circle1,circle2,circle3,circle4,circle5,circle6,circle7,circle8,circle9;
boolean locked = false;


PFont f;  
PImage photo;
   

void setup() {  

  size(1500, 760);  

photo = loadImage("001.jpg");   

  smooth();  
f = createFont("方正大黑简体", 10, true);  

image(photo,0,0);


}  

   



 void update(int x, int y)
{
  if(locked == false) {
    circle1.update();
    circle2.update();
    circle3.update();
    circle4.update();
    circle5.update();
    circle6.update();
    circle7.update();
    circle8.update();
    circle9.update();
  } 
  else {
    locked = false;
  }  

if(mousePressed) {////////////////////////////////////////////////////

strokeWeight(4);  //距离线粗细，颜色，坐标
stroke(255, 0, 0,70);  
line(559,95, mouseX, mouseY);  
stroke(242,242, 242); 
strokeWeight(0.5);  
  
   } 
  } 
    
 class Button
{
  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   

  void update() 
  {
    if(over()) {
      currentcolor = highlightcolor;
    } 
    else {
      currentcolor = basecolor;
    }
  }

  boolean pressed() 
  {
    if(over) {
      locked = true;
      return true;
    } 
    else {
      locked = false;
      return false;
    }    
  }

  boolean over() 
  { 
    return true; 
  }

  boolean overRect(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean overCircle(int x, int y, int diameter) 
  {
    float disX = x - mouseX;
    float disY = y - mouseY;
    
    //////////////////////////////////////////////宋记红蚂蚁餐厅///////////////////////////////////////////////////
    
    if(sqrt(sq(x-mouseX)+sq(y-mouseY))<diameter/2 && sqrt(sq(374-mouseX)+sq(128-mouseY))<diameter/2) {

     fill(155);  
     textFont(f, 27); 
     text("宋记红蚂蚁餐厅" ,26, 454); 
     textFont(f, 13); 
     text("地址: 上城区国货路69号(上岛咖啡后面)" ,26, 484); 
     textFont(f, 13); 
     text("电话: 0571-87015380 87081173" ,26, 514); 
     textFont(f, 20); 
     text("距离              "+round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.287)+"  米",26,554);  //*0.22
    for (int i=0;i<=round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.287*0.22);i+=1){
   noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,565,430,20);
      fill(155);
    noStroke();
    rect(28,565,i,20);
    }
    fill(155);
   textFont(f, 20); 
     text("平均价格       " +  30+"    元",26, 620); //*0.86
  for (int d=0;d<=25.8;d+=1){
    noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,635,430,20);
  fill(155);
    rect(28,635,d,20);
    }
    fill(155);
    text("评分              "+ 2+"     分",26,686); //*43
  for (int e=0;e<=172;e+=1){
  noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,701,430,20);
    fill(155);
    rect(28,701,e,20);    
  }
  
    
      return true;
    } 
  //////////////////////////////////////////生蚝馆////////////////////////////////////////////
  if(sqrt(sq(x-mouseX)+sq(y-mouseY))<diameter/2 && sqrt(sq(519-mouseX)+sq(215-mouseY))<diameter/2) {////每个圆圈都要修改
     
     fill(155);  
     textFont(f, 27); 
     text("生蚝馆 " ,26, 454); 
     textFont(f, 13); 
     text("地址：上城区高银街102号" ,26, 484); 
     textFont(f, 13); 
     text("电话: 057171-71-87571-858871-7101708" ,26, 514); 
     textFont(f, 20); 
     text("距离              "+round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.287)+"  米",26,554);  //*0.22
    for (int i=0;i<=round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.5396*0.22);i+=1){
    noFill();
    strokeWeight(1);
     stroke(155);
      rect(28,565,430,20);
      fill(155);
    noStroke();
    rect(28,565,i,20);
    }
    fill(155);
   textFont(f, 20); 
     text("平均价格       " +  55+"    元",26, 620); //*0.86
  for (int d=0;d<=47;d+=1){
    noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,635,430,20);
  fill(155);
    rect(28,635,d,20);
    }
    fill(155);
    text("评分              "+ 2+"     分",26,686); //*43
  for (int e=0;e<=172;e+=1){
  noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,701,430,20);
    fill(155);
    rect(28,701,e,20);    
  }
  
    
      return true;
    } 
    //////////////////////////////////////////////吴山酩楼大酒店海鲜自助广场/////////////////////////////////////////////////////////////////
   if(sqrt(sq(x-mouseX)+sq(y-mouseY))<diameter/2 && sqrt(sq(302-mouseX)+sq(221-mouseY))<diameter/2) {

     fill(155);  
     textFont(f, 27); 
     text("吴山酩楼大酒店海鲜自助广场" ,26, 454); 
     textFont(f, 13); 
     text("地址: 上城区河坊街388号吴山酩楼大酒店1楼(近吴山广场))" ,26, 484); 
     textFont(f, 13); 
     text("电话: 0571-87687818" ,26, 514); 
     textFont(f, 20); 
     text("距离              "+round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.287)+"  米",26,554);  //*0.22
    for (int i=0;i<=round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*3.418*0.22);i+=1){
   noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,565,430,20);
      fill(155);
    noStroke();
    rect(28,565,i,20);
    }
    fill(155);
   textFont(f, 20); 
     text("平均价格       " +  138+"    元",26, 620); //*0.86
  for (int d=0;d<=118;d+=1){
    noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,635,430,20);
  fill(155);
    rect(28,635,d,20);
    }
    fill(155);
    text("评分              "+ 4+"     分",26,686); //*43
  for (int e=0;e<=344;e+=1){
  noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,701,430,20);
    fill(155);
    rect(28,701,e,20);    
  }
  
    
      return true;
    } 
   
   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////星连心茶餐厅///////////////////////////////////////////////////
    
    if(sqrt(sq(x-mouseX)+sq(y-mouseY))<diameter/2 && sqrt(sq(600-mouseX)+sq(12-mouseY))<diameter/2) {

     fill(155);  
     textFont(f, 27); 
     text("星连心茶餐厅" ,26, 454); 
     textFont(f, 13); 
     text("地址：上城区中山中路196号锦江之星酒店1楼(近西湖大道)  " ,26, 484); 
     textFont(f, 13); 
     text("电话: 0571-28023508" ,26, 514); 
     textFont(f, 20); 
     text("距离              "+round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.287)+"  米",26,554);  //*0.22
    for (int i=0;i<=round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*3.655*0.22);i+=1){
   noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,565,430,20);
      fill(155);
    noStroke();
    rect(28,565,i,20);
    }
    fill(155);
   textFont(f, 20); 
     text("平均价格       " +  26+"    元",26, 620); //*0.86
  for (int d=0;d<=22;d+=1){
    noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,635,430,20);
  fill(155);
    rect(28,635,d,20);
    }
    fill(155);
    text("评分              "+ 3.5+"     分",26,686); //*43
  for (int e=0;e<=301;e+=1){
  noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,701,430,20);
    fill(155);
    rect(28,701,e,20);    
  }
  
    
      return true;
    } 
   
   ///////////////////////////////////////////////玲珑小镇/////////////////////////////////////////////////////////////
    if(sqrt(sq(x-mouseX)+sq(y-mouseY))<diameter/2 && sqrt(sq(94-mouseX)+sq(190-mouseY))<diameter/2) {

     fill(155);  
     textFont(f, 27); 
     text("玲珑小镇" ,26, 454); 
     textFont(f, 13); 
     text("地址: 上城区南山路198号(近河坊街)" ,26, 484); 
     textFont(f, 13); 
     text("电话:0571-87025558" ,26, 514); 
     textFont(f, 20); 
     text("距离              "+round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.287)+"  米",26,554);  //*0.22
    for (int i=0;i<=round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*3.781*0.22);i+=1){
   noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,565,430,20);
      fill(155);
    noStroke();
    rect(28,565,i,20);
    }
    fill(155);
   textFont(f, 20); 
     text("平均价格       " +  79+"    元",26, 620); //*0.86
  for (int d=0;d<=68;d+=1){
    noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,635,430,20);
  fill(155);
    rect(28,635,d,20);
    }
    fill(155);
    text("评分              "+ 4+"     分",26,686); //*43
  for (int e=0;e<=344;e+=1){
  noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,701,430,20);
    fill(155);
    rect(28,701,e,20);    
  }
  
    
      return true;
    } 
    /////////////////////////////////////////大宋坊///////////////////////////////////////////////////////////////
   if(sqrt(sq(x-mouseX)+sq(y-mouseY))<diameter/2 && sqrt(sq(573-mouseX)+sq(225-mouseY))<diameter/2) {

     fill(155);  
     textFont(f, 27); 
     text("大宋坊" ,26, 454); 
     textFont(f, 13); 
     text("地址：高银街59号" ,26, 484); 
     textFont(f, 13); 
     text("电话: 0571-87807900" ,26, 514); 
     textFont(f, 20); 
     text("距离              "+round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.287)+"  米",26,554);  //*0.22
    for (int i=0;i<=round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.824*0.22);i+=1){
   noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,565,430,20);
      fill(155);
    noStroke();
    rect(28,565,i,20);
    }
    fill(155);
   textFont(f, 20); 
     text("平均价格       " +  60+"    元",26, 620); //*0.86
  for (int d=0;d<=51;d+=1){
    noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,635,430,20);
  fill(155);
    rect(28,635,d,20);
    }
    fill(155);
    text("评分              "+ 3+"     分",26,686); //*43
  for (int e=0;e<=258;e+=1){
  noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,701,430,20);
    fill(155);
    rect(28,701,e,20);    
  }
  
    
      return true;
    }  
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////杭州哨兵海鲜(吴山店)///////////////////////////////////////////////////
    
    if(sqrt(sq(x-mouseX)+sq(y-mouseY))<diameter/2 && sqrt(sq(211-mouseX)+sq(252-mouseY))<diameter/2) {

     fill(155);  
     textFont(f, 27); 
     text("杭州哨兵海鲜(吴山店)" ,26, 454); 
     textFont(f, 13); 
     text("地址：上城区四宜路2号 " ,26, 484); 
     textFont(f, 13); 
     text("电话: 0571-87915788 28901111" ,26, 514); 
     textFont(f, 20); 
     text("距离              "+round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.287)+"  米",26,554);  //*0.22
    for (int i=0;i<=round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*3.4031*0.22);i+=1){
   noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,565,430,20);
      fill(155);
    noStroke();
    rect(28,565,i,20);
    }
    fill(155);
   textFont(f, 20); 
     text("平均价格       " +  500+"    元",26, 620); //*0.86
  for (int d=0;d<=430;d+=1){
    noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,635,430,20);
  fill(155);
    rect(28,635,d,20);
    }
    fill(155);
    text("评分              "+ 4+"     分",26,686); //*43
  for (int e=0;e<=344;e+=1){
  noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,701,430,20);
    fill(155);
    rect(28,701,e,20);    
  }
  
    
      return true;
    } 
    ///////////////////////////////////////////7盎司港式茶餐厅/////////////////////////////////////////////////////////////////////
     if(sqrt(sq(x-mouseX)+sq(y-mouseY))<diameter/2 && sqrt(sq(598-mouseX)+sq(307-mouseY))<diameter/2) {

     fill(155);  
     textFont(f, 27); 
     text("7盎司港式茶餐厅" ,26, 454); 
     textFont(f, 13); 
     text("地址:上城区河坊街大井巷34号(近鼓楼)" ,26, 484); 
     textFont(f, 13); 
     text("电话: 无" ,26, 514); 
     textFont(f, 20); 
     text("距离              "+round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.287)+"  米",26,554);  //*0.22
    for (int i=0;i<=round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*3.4031*0.22);i+=1){
   noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,565,430,20);
      fill(155);
    noStroke();
    rect(28,565,i,20);
    }
    fill(155);
   textFont(f, 20); 
     text("平均价格       " +  25+"    元",26, 620); //*0.86
  for (int d=0;d<=22;d+=1){
    noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,635,430,20);
  fill(155);
    rect(28,635,d,20);
    }
    fill(155);
    text("评分              "+ 2.5+"     分",26,686); //*43
  for (int e=0;e<=215;e+=1){
  noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,701,430,20);
    fill(155);
    rect(28,701,e,20);    
  }
  
    
      return true;
    } 
    ////////////////////////////////////////////////金堂国菜馆///////////////////////////////////////////////////////
   if(sqrt(sq(x-mouseX)+sq(y-mouseY))<diameter/2 && sqrt(sq(114-mouseX)+sq(369-mouseY))<diameter/2) {

     fill(155);  
     textFont(f, 27); 
     text("金堂国菜馆" ,26, 454); 
     textFont(f, 13); 
     text("地址：上城区南山路清波街109号五洋假日酒店1楼" ,26, 484); 
     textFont(f, 13); 
     text("电话：057105785-8567-760587550-876770578-717817" ,26, 514); 
     textFont(f, 20); 
     text("距离              "+round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*2.287)+"  米",26,554);  //*0.22
    for (int i=0;i<=round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*3.2504*0.22);i+=1){
   noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,565,430,20);
      fill(155);
    noStroke();
    rect(28,565,i,20);
    }
    fill(155);
   textFont(f, 20); 
     text("平均价格       " +  116+"    元",26, 620); //*0.86
  for (int d=0;d<=100;d+=1){
    noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,635,430,20);
  fill(155);
    rect(28,635,d,20);
    }
    fill(155);
    text("评分              "+ 3.5+"     分",26,686); //*43
  for (int e=0;e<=301;e+=1){
  noFill();
    strokeWeight(1);
    stroke(155);
      rect(28,701,430,20);
    fill(155);
    rect(28,701,e,20);    
  }
  
    
      return true;
    } 
   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    else {
      return false;
    }
  }

}

class CircleButton extends Button
{ 
  CircleButton(int ix, int iy, int isize, color icolor, color ihighlight) 
  {
    x = ix;
    y = iy;
    size = isize;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
  }

  boolean over() 
  {
    if( overCircle(x, y, size) ) {
      over = true;
      return true;
    } 
    else {
      over = false;
      return false;
    }
  }

  void display() 
  {
    noStroke();
    fill(currentcolor);
    ellipse(x, y, size, size);
  }
}   

void draw() {  
image(photo,0,0);
// Define and create circle button
  color buttoncolor = color(199,205,80);//按钮1之前的颜色
  color highlight = color(223,231,59);//按钮1之后的颜色
  ellipseMode(CENTER);
  circle1 = new CircleButton(374,128,20, buttoncolor, highlight);  //按钮1坐标
 
 // 按钮2颜色
  buttoncolor = color(152,198,62);//按钮2之前的颜色
  highlight = color(172,231,59); //按钮2之后的颜色
  circle2 = new CircleButton(519,215,20, buttoncolor, highlight); //按钮2坐标
  
// 按钮3颜色
  buttoncolor = color(205,126,56);//按钮2之前的颜色
  highlight = color(235,127,31); //按钮2之后的颜色
  circle3 = new CircleButton(302,221,20, buttoncolor, highlight); //按钮2坐标  
 
 // 按钮4颜色
  buttoncolor = color(72,206,75);//按钮2之前的颜色
  highlight = color(34,229,39); //按钮2之后的颜色
  circle4 = new CircleButton(600,12,20, buttoncolor, highlight); //按钮2坐标  
  
  
  // 按钮5颜色
  buttoncolor = color(54,204,139);//按钮2之前的颜色
  highlight = color(39,224,143); //按钮2之后的颜色
  circle5 = new CircleButton(94,190,20, buttoncolor, highlight); //按钮2坐标 
 
 
 // 按钮6颜色
  buttoncolor = color(67,170,200);//按钮2之前的颜色
  highlight = color(42,186,227); //按钮2之后的颜色
  circle6 = new CircleButton(573,225,20, buttoncolor, highlight); //按钮2坐标   
  
  
   // 按钮7颜色
  buttoncolor = color(78,78,187);//按钮2之前的颜色
  highlight = color(44,44,236); //按钮2之后的颜色
  circle7 = new CircleButton(211,252,20, buttoncolor, highlight); //按钮2坐标 
  
  
  // 按钮8颜色
  buttoncolor = color(158,78,187);//按钮2之前的颜色
  highlight = color(195,62,244); //按钮2之后的颜色
  circle8 = new CircleButton(598,307,20, buttoncolor, highlight); //按钮2坐标 
  
  
  // 按钮9颜色
  buttoncolor = color(196,64,126);//按钮2之前的颜色
  highlight = color(249,67,153); //按钮2之后的颜色
  circle9 = new CircleButton(114,369,20, buttoncolor, highlight); //按钮2坐标 
 
  update(mouseX, mouseY);
  circle1.display();
  circle2.display();
  circle3.display();
  circle4.display();
  circle5.display();
  circle6.display();
  circle7.display();
  circle8.display();
  circle9.display();
  frameRate(30);  

  strokeWeight(2);  

  stroke(0, 0, 0, 90);  
textFont(f, 30);  

  fill(0, 70);  
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////坐标轴////////////////////////////////////////////////////////////////////////////////////////  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
 // text("X pos////"+ mouseX, 1000, 30);  

   

  textFont(f, 30);  

  fill(0, 70);  

  //text("Y pos////"+ mouseY,1200,30); 
 /////////////////////////////////////////////////////////////////////// 
textFont(f, 12); 
noStroke();
ellipse(1121,380,20,20);
ellipse(559,95,20,20);
text("当前位置" ,1135,385);
noFill();
stroke(100);
strokeWeight(1);
ellipse(1121,380,round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY))))*1.4),round(sqrt((abs(sq(559-mouseX)))+(abs(sq(95-mouseY)))))*1.4);
/////////////////////////////////////////////////////////右下滑动条///////////////////////////////////////////////////////////////////////////////////////////////////////////
noStroke();

for (int i=0;i<=round(sqrt((abs(sq(374-mouseX)))+(abs(sq(128-mouseY))))*2.287*0.15);i+=1){
fill(255);
  rect(507,421,250,20);
  fill(199,205,80);
rect(507,421,i,20);
 fill(155);
text("距离"+round(sqrt((abs(sq(374-mouseX)))+(abs(sq(128-mouseY))))*2.287)+"  米",680,436);

}

for (int i=0;i<=round(sqrt((abs(sq(519-mouseX)))+(abs(sq(214-mouseY))))*2.287*0.15);i+=1){
fill(255);
  rect(507,458.625,250,20);
  fill(152,198,62);
rect(507,458.625,i,20);
 fill(155);
text("距离"+round(sqrt((abs(sq(519-mouseX)))+(abs(sq(214-mouseY))))*2.287)+"  米",680,473.625);

}

for (int i=0;i<=round(sqrt((abs(sq(302-mouseX)))+(abs(sq(221-mouseY))))*2.287*0.15);i+=1){
fill(255);
  rect(507,496.25,250,20);
  fill(205,126,56);
rect(507,496.25,i,20);
 fill(155);
text("距离"+round(sqrt((abs(sq(302-mouseX)))+(abs(sq(221-mouseY))))*2.287)+"  米",680,511.25);

}

for (int i=0;i<=round(sqrt((abs(sq(600-mouseX)))+(abs(sq(12-mouseY))))*2.287*0.15);i+=1){
fill(255);
  rect(507,533.875,250,20);
  fill(72,206,75);
rect(507,533.875,i,20);
 fill(155);
text("距离"+round(sqrt((abs(sq(600-mouseX)))+(abs(sq(12-mouseY))))*2.287)+"  米",680,548.875);

}

for (int i=0;i<=round(sqrt((abs(sq(94-mouseX)))+(abs(sq(190-mouseY))))*2.287*0.15);i+=1){
fill(255);
  rect(507,571.5,250,20);
  fill(54,204,139);
rect(507,571.5,i,20);
 fill(155);
text("距离"+round(sqrt((abs(sq(94-mouseX)))+(abs(sq(190-mouseY))))*2.287)+"  米",680,586.5);

}

for (int i=0;i<=round(sqrt((abs(sq(573-mouseX)))+(abs(sq(225-mouseY))))*2.287*0.15);i+=1){
fill(255);
  rect(507,609.125,250,20);
  fill(67,170,200);
rect(507,609.125,i,20);
 fill(155);
text("距离"+round(sqrt((abs(sq(573-mouseX)))+(abs(sq(225-mouseY))))*2.287)+"  米",680,624.125);

}


for (int i=0;i<=round(sqrt((abs(sq(211-mouseX)))+(abs(sq(252-mouseY))))*2.287*0.15);i+=1){
fill(255);
  rect(507,646.75,250,20);
  fill(78,78,187);
rect(507,646.75,i,20);
 fill(155);
text("距离"+round(sqrt((abs(sq(211-mouseX)))+(abs(sq(252-mouseY))))*2.287)+"  米",680,661.75);

}


for (int i=0;i<=round(sqrt((abs(sq(598-mouseX)))+(abs(sq(307-mouseY))))*2.287*0.15);i+=1){
fill(255);
  rect(507,684.375,250,20);
  fill(158,78,187);
rect(507,684.375,i,20);
 fill(155);
text("距离"+round(sqrt((abs(sq(598-mouseX)))+(abs(sq(307-mouseY))))*2.287)+"  米",680,699.375);

}


for (int i=0;i<=round(sqrt((abs(sq(114-mouseX)))+(abs(sq(369-mouseY))))*2.287*0.15);i+=1){
fill(255);
  rect(507,722,250,20);
  fill(196,64,126);
rect(507,722,i,20);
 fill(155);
text("距离"+round(sqrt((abs(sq(114-mouseX)))+(abs(sq(369-mouseY))))*2.287)+"  米",680,737);

}






//text("宋记红蚂蚁餐厅" ,1138,390-round(sqrt((abs(sq(374-mouseX)))+(abs(sq(128-mouseY)))))*0.7); 
//text("距离   "+round(sqrt((abs(sq(374-mouseX)))+(abs(sq(128-mouseY))))*2.29)+"  米",1138,375-round(sqrt((abs(sq(374-mouseX)))+(abs(sq(128-mouseY)))))*0.7);  

fill(199,205,80);//右侧圆圈1颜色，宋记红蚂蚁餐厅

ellipse(1121,380-round(sqrt((abs(sq(374-mouseX)))+(abs(sq(128-mouseY)))))*0.7,20,20);


translate(1121,380);
rotate(radians(220));

//text("生蚝馆 " ,0,round(sqrt((abs(sq(510-mouseX)))+(abs(sq(225-mouseY)))))*0.7); 
fill(152,198,62);//右侧圆圈2颜色，生蚝馆
ellipse(0,round(sqrt((abs(sq(519-mouseX)))+(abs(sq(214-mouseY)))))*0.7,20,20);

 
//text("吴山酩楼大酒店海鲜自助广场 " ,0,round(sqrt((abs(sq(510-mouseX)))+(abs(sq(225-mouseY)))))*0.7); 
rotate(radians(40));
fill(205,126,56);//右侧圆圈2颜色，生蚝馆
ellipse(0,round(sqrt((abs(sq(302-mouseX)))+(abs(sq(221-mouseY)))))*0.7,20,20); 



//text("星连心茶餐厅" ,0,round(sqrt((abs(sq(510-mouseX)))+(abs(sq(225-mouseY)))))*0.7); 
rotate(radians(40));
fill(72,206,75);//右侧圆圈2颜色，生蚝馆
ellipse(0,round(sqrt((abs(sq(600-mouseX)))+(abs(sq(12-mouseY)))))*0.7,20,20); 


//text("玲珑小镇" ,0,round(sqrt((abs(sq(510-mouseX)))+(abs(sq(225-mouseY)))))*0.7); 
rotate(radians(40));
fill(54,204,139);//右侧圆圈2颜色，生蚝馆
ellipse(0,round(sqrt((abs(sq(94-mouseX)))+(abs(sq(190-mouseY)))))*0.7,20,20); 


//text("大宋坊" ,0,round(sqrt((abs(sq(510-mouseX)))+(abs(sq(225-mouseY)))))*0.7); 
rotate(radians(40));
fill(67,170,200);//右侧圆圈2颜色，生蚝馆
ellipse(0,round(sqrt((abs(sq(573-mouseX)))+(abs(sq(225-mouseY)))))*0.7,20,20); 


//text("杭州哨兵海鲜(吴山店)" ,0,round(sqrt((abs(sq(510-mouseX)))+(abs(sq(225-mouseY)))))*0.7); 
rotate(radians(40));
fill(78,78,187);//右侧圆圈2颜色，生蚝馆
ellipse(0,round(sqrt((abs(sq(211-mouseX)))+(abs(sq(252-mouseY)))))*0.7,20,20); 


//text("7盎司港式茶餐厅" ,0,round(sqrt((abs(sq(510-mouseX)))+(abs(sq(225-mouseY)))))*0.7); 
rotate(radians(40));
fill(158,78,187);//右侧圆圈2颜色，生蚝馆
ellipse(0,round(sqrt((abs(sq(598-mouseX)))+(abs(sq(307-mouseY)))))*0.7,20,20); 


//text("金堂国菜馆" ,0,round(sqrt((abs(sq(510-mouseX)))+(abs(sq(225-mouseY)))))*0.7); 
rotate(radians(40));
fill(196,64,126);//右侧圆圈2颜色，生蚝馆
ellipse(0,round(sqrt((abs(sq(114-mouseX)))+(abs(sq(369-mouseY)))))*0.7,20,20); 



}  


