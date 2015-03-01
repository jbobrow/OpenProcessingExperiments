
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
    fill(0,0,0);
    triangle(x+sidea/2, y+sidea/4, x-sidea/2, y+sidea/4, x, y-(3*sidea)/4);   
  popStyle();
 }
  
}

public class Snowflake
{
  int size;
  ArrayList<Cut> cuts;
 int x;
 int y;
 
 public Snowflake(int h, int v, int s)
 {
    x=h;
    y=v;
    size=s; 
    cuts = new ArrayList<Cut>();
 }
  
public void show()
{
   ellipse(x,y,size,size);
   for(int i=0; i<cuts.size(); i++)
   {
      cuts.get(i).show(); 
   }
  
}
public void show(String type)
{
  
   if(type.equals("Half-Brick"))
   {
     show();
     int i=-x; int n=-y;
     int icount=1; int ncount=1;
       while(i<width+size )
         {
           n=-y;
           while(n<height+size)
           {
             pushMatrix();
               if(ncount%2==0)
                 translate(i+size/2, n);
               else
                 translate(i,n);  
             show(); 
             popMatrix();
             n+=size;
             ncount++;
           }
           i+=size;
        
           icount++;
         }     
   }
   else if(type.equals("Half-Drop"))
   {
     show();
     int i=-x; int n=-y;
     int icount=1; int ncount=1;
     boolean swt=false;
       while(i<width+size )
         {
           n=-y;
            if(icount%2==0)
                swt=true;
           while(n<height+size)
           {
             pushMatrix();
              if(swt)
                 translate(i, n+size/2);
               else
                 translate(i,n);  
             show(); 
             popMatrix();
             n+=size;
             ncount++;
           }
           swt=false;
           i+=size;
        
           icount++;
         }     
   }
   else//(type.equals("Basic"))
    {
     show();
       //move snowflake, draw snowflake, repeat
       for(int i =-x; i<width+size; i+=size)
         {
           for(int n=-y; n<height+size; n+=size)
           {
             pushMatrix();
             translate(i, n);
            
             show(); 
             popMatrix();
           }
         }
       
     
    } 
  
  
}


public void cut(int newx, int newy)
{
   Cut recent = new Cut(newx, newy, size/10);
   cuts.add(recent); 
}
  
public void Pressed(int px, int py)
{
   cut(px,py);
}

public void Reset()
{ 
 cuts.clear(); 
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
  
  
  
  return 0;
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
boolean dis=true;
String rep="Basic";
Snowflake flakes;
int wmid, hmid;
//edit box bounds
int upx, upy, downx, downy;
boolean showInstructions=true;

void setup()
{
 ellipseMode(CENTER);
 size(620, 480);
 background(0,0,0);
  siz=width/8;
  hmid = siz*2;
  wmid=width/2;
  //drawing square
  pushStyle();
    noFill();
    stroke(200,200,255);
    rectMode(CENTER);
    rect(width/2, (siz)*2, size, size);
    upx = (width/2) - (siz/2);
    upy = (siz*2)-siz/2;
    downx = (width/2) + (siz/2);
    downy = (siz*2)+siz/2;
  popStyle();
 
 String [] names = {"Basic", "Half-Drop", "Half-Brick", "Reset"};
 pattControl = new Console(names.length, names, margin);
 //drawing buttons
 pattControl.show(); 

 flakes = new Snowflake(width/2, (siz)*2, siz);
 
 pushStyle();
   fill(255,255,255);
   flakes.show(rep);
 popStyle(); 

 
   //show instructions
   pushStyle();
   fill(50,120,255,80);
   rect(0, height-75, width, 50);
   fill(110,130,255,255);
   textAlign(LEFT,TOP);
   textSize(24);
   text("Cut snowflake with mouse inside blue edit box. Press 's' to save.",0, height-75, width, height-25);
   popStyle();
 
 

}

void draw()
{

  background(0,0,0);
  
 pushStyle();
   fill(255,255,255);
   flakes.show(rep);
 popStyle(); 
  
  if(dis){
  //draw display UI
    //drawing square
    pushStyle();
      noFill();
      stroke(200,200,255);
      rectMode(CENTER);
      rect(width/2, (siz)*2, siz, siz);
    popStyle();
  //drawing buttons
    pattControl.show();
  }  

if(showInstructions){
   //show instructions
   pushStyle();
   fill(50,120,255,80);
   rect(0, height-75, width, 50);
   fill(110,130,255,255);
   textAlign(LEFT,TOP);
   textSize(24);
   text("Cut snowflake with mouse inside blue edit box. Press 's' to save.",0, height-75, width, height-25);
   popStyle();
}

  
}

void keyPressed()//save snowflake pattern without the UI
{
 if(key=='s' || key =='S')
 {
   dis=false;
   draw();
   //unique save file every time
   saveFrame("mySnowFlake"+day()+month()+year()+hour()+minute()+second()+millis()+".jpg");
   dis=true;
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
         flakes.Reset();
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
     flakes.cut(mouseX, mouseY);
     flakes.cut(width/2+((width/2)-mouseX), mouseY);
     flakes.cut(mouseX, hmid+(hmid-mouseY));
     flakes.cut( width/2+((width/2)-mouseX), hmid+(hmid-mouseY));

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
     flakes.cut(mouseX, mouseY);
     flakes.cut(width/2+((width/2)-mouseX), mouseY);
     flakes.cut(mouseX, hmid+(hmid-mouseY));
     flakes.cut( width/2+((width/2)-mouseX), hmid+(hmid-mouseY));
  } 
}
  
  
}


 
 
 
 
 
 
 
  
















