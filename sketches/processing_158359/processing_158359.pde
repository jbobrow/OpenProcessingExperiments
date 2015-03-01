
int counter;
Question [] test;
Question currentQ;

void setup(){
  
  size(800, 600);
  counter = 0;
  setupGUI();
  test = new Question[24];
  
  welcomingPage();
  
  test[0] = new Question(1, "How much time do you spend sitting?", "Me llamo Gabo"); //carefull
  test[0].setOpNames("Very Much", "Some", "Not Much", "Not at all");
  
  test[1] = new Question(2, "Do you usually take naps?", "Al parecer si!");
  test[2] = new Question(3, "Do you usually do \"To Do Lists\"?", "y tu?");  
  test[3] = new Question(4, "When you have a lot to do. Do you organize your time for the following day?", "y tu?");
  test[4] = new Question(5, "Do you usually apply creative ways to remember important stuff?", "y tu?");
  test[5] = new Question(6, "Do you usually take more handwritten notes than virtual notes?", "y tu?");
  test[6] = new Question(7, "Do you usually like to discuss your ideas with other people?", "y tu?");
  test[7] = new Question(8, "Do you usually like to listen other people's ideas?", "y tu?");
  test[8] = new Question(9, "How much exercise do you do per week?", "y tu?");
  test[8].setOpNames("None", "Almost Nothing", "Something", "A lot");
  
  test[9] = new Question(10, "Do you usually do the more important or difficult tasks early in the day?", "y tu?");
  test[10] = new Question(11, "If you see the stardard solution you look for an alternative solution just because you are curious?", "y tu?");
  test[11] = new Question(12, "Do you have possitive study/work habits?", "y tu?");
  test[12] = new Question(13, "When you find a fascinating topic. Do you do a research to develop a deep understanding of it?", "y tu?");
  test[13] = new Question(14, "Do you usually organize your work/study so if you want to take a look to it after you've done it you can easily do it?", "Al parecer si!");
  test[14] = new Question(15, "Do you always (study/do extra-work) on the same enviroment?", "Al parecer si!");
  test[14].setOpNames("Yes", "Almost always", "Not much", "No");
  
  test[15] = new Question(16, "When you are working/studying do you always focus more on the product than in the process?", "Al parecer si!");
  test[15].setOpNames("Yes", "Almost always", "Not much", "No");
  
  test[16] = new Question(17, "When you are stuck with a problem. Do you stay thinking as long as it takes until you solve it?", "Al parecer si!");
  test[16].setOpNames("Yes", "Almost always", "Not much", "No");
  
  test[17] = new Question(18, "Do you mainly work/study at night?", "Al parecer si!");
  test[17].setOpNames("Yes", "Almost always", "Not much", "No");
  
  test[18] = new Question(19, "Do you usually review recent or older valuable information of your study/work?", "Al parecer si!");
  test[19] = new Question(20, "When you are preparing yourself for a test or a presentation. How much time do you take to prepare to it?", "Al parecer si!");
  test[19].setOpNames("The day before", "A few days", "A week", "More than a week");
  
  test[20] = new Question(21, "When you see the solution of a certain problem. Do you always think that you could solve the same problem without help?", "Al parecer si!");
  test[20].setOpNames("Yes", "Almost always", "Not always", "No");
  
  test[21] = new Question(22, "When you are studying you JUST read the material many times?", "Al parecer si!");
  test[21].setOpNames("Yes", "Sometimes", "Not much", "No");
  
  test[22] = new Question(23, "Do you balance your study between the hard and easy parts or you just focus on the easy parts?", "Al parecer si!");
  test[22].setOpNames("Just easy parts", "Just hard parts", "A little of both", "Both");
  
  test[23] = new Question(24, "When you are studying do you test your own knowledge by asking you questions?", "Al parecer si!");
  
  
  currentQ = test[0];
  
}

void draw(){
  

  
}

void mouseClicked(){
  
  if(currentQ.mouseClicked()){

    if(currentQ.decided && currentQ.cont.isClicked()){
      counter++;
      if(counter >= test.length){
        finishPage();
      }
      else{
        currentQ = test[counter];
        currentQ.setQuestion();
        currentQ.showOptions();
      }
    }
    else{
      currentQ.decided = true;
    }
  }
  else{
    currentQ.setQuestion();
    currentQ.showOptions();
  }
}

int getScore(){
  
  int score = 0;
  
  for(int i = 0; i < test.length; i++){
    
    score += test[i].points;
  }
  return (int) map(score, 5*test.length, 20*test.length, 0, 100);
  
}

