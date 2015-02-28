
/*
 * author: Ricky Lai
 * from a template: the garden of good and evil
 * do some visual effective
 
 * template for assignment 4: the garden of good and evil
 * prepared by schien@mail.ncku.edu.tw (2009-04-26)
 */


/* 在此加入你的設計構想說明
 煙花，運用弧（arc）繞著圓心旋轉表達。
 弧正轉與反轉及顏色代表股價的漲跌。
 
 股價較高者，煙花將分成數層表達，最高可以到三層。
 
 煙花釋放的高度為股票當年最高價跟最低價的差。
 
 然而，在我們在股票市場上追逐獲利時，
 是否有想過這些股價驚人成長，超高獲利的公司，
 鉅額獲利的真相？

 對照近日中國「血汗工廠」事件，勞工苛刻的工作環境，
 在此「股市花園」中的資訊領先品牌，
 是不是盡到了該有的社會責任，或是，對低成本代工有起碼的關心？

 在繁華的煙花背後，加入了點點的血跡。
 過去一年間市值成長超過五成的公司，
 其血跡在煙花不斷釋放的過程中也不斷增加。
 血跡愈大點，代表其成長的速度愈快。
 */
void setup(){  // 可加入必要內容
  size(1000,400);
  background(0);
  colorMode(HSB,360,100,100,100);
  /*
  PFont myFont;
   myFont = loadFont("AppleSymbols-12.vlw");
   textMode(SCREEN);
   textFont(myFont, 12);
   */
  loadData();
  //noLoop();
}

void draw() {  // 可加入必要內容
  drawData();
}

class StockQuote {  // 可加入必要內容

  //constructor
  String name = "";
  float openPrice = 0;
  float askPrice = 0;
  float bidPrice = 0;
  float change = 0;
  float yearLow = 0;
  float yearHigh = 0;
  //constructor end  

  void draw(float ox, float oy) {
    // 本次作業主要在填入這個部份的內容，讓畫面有具美感的資訊呈現    
    for(int i = 0; i < data.length; i++){
      color c1;
      color c2;
      color c3;
      float dia;
      float growValue = yearHigh - yearLow;
      float speed = growValue / yearLow;
      float upperLimit = ox + 20;
      float lowerLimit = ox - 20;
      float scaleValue = random(5,10);

      if(speed > 0.5){ // draw bloody background.
        noStroke();
        fill(0,100,100,random(60,100));
        ellipse(random(lowerLimit, upperLimit), random(height), speed*scaleValue, speed*scaleValue);  
      }
     
      if(askPrice > 150){
        dia = askPrice / 3;
      }
      else{
        dia = askPrice; 
      }
      int number;
      if(askPrice > 150){
        number = int(askPrice/3); 
      }
      else if(askPrice > 100){
        number = int(askPrice/2); 
      }
      else{
        number = int(askPrice); 
      }
      float unitAngle = TWO_PI / number;
      //print(number);

      for(int j = 0; j < number; j++){
        float index = j*unitAngle;
        int arcX = int(dia/2 * cos(index));
        int arcY = int(dia/2 * sin(index));
        int centerPoint = int(oy - yearHigh + yearLow);
        float startAngle;
        float endAngle;
        if(change < 0){
          startAngle = index;
          endAngle = PI + index;
          c1 = color(random(180,200),random(30,50),100,80);
          c2 = color(random(200,220),random(30,50),80,80);
          c3 = color(random(220,250),random(30,50),60,80);
        }
        else{
          startAngle = PI +index;
          endAngle = TWO_PI + index;
          c1 = color(random(30,60),random(30,50),100,80);
          c2 = color(random(315,359),random(30,50),80,80);
          c3 = color(random(0,30),random(30,50),60,80);
        }
        noFill();
        smooth();
        strokeWeight(0.4);
        if(askPrice > 150){
          //text(name,ox,centerPoint);
          stroke(c3);
          arc(ox + arcX , centerPoint + arcY , dia/2 , dia/2 , startAngle , endAngle);
          stroke(c2);
          arc(ox + arcX * 2/3 , centerPoint + arcY * 2/3 , dia/2 , dia/2 , startAngle , endAngle);
          stroke(c1);
          arc(ox + arcX / 3 , centerPoint + arcY / 3 , dia/2 , dia/2 , startAngle , endAngle);
        }
        else if(askPrice > 100){
          //text(name,ox,centerPoint);
          stroke(c3);
          arc(ox + arcX , centerPoint + arcY , dia/2 , dia/2 , startAngle , endAngle);
          stroke(c2);
          arc(ox + arcX / 2 , centerPoint + arcY / 2 , dia/2 , dia/2 , startAngle , endAngle);
        }
        else{
          //text(name,ox,centerPoint);
          stroke(c3);
          arc(ox + arcX , centerPoint + arcY , dia/2 , dia/2 , startAngle , endAngle);
        }       
      }

    }
  }
}




