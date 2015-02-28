
ArrayList<Integer> posx;
ArrayList<Integer> posy;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
ArrayList<Integer>count1; 
ArrayList<Integer>count2;
boolean Start = false;
boolean End = false;
int i;
int r;
int x = 0;
int count = 0;
int score = 0;
int q;
int w;
int p;
int z; 
int e;



void setup()

{
  count = 0;
  score = 0;
  z = int(random(-5,5));
  e = int(random(-5,5));
  q = int(random(width)); 
  w = int(random(height));
  r = 500;
  size(1500,1000);
  smooth();
  background(0);
  posx = new ArrayList<Integer>();
  posy = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
  count1 = new ArrayList<Integer>();
  count2 = new ArrayList<Integer>();
  xvelocity.add(0,0);
  yvelocity.add(0,0);
  i = 750;
  posx.add(0,i);
  posy.add(0,r);
}

  
void draw()
{
  x = posx.size();
  background(0);
  fill(255);
  ellipse(mouseX,mouseY,25,25); 
  fill(255);
  textSize(24);
  text("Score:",10,20);
  text(score,20,40);
  fill(255);
  text("AVOID THE SQUARES!",750,20);
    
 { 
   count++;
   if(count == 55)
   {
     for (int i = 0; i < posx.size() ; i++)
     {
      posx.set(i,posx.get(i)+xvelocity.get(i));
      posy.set(i,posy.get(i)+yvelocity.get(i));
    
      if (posx.get(i) > width)
      {
        posy.set(i,0);
        xvelocity.set(i,1);
        yvelocity.set(i,1);
        
      }
      if (posy.get(i) < 0)
      {
        posy.set(i,height);
        xvelocity.set(i,1);
        yvelocity.set(i,1);
      }
      if (posx.get(i) < 0)
      {
        posx.set(i,width);
        xvelocity.set(i,1);
        yvelocity.set(i,1);
      }
      if (posy.get(i) > width)
      {
        posy.set(i,0);
        xvelocity.set(i,1);
        yvelocity.set(i,1);
      }
       
         posx.get(i);
         fill(random(255),random(255),random(255));
         rect(random(q),random(w),25,25);
         count = 0;
         score++;
         count1.add(i,int(random(width)));
         count2.add(i,int(random(height)));
         xvelocity.add(0,z);
         yvelocity.add(0,e);
       }
   }
     for (int p = 0; p < count1.size() ; p++)
     {
       rect(count1.get(p),count2.get(p),25,25);
       xvelocity.set(0,z);
       yvelocity.set(0,e);
     }
     if (posx.get(p) == mouseX)
     {
       exit();
       fill(255);
       textSize(50);
       text("Game Over",750,500);  
   }
 }
}
