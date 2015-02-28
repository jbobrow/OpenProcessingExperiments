
int _numChildren = 2;
int _maxLevels = 11;
 
Branch _trunk;
PFont font;
 
void setup(){
  
 size(400,200);
 background(255);
 colorMode(HSB);
 noFill();
 smooth();
 newTree();
 font = createFont("Courier", 50);
  textFont(font);
  textAlign(CENTER, CENTER);
   
}
 
void newTree(){
  
 _trunk = new Branch(1,0,width/2,height/2);
 _trunk.drawMe();
   
}
 
void draw(){
   
  background(255);
  _trunk.updateMe(width/2,height/2);
  _trunk.drawMe();
  fill(150);
//  textFont(font, 18);
//  text("P.I.E ", width/4-20, height-20);
  textFont(font, 14);
  text("Prototyping Interactive Experiences", width/2+50, height-15);
}
 
class Branch{
  
 float level,index;
 float x = width/3;
 float y = height/3;
 float endx,endy;
 
 float strokeW,alph;
 float len,lenChange;
 float rot,rotChange;
  
  Branch[] children = new Branch[0];
  
 Branch(float lev,float ind,float ex,float why){
   
   level = lev;
   index = ind;
    
   strokeW = (1/level) * 5; //Level up to huto
   alph = 255/level;
   len = random(width)*(1/(level*8)); // Level up to short
    
   rot = random(360);
    
   lenChange = random(second()/10);
   rotChange = random(hour()/2);
    
   updateMe(ex,why);
    
    
   if(level < _maxLevels){
     
     children = new Branch[_numChildren];
      
     for(int x = 0 ; x < _numChildren; x++)
     {
        children[x] = new Branch(level+1,x,endx,endy);
     }
      
   }
 }
  
 void updateMe(float ex,float why){
   
  x += (ex - x) / (4.);
  y += (why - y) / (4.);
    
  rot += rotChange;
  rot %= 360;
  
  len -=lenChange;
 
  if(len < 0){lenChange *= -1;}
  else if(len > width/8){lenChange *= -1;}
   
  float radian = radians(rot);
  endx = x + (len * cos(radian));
  endy = y + (len * sin(radian));
     
  for(int i = 0 ; i < children.length; i++)
  {
     children[i].updateMe(endx,endy);
  }
 }
  
 void drawMe(){
   
  if(level > 1){
    
    strokeWeight(strokeW);
    stroke(0,alph);
    line(x,y,endx,endy);
     
    fill((255 / _maxLevels * level),255,255,alph);
     
    noStroke();
    //ellipse(endx,endy,len/12,len/12);
    
  }
   
  for(int i = 0 ; i < children.length;i++)
  {
     children[i].drawMe();
  }
    
 }
   
}


