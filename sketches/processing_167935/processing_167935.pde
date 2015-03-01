
PImage angerimpact;
PImage buddhasABro;
PImage spriteSheet;
int pumaManX=0;
int pumaManY=490;
int spriteSheetX=0;
int spriteSheetY=0;
int speed=20;
int questionX;
int questionGenerator;
int timer=0;
int colorCreator=0;
int countdown;
int victoryCount=0;
char[] question;
boolean failTrigger;
boolean next;
boolean proximityTrigger;
void setup()
{
  size(970,540);
  failtrigger=false;
  next=false;
  angerimpact=loadImage("angerimpact.png");
  buddhasABro=loadImage("buddhasABro.jpg");
  spriteSheet=loadImage("download.png");
  question=new char[5];
  question[0]="Q";
  question[1]="Z";
  question[2]="M";
  question[3]="P";
  question[4]="Y";
  questionX=random(870);
  questionGenerator=int(random(5));
  proximityTrigger=false;
  
}

void draw()
{
  if(questionX+136>pumaManX&&questionX-40<pumaManX)
    proximityTrigger=true;
  pushMatrix();
  scale(2.25, 2);
  image(buddhasABro,0,0);
  popMatrix();
 
  fill(0);
  rect(pumaManX,pumaManY,50,50);
  copy(spriteSheet,0,0,59,59,pumaManX,pumaManY,59,59);
  fill(0+colorCreator,240-colorCreator,0);
  textSize(96);
  if(!failTrigger&&victoryCount<3)
    text(question[questionGenerator],questionX,400+random(5));
  timer++;
  if(colorCreator<240&&timer==5)
  {
    colorCreator+=2;
    timer=0;
  }
  if(colorCreator==240&&victoryCount<3)
    failTrigger=true;
  if(!failTrigger)
  {
  if(keyPressed&&proximityTrigger)
  {
    if((key=='q'||key=='Q')&&questionGenerator==0)
    {
      questionX=random(870);
      questionGenerator=int(random(5));
      victoryCount++;
    }
    if((key=='z'||key=='Z')&&questionGenerator==1)
     {
      questionX=random(870);
      questionGenerator=int(random(5));
      victoryCount++;
    }
    if((key=='m'||key=='M')&&questionGenerator==2)
     {
      questionX=random(870);
      questionGenerator=int(random(5));
      victoryCount++;
    }
    if((key=='p'||key=='P')&&questionGenerator==3)
     {
      questionX=random(870);
      questionGenerator=int(random(5));
      victoryCount++;
    }
    if((key=='y'||key=='Y')&&questionGenerator==4)
     {
      questionX=random(870);
      questionGenerator=int(random(5));
      victoryCount++;
    }
  }
  }
  else{  
         pushMatrix();
         scale(0.4, 0.4);
         if(pumaManX>450)
          {
              scale(-1, 1);
              image(angerimpact,-1050-angerimpact.width,500);
          } else image(angerimpact,1050,500);
         popMatrix(); 
        text("Failure",330,150);
        
      }
  if(victoryCount==3)
  {
    fill(0,240,0);
    text("Victory!",330,150);
  }
  
}

void keyPressed() {

  if (key == CODED) {

    if (keyCode == RIGHT) 
    {

      pumaManX += speed;
    } else if (keyCode == LEFT) 
    {

      pumaManX -= speed;
    }

  }
  

}


