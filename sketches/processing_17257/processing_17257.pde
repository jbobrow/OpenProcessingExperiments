
///////////////////////////////////////////////// PATTERN MAKER
//그럴싸한 패턴이미지를 만들어 냅니다. 저장도 가능! 
//You will get awesome looking patterns. also can save them! 
///////////////////////////////////////////////// by JINJU.JANG

//value1: 폰트 font 
String fontFilePath ="DialogInput.bold-30.vlw";
PFont theFont;

//value2: 이미지 images
PImage img1;
int imgWidth = 625;
int imgHeight = 600;
int pointillize = 16;

//value3: 버튼 buttons
int buttonY = 680;
int ipt= 75;
Button myButton1 = new Button(200 + ipt, buttonY, 10, 10);
Button myButton2 = new Button(200 + (ipt*2), buttonY, 10, 10);
Button myButton3 = new Button(200 + (ipt*3), buttonY, 10, 10);
Button myButton4 = new Button(200 + (ipt*4), buttonY, 10, 10);
String button[] ={"Dot","Mozaic","Image","Save"};

//value4: 지점 points
int startX = 60;
int startY = 130;
int i = 0;

//value5: 모드들 modes
boolean circleMode=false;
boolean mozaicMode=false;
boolean imgMode=false;
boolean saveMode=false;
boolean cleartoggle=false;
boolean cleartoggle2=false;

/////////////////////////////////////////////////
// 화면에 '계속'해서 떠야 할 것들은 setup에서 만듭니다.
// making things in setup for showing up on display 'every time'
// 사이즈, 배경, 타이틀, 버튼
// size, backround, title, buttons
/////////////////////////////////////////////////

void setup()
{  
size(750,750);
background(0);
frameRate(30);
//cleartoggle=false;
theFont = loadFont(fontFilePath);
textFont(theFont);
  smooth();
  fill(0,255,0);
  textSize(15);
  textAlign(CENTER);
  text("--================ PATTERN MAKER ===============--",width/2,60);
  text("You can make awesome patterns!",width/2,80);
  text("--==============================================--",width/2,650);
img1 = loadImage("img1.jpg");
  myButton1.display();
  myButton2.display();
  myButton3.display();
  fill(255);
  myButton4.display();
  cleartoggle=false;

  println("SETTING UP COMPELTE");
}

/////////////////////////////////////////////////
// 이제 펑션들을 만들어 봅시다. *존나* 복잡합니다. ^^
// Let's make functions! it's *bloody* complicating.=]
/////////////////////////////////////////////////

//1.draw 
/*  - 모드 부르기 
      (calling MODE)
    - 버튼에 마우스가 올라가면 "Dot", "Mozgic", "Image" "save" 띄우기. 
      (showing ""Dot", "Mozgic", "Image" "save" when the mouse on the buttons)*/
      
void draw()
{ 
  if(circleMode)
  {
  circlePlayMode();
  }else if(mozaicMode){
    mozaicPlayMode();
  }else if(imgMode){
   imgPlayMode();
  }else if(saveMode){
   saveImage();
  }
  
  for(int i =0; i<4; i++)
    {
    if(checkButton(275 + (75*i), 680, 10, 10)) 
    { 
      fill(0,255,0);
      textAlign(CENTER);
      text(button[i],275 + (75*i),710);
    } else if (!checkButton(275 + (75*i), 680, 10, 10))
    { 
      fill(0);
      textAlign(CENTER);
      text(button[i],275 + (75*i),710);
    }
   }
}

//2.mousePressed
/*   - 버튼을 클릭하면 특정 모드를 실행하게 합니다. 
       (turning specific MODE on when we click each buttons */       
