
PImage saddog;PImage frog; int time = 0; pFont ser; pFont tek; pFont sten; pFont snap; pFont cur;
int x = 0; int x2= -300; int sw = 100; int hw = 50; float rw= 1.0; int xw = 0; int yw = 0;
char  a = 'P'; char b = 'a'; char c = 's';char d ='s'; char e= 'i'; char f = 'o'; char g = 'n'; char h ='a'; char i ='t'; char j='e';
char k = 'S'; char l= 'l'; char m = 'c'; char n= 't'; char o= 'v'; char p = 'r';
void setup() {
  size(800, 525);
  //String[] fontList = PFont.list();
  //println(fontList);
  saddog = loadImage("Saddog.jpg");
  frog = loadImage("Sgt.jpg");

  textAlign(LEFT, CENTER);
  ser = createFont("serif", 50);
  cur = createFont("cursive", 100);
  tek = loadFont("Tekt.vlw",48);
  sten = loadFont("Sten.vlw",300);
  snap = loadFont("Snap.vlw",100);

  
// text("Withdrawn", -1.5, 0, 50);
  //("Angry", 2.3, 0, 100);
  //("Mean", -3, 0, 150);
}

void draw() 
{
  color c2 = #336699;
  color c1 = #CC0000;
  color c3 = #003366;
  color c4 = #0000FF;
  fill(c2);
 
 
  /*{
      text("Withdrawn", 10, 10);
      text("Angry", 2.3, 200);
      text("Stern", -3,300);
      time++;
  }*/
  if (time < 1000)
  {
    time++;
   
    
   if (time <=600)
  {
    image(saddog, 0, 0);
    
    textFont(sten);
    //textSize(300); 
    text("STOIC", x2,300);
    textFont(ser,100);
    fill(c3);
    text("Stern", 100 , x);  
    x++;x2++;

  }
    if (time < 110)
  {
    textSize(sw);
    text("Withdrawn", 500, 300);
    sw--;
  }
  if (time < 500)
  {
    textSize(100);
    fill(c1);
    text("Angry", random(700), random(400));
  }
    if (time > 599)
  {
   image(frog, 0, 0);
   
  }
  if (time >= 605 && time < 640)
  {
    
     textSize(hw);
     text("Honest", 300, 300);
     hw++;
  }
   if (time > 620)
  {
    textFont(snap,100);
    if (second() %2 == 0)
    {
    text(k,100,400);text(l,200,400);text(m,260,400);text(e,330,400);text(j,430,400);
    }
    if (second() %2 ==1)
    {
    text(j,140,400);text(j,220,400);text(n,280,400);text(o,380,400);
    }
  }
  if (time > 650)
  {
    fill(255);
    textAlign(BOTTOM);
    text("Perfectionist",xw,yw);
    xw++;yw++;
  }
  if (time > 650)
  {
    textSize(80);
    fill(c4);
    text(k,480,20 + yw);text(b,520,40 + yw);text(p,560,60 + yw);text(m,600,80 + yw);text(b,640,100 + yw);text(c,680,120 + yw);text(n,720,140 + yw);text(e,760,160 + yw);text(m,780,180 + yw);
  }
    if (time > 605)
  {
    textFont(cur,100);
    fill(c2);
    rotate(PI/rw);
    text(a,100,100);text(b,140,100);text(c,180,100);text(d,220,100);text(e,260,100);text(f,280,100);text(g,330,100);text(h,380,100);text(i,430,100); text(j,460,100);
    rw++;
     println(rw);
  }

  }

}


