
int h = #271604;
int s = #FFCB93;
int k=2;
int x=600/k;
int y=x;
int c=y/3;
int cu=c/k;
int r=cu/k;
int d=c/10;
int g=d/k;


void setup()
{
  size(600, 600); 
  
}

void draw()
{
  smooth();
  noStroke();
  //hair
  fill(h);
   ellipse(x,y,cu,c);
   //face
  fill(s);
   ellipse(x,y+d,cu,c-d);
   //ear
   fill(s);
   ellipse(x-d,y+d,cu,cu-d);
   //ear creases
   stroke(k-k); 
   curve(x+d, y-d-g, x-r, y-k, x-r, y+d+d, x+d, y+d);
   //ear
   noStroke();
   fill(s);
   ellipse(x+d,y+d,cu,cu-d);
   //ear creases
   stroke(c-c); 
   curve(x-10, y-15, x+25, y-2, x+25, y+20, x-10, y-10);
   //glasses
   line(x-15, y+5, x-24, y-7);
   line(x+13, y+5, x+24, y-7);
   ellipse(x-10,y+10,15,15);
   ellipse(x+10,y+10,15,15);
   line(x-5, y+5, x+5, y+5);
   //nose
   curve(x+20, y, x, y+25, x, y+5, x, y);
   //eyes
   fill(0);
   ellipse(x-10,y+10,5,5);
   ellipse(x+10,y+10,5,5);
   //mustache
   fill(h);
   curve(x-200, y-30, x, y+25, x, y+25, x+200, y-30);
   //smiling mouth
   stroke(0);
   fill(255);
   curve(x-8, y+5, x-8, y+35, x+8, y+35, x+8, y+5);
   //Neck
   fill(s);
   noStroke();
   rect(x-10, y+52, 20, 10);
   //arms
   fill(0, 0, 150);
   stroke(0);
   ellipse (x-2, y+120, 90, 125);
   //shirt body
   fill(0, 0, 255);
   ellipse (x-2, y+120, 60, 125);
   //open top of shirt
   fill(s);
   noStroke();
   triangle(x-10, y+50, x+10, y+50, x, y+100);
   fill(0,0,150);
   triangle(x-10, y+50, x-20, y+70, x, y+100);
   triangle(x+10, y+50, x+20, y+70, x, y+100);
   //shirt opening
   stroke(0);
   line(x-1, y+100, x-1, y+180);
   //buttons
   fill(255,255,255);
   ellipse(x,y+102,5,5);
   ellipse(x,y+110,5,5);
   ellipse(x,y+118,5,5);
   ellipse(x,y+126,5,5);
   ellipse(x,y+134,5,5);
   ellipse(x,y+142,5,5);
   ellipse(x,y+150,5,5);
   ellipse(x,y+158,5,5);
   ellipse(x,y+166,5,5);
   ellipse(x,y+174,5,5);
   
 if(mouseX > 130 && mouseX <400)
  {
    if(mouseY > 120 && mouseY < 320)
    {
       fill(255,0,0);
       ellipse(x-10,y+10,5,5);
       ellipse(x+10,y+10,5,5);
       link("http://ronaldcowles.com");
    }
  }
  
}



