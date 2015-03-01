
//Assignment 5c: Using â��ifâ�� and â��elseâ��, make the mouse perform different actions when in different parts of the canvas.
float col=0;

void setup(){
  size(400,300);
  
  background(0);
}

void draw()
{
  colorMode(HSB);
   
  fill(255);
  for(int i = 0; i < 400; i+=40)
  {
    rect(i,30,40,250);
  }
  
 
   if(mouseX<40)
  {
  fill(col,255,255);
    rect(0,30,40,250);
  }
   if(mouseX>40 && mouseX<80)
  {
    fill(col+20,255,255);
    rect(40,30,40,250);
  }
   if(mouseX>80 && mouseX<120)
  {
    fill(col+40,255,255);
    rect(80,30,40,250);
  }
   if(mouseX>120 && mouseX<160)
  {
   fill(col+60,255,255);
    rect(120,30,40,250);
  }
   if(mouseX>160 && mouseX<200)
  {
     fill(col+80,255,255);
    rect(160,30,40,250);
  }
   if(mouseX>200 && mouseX<240)
  {
   fill(col+100,255,255);
    rect(200,30,40,250);
  }
   if(mouseX>240 && mouseX<280)
  {
   fill(col+120,255,255);
    rect(240,30,40,250);
  }
   if(mouseX>280 && mouseX<320)
  {
    fill(col+140,255,255);
    rect(280,30,40,250);
  }
   if(mouseX>320 && mouseX<360)
  {
     fill(col+160,255,255);
    rect(320,30,40,250);
  }
    if(mouseX>360 && mouseX<400)
  {
  fill(col+180,255,255);
    rect(360,30,40,250);
  }
  
  fill(0);
  for(int x = 0; x < 400; x+=40)
  {
    rect(x+30,30,20,150);
  }
 
}