void mousePressed(){
    if (mouseX > 275 && mouseX < 285 &&
        mouseY > buttonY - 10 && mouseY < buttonY +10)
    {
      circleMode=true;
      mozaicMode=false;
      imgMode=false; 
      saveMode=false;

    }else if(mouseX > 350 && mouseX < 360 &&
        mouseY > buttonY - 10 && mouseY < buttonY +10){
      circleMode=false;
      mozaicMode=true;
      imgMode=false;
      saveMode=false;
      cleartoggle=true;

    }else if(mouseX > 425 && mouseX < 435 &&
        mouseY > buttonY - 10 && mouseY < buttonY +10){
      circleMode=false;
      mozaicMode=false;
      imgMode=true;
      saveMode=false;
    }else if(mouseX > 500 && mouseX < 510 &&
        mouseY > buttonY - 10 && mouseY < buttonY +10){
      circleMode=false;
      mozaicMode=false;
      imgMode=false;
      saveMode=true;
    }else{
      circleMode=false;
      mozaicMode=false;

      imgMode=false;
      saveMode=false;
    }
}

//3. Dot > Circle function (with mousePressed)
/*    -(mousePressed)를 이용해서 땡땡이 무늬 만들기
      - making dot patterns with (mousePressed)   */
void circlePlayMode()
{ 
  if(!cleartoggle){  
      fill(0);
      rect(0,startY - 30 ,width,520);
      cleartoggle=true;
      cleartoggle2=true;}

   if(mousePressed == true)
 {
  for(int i=75; i<700; i+= 50)
  { 
    for (int j = 150; j<600; j+= 55)
    {
    smooth();
    noStroke();
    fill(random(30,255),random(30,255),random(30,100));
    ellipseMode(CENTER);
    ellipse(i,j ,random(50),random(50)); 
    delay(1);
    }
  }
 }
/* if(cleartoggle)
  {  
    background(0);
    cleartoggle=false;
  }*/
}

//4. Mozaic > Mozaic function
/*  - 모자이크 무늬, 마우스 왼쪽버튼을 한번 더 누르면 빨간 줄무늬.
    - Mozic, it turns to red plaid pattern when you click LEFT button on mouse. */
void mozaicPlayMode()
{
   if(cleartoggle){  
      fill(0);
      rect(0,startY -30 ,width,520);
      cleartoggle=false;
      cleartoggle2=true;}
      
 for(int i=50; i<700; i+= 10)
  { 
    for (int j = 150; j<600; j+= 15)
     {
      smooth();
      if(mousePressed && (mouseButton == LEFT))
       {
         fill(255,0,0);
        }else{
         fill(random(100,255));
       }
         rect(i,j ,12,8);
     }
  }
}

//5. IMage > Image function
/*  - (img1)의 이미지 픽셀을 이용하여 새로운 그림 그리기. 
    - Drawing new pic from (img1) with loadPixels */
    
void imgPlayMode()
{ if(cleartoggle2){
   fill(0);
   rect(0,startY - 20 ,width,520);
   cleartoggle2 = false;
  }
  int x = int(random(60,img1.width));
  int y = int(random(130,img1.height));
  int loc = x + y *img1.width;
  loadPixels();
  float r = red(img1.pixels[loc]);
  float g = green(img1.pixels[loc]);
  float b = blue(img1.pixels[loc]);
  noStroke();
  fill(r,g,b);
  ellipse(x,y,random(15,50),random(15,50));
  }
  
//6. Save > SaveImage function
/*  - png파일로 저장.
    - saving with png format.n */
void saveImage()
{ if(mousePressed && (mouseButton == LEFT))
       { fill(255,0,0);
         myButton4.display();
         saveFrame("/file/####.png"); 
         delay(50);
       }else{
         fill(255);
         myButton4.display();
       }
}

//7. Button Setting 버튼세팅
/*  - 이건.... 설명하기 너무 어려움...ㅠㅠ 미안...
    - Sorry.... it's really difficult to explain...:`( */
    
boolean checkButton(int bX, int bY, int boxWidth, int boxHeight)
{
  if((mouseX > bX && mouseX < bX+boxWidth) && (mouseY > bY && mouseY < bY+boxHeight))
  {
  return true;
  }else{
  return false;
  }
}
//신은정씨가 도와줌
class Button{
  int xpos;
  int ypos;
  int widthRadius;
  int heightRadius;
  Button(int x, int y, int wr, int hr){
    xpos = x;
    ypos = y;
    widthRadius = wr;
    heightRadius = hr;
  }
    void display(){
      noStroke();
      smooth();
     rect(xpos, ypos, widthRadius, heightRadius);
    }
}



