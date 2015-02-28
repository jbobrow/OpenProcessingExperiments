
int startSEC, startMIN, startTOT;
int stopSEC, stopMIN, stopTOT;
int min, sec;
PFont font10;
PFont font20;
boolean start = false;
int rectx=200;
int recty=150;
int rectw=50;
int recth=20;


void setup()
{
  font10 = loadFont("Ebrima-10.vlw"); 
  font20 = loadFont("Ebrima-20.vlw"); 

size(600,480);

}

void draw()
{

buttons();
if(mousePressed && buttonSTART())
{
 startSEC=second();
 startMIN = minute();
 startTOT = startMIN*60 + startSEC;
 start = true;
}

if(mousePressed && buttonSTOP())
{
start = false;
}

if(mousePressed && buttonRESET())
{
  
 min = 0;
 sec = 0; 

}

time();
stopwatch();
}

void buttons()
{
fill(6,203,27);  
rect(rectx,recty,rectw,recth); 
fill(250,0,17);  
rect(rectx+100,recty,rectw,recth);
fill(250,122,30);  
rect(rectx+200,recty,rectw,recth);

fill(0);
    textFont(font10);
    text("START", rectx+25,recty+10);
    text("STOP", rectx+125,recty+10);
    text("RESET", rectx+225,recty+10);
    textAlign(CENTER);
}

void time()
{
  if(start)
{
  stopMIN = minute();
  stopSEC = second();
  
  stopTOT = stopMIN*60 + stopSEC;

  int diff = stopTOT-startTOT;
min = diff/60;
sec = diff - min*60;
}
}
void stopwatch()
{
 stroke(0);
    fill(255,255,255);
  rect(rectx+60,recty-100,rectw+50,recth+40);   
fill(0);
textFont(font20);
textAlign(CENTER);
text(nf(min,2)+":"+nf(sec,2),rectx+110,recty-62);
} 

boolean buttonSTART()
 {
  if(mouseX > rectx && mouseX < rectx+50 && mouseY > recty && mouseY < recty+20) 
  return true;
else return false;

}

boolean buttonSTOP()
{
if(mouseX > rectx+100 &&  mouseX < rectx+150 && mouseY > recty && mouseY < recty+20) 
return true;
else return false;
}

boolean buttonRESET()
{
if(mouseX > rectx+200 && mouseX < rectx+250 && mouseY > recty && mouseY < recty+20) 
return true;
else return false;
}



