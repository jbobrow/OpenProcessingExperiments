
Grafic grafic;
float x=40;
float y=40;
Slider AA, AB, BA, BB;
Toggle A,B;
RadioButtons fstFuntion, sndFuntion;
String[] names = {"None", "Type a", "Type b", "Type c", "Type d"};

void setup() {
  size(800, 400);
  rectMode(CENTER);
  smooth(); 
  textSize(11);
 
  fstFuntion = new RadioButtons(5, x, y, 50, 20, HORIZONTAL);
  
  AA = new Slider("1Âºvariable'A'", 0, -4, 4, x, y+30, 300, 20, HORIZONTAL);
  AB = new Slider("1Âºvariable'B'", 4, -4, 4, x, y+50, 300, 20, HORIZONTAL);

    sndFuntion= new RadioButtons(5,  x, y+90, 50, 20, HORIZONTAL);
    
  BA = new Slider("2Âºvariable'A'", 1, -4, 4, x, y+120, 300, 20, HORIZONTAL);
  BB = new Slider("2Âºvariable'B'", 1, -4, 4, x, y+140, 300, 20, HORIZONTAL);
  
  A = new Toggle("sin/cos",350,y+30,40,20);
  B = new Toggle("sin/cos",350,y+120,40,20);

  fstFuntion.setNames(names);
  sndFuntion.setNames(names);
  fstFuntion.set("Type d");
  sndFuntion.set("Type d");
  B.set(true);
  grafic= new Grafic(new PVector((3*width)/4, height/2), width/2*0.9, 

  new PVector((width/4), (3*height)/4), width/2*0.9, height/2*0.8);
}

