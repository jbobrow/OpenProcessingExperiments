
//Since summer is ending in the northern hemisphere right now, I wanted to make some snowflakes.
//I'm trying to emulate the paper snowflakes that you can make by cuttinf out pieces of a white paper circle.
//I wanted to be able to save the snowflakes in different pattern layouts (basic, half-drop, half-brick), as well
//as start a new snowflake without having to re-open the sketch (reset button)



/*
plan: 
snowflakepattern
    circle
    array of cuts/triangle
    repeattype
  draw
  cut-add triangle to array



*/

PImage GGimg;
PImage RGimg;
PImage RSimg;


public class Cut
{
 int x;
 int y;
 int sidea;
 
 public Cut(int h, int v, int siz)
 {
   x=h;
   y=v;
   sidea=siz;
 }
 public void show()
 {
   //draw triange around x,y midpoint
   //sidea is length of one side
   //points are x+a/2, y +a/4   
  pushStyle();
//    fill(0,0,0);
    //triangle(x+sidea/2, y+sidea/4, x-sidea/2, y+sidea/4, x, y-(3*sidea)/4); 
     //img = loadImage("COLOURlovers.com-Green_Gold_Bauble_1.png");
     image(GGimg, x,  y, 50,50);
     
  popStyle();
 }
  public void show(String type)
 {
   //draw triange around x,y midpoint
   //sidea is length of one side
   //points are x+a/2, y +a/4   
  pushStyle();
//    fill(0,0,0);
    //triangle(x+sidea/2, y+sidea/4, x-sidea/2, y+sidea/4, x, y-(3*sidea)/4); 
     //img = loadImage("COLOURlovers.com-Green_Gold_Bauble_1.png");
     
      switch (type) {
            case "RS":  image(RSimg, x,  y, 50,50);
                     break;
            case "RG":  image(RGimg, x,  y, 50,50);
                     break;
            case "GG":  image(GGimg, x,  y, 50,50);
                     break;
          
            default: image(GGimg, x,  y, 50,50);
                     break;
        }
     
  popStyle();
 }
  
}

public class Swatch
{
  int size;
  ArrayList<Cut> cuts;
 int x;
 int y;
 int sizeh=0;
 
 public Swatch(int h, int v, int s)
 {
    x=h;
    y=v;
    size=s; 
    cuts = new ArrayList<Cut>();
 }

 public Swatch(int h, int v, int s, int h)
 {
    x=h;
    y=v;
    size=s; 
    sizeh=h;
    cuts = new ArrayList<Cut>();
 }
  
public void show()
{
  if(sizeh=0)    
   rect(x,y,size,size);
  else
   rect(x,y,size,sizeh);  
   for(int i=0; i<cuts.size(); i++)
   {
      cuts.get(i).show(); 
   }
  cuts.clear();
}

public void show(String t, int x)
{
  if(sizeh=0)    
   rect(x,y,size,size);
  else
   rect(x,y,size,sizeh);  
   
   for(int i=0; i<cuts.size(); i++)
   {
      cuts.get(i).show(t); 
   }
 cuts.clear();
}
public void show(String type)
{
  
   if(type.equals("Red-Gold"))
   {
     show("RG",0);
     
         
   }
   else if(type.equals("Red-Silver"))
   {
     show("RS",0);
       
   }
   else//(type.equals("Basic"))
    {
     show("GG",0);
      
     
    } 
  
  
}


public void cut(int newx, int newy)
{
   Cut recent = new Cut(newx, newy, size/50);
   cuts.add(recent); 
}
  
public void Pressed(int px, int py)
{
   cut(px,py);
}

public void Reset()
{ 
 cuts.clear();
background(0,0,0); 
}
  
  
}


public class Console {
 public int numbuttons;
 public int xval;
 public int yval;
 public int mar;
 public int wide;
 public int tall;
 String[] titles;
 String type;
 boolean isDisplayed;

public Console(int num, String[] name, int marg){
  numbuttons = num;
  titles= name;
  mar=marg;
  xval = width-(mar*5);
  yval = mar;
  wide = mar*5;
  tall = 50*num;
  type = "default";
 
} 
public void pressed()//finish definition later
{
   if(type.equals("default"))
   {
     // for changing colors
     //return get(mouseX, mouseY);
   }
    
} 
public float getIH(){  return tall/numbuttons;}
public float getIW(){  return wide;}

//( yval + (u* (tall/numbuttons)) )
public Object pressed(String press)//which type of button press do I want?
{
  if(press.equals("colored"))
  {
    return pressedColor();
  }
  else if(press.equals("repeat"))
  {
     return pressedString();
  }
  
  
  
  return (Integer)0;
}

public String pressedString()
{
  //loop through buttons looking for mouse position
      for(int u=0; u<numbuttons; u++){
      
     if(mouseY<=( ((getIH()*u)+yval) + getIH()) && mouseY>= ((getIH()*u)+yval) )
     {
      
        return titles[u];
        
     }
     
     }
     return "";
  
}

public color pressedColor(){

     // for changing colors
    for(int u=0; u<numbuttons; u++){
      
     if(mouseY<=( ((getIH()*u)+yval) + getIH()) && mouseY>= ((getIH()*u)+yval) )
     {
        float red = (255/numbuttons)*u;
        float green = 256 % (u+1);
        float blue = 255/(u+1);
        color temp = color(red,green,blue);
        return temp;
        
     }
     
     }
     
     return color(128);

    
}


