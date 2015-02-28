
/**
//Snake Game
//By Adnan Masood
*/


/********************************************************************************/
//
//
//Variables for snake and food (will be declared in reset()) :
int snake;
int foodX;
int foodY;
int bonusX;
int bonusY;
//
//
//Variables for Direction     (will be declared in reset()) :
boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
//
//
/*********************************************************************************/
//
//Other Variables for controling game and features : 
int red = 0;
int green = 0;
int blue = 0;
int speed = 3;
int winSize = 500;

int life ;
int score ;
//
//
//Booleans to control features (will be declared in resert()):
boolean hit;
boolean play;
boolean over;
boolean gui = true;

int[][] snakepos = new int[10000][2];
//
//
/********************************************************************************/
//
//Variables for GUI and Sound :
PImage main;

Button p ;                                   //play button
Toggle bor;                                  //border switch
Toggle music;                                //sound switch
Button pa;                                   //play again button
Button mm;                                   //main menu button
Button e;                                    //exit button
Maxim maxim; 
AudioPlayer select;                          //Audio player for select sound
AudioPlayer eat;                             //eat sound
AudioPlayer main_s;                          //mian music 
AudioPlayer hit_s;                           //when snake hit wall or himself





/********************************************************************************/
//
//reset() will reset all the initial variables : 
//
void reset() {
  //Variables for Snake and Food :
  score = 0;
  life = 3; 
  snake = 20;
  genFood();
  moveLeft = false;
  moveRight = true;
  moveUp = false;
  moveDown = false;
  //Booleans to control features :
  boolean play = false;
  boolean hit = false;
  boolean over = false;
  boolean gui = true;
  //Starting Point For Snake:
  for(int p = 0; p < snake; p++) {
    snakepos[p][0] = 100;
    snakepos[p][1] = 100;
  }
}

//
//genFood() generates food X and Y positions : 
//
void genFood() {
  foodX = (int)random(10,winSize-10);
  foodY = (int)random(10,winSize-10);
}



//
//
/*********************************************************************************/
//
//

void setup() {
   size(500,500);                                //Seting window size
   reset();                                      //Initializing Variables
   
   
   maxim = new Maxim(this);
   
   eat = maxim.loadFile("eat.wav");
   eat.setLooping(false);
   
   select = maxim.loadFile("select.wav");
   select.setLooping(false);
   
   main_s = maxim.loadFile("mian.wav");
   
   hit_s = maxim.loadFile("eh.wav");
   hit_s.setLooping(false);
   
   
   main = loadImage("main.jpg");        //main background
   
   //
   //Button Images :
   PImage exit = loadImage("exit.jpg");
   PImage play = loadImage("play.jpg");
   PImage playa = loadImage("playa.jpg");     //button image for play again
   PImage mmu = loadImage("mm.jpg");          //button image for main menu
   PImage borderon = loadImage("borderon.jpg");
   PImage borderoff = loadImage("borderoff.jpg");
   PImage soundon = loadImage("soundon.jpg");
   PImage soundoff = loadImage("soundoff.jpg");
   
   //
   //buttons properties
   //
   
   //exit button:
   e = new Button ("Exit",width-50,0,50,20);
   e.setActiveImage(exit);
   
   //play button:
   p = new Button ("Play",(width/2)-70,(height/2)+50,150,50);
   p.setActiveImage(play);
   
   //play again button:
   pa = new Button ("Play Again",(width/2)-70,(height/2)+50,150,50);
   pa.setActiveImage(playa);
   
   //mian menu button:
   mm = new Button ("Main Menu",(width/2)-70,(height/2)+110,150,50);
   mm.setActiveImage(mmu);
   
   //border switch:
   bor = new Toggle ("Border",(width/2)-40,(height/2)+110,92,20);
   bor.setInactiveImage(borderoff);
   bor.setActiveImage(borderon);
   
   //music switch
   music = new Toggle ("Music",(width/2)-40,(height/2)+140,92,20);
   music.setInactiveImage(soundoff);
   music.setActiveImage(soundon);
   music.set(true);  //setting music on by default
}