void draw() {
  background(0);
  strokeWeight(6);
  float F;
  for(int i = height; i>height-250;i-=10){
  F= map(i,width,height-250,255,0);
  stroke(#032C71,F);
  line(0,i,width,i);
  }
  strokeWeight(1);
  rectMode(CENTER);
  float a= map(mouseX, 0, width, -4, 4);
  float b= map(mouseY, 0, height, -4, 4);
  grafic.coordPolar(AA.get(), AB.get(), BA.get(), BB.get(),A.get(),B.get());
  grafic.planoCarte(AA.get(), AB.get(), BA.get(), BB.get(),A.get(),B.get());

  rectMode(CORNER); 
  AA.display();
  AB.display();
  BA.display();
  BB.display();
  fstFuntion.display();
  sndFuntion.display();
  A.display();
  B.display();
  
}
void mousePressed()
{


  AA.mousePressed();
  AB.mousePressed();
  BA.mousePressed();
  BB.mousePressed();
  A.mousePressed();
  B.mousePressed();
 
}

void mouseDragged()
{
  AA.mouseDragged();
  AB.mouseDragged();
  BA.mouseDragged();
  BB.mouseDragged();
  A.mouseDragged();
  B.mouseDragged();
 
}
void mouseReleased() {
  fstFuntion.mouseReleased();
  sndFuntion.mouseReleased();
  A.mouseReleased();
  B.mouseReleased();
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
        buttons[i].set(true);
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

class Grafic {
  PVector center; 
  float WW;
  PVector center2; 
  float WW2;
  float HW2;
 float margen;
 float amplitud1;
 float amplitud2;
 color A = color(#FF1008,128);
 color B = color(#0017FF,128);
 
  //los tres primeros son para las coordenadas polares y los tres ultimos para el plano cartesiano.
  
  Grafic(PVector center_, float s, PVector center_2, float w2, float h2) {
    center = center_;
    WW=s/2;
    center2 = center_2;
    WW2=w2/2;
    HW2=h2/2;
    margen= (WW2)/2;
    amplitud1= map(WW*2,0,width/2,0,25);
    amplitud2=map(HW2*2,0,height/2,0,25/2);
  }

  void coordPolar(float A1, float B1, float A2, float B2,boolean trigA,boolean trigB) {
    fill(50);  
    stroke(255);
    rect(center.x, center.y, WW*2, WW*2);    
    line(center.x, center.y-(WW), center.x, center.y+(WW));
    line(center.x-WW, center.y, center.x+WW, center.y);

    fill(0,255,255);
    text("90Âº",center.x, center.y-(WW)*0.9);
    text("180Âº",center.x-WW*0.9, center.y);
    text("270Âº", center.x, center.y+WW*0.9);
    text("0Âº", center.x+WW*0.9, center.y);
    
    fill(200,110);
    stroke(A);
    graphCoord(trigA,fstFuntion.get(),A1,B1,350);
    fill(200,110);
    stroke(B);
    graphCoord(trigB,sndFuntion.get(),A2,B2,370);
    
   
  }




  void planoCarte(float A1, float B1, float A2, float B2,boolean trigA,boolean trigB) {
    
     stroke(255);
     strokeWeight(1);
    fill(20);  
    rect(center2.x, center2.y, WW2*2, HW2*2);

    line(center2.x-WW2, center2.y, center2.x+WW2, center2.y);
    
    fill(0,255,255);
        
    text("90Âº",(center2.x-(WW2))+margen, center2.y);
    text("180Âº",(center2.x-(WW2))+margen*2, center2.y);
    text("270Âº",(center2.x-(WW2))+margen*3, center2.y);
   
    strokeWeight(5);
    point((center2.x-(WW2))+margen, center2.y);
    point((center2.x-(WW2))+margen*2, center2.y);
    point((center2.x-(WW2))+margen*3, center2.y);
    
    strokeWeight(2);
     stroke(A);
    graphPlan(trigA, fstFuntion.get(),A1,B1,350);
    stroke(B);
    graphPlan(trigB, sndFuntion.get(),A2,B2,370);  
    
    }
    
    // OTHER STUFF
    
    void graphCoord(boolean trig, int type,float A,float B, float x){
      strokeWeight(2);
       beginShape();
      
    for (int i=0;i<360;i++) {
      float angle=radians(i);
      float r;
      
  if(trig){
      
               if(type==1){
                r= (A+(B*cos(angle)))*amplitud1;
                if(i==0)text("R ="+nf(A,1,2)+"+("+nf(B,1,2)+"*cos(angle)",3*width/4- width/4*0.9+20,x);
               }
                else if(type ==2){
              r= (A+(B*cos(2*angle)))*amplitud1;
              if(i==0)text("R="+nf(A,1,2)+"+("+nf(B,1,2)+"*cos(2*angle)",3*width/4- width/4*0.9+20,x);
               }
               else if(type ==3){
             
                r= (A+(B*cos(3*angle)))*amplitud1;
                if(i==0)text("R="+nf(A,1,2)+"+("+nf(B,1,2)+"*cos(3*angle)",3*width/4- width/4*0.9+20,x);
               }
                else if(type ==4){
               r= (A+(B*cos(4*angle)))*amplitud1;
               if(i==0)text("R ="+nf(A,1,2)+"+("+nf(B,1,2)+"*cos(4*angle)",3*width/4- width/4*0.9+20,x);
               }
              
               else{
               r=0;
               }
   }else{
      
            if(type==1){
                r= (A+(B*sin(angle)))*amplitud1;
                if(i==0)text("R ="+nf(A,1,2)+"+("+nf(B,1,2)+"*sin(angle)",3*width/4- width/4*0.9+20,x);
               }
                else if(type ==2){
              r= (A+(B*sin(2*angle)))*amplitud1;
              if(i==0)text("R ="+nf(A,1,2)+"+("+nf(B,1,2)+"*sin(2*angle)",3*width/4- width/4*0.9+20,x);
               }
               else if(type ==3){
             
                r= (A+(B*sin(3*angle)))*amplitud1;
                if(i==0)text("R ="+nf(A,1,2)+"+("+nf(B,1,2)+"*sin(3*angle)",3*width/4- width/4*0.9+20,x);
               }
                else if(type ==4){
               r= (A+(B*sin(4*angle)))*amplitud1;
               if(i==0)text("R ="+nf(A,1,2)+"+("+nf(B,1,2)+"*sin(4*angle)",3*width/4- width/4*0.9+20,x);
               }
              
               else{
               r=0;
               }
   }
     
      float posx= constrain(cos(angle)*r +center.x,center.x-WW,center.x+WW);
      float posy= constrain(sin(angle)*r +center.y,center.y-WW,center.y+WW);
      vertex(posx, posy);
    }
    endShape(CLOSE);
    
    
    }
    
    void  graphPlan(boolean trig, int type,float A,float B){
      
    noFill();
   

    beginShape();
    
    for (int i=0;i<360;i++) {
      float temp= map(i, 0, 359, center2.x-(WW2), center2.x+(WW2));
      float angle=radians(i);
      float r;
       
       
       if(trig){
         
                      if(type==1){
                    r= (A+(B*cos(angle)))*amplitud2;
                   }
                   
                    else if(type ==2){
                 r= (A+(B*cos(2*angle)))*amplitud2;
                   }
                   
                   else if(type ==3){
                     r= (A+(B*cos(3*angle)))*amplitud2;
                   }
                   
                    else if(type ==4){
                   r= (A+(B*cos(4*angle)))*amplitud2;
                   
                    }else{
                   r=0;
                   }
     
     
     
       }else{
         
                        if(type==1){
                      r= (A+(B*sin(angle)))*amplitud2;
                     }
                     
                      else if(type ==2){
                   r= (A+(B*sin(2*angle)))*amplitud2;
                     }
                     
                     else if(type ==3){
                       r= (A+(B*sin(3*angle)))*amplitud2;
                     }
                     
                      else if(type ==4){
                     r= (A+(B*sin(4*angle)))*amplitud2;
                    }
                    
                    else{
                     r=0;
                     }
       }
      vertex(temp,constrain(r+center2.y,center2.y-HW2,center2.y+HW2));
      }
      endShape();
    
    }
  }



