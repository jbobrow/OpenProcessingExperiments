

//Margin
int marginX = 10;
int marginY = 5;
int margine = 12;

//Font
PFont fontA = loadFont("Arial");
int FontSizeLarge = 30;
int FontSizeSmall = 12;

int WIDTH = 700;
int HEIGHT = 700;

final int underBarHeight = 44;
final int height2 = HEIGHT - underBarHeight;


//Text
FlyerText detailText = new FlyerText("バスキュールとパーティーで学校をはじめることになりました。", marginX, margine, FontSizeSmall);
FlyerText titleText = new FlyerText("押し、得て。バパ。", marginX - 5, detailText.underY(), FontSizeLarge);
FlyerText bapCount = new FlyerText("test", marginX - 3, height2 + marginY + 1 , FontSizeSmall);



FlyerText clickDrag = new FlyerText("クリック＆ドラッグで卵が描けます。\n グレーの箇所をクリックするとキャプチャが撮れます。", WIDTH/2, HEIGHT/2,FontSizeSmall);


PGraphics bapaGraphic;
PGraphics bapaGraphicRayer;
ArrayList bapas = new ArrayList();
final int WIDTH = 39;
final int HEIGHT = 25;


void setup() { 
  size(700, 700);

  initbapaGraphic();
  addbapa();
  bapas.get(0).x = width/2;
  bapas.get(0).y = height/2;
  bapas.get(0).setSize(200);

  bapaGraphicRayer = createGraphics(width, height);
}

void initbapaGraphic()
{
  colorMode(RGB,256);
  final color bodyColor = color(244, 180, 208);
  final color strokeColor = color(126, 60, 146);

  bapaGraphic = createGraphics(WIDTH, HEIGHT);
  bapaGraphic.beginDraw();
  smooth();

  bapaGraphic.size(200,200);
  bapaGraphic.ellipse(100,100,120,180);
}

void addbapa() {

  bapas.add(new bapaBig(mouseX - random(10), mouseY - random(10)));
}

void drawbapas() {

  int num = bapas.size();

  for (int i = 0 ; i < num ; i++)
  {
    bapaBig bapa = bapas.get(i);
    bapa.draw();
  }
}

int preMills = 0;
int nowMills = 10;
int deltaMills;
int fr = 30; //ライフ
final int MIN_FRAME_RATE = 10;


void arrange(){

int size =  bapas.size();

  {
      for(int i = size-1 ; i >= 0 ; i--)
      {  
      
              
         if(mousePressed)
         {
                    int x = bapas.get(i).x;
           int y = bapas.get(i).y;
           int deltaX = mouseX- x;
           int deltaY = mouseY -y;
       
           int distance = pow(pow((deltaX),2)+ pow((deltaY),2),0.5);


             bapas.get(i).x -= deltaX / pow(distance,2) * 8000;
             bapas.get(i).y -= deltaY / pow(distance,2) * 5500;
         }
         else
         {
          

            bapas.get(i).y += (mouseY - height/3)/16;

         }        
      }
 }

}


void killM(){

  if(fr < MIN_FRAME_RATE)
  {
      int delteNum = (MIN_FRAME_RATE - fr);
      
      for(int i = 0 ; i < delteNum ; i++)
      {
          if(bapas.size() > delteNum+ 1)
          {
                  bapaBig bap = bapas.get(i);
                  bap.setKill();
          }
          else
          {
              break;
          }     
          
         if(bapas.get(i).canDelete())
         {
              bapas.remove(i);
         }    

      }
      
            
  }
  


}

void preDraw() {

  nowMills = millis();
  deltaMills = (nowMills - preMills + 1000 ) % 1000;
  preMills = nowMills;
  fr = 1000. / deltaMills;
  
  //
  killM();
  
  arrange();
  if(mousePressed) addbapa();

}



void draw() {  //draw function loops

    preDraw();

  //background(10);
  drawbapaGraphicRayer();
  
  
  fill(80);
  noStroke();
  rect(0,height - underBarHeight,width,underBarHeight);
  
  
  drawFont();
}

void drawbapaGraphicRayer()
{
  bapaGraphicRayer.beginDraw();

  //if(mousePressed == false)
  {
    bapaGraphicRayer.background(255);
  }

  drawbapas();
  bapaGraphicRayer.endDraw();

  image(bapaGraphicRayer, 0, 0, width, height);
}

boolean bClicked = false;

int mMax = 1;

