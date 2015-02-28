
/*In this assignment you will play a game with the circle.
in this game u will use the mouse to control a white circle to avoid
those red circle, if you touch the red circle you will die and lose.
And see how long can you survive in this game, of course, the longer you survive
the game will increase it's hardness level!!!(try to get marks >1500)

Reference:
http://justmydesigner.blogspot.hk/2011/11/processing-07.html
http://belleaya.pixnet.net/blog/post/31860741-%5B教學%5D-%5B程式%5D-用processing寫特訓99
http://www.youtube.com/watch?v=hD8PGGly19w
http://www.youtube.com/watch?v=3lbYgrhyzYI
*/
int headX, headY;
PImage starscreen;
PImage endscreen;
PFont title;
int stage;
int screenx;
int screeny;
float ball_x=0;//1
float speed_x=5;
float ball_y=0;
float speed_y=4;

float ball_x2=0;//2
float speed_x2=10;
float ball_y2=0;
float speed_y2=4;

float ball_x3=0;//3
float speed_x3=3;
float ball_y3=0;
float speed_y3=7;

float ball_x4=0;//4
float speed_x4=6;
float ball_y4=0;
float speed_y4=4;

float ball_x5=0;//5
float speed_x5=8;
float ball_y5=0;
float speed_y5=2;

float ball_x6=0;//6
float speed_x6=3;
float ball_y6=0;
float speed_y6=9;

float ball_x7=0;//7
float speed_x7=9;
float ball_y7=0;
float speed_y7=4;

float ball_x8=0;//8
float speed_x8=3;
float ball_y8=0;
float speed_y8=5;

float ball_x9=0;//9
float speed_x9=6;
float ball_y9=0;
float speed_y9=9;

float ball_x10=0;//10
float speed_x10=10;
float ball_y10=0;
float speed_y10=2;

float ball_x11=0;//11
float speed_x11=2;
float ball_y11=0;
float speed_y11=14;

float ball_x12=0;//12
float speed_x12=13;
float ball_y12=0;
float speed_y12=5;

float ball_x13=0;//13
float speed_x13=3;
float ball_y13=0;
float speed_y13=8;

float ball_x14=0;//14
float speed_x14=3;
float ball_y14=0;
float speed_y14=9;

float ball_x15=0;//15
float speed_x15=8;
float ball_y15=0;
float speed_y15=4;

//////////////////////////////////////////////////////////////////////////
void setup () {
  stage=1;
  screenx=700;
  screeny=500;
  size(screenx, screeny);
  starscreen=loadImage("wall.jpg");
  image(starscreen, 0, 0, screenx, screeny);

  title = createFont("font", 1000, true);
  
}

