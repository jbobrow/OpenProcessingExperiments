
//Margin
int marginX = 10;
int marginY = 5;
int margine = 12;

//Font
PFont fontA = loadFont("Arial");
int FontSizeLarge = 80;
//int FontSizeMid = 18;
int FontSizeSmall = 12;

int WIDTH = 320;
int HEIGHT = 474;

final int underBarHeight = 44;
final int height2 = HEIGHT - underBarHeight;


//Text
FlyerText detailText = new FlyerText("2012/7/15/Sun/14:00~ @秋葉原MOGRA", marginX, margine, FontSizeSmall);
FlyerText titleText = new FlyerText("MOG++", marginX - 5, detailText.underY(), FontSizeLarge);
FlyerText mogCount = new FlyerText("test", marginX - 3, height2 + marginY + 1 , FontSizeSmall);
//FlyerText mogCount2 = new FlyerText("test", WIDTH - marginX, height2 + marginY * 2 + 1 , FontSizeSmall);
//FlyerText gazoText  = new FlyerText("画像にする", WIDTH/2, height2 + marginY * 2 + 1 , 18);

//FlyerText saveText = new FlyerText("CAPTURE", WIDTH - 96, height2 + marginY * 2 + 1 , 18);
FlyerText clickDrag = new FlyerText("Click & Drag\n Tap underbar to capture!", WIDTH/2, HEIGHT/2,FontSizeSmall);

//Koucho
//MograKoucho mogra =
PGraphics mograGraphic;// = createGraphics(WIDTH,HEIGHT);
PGraphics mograGraphicRayer;// = createGraphics(width,height);
ArrayList mogras = new ArrayList();
final int WIDTH = 39;
final int HEIGHT = 25;


void setup() {  //setup function called initially, only once
  size(320, 474);

  initMograGraphic();
  addMogra();
  mogras.get(0).x = width/2;
  mogras.get(0).y = height/2;  
  mogras.get(0).setSize(200);

  mograGraphicRayer = createGraphics(width, height);
}

void initMograGraphic()
{
  final color bodyColor = color(244, 180, 208);
  final color strokeColor = color(126, 60, 146);

  mograGraphic = createGraphics(WIDTH, HEIGHT);
  mograGraphic.beginDraw();

  mograGraphic.colorMode(RGB);

  //Body
  mograGraphic.stroke(strokeColor);
  mograGraphic.strokeWeight(2);
  mograGraphic.fill(bodyColor);
  mograGraphic.rect(0, 0, WIDTH, HEIGHT);

  //senaka
  mograGraphic.noStroke();
  mograGraphic.fill(strokeColor);
  mograGraphic.rect(WIDTH - 5, 0, 5, 5);

  //eye
  mograGraphic.rect(0 + 7, 0 + 4, 5, 9);
  mograGraphic.rect(0 + 15, 0 + 4, 5, 9);

  //leg
  mograGraphic.rect(0 + 12, 0 + 18, 3, 8 );
  mograGraphic.rect(0 + 25, 0 + 18, 3, 8 );

  mograGraphic.endDraw();
}

void addMogra() {

  mogras.add(new MograKoucho(mouseX - random(10), mouseY - random(10)));
}

void drawMogras() {

  int num = mogras.size();

  for (int i = 0 ; i < num ; i++)
  {
    MograKoucho mogra = mogras.get(i);
    mogra.draw();
  }
}

int preMills = 0;
int nowMills = 10;
int deltaMills;
int fr = 30;
final int MIN_FRAME_RATE = 16;