  public void show(){
    
    rectMode(CORNER);
    if(type.equals("default")){
    noStroke();
    for(int i=0; i<numbuttons; i++)
    {
      float red = (255/numbuttons)*i;
      float green = 256 % (i+1);
      float blue = 255/(i+1);
     fill(red,green,blue);
     rect(xval,(yval+((tall/numbuttons)*i)),wide,(tall/numbuttons));
     fill(255,255,255);
     text(titles[i],xval,(yval+((tall/numbuttons)*i))+15,wide,(tall/numbuttons));
    }
    }
    
    isDisplayed=true;//use later

  }
  
}
///////////////////////////////////////////////////////////////////////////////////////
Console pattControl;
int margin = 15;
int siz = 200;
boolean display=true;
String rep="Basic";
Swatch square;
int wmid, hmid;
//edit box bounds
int upx, upy, downx, downy;
boolean showInstructions=true;

void setup()
{
 ellipseMode(CENTER);
 size(800, 600);
 background(0,0,0);
  siz=width/8;
  hmid = siz*2;
  wmid=width/2;
  //drawing square
  pushStyle();
    noFill();
    stroke(200,200,255);
    rectMode(CENTER);

    
    upx=0; upy=0; downx=width; downy=height;
    
  popStyle();
 
 String [] names = {"Basic", "Red-Gold", "Red-Silver", "Green-Gold","Reset"};
 pattControl = new Console(names.length, names, margin);
 //drawing buttons
 pattControl.show(); 

 square = new Swatch((height)/2, 0,width, height);
 
 pushStyle();
   fill(255,255,255);
   square.show(rep);
 popStyle(); 

 
   //show instructions
   pushStyle();
   fill(50,120,255,160);
   rect(0, height-75, width, 50);
   fill(120,10,255,255);
   textAlign(LEFT,TOP);
   textSize(25);
   text("Draw with various color combinations to see how different patterns go together. Become more fashion adventurous with patterns! Press 's' to save.",0, height-75);
   popStyle();
 
 GGimg = loadImage("COLOURlovers.com-Green_Gold_Bauble_1.png");
 RGimg = loadImage("COLOURlovers.com-Red_Gold_Bauble_1.png");
 RSimg = loadImage("COLOURlovers.com-Red_Silver_Bauble.png");
 
}

void draw()
{

 // background(150,150,150);
  
  
 
 pushStyle();
   fill(255,255,255);
   square.show(rep);
 popStyle(); 
  
  if(display){
  //draw display UI

    pattControl.show();
  }  

if(showInstructions){
   //show instructions
   pushStyle();
   fill(50,120,255,160);
   rect(0, height-75, width, 50);
   fill(120,10,255,255);
   textAlign(LEFT,TOP);
   textSize(32);
   text("Draw with various color combinations to see how different patterns go together. Become more fashion adventurous with patterns! Press 's' to save.",0, height-75);
   popStyle();
}

 imageMode(CENTER);
     //image(img, width/2,  height/2, 500,500);
  
}

void keyPressed()//save snowflake pattern without the UI
{
 if(key=='s' || key =='S')
 {
   display=false;
   draw();
   //unique save file every time
   saveFrame("mySwatch"+day()+month()+year()+hour()+minute()+second()+millis()+".jpg");
   display=true;
 }  
  
  
  
  
  
}
void mousePressed()
{
  showInstructions=false;
String prevrep="";

  //did I press the console?  
 if(mouseX>=pattControl.xval) 
 {
    if(mouseY>=(pattControl.yval))
   {
       //console pressed
  
       prevrep=rep;
       rep = (String)pattControl.pressed("repeat");
       //println(rep);
       if(rep.equals("Reset"))
       {
         square.Reset();
         rep = prevrep;
         showInstructions=true;
       }
       else if(rep.equals(""))
         rep=prevrep;
    
   } 
 }
 //not console?
 
//did I press in editor box?
else if(mouseX>upx && mouseX<downx)
{
   if(mouseY>upy && mouseY<downy)
  {
     //println("edit box");
     square.cut(mouseX, mouseY);
     square.cut(width/2+((width/2)-mouseX), mouseY);
     square.cut(mouseX, hmid+(hmid-mouseY));
     square.cut( width/2+((width/2)-mouseX), hmid+(hmid-mouseY));

  } 
}

}

void mouseDragged()
{
  if(mouseX>upx && mouseX<downx)
{
   if(mouseY>upy && mouseY<downy)
  {
     //println("edit box");
     square.cut(mouseX, mouseY);
     square.cut(width/2+((width/2)-mouseX), mouseY);
     square.cut(mouseX, hmid+(hmid-mouseY));
     square.cut( width/2+((width/2)-mouseX), hmid+(hmid-mouseY));
  } 
}
  
  
}


 
 
 
 
 
 
 
  















