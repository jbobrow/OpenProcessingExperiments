
// Caprice
ArrayList fontList;
int[] fonts = new int[7];
int[] sizes = new int[7];

PFont academy;
PFont caslon;
PFont cooper;
PFont didot;
PFont futura;
PFont georgia;
PFont giddyup;
PFont lithos;
PFont offthedrugs;
PFont heiti;
PFont synchro;
PFont wingdings;
PFont xirod;

String myText;
float posx = 320;
float posy = 180;
float angle = 0;
float speed = 5;
int avgSize = 36;

int timer = 0;
int stateTimer = 0;
int maxStateTimer = 0;

final int STATE_IDLE = 0;
final int STATE_RANDOM = 1;
final int STATE_FOLLOW = 2;
final int STATE_ESCAPE = 3;
final int STATE_HIDE = 4;

final int FONTSTATE_STATIC = 0;
final int FONTSTATE_CHANGING = 1;
final int FONTSTATE_SINGLECHANGE = 2;

int state = 0;
int fontState = FONTSTATE_CHANGING;

void setup()
{
  size(640, 480);
  frameRate(60);
  
  fontList = new ArrayList();
  
  caslon = createFont("BigCaslon.ttf", 24);
  cooper = createFont("CooperBlackStd.otf", 24);
  didot = createFont("Didot.ttc", 24);
  futura = createFont("Futura.ttc", 24);
  georgia = createFont("Georgia Bold Italic.ttf", 24);
  giddyup = createFont("GiddyupStd.otf", 24);
  lithos = createFont("LithosPro-Black.otf", 24);
  offthedrugs = createFont("offthedrugs.ttf", 24);
  heiti = createFont("STHeiti Medium.ttc", 24);
  synchro = createFont("Synchro LET Fonts", 24);
  xirod = createFont("xirod.ttf", 24);
  
  fontList.add(caslon);
  fontList.add(cooper);
  fontList.add(didot);
  fontList.add(futura);
  fontList.add(georgia);
  fontList.add(giddyup);
  fontList.add(lithos);
  fontList.add(offthedrugs);
  fontList.add(heiti);
  fontList.add(synchro);
  fontList.add(xirod);
  
  textFont(futura);
  
  background(200, 240, 245);
  
  myText = "CAPRICE";
  
  SetFonts();
  
  //noCursor();
  
  maxStateTimer = int(random(0, 300));
  
  fill(0);
}

void draw()
{
  timer++;
  stateTimer++;
  
  if(timer >= 5)
  {
    timer = 0;
    SetFonts();
  }
  
  background(245, 245, 245);
  
  switch(state)
  {
    case STATE_IDLE:
      pushMatrix();
      translate(posx, posy);
      rotate(angle);
      DrawText();
      popMatrix();
      break;
    case STATE_RANDOM:
      pushMatrix();
      angle += random(-0.03, 0.03);
      posx += random(-1, 1);
      posy += random(-1, 1);
      avgSize += int(random(-4, 4));
      translate(posx, posy);
      rotate(angle);
      DrawText();
      popMatrix();
      break;
    case STATE_FOLLOW:
      pushMatrix();
      PVector dir = new PVector(mouseX - posx, mouseY - posy);
      
      if(dir.mag() < speed)
      {
        posx = mouseX;
        posy = mouseY;
      }
      else
      {
        dir.normalize();
        posx += dir.x * speed;
        posy += dir.y * speed;
      }
      translate(posx, posy);
      rotate(angle);
      DrawText();
      popMatrix();
      break;
    case STATE_ESCAPE:
      if(dist(mouseX, mouseY, posx, posy) < 180)
      {
        PVector dir2 = new PVector(mouseX - posx, mouseY - posy);
        
        dir2.normalize();
        posx -= dir2.x * speed;
        posy -= dir2.y * speed;
      }
      pushMatrix();
      translate(posx, posy);
      rotate(angle);
      DrawText();
      popMatrix();
      break;
    case STATE_HIDE:
      posx = random(100, 540);
      posy = random(100, 380);
      angle = random(0, 360) * PI / 180;
      avgSize = int(random(28, 108));
      break;
  }
  
  if(stateTimer >= maxStateTimer)
  {
    state = int(random(0, 5));
    stateTimer = 0;
    maxStateTimer = int(random(0, 300));
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  }
}

void SetFonts()
{
  for(int i = 0; i < myText.length(); i++)
  {
    fonts[i] = int(random(0, 11));
    sizes[i] = int(random(avgSize - 12, avgSize + 12));
  }
}

void DrawText()
{
  float modx = 0;
  for(int i = 0; i < myText.length(); i++)
  {
    textFont((PFont)fontList.get(fonts[i]));
    textSize(sizes[i]);
    text(myText.charAt(i), modx, 0);
    modx += textWidth(myText.charAt(i));
  }
}