void draw() {
  
  //
  //All GUI stuff goes in there
  // 
   if (gui){
    if (!play || over){
        if (over){
          //this GUI will appear when the snake dies.
          textSize(20);
          fill(0,255,0);
          text("You Scored : "+(score+snake),(width/3),height/2);
          pa.display();               // play again             
          mm.display();               // main menu
          e.display();                // exit
        }
       else if (!over){  
          // this GUI will appear on start:
          image(main,0,0);
          p.display();                // play       
          bor.display();              // border
          e.display();                // exit
          music.display();            // sound
          
          if(music.get())   {main_s.play();}               // getting sound switch on/off.
          else              {main_s.stop(); main_s.cue(0);}
      }  
     }
    }
    
    
    
    
    
    boolean border = bor.get();                     // setting border.
    
    if (hit)      {life--;hit=!hit;}                    

    if (play) {
      if (red > 0)       {red-=10;}                       
      background(red, green, blue);
    
      textSize(14);
      fill(255);
      text("SCORE:"+score,5,10);
      if(!border)    {text("LIFE:"+life,14,24);}
    
      //
      //Snake Body :
      for(int a = snake+19; a>0; a--) {
        snakepos[a][0] = snakepos[a-1][0];
        snakepos[a][1] = snakepos[a-1][1];
      }
      
      
      //
      //
      //Movement on the screen :
      if      (moveLeft == true)    {snakepos[0][0] -= speed;}
      else if (moveRight == true)   {snakepos[0][0] += speed;}
      else if (moveUp == true)      {snakepos[0][1] -= speed;}
      else if (moveDown == true)    {snakepos[0][1] += speed;}
      
      
      //
      //Snake will pass through the border if border is false else will die.
      //Following is algorithm for all four borders :
      for (int b=0 ; b<snake ; b++) {
        if (snakepos[b][0] <= 0) {
          if (border == true) {play=false;over=true;gui=true;}
          hit = true;
          snakepos[b][0] = winSize-4;              // rise from opposite side to border.
          snake = snake/2;                         // if passes border cut one life.
          red=200 ; green=0 ; blue=0;              // will create blink red effect  
          hit_s.play(); 
        }
        
        else if (snakepos[b][0] >= winSize-3) {
          if (border == true) {play=false;over=true;gui=true;}
          hit = true;
          snakepos[b][0] = 3;                      // rise from opposite side to border.
          snake = snake/2;                         // if passes border cut one life.
          red=200 ; green=0 ; blue=0;              // will create blink red effect  
          hit_s.play();
        }
        
        
        else if (snakepos[b][1] <= 0) {
          if (border == true) {play=false;over=true;gui=true;}
          hit = true;
          snakepos[b][1] = winSize-4;              // rise from opposite side to border.
          snake = snake/2;                         // if passes border cut one life.
          red=200 ; green=0 ; blue=0;              // will create blink red effect   
          hit_s.play();
        }
      
        else if (snakepos[b][1] >= winSize-3) {
          if (border == true) {play=false;over=true;gui=true;}
          hit = true;
          snakepos[b][1] = 3;                      // rise from opposite side to border.
          snake = snake/2;                         // if passes border cut one life.
          red=200 ; green=0 ; blue=0;              // will create blink red effect  
          hit_s.play();
        }  
      }
    
      //
      //Formation of snake :
      for (int f=0 ; f<snake; f++){
         fill(255);                            // Green colour for snake.
         noStroke();
         rect(snakepos[f][0],snakepos[f][1],5,5);
      }
    
      //
      //Formation of Food.
      fill(255,0,0);                              // Red colour for food.
      rect(foodX,foodY,5,5);
    
    
      //
      //Detection of eating food :
      for(int f=0 ; f<snake-1 ; f++) {
        if (snakepos[0][0]<=foodX+5 && snakepos[0][0]>=foodX-5 && 
            snakepos[0][1]<=foodY+5 && snakepos[0][1]>=foodY-5    )  { 
          snake+=10;
          eat.play();
          score+=2;
          genFood();
        } 
      }
     
     
     
       //
       //snake lives for initial size (i.e. zero score)
     for(int e = 3; e<snake; e++){
       if (snakepos[0][0] <= snakepos[e][0] + 2 && snakepos[0][0] >= snakepos[e][0] - 2 && 
           snakepos[0][1] <= snakepos[e][1] + 5 && snakepos[0][1] >= snakepos[e][1] - 5)
       {
          snake = e;
          red = 200;
          life=life-1; 
          hit_s.play();
       }
     }
     
     
     if (snake < 3 || life <= 0) {
       play = false;
       over = true;
       gui = true;
     }
  }   
}



/*****************************************************************************************/
//
//
//
void keyPressed() {
  if ((key == 'a' || key == 'A' || keyCode == LEFT) && moveRight == false) {
   moveLeft = true;
   moveDown = false;
   moveUp = false;
 }
  
  if ((key == 'w' || key == 'W' || keyCode == UP) && moveDown == false) {
   moveLeft = false;
   moveRight = false;
   moveUp = true;
 }
  
  if ((key == 's' || key == 'S' || keyCode == DOWN) && moveUp == false) {
   moveLeft = false;
   moveRight = false;
   moveDown = true;
 }
  
  if ((key == 'd' || key == 'D' || keyCode == RIGHT) && moveLeft == false) {
   moveUp = false;
   moveRight = true;
   moveDown = false;
 }
}