void arrange(){

int size =  mogras.size();

  {
      for(int i = size-1 ; i >= 0 ; i--)
      {    
      
              
         if(mousePressed)
         {
                    int x = mogras.get(i).x;
           int y = mogras.get(i).y;
           int deltaX = mouseX- x;
           int deltaY = mouseY -y;
       
           int distance = pow(pow((deltaX),2)+ pow((deltaY),2),0.5);


             mogras.get(i).x -= deltaX / pow(distance,2) * 5000;
             mogras.get(i).y -= deltaY / pow(distance,2) * 4500;
         } 
         else
         {
          

            mogras.get(i).y += (mouseY - height/3)/16;

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
          if(mogras.size() > delteNum+ 1)
          {
                  MograKoucho mog = mogras.get(i);
                  mog.setKill();
          }
          else
          {
              break;
          }       
          
         if(mogras.get(i).canDelete())
         {
              mogras.remove(i);
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
  if(mousePressed) addMogra();

}



void draw() {  //draw function loops

    preDraw();

  //background(10);
  drawMograGraphicRayer();
  
  
  fill(80);
  noStroke();
  rect(0,height - underBarHeight,width,underBarHeight);
  
  
  drawFont();
}

void drawMograGraphicRayer()
{
  mograGraphicRayer.beginDraw();

  //if(mousePressed == false)
  {
    mograGraphicRayer.background(255);
  }

  drawMogras(); 
  mograGraphicRayer.endDraw();

  image(mograGraphicRayer, 0, 0, width, height);
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
 int tmpMax = mogras.size();
 if(mogras.size() > mMax) mMax = tmpMax;
    
  mogCount.setString("MAX : " + nf(mMax) + "\nM : " + nf(mogras.size(),00000));// + "\nFrameRate : " + nf(fr));
  //mogCount2.setString(" M : " + nf(mogras.size(),00000));

   textAlign(LEFT, TOP);
 
  mogCount.draw(); 
  // textAlign(RIGHT, TOP);
 
  //mogCount2.draw();
    textAlign(CENTER, CENTER);
 
    
    
  if(!mousePressed && mogras.size() == 1)
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

final int minMogSize = 20;

class MograKoucho {

  int blockID;
  int initX;
  int initY;
  int x, y;
  int mogSizeWidth = mograGraphic.width * 2 * pow(random(),4) + minMogSize; //= (mogras.size() % 10 == 0 ) ? 40 : 100 * ramdom();
  int mogSizeHeight;// = mogSizeWidth / mograGraphic.width * mograGraphic.height;
  int drawCount = 0;
  final int DRAW_INIT_COUNT = 8;
  boolean bkill = false;

  PVector vec = new PVector(-random(16), -random(8,16));

  final int OFFSET = 0;

  MograKoucho(int initX, int initY) {

    if(mogras.size() == 100)
    {
      mogSizeWidth = 300; 
    }
    
    setHeight();

    this.initX = initX - mogSizeWidth;
    this.initY = initY - mogSizeHeight;
    this.x =  this.initX;
    this.y = this.initY;
    
  }
  
  void setHeight(){
      mogSizeHeight = mogSizeWidth / mograGraphic.width * mograGraphic.height;
  
  }
  
  void setSize(int size){
      mogSizeWidth = size;
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
    else if (this.x <= - mogSizeWidth)
    {
      this.x = width;
    }
    else if (this.y + mogSizeHeight >= height2)
    {
      this.y = height2 - mogSizeHeight;
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
        mograGraphicRayer.tint(255, 255 * (flaot)drawCount/DRAW_INIT_COUNT );
        mograGraphicRayer.image(mograGraphic, x, y , mogSizeWidth , mogSizeHeight);
        mograGraphicRayer.noTint();
    }
    else{
        mograGraphicRayer.image(mograGraphic, x, y , mogSizeWidth , mogSizeHeight);
    }
  }
}



void mouseClicked() {

  addMogra();
  
  if(millis() < 200 ) addMogra();
  
  if(mouseX < width * 2 / 3 && mouseY < height/5)
  {
      link("http://club-mogra.jp/2012/07/15/1330/", "_new"); 
  }
  
  if(mouseY > height2)
  {
      save("MAX" + nf(mMax) + "M" + nf(mogras.size(),00000) + ".png");  
  } 

}

void mouseDragged(){
    addMogra();
}