PImage back1;
PImage back2;
PFont myFont;

void setBackground(PImage background){
 
  background(background);
  fill(255, 255, 255, 30);
  rect(0, 0, width, height);
  fill(0,0,0, 180);
  rect(50, 50, width - 100, height - 100);
}

void setupGUI(){
  
  //background
  back1 = loadImage("DarkFlakes.png");
  //back2 = loadImage("flower1.png");
  
  //resize
  back1.resize(width, height);
  //back2.resize(width, height);
  
  setBackground(back1);
  
  //font 
  myFont = createFont("Georgia", 32);
  
}

void welcomingPage(){
  
  setBackground(back1);
  fill(255,255,255);
  textFont(myFont);
  
  textSize(60);
  text("The learning test!", 100, 80, 700, 200);
  
  textSize(30);
  text("This test will teach you some tips about learning and will help you realize what you are doing well, or not, and why.", 100, 200, 600, 400);
  textSize(18);
  text("Please Click to continue and be honest with yourself --> ", 100, 400, 700, 500);
  
  copyright();
}

void copyright(){
  //Copyright
  textSize(10);
  text("This work had been developed by Gabriel Amarista All Rights Reserved", 100, height-70 );
}

void finishPage(){
  
  int score = getScore();
  
  setBackground(back1);
  fill(255,255,255);
  textFont(myFont);
  textSize(25);
  text("Thanks for playing I hope your knowledge about learning had been improved!", 100, 100, 700, 200);
  textSize(50);
  text("Your Score was: " + score, 100, 250);
  textSize(18);
  text("Learning is a progressive live journey, if you can dream it you can accomplish it and remember: \n\n\t\"Lady luck always helps the one who tries\".", 100, 300, 700, 500);
  text("Good learning!", 2*width/3, height - 180);
  copyright();
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
  
  void setImageTint(float r, float g, float b)
  {
    imageTint = color(r,g,b);
  }

  void display()
  {
    if(currentImage != null)
    {
      //float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      float imgWidth = (extents.y*currentImage.width)/currentImage.height;
      
      
      pushStyle();
      imageMode(CORNER);
      tint(imageTint);
      image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      stroke(bgColor);
      noFill();
      rect(pos.x, pos.y, imgWidth,  extents.y);
      noTint();
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
      if (bgColor == activeColor)
      {
        bgColor = inactiveColor;
      } else
      {
        bgColor = activeColor;
      }
      
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
  
  RadioButtons (String [] names,int numButtons, int x, int y, int w, int h, int orientation)
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
      buttons[i] = new Toggle(names[i], bx, by, w, h);
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
  
  void setAllImages(PImage [] img)
  {
    setAllInactiveImages(img);
    setAllActiveImages(img);
  }
  
  void setInactiveImage(int i, PImage img)
  {
    buttons[i].setInactiveImage(img);
  }

  
  void setAllInactiveImages(PImage [] img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(img[i]);
    }
  }
  
  void setActiveImage(int i, PImage img)
  {
    
    buttons[i].setActiveImage(img);
  }
  
  
  
  void setAllActiveImages(PImage [] img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(img[i]);
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
    
    float textW = textWidth;
    if(name == "")
      textW = 0;
    pushStyle();
    textAlign(LEFT, TOP);
    fill(lineColor);
    text(name, pos.x, pos.y);
    stroke(lineColor);
    noFill();
    if(orientation ==  HORIZONTAL){
      rect(pos.x+textW, pos.y, extents.x-textWidth, extents.y);
    } else {
      rect(pos.x, pos.y+textW, extents.x, extents.y-textW);
    }
    noStroke();
    fill(bgColor);
    float sliderPos; 
    if(orientation ==  HORIZONTAL){
        sliderPos = map(val, minimum, maximum, 0, extents.x-textW-4); 
        rect(pos.x+textW+2, pos.y+2, sliderPos, extents.y-4);
    } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2, extents.x-4, sliderPos);
    } else if(orientation == UPWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2 + (extents.y-textW-4-sliderPos), extents.x-4, sliderPos);
    };
    popStyle();
  }

  
  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-4, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, maximum, minimum));
      };
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-10, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, maximum, minimum));
      };
      return true;
    }
    return false;
  }
}