void mouseReleased() {
  
  if (gui) {
    if (!over){
    if (p.mouseReleased()) {
      select.play();
      reset(); 
      play = true;
      gui = false;
       
    }
    bor.mouseReleased();
    music.mouseReleased();}
    
    
    if (e.mouseReleased()){
      select.play();
      exit(); 
      gui = false;
    }
    
    if (mm.mouseReleased()){
        select.play();
        play= false;
        over = false;
    } 
    if (pa.mouseReleased()){
        select.play();
        reset();
        gui = false;
        play = true; 
    }
  }
}

int HORIZONTAL = 0;
int VERTICAL   = 1;
int UPWARDS    = 2;
int DOWNWARDS  = 3;

class Widget
{

  
  PVector pos;
  PVector extents;
  String name;

  color inactiveColor = color(60, 60, 100);
  color activeColor = color(100, 100, 160);
  color bgColor = inactiveColor;
  color lineColor = color(255);
  
  
  
  void setInactiveColor(color c)
  {
    inactiveColor = c;
    bgColor = inactiveColor;
  }
  
  color getInactiveColor()
  {
    return inactiveColor;
  }
  
  void setActiveColor(color c)
  {
    activeColor = c;
  }
  
  color getActiveColor()
  {
    return activeColor;
  }
  
  void setLineColor(color c)
  {
    lineColor = c;
  }
  
  color getLineColor()
  {
    return lineColor;
  }
  
  String getName()
  {
    return name;
  }
  
  void setName(String nm)
  {
    name = nm;
  }


  Widget(String t, int x, int y, int w, int h)
  {
    pos = new PVector(x, y);
    extents = new PVector (w, h);
    name = t;
    //registerMethod("mouseEvent", this);
  }

  void display()
  {
  }

  boolean isClicked()
  {
    if (mouseX > pos.x && mouseX < pos.x+extents.x 
      && mouseY > pos.y && mouseY < pos.y+extents.y)
    {
      //println(mouseX + " " + mouseY);
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public void mouseEvent(MouseEvent event)
  {
    //if (event.getFlavor() == MouseEvent.PRESS)
    //{
    //  mousePressed();
    //}
  }
  
  
  boolean mousePressed()
  {
    return isClicked();
  }
  
  boolean mouseDragged()
  {
    return isClicked();
  }
  
  
  boolean mouseReleased()
  {
    return isClicked();
  }
}

class Button extends Widget
{
  PImage activeImage = null;
  PImage inactiveImage = null;
  PImage currentImage = null;
  color imageTint = color(255);
  
  Button(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }
  
  void setImage(PImage img)
  {
    setInactiveImage(img);
    setActiveImage(img);
  }
  
  void setInactiveImage(PImage img)
  {
    if(currentImage == inactiveImage || currentImage == null)
    {
      inactiveImage = img;
      currentImage = inactiveImage;
    }
    else
    {
      inactiveImage = img;
    }
  }
  
  void setActiveImage(PImage img)
  {
    if(currentImage == activeImage || currentImage == null)
    {
      activeImage = img;
      currentImage = activeImage;
    }
    else
    {
      activeImage = img;
    }
  }
  
  void setImageTint(color c)
  {
    imageTint = c;
  }

  void display()
  {
    if(currentImage != null)
    {
      //float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      float imgWidth = (extents.y*currentImage.width)/currentImage.height;
      
      
      pushStyle();
      imageMode(CORNER);
      //tint(imageTint);
      image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      stroke(bgColor);
      noFill();
      rect(pos.x, pos.y, imgWidth,  extents.y);
      //noTint();
      popStyle();
    }
    else
    {
      pushStyle();
      stroke(lineColor);
      fill(bgColor);
      rect(pos.x, pos.y, extents.x, extents.y);
  
      fill(lineColor);
      textAlign(CENTER, CENTER);
      text(name, pos.x + 0.5*extents.x, pos.y + 0.5* extents.y);
      popStyle();
    }
  }
  
  boolean mousePressed()
  {
    if (super.mousePressed())
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
      return true;
    }
    return false;
  }
  
  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
      return true;
    }
    return false;
  }
}

class Toggle extends Button
{
  boolean on = false;

  Toggle(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }


  boolean get()
  {
    return on;
  }

