
//section get
//owaun scantlebury
//June 16th 2011

int w = 255;
int h = 255;

void setup(){
size(255,255);  
background(-1);
placex=int(random(25,w-25));
placey=int(random(25,h-25));
}

int placex;
int placey;
boolean animate= false;
void keyPressed(){
 if(key=='a')animate=!animate; 
}
String [] tune = {"top left","top right","bottom right","bottom left"};
void draw(){
  
  if (!mousePressed && animate){
    bounce(true,3,1,5);
  placex=px;
  placey=py;
  }
  else
  {
   px=placex; 
   py=placey;
  }
  if(mousePressed){
    placex=mouseX;
  placey=mouseY;
   px=placex;
   py=placey;
    
  }
// if(!animate)
//  {
//    placex=mouseX;
//    placey=mouseY;
//    px=placex;
//    py=placey;
//  }
  
 fill(-1);
 rect(0,0,w,h);
 // background(-1);
  String where  = jail(mouseX,mouseY,placex,placey); 
  line(0,placey,w,placey);
  line(placex,0,placex,h);
  fill(255,0,0);
  if(where==tune[1])rect(placex,0,w-placex,placey); //rop right
  if(where ==tune[2])rect(placex,placey,w-placex,h-placey); //bottom right
  if(where==tune[3])rect(0,placey,placex,h-placey); //bottom left
  if(where==tune[0])rect(0,0,placex,placey); //top left
}



String jail(float x,float y,float mx,float my){
  if(mx%.5!=0)mx = mx-.5;
  if(my%.5!=0)my = my - .5;
  String retval = "";
  if (x > mx && y< my)retval = tune[1]; // "top right";
 if( x < mx &&y< my)retval = tune[0];//"top left";
if (x > mx && y> my)retval = tune[2]; //"bottom right";
if(x<mx &&y> my)retval = tune[3]; //"bottom left";
  
  
 return retval; 
}

void circle(float startx,float starty, float angle,float distance,float [] _carx,float [] _cary){

  float endx = startx + cos(angle) * distance;
  float endy = starty + sin(angle) * distance;
  
}

public boolean forward = true;
public boolean up = false;
public int px=0;
public int py =0;
public int ly=0;
public int lx=0;
void bounce(boolean rnd, int by, int lo, int hi){
 if (forward){
  if (rnd)px+=random(lo,hi);
   if (!rnd){
    px+=by;
   }
 }
  
  
   if (!forward){
     if(rnd)px-=random(lo,hi); 
     if (!rnd){
      px-=by;
     }
     }
    
   if (up){
    if (rnd)py-=random(lo,hi*2);
     if (!rnd){
       py+=by;
     }
     }
      
     if (!up){
      if(rnd)py+=random(lo,hi*2);
     if (!rnd){
       py-=by;
     } 
        
     }
    
    
   if (px>width)
     {
        
       forward = false;
        
     }
      
    
   if (px<0)    forward = true;
   if (py>height)up     = true;
   if (py<0     )up     = false;
  } 
                