class MultiSlider extends Widget
{
  Slider [] sliders;
  /*
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
  */
  MultiSlider(int numSliders, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w, h*numSliders);
    sliders = new Slider[numSliders];
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
      sliders[i] = new Slider("", 0, min, max, bx, by, w, h, orientation);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(i >= names.length)
        break;
      sliders[i].setName(names[i]);
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


//
//void question(int counter){
//  
//  fill(255,255,255);
//  textFont(myFont);
//  textSize(30);
//  
//  
//  switch(counter){
//    
//    case 1: 
//    
//      questionOne();
//    break;
//    
//    case 2:
//    
//      questionTwo();
//    break;
//    
//    case 3:
//    
//      questionThree();
//    break;
//    
//    case 4: 
//    
//      questionFour();
//    break;
//    
//    case 5:
//    
//      questionFive();
//    break;
//    
//    case 6:
//    
//      questionSix();
//    break;
//    
//    case 7:
//    
//      questionSeven();
//    break;
//    
//    case 8:
//    
//      questionEight();
//    break;
//    
//    case 9:
//    
//      questionNine();
//    break;
//    
//    case 10:
//    
//      questionTen();
//    break;
//    
//    default:
//    break;
//  }
//  
//}
//
//
//void questionOne(){
//   
//  text("pregunta 1: ", 100, 100);
//
//}
//
//void questionTwo(){
//   
//  text("pregunta 2: ", 100, 100);
//
//}
//
//void questionThree(){
//
//  text("pregunta 3: ", 100, 100);
//
//}
//
//void questionFour(){
//  
//  text("pregunta 4: ", 100, 100);
//
//}
//
//void questionFive(){
//
//  text("pregunta 5: ", 100, 100);
//
//}
//
//void questionSix(){
//
//  text("pregunta 6: ", 100, 100);
//
//}
//
//void questionSeven(){
// 
//  text("pregunta 7: ", 100, 100);
//
//}
//
//void questionEight(){
//
//  text("pregunta 8: ", 100, 100);
//
//}
//
//void questionNine(){
//
//  text("pregunta 9: ", 100, 100);
//
//}
//
//void questionTen(){
//
//  text("pregunta 10: ", 100, 100);
//
//}

class Question{
  
  int num;
  int points;
  String preg;
  String answer;
  Button [] bot;
  Button cont;
  boolean decided;
  //PImage but;
  
  Question(int n, String p, String a){
    
    num = n;
    preg = p;
    answer = a;
    
    //option buttons    
    //init
    bot = new Button[4];
    //but = loadImage("but.jpg");
    setOptions("No","Not Much","Sometimes","Yes");
    
    cont = new Button("Continue -> ", 550, 400, 150, 50);
    cont.setImageTint(81, 90, 250);
    decided = false;
    
  }
  
  void setOptions(String op1, String op2, String op3, String op4){
    
    bot[0] = new Button(op1, 100, 400, 150, 50);
    bot[1] = new Button(op2, 250, 400, 150, 50);
    bot[2] = new Button(op3, 400, 400, 150, 50);
    bot[3] = new Button(op4, 550, 400, 150, 50);    
    
    bot[0].setImageTint(250,137,81);
    bot[1].setImageTint(250, 231, 81);
    bot[2].setImageTint(210, 250, 81);
    bot[3].setImageTint(81, 250, 99);    
    
  }
  
  void setOpNames(String op1, String op2, String op3, String op4){
    
    bot[0].setName(op1);
    bot[1].setName(op2);
    bot[2].setName(op3);
    bot[3].setName(op4);   
  }
  
  void setQuestion(){
    
    setBackground(back1);
    fill(255,255,255);
    textFont(myFont);
    textSize(30);
    text("Question "+num+": ", 100, 100);
    
    textSize(25);
    text(preg, 100, 200, 630, 400); //box
  }
  
  void showOptions(){
    
    for(int i = 0; i < bot.length; i++){
      bot[i].display();
    }   
    
  }
  
  void showAnswer(){
    setBackground(back1);
    
    fill(255,255,255);
    textFont(myFont);
    textSize(30);
    text("Question "+num+": ", 100, 100);
    
    textSize(18);
    text(answer, 100, 150, 630, 400); //box
    
  }
  
  boolean mouseClicked(){
    
    for(int i = 0; i < bot.length; i++){
      if(bot[i].mousePressed()){
        
        if(!decided){
          points = (i+1) * 5;
        }
        showAnswer();
        
        //continue button
        cont.display();
        return true;
      }
    }
    
    return false;
    
  }
  
  
  
  
  
}