  void set(boolean val)
  {
    on = val;
    if (on)
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
    }
    else
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
    }
  }

  void toggle()
  {
    set(!on);
  }

  
  boolean mousePressed()
  {
    return super.isClicked();
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      toggle();
      return true;
    }
    return false;
  }
}

class RadioButtons extends Widget
{
  public Toggle [] buttons;
  
  RadioButtons (int numButtons, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w*numButtons, h);
    buttons = new Toggle[numButtons];
    for (int i = 0; i < buttons.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x+i*(w+5);
        by = y;
      }
      else
      {
        bx = x;
        by = y+i*(h+5);
      }
      buttons[i] = new Toggle("", bx, by, w, h);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(i >= names.length)
        break;
      buttons[i].setName(names[i]);
    }
  }
  
  void setImage(int i, PImage img)
  {
    setInactiveImage(i, img);
    setActiveImage(i, img);
  }
  
  void setAllImages(PImage img)
  {
    setAllInactiveImages(img);
    setAllActiveImages(img);
  }
  
  void setInactiveImage(int i, PImage img)
  {
    buttons[i].setInactiveImage(img);
  }

  
  void setAllInactiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(img);
    }
  }
  
  void setActiveImage(int i, PImage img)
  {
    buttons[i].setActiveImage(img);
  }
  
  
  
  void setAllActiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(img);
    }
  }

  void set(String buttonName)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].getName().equals(buttonName))
      {
        buttons[i].set(true);
      }
      else
      {
        buttons[i].set(false);
      }
    }
  }
  
  int get()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return i;
      }
    }
    return -1;
  }
  
  String getString()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return buttons[i].getName();
      }
    }
    return "";
  }

  void display()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].display();
    }
  }

  boolean mousePressed()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mousePressed())
      {
        return true;
      }
    }
    return false;
  }
  
  boolean mouseDragged()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseReleased())
      {
        for(int j = 0; j < buttons.length; j++)
        {
          if(i != j)
            buttons[j].set(false);
        }
        //buttons[i].set(true);
        return true;
      }
    }
    return false;
  }
}

class Slider extends Widget
{
  float minimum;
  float maximum;
  float val;
  int textWidth = 60;
  int orientation = HORIZONTAL;

  Slider(String nm, float v, float min, float max, int x, int y, int w, int h, int ori)
  {
    super(nm, x, y, w, h);
    val = v;
    minimum = min;
    maximum = max;
    orientation = ori;
    if(orientation == HORIZONTAL)
      textWidth = 60;
    else
      textWidth = 20;
  }

  float get()
  {
    return val;
  }

  void set(float v)
  {
    val = v;
    val = constrain(val, minimum, maximum);
  }

  void display()
  {
    pushStyle();
    textAlign(LEFT, TOP);
    fill(lineColor);
    text(name, pos.x, pos.y);
    stroke(lineColor);
    noFill();
    if(orientation ==  HORIZONTAL){
      rect(pos.x+textWidth, pos.y, extents.x-textWidth, extents.y);
    } else {
      rect(pos.x, pos.y+textWidth, extents.x, extents.y-textWidth);
    }
    noStroke();
    fill(bgColor);
    float sliderPos; 
    if(orientation ==  HORIZONTAL){
        sliderPos = map(val, minimum, maximum, 0, extents.x-textWidth-4); 
        rect(pos.x+textWidth+2, pos.y+2, sliderPos, extents.y-4);
    } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textWidth-4); 
        rect(pos.x+2, pos.y+textWidth+2, extents.x-4, sliderPos);
    } else if(orientation == UPWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textWidth-4); 
        rect(pos.x+2, pos.y+textWidth+2 + (extents.y-textWidth-4-sliderPos), extents.x-4, sliderPos);
    };
    popStyle();
  }

  
  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textWidth, pos.x+extents.x-4, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-4, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-4, maximum, minimum));
      };
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textWidth, pos.x+extents.x-10, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-10, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-10, maximum, minimum));
      };
      return true;
    }
    return false;
  }
}

class MultiSlider extends Widget
{
  Slider [] sliders;

  MultiSlider(String [] nm, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super(nm[0], x, y, w, h*nm.length);
    sliders = new Slider[nm.length];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider(nm[i], 0, min, max, bx, by, w, h, orientation);
    }
  }

  void set(int i, float v)
  {
    if(i >= 0 && i < sliders.length)
    {
      sliders[i].set(v);
    }
  }
  
  float get(int i)
  {
    if(i >= 0 && i < sliders.length)
    {
      return sliders[i].get();
    }
    else
    {
      return -1;
    }
    
  }

  void display()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      sliders[i].display();
    }
  }

  
  boolean mouseDragged()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseReleased())
      {
        return true;
      }
    }
    return false;
  }
}