void drawFont()
{
  textAlign(LEFT, TOP);
  
  colorMode(HSB);
  fill(random(255), random(255), 250);
  titleText.draw();


  colorMode(RGB);
  fill(100,100,100);
  detailText.draw();
    
    
   fill(200,200,200); 
 int tmpMax = bapas.size();
 if(bapas.size() > mMax) mMax = tmpMax;
    
  bapCount.setString("MAX : " + nf(mMax) + "\nNow : " + nf(bapas.size(),00000));// + "\nFrameRate : " + nf(fr));
  
   textAlign(LEFT, TOP);

  bapCount.draw();
  // textAlign(RIGHT, TOP);

  //bapCount2.draw();
    textAlign(CENTER, CENTER);

    
    
  if(!mousePressed && bapas.size() == 1)
  {
        textAlign(CENTER, CENTER);
      clickDrag.draw();
      
      bClicked = true;
    }
}


class FlyerText {
  int initX;
  int initY;
  int x, y;
  String string;
  int fontSize;

  FlyerText(String string, int initX, int initY, int fontSize) {
    this.initX = initX;
    this.initY = initY;
    this.x = initX;
    this.y = initY;
    this.string = string;
    this.fontSize = fontSize;
  } 
  
  void setString(String string){
    this.string = string;
  }

  void draw()
  { 
    textSize(fontSize);
    text(string, x, y);
  }

  int underY()
  {
    String[] strings = splitTokens(string, "\n");
    return y + fontSize * (strings.length * 2 - 1) ;
  }
}

final int minbapSize = 20;

class bapaBig {

  int blockID;
  int initX;
  int initY;
  int x, y;
  int bapSizeWidth = bapaGraphic.width * 2 * pow(random(),4) + minbapSize; //= (bapas.size() % 10 == 0 ) ? 40 : 100 * ramdom();
  int bapSizeHeight;// = bapSizeWidth / bapaGraphic.width * bapaGraphic.height;
  int drawCount = 0;
  final int DRAW_INIT_COUNT = 8;
  boolean bkill = false;

  PVector vec = new PVector(-random(16), -random(8,16));

  final int OFFSET = 0;

  bapaBig(int initX, int initY) {

    if(bapas.size() == 100)
    {
      bapSizeWidth = 300;
    }
    
    setHeight();

    this.initX = initX - bapSizeWidth;
    this.initY = initY - bapSizeHeight;
    this.x =  this.initX;
    this.y = this.initY;
    
  }
  
  void setHeight(){
      bapSizeHeight = bapSizeWidth / bapaGraphic.width * bapaGraphic.height;
  
  }
  
  void setSize(int size){
      bapSizeWidth = size;
      setHeight();
      
  }
  
  void setKill(){
  
      bkill = true;
  }
  
  boolean canDelete(){
      if(drawCount < 0 )return true; else return false;
  }


  void loop() {
  
    if(bkill == true){
    
        drawCount--;
        

    }else if(drawCount < DRAW_INIT_COUNT)
    {
            drawCount++;
    }
   
    vec.y += 1;

    x += vec.x;
    y += vec.y;
    
    

    if (this.x > width)
    {
    //  x = 0;
    }
    else if (this.x <= - bapSizeWidth)
    {
      this.x = width;
    }
    else if (this.y + bapSizeHeight >= height2)
    {
      this.y = height2 - bapSizeHeight;
      vec.y = -random((height-initY)/10.);
    }
    else if (this.y <= 0)
    {
    }
  }

  void draw() {

    loop();
    
    if(canDelete()) return;
    
    if(drawCount < DRAW_INIT_COUNT)
    {
        bapaGraphicRayer.tint(255, 255 * (flaot)drawCount/DRAW_INIT_COUNT );
        bapaGraphicRayer.image(bapaGraphic, x, y , bapSizeWidth , bapSizeHeight);
        bapaGraphicRayer.noTint();
    }
    else{
        bapaGraphicRayer.image(bapaGraphic, x, y , bapSizeWidth , bapSizeHeight);
    }
  }
}



void mouseClicked() {

  addbapa();
  
  if(millis() < 200 ) addbapa();
  
  if(mouseX < width * 2 / 3 && mouseY < height/5)
  {
      link("http://bapa.ac/", "_new");
  }
  
  if(mouseY > height2)
  {
      save("MAX" + nf(mMax) + "M" + nf(bapas.size(),00000) + ".png");
  }

}

void mouseDragged(){
    addbapa();
}
