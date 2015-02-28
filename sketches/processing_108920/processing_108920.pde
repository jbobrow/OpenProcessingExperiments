
int extend;

void setup()
{
  size(800, 600);
  colorMode(HSB);
  frameRate(1);
  stroke(255);
  strokeWeight(4);
  smooth();
  thing();
}

void draw(){ 
}

void textthis(String s)
{
  PFont shit = createFont("Monospaced", 8);
  textFont(shit);
  //textAlign(CENTER, CENTER);
  fill(255);
  text(s, 10, 60, 15+extend, 65);
}

void thing()
{
  background(random(0, 255), 50, 250);
  int count = 0;
  extend = 0;
  for (int i = 0; i < 801; i+=50+extend) {
    for (int j = 0; j < 601; j+=75) {
      pushMatrix();
      translate(i+count, j);

      //credits to Dave Yan for helping me figure out 2^10
      int r1 = int(random(0, 2));
      int r2 = int(random(0, 2));
      int r3 = int(random(0, 2));
      int r4 = int(random(0, 2));
      int r5 = int(random(0, 2));
      int r6 = int(random(0, 2)); //swear words
      int r7 = int(random(0, 2));
      int r8 = int(random(0, 2));
      int r9 = int(random(0, 2));
      int r10 = int(random(0,2));

      if (r1 == 1) line(0, 0, 0, 25);
      if (r2 == 1) line(0, 25, 0, 50);
      if (r3 == 1) line(0, 25, 25+extend, 25);
      if (r4 == 1) line(25+extend, 25, 25+extend, 50);
      if (r5 == 1) line(25+extend, 50, 25+extend, 75);
      if (r6 == 1 && i >= 100)
      {
        int swear = int(random(0, 26));
        switch(swear) {
        case 0:
          textthis("ass");
          break;
        case 1:
          textthis("bitch");
          break;
        case 2:
          textthis("cock");
          break;
        case 3:
          textthis("dumb");
          break;
        case 4:
          textthis("<3");
          break;
        case 5: 
          textthis("fucker");
          break;
        case 6:
          textthis("gay");
          break;
        case 7:
          textthis("ho");
          break;
        case 8:
          textthis("idiot");
          break;
        case 9:
          textthis("jerk");
          break;
        case 10:
          textthis("knocker");
          break;
        case 11:
          textthis("lame");
          break;
        case 12:
          textthis("mofo");
          break;
        case 13:
          textthis("nigga");
          break;
        case 14:
          textthis("obama");
          break;
        case 15:
          textthis("prick");
          break;
        case 16:
          textthis("quim");
          break;
        case 17:
          textthis("retard");
          break;
        case 18:
          textthis("shit");
          break;
        case 19:
          textthis("twat");
          break;
        case 20:
          textthis("<3");
          break;
        case 21:
          textthis("vag");
          break;
        case 22:
          textthis("whore");
          break;
        case 23:
          textthis("<3");
          break;
        case 24:
          textthis("<3");
          break;
        case 25:
          textthis("<3");
          break;
        }
      }
      if(r7 == 1) line(0, 0, 25+extend, 0);
      if(r8 == 1) line(25+extend, 0, 50+extend, 0);
      if(r9 == 1) line(0, 50, 25+extend, 50);
      if(r10== 1) line(25+extend, 50, 50+extend, 50);
      
      popMatrix();

      count+=25+extend;
    }
    extend+=5;
    count = 0;
  }
}


void mouseClicked()
{
  thing();
}