void draw() {
  if (stage==1) {
    textAlign(CENTER);
    textSize(50);
    text("click to start", 300, 300);
    //frameRate(9);
    if (mousePressed==true) {
      stage=2;
    }
  }
  if (stage==2) {
    background(0);
    textSize(100);
    fill(100);
    text(" "+frameCount, 100, 200);


    if (ball_x<-20||ball_x>width+20)speed_x=-speed_x;//1
    if (ball_y<-20||ball_y>height+20)speed_y=-speed_y;


    //else speed_y+=0.5;
    if (ball_x2<0-20||ball_x2>width+20)speed_x2=-speed_x2;//2
    if (ball_y2<0-20||ball_y2>height+20)speed_y2=-speed_y2;
    if (ball_x3<0-20||ball_x3>width+20)speed_x3=-speed_x3;//3
    if (ball_y3<0-20||ball_y3>height+20)speed_y3=-speed_y3;
    if (ball_x4<0-20||ball_x4>width+20)speed_x4=-speed_x4;//4
    if (ball_y4<0-20||ball_y4>height+20)speed_y4=-speed_y4;
    if (ball_x5<0-20||ball_x5>width+20)speed_x5=-speed_x5;//5
    if (ball_y5<0-20||ball_y5>height+20)speed_y5=-speed_y5;
    if (ball_x6<0-20||ball_x6>width+20)speed_x6=-speed_x6;//6
    if (ball_y6<0-20||ball_y6>height+20)speed_y6=-speed_y6;
    if (ball_x7<0-20||ball_x7>width+20)speed_x7=-speed_x7;//7
    if (ball_y7<0-20||ball_y7>height+20)speed_y7=-speed_y7;

    ball_x+=speed_x;//1
    ball_y+=speed_y;
    ball_x2+=speed_x2;//2
    ball_y2+=speed_y2;
    ball_x3+=speed_x3;//3
    ball_y3+=speed_y3;
    ball_x4+=speed_x4;//4
    ball_y4+=speed_y4;
    ball_x5+=speed_x5;//5
    ball_y5+=speed_y5;
    ball_x6+=speed_x6;//6
    ball_y6+=speed_y6;
    ball_x7+=speed_x7;//7
    ball_y7+=speed_y7;

    fill(255, 0, 0);
    ellipse(ball_x, ball_y, 10, 10);//1
    ellipse(ball_x2, ball_y2, 10, 10);//2
    ellipse(ball_x3, ball_y3, 10, 10);//3
    ellipse(ball_x4, ball_y4, 10, 10);//4
    ellipse(ball_x5, ball_y5, 10, 10);//5
    ellipse(ball_x6, ball_y6, 10, 10);//6
    ellipse(ball_x7, ball_y7, 10, 10);//7

    fill(250);
    ellipse(mouseX, mouseY, 20, 20);

    println("ball_x:"+ball_x+" mouseX:"+mouseX);
    if (ball_x>=mouseX && ball_x<=mouseX+30 && ball_y>=mouseY && ball_y<=mouseY+30) {//1
      stage=3;
    }
    if (ball_x2>=mouseX && ball_x2<=mouseX+30 && ball_y2>=mouseY && ball_y2<=mouseY+30) {//2
      stage=3;
    }
    if (ball_x3>=mouseX && ball_x3<=mouseX+30 && ball_y3>=mouseY && ball_y3<=mouseY+30) {//3
      stage=3;
    }
    if (ball_x4>=mouseX && ball_x4<=mouseX+30 && ball_y4>=mouseY && ball_y4<=mouseY+30) {//4
      stage=3;
    }
    if (ball_x5>=mouseX && ball_x5<=mouseX+30 && ball_y5>=mouseY && ball_y5<=mouseY+30) {//5
      stage=3;
    }
    if (ball_x6>=mouseX && ball_x6<=mouseX+30 && ball_y6>=mouseY && ball_y6<=mouseY+30) {//6
      stage=3;
    }
    if (ball_x7>=mouseX && ball_x7<=mouseX+30 && ball_y7>=mouseY && ball_y7<=mouseY+30) {//7
      stage=3;
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    if (frameCount>500) {//harder
      if (ball_x8<0||ball_x8>width)speed_x8=-speed_x8;//8
      if (ball_y8<0||ball_y8>height)speed_y8=-speed_y8;
      if (ball_x9<0||ball_x9>width)speed_x9=-speed_x9;//9
      if (ball_y9<0||ball_y9>height)speed_y9=-speed_y9;
      if (ball_x10<0||ball_x10>width)speed_x10=-speed_x10;//10
      if (ball_y10<0||ball_y10>height)speed_y10=-speed_y10;
      if (ball_x11<0||ball_x11>width)speed_x11=-speed_x11;//11
      if (ball_y11<0||ball_y11>height)speed_y11=-speed_y11;
      if (ball_x12<0||ball_x12>width)speed_x12=-speed_x12;//12
      if (ball_y12<0||ball_y12>height)speed_y12=-speed_y12;
      if (ball_x13<0||ball_x13>width)speed_x13=-speed_x13;//13
      if (ball_y13<0||ball_y13>height)speed_y13=-speed_y13;
      if (ball_x14<0||ball_x14>width)speed_x14=-speed_x14;//14
      if (ball_y14<0||ball_y14>height)speed_y14=-speed_y14;
      if (ball_x15<0||ball_x15>width)speed_x15=-speed_x15;//15
      if (ball_y15<0||ball_y15>height)speed_y15=-speed_y15;



      ball_x8+=speed_x8;//8
      ball_y8+=speed_y8;
      ball_x9+=speed_x9;//9
      ball_y9+=speed_y9;
      ball_x10+=speed_x10;//10
      ball_y10+=speed_y10;
      ball_x11+=speed_x11;//11
      ball_y11+=speed_y11;
      ball_x12+=speed_x12;//12
      ball_y12+=speed_y12;
      ball_x13+=speed_x13;//13
      ball_y13+=speed_y13;
      ball_x14+=speed_x14;//14
      ball_y14+=speed_y14;
      ball_x15+=speed_x15;//15
      ball_y15+=speed_y15;
      fill(255, 0, 0);
      ellipse(ball_x8, ball_y8, 20, 20);//8
      ellipse(ball_x9, ball_y9, 20, 20);//9
      ellipse(ball_x10, ball_y10, 20, 20);//10
      ellipse(ball_x11, ball_y11, 20, 20);//11
      ellipse(ball_x12, ball_y12, 20, 20);//12
      ellipse(ball_x13, ball_y13, 20, 20);//13
      ellipse(ball_x14, ball_y14, 20, 20);//14
      ellipse(ball_x15, ball_y15, 20, 20);//15

      if (ball_x8>=mouseX && ball_x8<=mouseX+30 && ball_y8>=mouseY && ball_y8<=mouseY+30) {//8
        stage=3;
      }
      if (ball_x9>=mouseX && ball_x9<=mouseX+30 && ball_y9>=mouseY && ball_y9<=mouseY+30) {//9
        stage=3;
      }
      if (ball_x10>=mouseX && ball_x10<=mouseX+30 && ball_y10>=mouseY && ball_y10<=mouseY+30) {//10
        stage=3;
      }
      if (ball_x11>=mouseX && ball_x11<=mouseX+30 && ball_y11>=mouseY && ball_y11<=mouseY+30) {//11
        stage=3;
      }
      if (ball_x12>=mouseX && ball_x12<=mouseX+30 && ball_y12>=mouseY && ball_y12<=mouseY+30) {//12
        stage=3;
      }
      if (ball_x13>=mouseX && ball_x13<=mouseX+30 && ball_y13>=mouseY && ball_y13<=mouseY+30) {//13
        stage=3;
      }
      if (ball_x14>=mouseX && ball_x14<=mouseX+30 && ball_y14>=mouseY && ball_y14<=mouseY+30) {//14
        stage=3;
      }
      if (ball_x15>=mouseX && ball_x15<=mouseX+30 && ball_y15>=mouseY && ball_y15<=mouseY+30) {//15
        stage=3;
      }
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    if (frameCount>1000) {//harder faster
      if (ball_x<0||ball_x>width)speed_x=-speed_x;//1
      if (ball_y<0||ball_y>height)speed_y=-speed_y;


      //else speed_y+=0.5;
      if (ball_x2<0||ball_x2>width)speed_x2=-speed_x2;//2
      if (ball_y2<0||ball_y2>height)speed_y2=-speed_y2;
      if (ball_x3<0||ball_x3>width)speed_x3=-speed_x3;//3
      if (ball_y3<0||ball_y3>height)speed_y3=-speed_y3;
      if (ball_x4<0||ball_x4>width)speed_x4=-speed_x4;//4
      if (ball_y4<0||ball_y4>height)speed_y4=-speed_y4;
      if (ball_x5<0||ball_x5>width)speed_x5=-speed_x5;//5
      if (ball_y5<0||ball_y5>height)speed_y5=-speed_y5;
      if (ball_x6<0||ball_x6>width)speed_x6=-speed_x6;//6
      if (ball_y6<0||ball_y6>height)speed_y6=-speed_y6;
      if (ball_x7<0||ball_x7>width)speed_x7=-speed_x7;//7
      if (ball_y7<0||ball_y7>height)speed_y7=-speed_y7;

      ball_x+=speed_x;//1
      ball_y+=speed_y;
      ball_x2+=speed_x2;//2
      ball_y2+=speed_y2;
      ball_x3+=speed_x3;//3
      ball_y3+=speed_y3;
      ball_x4+=speed_x4;//4
      ball_y4+=speed_y4;
      ball_x5+=speed_x5;//5
      ball_y5+=speed_y5;
      ball_x6+=speed_x6;//6
      ball_y6+=speed_y6;
      ball_x7+=speed_x7;//7
      ball_y7+=speed_y7;

      fill(255, 0, 0);
      ellipse(ball_x, ball_y, 10, 10);//1
      ellipse(ball_x2, ball_y2, 10, 10);//2
      ellipse(ball_x3, ball_y3, 10, 10);//3
      ellipse(ball_x4, ball_y4, 10, 10);//4
      ellipse(ball_x5, ball_y5, 10, 10);//5
      ellipse(ball_x6, ball_y6, 10, 10);//6
      ellipse(ball_x7, ball_y7, 10, 10);//7

      fill(250);
      ellipse(mouseX, mouseY, 20, 20);

      println("ball_x:"+ball_x+" mouseX:"+mouseX);
      if (ball_x>=mouseX && ball_x<=mouseX+30 && ball_y>=mouseY && ball_y<=mouseY+30) {//1
        stage=3;
      }
      if (ball_x2>=mouseX && ball_x2<=mouseX+30 && ball_y2>=mouseY && ball_y2<=mouseY+30) {//2
        stage=3;
      }
      if (ball_x3>=mouseX && ball_x3<=mouseX+30 && ball_y3>=mouseY && ball_y3<=mouseY+30) {//3
        stage=3;
      }
      if (ball_x4>=mouseX && ball_x4<=mouseX+30 && ball_y4>=mouseY && ball_y4<=mouseY+30) {//4
        stage=3;
      }
      if (ball_x5>=mouseX && ball_x5<=mouseX+30 && ball_y5>=mouseY && ball_y5<=mouseY+30) {//5
        stage=3;
      }
      if (ball_x6>=mouseX && ball_x6<=mouseX+30 && ball_y6>=mouseY && ball_y6<=mouseY+30) {//6
        stage=3;
      }
      if (ball_x7>=mouseX && ball_x7<=mouseX+30 && ball_y7>=mouseY && ball_y7<=mouseY+30) {//7
        stage=3;
      }
    }


    if (stage==3) {
      fill(0);
      rect( 0, 0, screenx, screeny);
      
      //endscreen=loadImage("gameover.jpg");
      //image(endscreen, 0, 0, screenx, screeny);
      textSize(50);
      fill(240, 220, 0);
      text("Your Score: "+frameCount, 220, 150);
      if(frameCount<=499){
        textSize(50);
      fill(240, 220, 0);
      text("Fun???", 400, 450);
      }
      else if(frameCount>=500&&frameCount<=999){
      textSize(50);
      fill(240, 220, 0);
      text("Almost...Ha Ha", 400, 450);
      }
       else if(frameCount>=1000&&frameCount<=1499){
      textSize(50);
      fill(240, 220, 0);
      text("new type??", 400, 450);
      }
     else if(frameCount>=1500){
       
     textSize(50);
      fill(240, 220, 0);
      text("God hand O.o", 400, 450);
     }
    }
  }
}
void mouseClicked() {
  if(stage==3==true){
      frameCount=0;
      ball_x=0;
      ball_x2=0;
      ball_x3=0;
      ball_x4=0;
      ball_x5=0;
      ball_x6=0;
      ball_x7=0;
      ball_y=0;
      ball_y2=0;
      ball_y3=0;
      ball_y4=0;
      ball_y5=0;
      ball_y6=0;
      ball_y7=0;
      setup(); 
      redraw();
  }
}



