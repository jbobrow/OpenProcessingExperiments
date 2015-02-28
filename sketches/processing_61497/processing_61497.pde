
class floatingText
{
  String[] letters;
  int ssize;
  float[] yyy;
  float angle = 0.0;
  float hh=(TWO_PI / 100.0)*2;
   
  floatingText(String tempS, int tempSize)
  {
    letters = split(tempS, ',');
    yyy = new float[letters.length];
    ssize = tempSize;
  }
   
  void wave()
  {
    angle += 0.08;
     
    float h = angle;
    for(int i=0;i<yyy.length;i++)
    {
      yyy[i] = sin(h)*75;
      h+=hh;
    }
  }
   
  void display(int xx, int yy)
  {
    for(int i=0;i<letters.length;i++)
    {
      text(letters[i],xx+(i*(ssize-10)),yy+yyy[i]);
    }
  }
   
}

String message = "p,a,y, ,p,a,r,k,i,n,g, ,f,o,r, ,f,e,d,e,r,a,l, ,b,u,i,l,d,i,n,g, ,s,t,u,d,e,n,t,s, ,v,i,s,a, ,a,m,e,x,.,., ,a,p,a,r,t,m,e,n,t,f,i,n,d,e,r,.,.,., ,c,h,e,e,r,s, ,r,e,m,i,',s";
floatingText flText;
int txtSize = 40;
PFont font;
int x;
 
void setup(){
  size(640,480);
  frameRate(30);
  flText = new floatingText(message,txtSize);
  font = loadFont("Arial-Black-75.vlw");
  textFont(font,txtSize);
}
void draw(){
  background(5,123,100);
  x-=4;
  flText.wave();
  flText.display(640+x,height/2);
  if(x<-3500){
    x = 0;
  }
}


