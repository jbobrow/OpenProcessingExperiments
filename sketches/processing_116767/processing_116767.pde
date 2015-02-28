
/*Spil, lab et rumskib som bevæger sig ud fra mus
Der skal tilfældigvis komme bomber, hvis rumskibet bliver ramt skal det eksplodere
*/
//Variabler
float randomx = random(1,1280);
float randomx2  = random(1,1280);
float randomx3 = random(1,1280);
int position_firkant = 660;
float positiony = -100;
float positiony2 = 0;
float positiony3 = -50;
int fald = 4;
int tid = 0;
int balls;
int game_over = 0;

//Setup
void setup()
{
  size(1280,720);
  frameRate(60);
  textSize(32);
}

void draw()
{
  background(#ffffff);
  physics();
  fill(0,0,0);
    rect(position_firkant,690,50,30);
  noFill();
  tid++;
  if(game_over==0)
  {
    shower();
    shower_2();
    shower_3();
  }
  game_over();


}

void game_over()
{
  if(positiony > 695 && positiony <= 720 && randomx > position_firkant && randomx <= position_firkant+55)
  {
    game_over = 1;
  }
  if(positiony2 > 695 && positiony2 <= 720 && randomx2 > position_firkant && randomx2<= position_firkant+55)
  {
    game_over = 1;
  }
  if(positiony3 > 695 && positiony3 <= 720 && randomx3 > position_firkant && randomx3<= position_firkant+55)
  {
    game_over = 1;
  }
  if(game_over==1)
  {
     text("GAME OVER",100,50); 
     frameRate(1);
    }
}

void shower()
{
    fill(255,60,70);
      ellipse(randomx,positiony,10,10);
    noFill();
    positiony = positiony+fald;
    if (positiony > 720)
    {
    positiony= random(-300,-150);
    randomx = random(1,1280);
    fald = fald+2;
    }

}
void shower_2()
{
    fill(255,60,70);
      ellipse(randomx2,positiony2,10,10);
    noFill();
    positiony2 = positiony2+fald;
    if (positiony2 > 720)
    {
    randomx2 = random(1,1280);
    positiony2 = random(-500,-300);
    fald = fald+2;
    }

}
void shower_3()
{
    fill(255,60,70);
      ellipse(randomx3,positiony3,10,10);
    noFill();
    positiony3 = positiony3+fald;
    if (positiony3 > 720)
    {
    randomx3 = random(1,1280);
    positiony3 = random(-500,-300);
    fald = fald+2;
    }

}

void physics()
{
  
  if(fald>=20)
    {
      fald= 20;
    }
//Controls
  if(key == CODED)
{
    if(keyCode == LEFT && keyPressed==true)
    {
      position_firkant = position_firkant-10;
    }
    if(keyCode == RIGHT && keyPressed==true)
    {
      position_firkant = position_firkant +10;
    }

}
//Boundaries
  if(position_firkant<=0)
  {
    position_firkant = 0;
  }
  else if (position_firkant >= 1230)
  {
    position_firkant = 1230;
  }
  //reset
  if(key=='r' || key=='R')
  {
   game_over=0; 
   frameRate(60);
  }
}
