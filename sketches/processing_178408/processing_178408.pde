


//images
PImage GGimg;
PImage RGimg;
PImage RSimg;
PImage BPimg;
PImage Bimg;
PImage Pimg;
PImage GYimg;
PImage Gimg;
String GGtext= "COLOURlovers.com-Road_to_El_Dorado.png";
String RGtext= "COLOURlovers.com-Off_to_Fight.png";
String RStext= "COLOURlovers.com-Power_of_Equality.png";
String BPtext= "COLOURlovers.com-Circles.png";
String Btext= "COLOURlovers.com-blue.png";
String Ptext= "COLOURlovers.com-Sweet_Toile1.png";
String GYtext= "COLOURlovers.com-Boxy_Stripe.png";
String Gtext= "COLOURlovers.com-Pasty.png";
String [] names = {"Basic", "Red-Gold", "Red-Silver", "Green-Gold","Blue-Pink","Blue","Purple","Green-Yellow","Green","New Pattern Section","Reset"};
 
PImage[] imgs;//later use
String[] files;//later use

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
 
 public void show()//default
 { 
  pushStyle();
     image(GGimg, x,  y, sidea,sidea);
  popStyle();
 }
 
  public void show(String type)
 {
  
  pushStyle();
//pick image to draw
      switch (type) {
            case "RS":  image(RSimg, x,  y, sidea,sidea);
                     break;
            case "RG":  image(RGimg, x,  y, sidea,sidea);
                     break;
            case "GG":  image(GGimg, x,  y, sidea,sidea);
                     break;
            case "BP":  image(BPimg, x,  y, sidea,sidea);
                     break;
            case "B":   image(Bimg, x,  y, sidea,sidea);
                     break;
            case "P":  image(Pimg, x,  y, sidea,sidea);
                     break;  
            case "GY":  image(GYimg, x,  y, sidea,sidea);
                     break;     
            case "G":  image(Gimg, x,  y, sidea,sidea);
                     break;         
            default: image(GGimg, x,  y, sidea,sidea);
                     break;
        }
     
  popStyle();
 }
  
}

public class Swatch//canvas to draw on
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
  
public void show()//default square draw
{
  pushStyle();
  stroke(255,0,0);
  strokeWeight(25);
  if(sizeh=0)    
   rect(x,y,size,size);
  else
   rect(x,y,size,sizeh);  
   
  popStyle(); 
   for(int i=0; i<cuts.size(); i++)
   {
      cuts.get(i).show(); 
   }
  cuts.clear();
}

public void show(String t, int x)//draw cut based on type
{
  if(sizeh=0)    
   rect(x,y,size,size);
  else
   rect(x,y,size,sizeh);  
   
   for(int i=0; i<cuts.size(); i++)
   {
      cuts.get(i).show(t); 
   }
 //cuts.clear();
}

public void show(String type)//pick show based on type
{
  
   if(type.equals("Red-Gold"))
   {
     show("RG",0);
     
         
   }
   else if(type.equals("Red-Silver"))
   {
     show("RS",0);
       
   }
   else if(type.equals("Blue-Pink"))
   {
     show("BP",0);
       
   }
   else if(type.equals("Blue"))
   {
     show("B",0);
       
   }
   else if(type.equals("Purple"))
   {
     show("P",0);
       
   }
   else if(type.equals("Green-Yellow"))
   {
     show("GY",0);
       
   }
   else if(type.equals("Green"))
   {
     show("G",0);
       
   }
   
   
   else//(type.equals("Basic"))
    {
     show("GG",0);
      
     
    } 
  
  
}


public void cut(int newx, int newy)//add cut to draw
{
   Cut recent = new Cut(newx, newy, size/10);
   cuts.add(recent); 
}
  
public void Pressed(int px, int py)
{
   cut(px,py);
}

public void Reset()//clear cuts to draw in a different patterm
{ 
 cuts.clear();
background(0,0,0); 
}
public void Clear() {cuts.clear();}  
  
}

//draw buttons
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
public void pressed()//default definition
{
   if(type.equals("default"))
   {
     // for changing colors
     //return get(mouseX, mouseY);
   }
    
} 
public float getIH(){  return tall/numbuttons;}//get button height
public float getIW(){  return wide;}//get width


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
Console pattControl;//putton control
int margin = 15;
int siz = 200;
boolean display=true;
String rep="Basic";
Swatch square;//canvas
int wmid, hmid;
//edit box bounds
int upx, upy, downx, downy;
boolean showInstructions=true;

void setup()
{
 ellipseMode(CENTER);
 size(1080, 720);
 background(0,0,0);
  siz=width/8;
  hmid = siz*2;
  wmid=width/2;
  //drawing square, canvas style
  pushStyle();
    noFill();
    stroke(200,200,255);
    rectMode(CENTER);    
    upx=0; upy=0; downx=width; downy=height;
  popStyle();
 
// String [] names = {"Basic", "Red-Gold", "Red-Silver", "Green-Gold","New Pattern Section","Reset"};
 pattControl = new Console(names.length, names, margin);
 //drawing buttons
 pattControl.show(); 

 square = new Swatch(0, 0,width, height);
 
 //drawing canvas
 pushStyle();
   fill(255,255,255);
   square.show(rep);
 popStyle(); 

 
   //show instructions
   pushStyle();
   fill(50,120,255,160);
   rect(0, height-75, width, 50);
   fill(255,255,255,255);
   textAlign(LEFT,TOP);
   textSize(20);
   text("See how different patterns go together. Make a pattern palette and become more fashion adventurous with patterns! Press 's' to save.",0, height-75, width,50);
   popStyle();
 
 //load images
 GGimg = loadImage(GGtext);
 RGimg = loadImage(RGtext);
 RSimg = loadImage(RStext);
 Bimg = loadImage(Btext);
 Pimg = loadImage(Ptext);
 GYimg = loadImage(GYtext);
 Gimg = loadImage(Gtext);
 BPimg = loadImage(BPtext);

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
   fill(255,255,255,255);
   textAlign(LEFT,TOP);
   textSize(20);
   text("See how different patterns go together. Make a pattern palette and become more fashion adventurous with patterns! Press 's' to save.",0, height-75,width,50);
   popStyle();
}

 imageMode(CENTER);
    
  
}

void keyPressed()//save pattern without the UI
{
 if(key=='s' || key =='S')
 {
   display=false;
   showInstructions=false;
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
       else if(rep.equals("New Pattern Section"))
       {
         square.Clear();
         rep = prevrep;
         
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
    doCut();
     
     /*
     square.cut(width/2+((width/2)-mouseX), mouseY);
     square.cut(mouseX, hmid+(hmid-mouseY));
     square.cut( width/2+((width/2)-mouseX), hmid+(hmid-mouseY));
      */
  } 
}

}
void doCut(){
  
     int size= square.size/10;
     int posX= mouseX;
     int g=0;
     while(g<height+50)
     {
         square.cut(posX, g);
         console.log(size);
         g+=size;
     }
  
}

void mouseDragged()
{
  showInstructions=false;
 
     int oldx= pmouseX;
     int oldy= pmouseY;
  
if(mouseX>upx && mouseX<downx)
{
   if(mouseY>upy && mouseY<downy)
  {
     //println("edit box");
     int size= square.size;

     
     if(abs(oldx-mouseX)>square.size || abs(mouseX-oldx)>square.size)
     {
          oldx=mouseX;       
         doCut();
     
     }
     

  } 
}
  

  
  
}


 
 
 
 
 
 
 
  















