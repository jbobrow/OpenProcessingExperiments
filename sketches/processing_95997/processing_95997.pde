
float spawntimer;
boolean resetTimerOnZero = false;
ArrayList deadguys;

void setup()
{
  size(500,200);
  background(0);
  fill(255);
  deadguys = new ArrayList();
  PFont fontA = loadFont("courier");
  textFont(fontA, 14);  
  frameRate(10);
}

void draw(){  
  background(0);
  fill(150,180,255);
  text("spawn timer:",20,20);
  fill(0,255,0);
  text(spawntimer,120,20);
  fill(150,180,255);
  text("press 1 to add a light (3 secs)",40,45);
  text("press 2 to add a medium (4 secs)",40,60);
  text("press 3 to add a heavy (6 secs)",40,75);
  text("press R to toggle spawn timer rollover",40,90);   fill(0,255,0); text(resetTimerOnZero,360,70);
  fill(150,180,255);
  text("press 4 to reset the timer",40,105);

  for (int i = deadguys.size()-1; i >= 0; i--) { 
    int deadnum = deadguys.get(i);
    textSize(12+2*deadnum);
    String classtype = "";
    if(deadnum == 1) {classtype = "L"; fill(200,70,40);}
    if(deadnum == 2) {classtype = "M"; fill(230,50,25);}
    if(deadnum == 3) {classtype = "H"; fill(255,0,0);}
    text(classtype, 20 + i*15, 150);
  }
    
  spawntimer -= 0.1;
  
  if(spawntimer <= 0 )
  {
    if( resetTimerOnZero )
      spawntimer = 15;
    else
      spawntimer = 0;
      
      for (int i = deadguys.size()-1; i >= 0; i--) { 
        deadguys.remove(i);
        spawntimer = 15;
      }
  }
}

void keyPressed() {
    if (key == '1') {
      spawntimer += 3.0; 
      deadguys.add(1);
    } else if (key == '2') {
      spawntimer += 4.0;
      deadguys.add(2);
    } else if (key == '3') {
      spawntimer += 6.0;
      deadguys.add(3);
    } else if (key == '4') {
      spawntimer = 0.0;
      for (int i = deadguys.size()-1; i >= 0; i--) { 
        deadguys.remove(i);
      }
    }else if (key == 'r' || key == 'R' ) {
      resetTimerOnZero = !resetTimerOnZero;
    }
  
}
