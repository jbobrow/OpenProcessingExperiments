
Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;

int i,j;
boolean[] check;
boolean play;
int x;
PImage imgtom,imgsnare,imgride,imgkick,imghihat,imgcrash,imgplay,imgspeed;

void setup()
{
  imgtom = loadImage("tom.jpg");
  imgsnare = loadImage("snare.jpg");
  imgride = loadImage("ride.jpg");
  imgkick = loadImage("kick.jpg");
  imghihat = loadImage("hihat.jpg");
  imgcrash = loadImage("crash.jpg");
  imgplay = loadImage("play.jpg");
  imgspeed = loadImage("speed.jpg");
  check = new boolean[53];
  for(i=0;i<53;i++)
  {  
    check[i] = false;
  }
  play= false;
  maxim = new Maxim(this);
  player1 = maxim.loadFile("tomlow.wav");
  player1.setLooping(false);
  player1.volume(1.0);
  player2 = maxim.loadFile("snare.wav");
  player2.setLooping(false);
  player2.volume(1.0);
  player3 = maxim.loadFile("ride.wav");
  player3.setLooping(false);
  player3.volume(1.0);
  player4 = maxim.loadFile("kick.wav");
  player4.setLooping(false);
  player4.volume(1.0);
  player5 = maxim.loadFile("hihat.wav");
  player5.setLooping(false);
  player5.volume(1.0);
  player6 = maxim.loadFile("crash.wav");
  player6.setLooping(false);
  player6.volume(1.0);
  background(255);
  size(600,560);
  x=500;
  
  
}

void draw()
{
  image(imgtom,0,0,100,50);
  image(imgsnare,0,55,100,50);
  image(imgride,0,110,100,50);
  image(imgkick,0,165,100,50);
  image(imghihat,0,220,100,50);
  image(imgcrash,0,275,100,50);
  image(imgplay,275,375,100,50);
  image(imgspeed,5,465,590,90);

  fill(0);
  for(i=105;i<550;i+=55)
  {
    for(j=0;j<280;j+=55)
    {
    rect(i,j,50,50);
    }
  }
  
  if(check[0])
  {
    fill(255);
    rect(110,5,40,40);
  }
  else
  {
    fill(0);
    rect(110,5,40,40);
  }
  
  if(check[1])
  {
    fill(255);
    rect(165,5,40,40);
  }
  else
  {
    fill(0);
    rect(165,5,40,40);
  }
  
  if(check[2])
  {
    fill(255);
    rect(220,5,40,40);
  }
  else
  {
    fill(0);
    rect(220,5,40,40);
  }
  
  if(check[3])
  {
    fill(255);
    rect(275,5,40,40);
  }
  else
  {
    fill(0);
    rect(275,5,40,40);
  }
  
  if(check[4])
  {
    fill(255);
    rect(330,5,40,40);
  }
  else
  {
    fill(0);
    rect(330,5,40,40);
  }
  
  
  if(check[5])
  {
    fill(255);
    rect(385,5,40,40);
  }
  else
  {
    fill(0);
    rect(385,5,40,40);
  }
  
  
  if(check[6])
  {
    fill(255);
    rect(440,5,40,40);
  }
  else
  {
    fill(0);
    rect(440,5,40,40);
  }
  
  if(check[7])
  {
    fill(255);
    rect(495,5,40,40);
  }
  else
  {
    fill(0);
    rect(495,5,40,40);
  }
  
  if(check[8])
  {
    fill(255);
    rect(550,5,40,40);
  }
  else
  {
    fill(0);
    rect(550,5,40,40);
  }
  
  
  
  // 2nd row
  
  
    if(check[9])
  {
    fill(255);
    rect(110,60,40,40);
  }
  else
  {
    fill(0);
    rect(110,60,40,40);
  }
  
  if(check[10])
  {
    fill(255);
    rect(165,60,40,40);
  }
  else
  {
    fill(0);
    rect(165,60,40,40);
  }
  
  if(check[11])
  {
    fill(255);
    rect(220,60,40,40);
  }
  else
  {
    fill(0);
    rect(220,60,40,40);
  }
  
  if(check[12])
  {
    fill(255);
    rect(275,60,40,40);
  }
  else
  {
    fill(0);
    rect(275,60,40,40);
  }
  
  if(check[13])
  {
    fill(255);
    rect(330,60,40,40);
  }
  else
  {
    fill(0);
    rect(330,60,40,40);
  }
  
  
  if(check[14])
  {
    fill(255);
    rect(385,60,40,40);
  }
  else
  {
    fill(0);
    rect(385,60,40,40);
  }
  
  
  if(check[15])
  {
    fill(255);
    rect(440,60,40,40);
  }
  else
  {
    fill(0);
    rect(440,60,40,40);
  }
  
  if(check[16])
  {
    fill(255);
    rect(495,60,40,40);
  }
  else
  {
    fill(0);
    rect(495,60,40,40);
  }
  
  if(check[17])
  {
    fill(255);
    rect(550,60,40,40);
  }
  else
  {
    fill(0);
    rect(550,60,40,40);
  }
  
  
  // 3rd row
  
  
  if(check[18])
  {
    fill(255);
    rect(110,115,40,40);
  }
  else
  {
    fill(0);
    rect(110,115,40,40);
  }
  
  if(check[19])
  {
    fill(255);
    rect(165,115,40,40);
  }
  else
  {
    fill(0);
    rect(165,115,40,40);
  }
  
  if(check[20])
  {
    fill(255);
    rect(220,115,40,40);
  }
  else
  {
    fill(0);
    rect(220,115,40,40);
  }
  
  if(check[21])
  {
    fill(255);
    rect(275,115,40,40);
  }
  else
  {
    fill(0);
    rect(275,115,40,40);
  }
  
  if(check[22])
  {
    fill(255);
    rect(330,115,40,40);
  }
  else
  {
    fill(0);
    rect(330,115,40,40);
  }
  
  
  if(check[23])
  {
    fill(255);
    rect(385,115,40,40);
  }
  else
  {
    fill(0);
    rect(385,115,40,40);
  }
  
  
  if(check[24])
  {
    fill(255);
    rect(440,115,40,40);
  }
  else
  {
    fill(0);
    rect(440,115,40,40);
  }
  
  if(check[25])
  {
    fill(255);
    rect(495,115,40,40);
  }
  else
  {
    fill(0);
    rect(495,115,40,40);
  }
  
  if(check[26])
  {
    fill(255);
    rect(550,115,40,40);
  }
  else
  {
    fill(0);
    rect(550,115,40,40);
  }
  
  
  // 4th row
  
  
  
    if(check[27])
  {
    fill(255);
    rect(110,170,40,40);
  }
  else
  {
    fill(0);
    rect(110,170,40,40);
  }
  
  if(check[28])
  {
    fill(255);
    rect(165,170,40,40);
  }
  else
  {
    fill(0);
    rect(165,170,40,40);
  }
  
  if(check[29])
  {
    fill(255);
    rect(220,170,40,40);
  }
  else
  {
    fill(0);
    rect(220,170,40,40);
  }
  
  if(check[30])
  {
    fill(255);
    rect(275,170,40,40);
  }
  else
  {
    fill(0);
    rect(275,170,40,40);
  }
  
  if(check[31])
  {
    fill(255);
    rect(330,170,40,40);
  }
  else
  {
    fill(0);
    rect(330,170,40,40);
  }
  
  
  if(check[32])
  {
    fill(255);
    rect(385,170,40,40);
  }
  else
  {
    fill(0);
    rect(385,170,40,40);
  }
  
  
  if(check[33])
  {
    fill(255);
    rect(440,170,40,40);
  }
  else
  {
    fill(0);
    rect(440,170,40,40);
  }
  
  if(check[34])
  {
    fill(255);
    rect(495,170,40,40);
  }
  else
  {
    fill(0);
    rect(495,170,40,40);
  }
  
  if(check[35])
  {
    fill(255);
    rect(550,170,40,40);
  }
  else
  {
    fill(0);
    rect(550,170,40,40);
  }
  
  
  // 5th row
  
  
  if(check[36])
  {
    fill(255);
    rect(110,225,40,40);
  }
  else
  {
    fill(0);
    rect(110,225,40,40);
  }
  
  if(check[37])
  {
    fill(255);
    rect(165,225,40,40);
  }
  else
  {
    fill(0);
    rect(165,225,40,40);
  }
  
  if(check[38])
  {
    fill(255);
    rect(220,225,40,40);
  }
  else
  {
    fill(0);
    rect(220,225,40,40);
  }
  
  if(check[39])
  {
    fill(255);
    rect(275,225,40,40);
  }
  else
  {
    fill(0);
    rect(275,225,40,40);
  }
  
  if(check[40])
  {
    fill(255);
    rect(330,225,40,40);
  }
  else
  {
    fill(0);
    rect(330,225,40,40);
  }
  
  
  if(check[41])
  {
    fill(255);
    rect(385,225,40,40);
  }
  else
  {
    fill(0);
    rect(385,225,40,40);
  }
  
  
  if(check[42])
  {
    fill(255);
    rect(440,225,40,40);
  }
  else
  {
    fill(0);
    rect(440,225,40,40);
  }
  
  if(check[43])
  {
    fill(255);
    rect(495,225,40,40);
  }
  else
  {
    fill(0);
    rect(495,225,40,40);
  }
  
  if(check[44])
  {
    fill(255);
    rect(550,225,40,40);
  }
  else
  {
    fill(0);
    rect(550,225,40,40);
  }
  
  
  // 6th row
  
  
  if(check[45])
  {
    fill(255);
    rect(110,280,40,40);
  }
  else
  {
    fill(0);
    rect(110,280,40,40);
  }
  
  if(check[46])
  {
    fill(255);
    rect(165,280,40,40);
  }
  else
  {
    fill(0);
    rect(165,280,40,40);
  }
  
  if(check[47])
  {
    fill(255);
    rect(220,280,40,40);
  }
  else
  {
    fill(0);
    rect(220,280,40,40);
  }
  
  if(check[48])
  {
    fill(255);
    rect(275,280,40,40);
  }
  else
  {
    fill(0);
    rect(275,280,40,40);
  }
  
  if(check[49])
  {
    fill(255);
    rect(330,280,40,40);
  }
  else
  {
    fill(0);
    rect(330,280,40,40);
  }
  
  
  if(check[50])
  {
    fill(255);
    rect(385,280,40,40);
  }
  else
  {
    fill(0);
    rect(385,280,40,40);
  }
  
  
  if(check[51])
  {
    fill(255);
    rect(440,280,40,40);
  }
  else
  {
    fill(0);
    rect(440,280,40,40);
  }
  
  if(check[52])
  {
    fill(255);
    rect(495,280,40,40);
  }
  else
  {
    fill(0);
    rect(495,280,40,40);
  }
  
  if(check[53])
  {
    fill(255);
    rect(550,280,40,40);
  }
  else
  {
    fill(0);
    rect(550,280,40,40);
  }
}

function delay1()
{  
    player1.stop();
  player2.stop();
  player3.stop();
  player4.stop();
  player5.stop();
  player6.stop();
    if(check[1])
    {
      player1.play();
    }
    
    if(check[10])
    {
      player2.play();
    }
    
    if(check[19])
    {
      player3.play();
    }
    
    if(check[28])
    {
      player4.play();
    }
    
    if(check[37])
    {
      player5.play();
    }
    
    if(check[46])
    {
      player6.play();
    }
    setTimeout(delay2,x);
}


function delay2()
{
   player1.stop();
  player2.stop();
  player3.stop();
  player4.stop();
  player5.stop();
  player6.stop();  
  if(check[2])
    {
      player1.play();
    }
    
    if(check[11])
    {
      player2.play();
    }
    
    if(check[20])
    {
      player3.play();
    }
    
    if(check[29])
    {
      player4.play();
    }
    
    if(check[38])
    {
      player5.play();
    }
    
    if(check[47])
    {
      player6.play();
    }
    setTimeout(delay3,x);
}

function delay3()
{
   player1.stop();
  player2.stop();
  player3.stop();
  player4.stop();
  player5.stop();
  player6.stop();   
  if(check[3])
    {
      player1.play();
    }
    
    if(check[12])
    {
      player2.play();
    }
    
    if(check[21])
    {
      player3.play();
    }
    
    if(check[30])
    {
      player4.play();
    }
    
    if(check[39])
    {
      player5.play();
    }
    
    if(check[48])
    {
      player6.play();
    }
    setTimeout(delay4,x);
}

function delay4()
{
    
     player1.stop();
  player2.stop();
  player3.stop();
  player4.stop();
  player5.stop();
  player6.stop(); 
    if(check[4])
    {
      player1.play();
    }
    
    if(check[13])
    {
      player2.play();
    }
    
    if(check[22])
    {
      player3.play();
    }
    
    if(check[31])
    {
      player4.play();
    }
    
    if(check[40])
    {
      player5.play();
    }
    
    if(check[49])
    {
      player6.play();
    }
    
    setTimeout(delay5,x);
   
}

function delay5()
{
    
     player1.stop();
  player2.stop();
  player3.stop();
  player4.stop();
  player5.stop();
  player6.stop(); 
    if(check[5])
    {
      player1.play();
    }
    
    if(check[14])
    {
      player2.play();
    }
    
    if(check[23])
    {
      player3.play();
    }
    
    if(check[32])
    {
      player4.play();
    }
    
    if(check[41])
    {
      player5.play();
    }
    
    if(check[50])
    {
      player6.play();
    }
    
    setTimeout(delay6,x);
   
}

function delay6()
{
    
     player1.stop();
  player2.stop();
  player3.stop();
  player4.stop();
  player5.stop();
  player6.stop(); 
    if(check[6])
    {
      player1.play();
    }
    
    if(check[15])
    {
      player2.play();
    }
    
    if(check[24])
    {
      player3.play();
    }
    
    if(check[33])
    {
      player4.play();
    }
    
    if(check[42])
    {
      player5.play();
    }
    
    if(check[51])
    {
      player6.play();
    }
    
    setTimeout(delay7,x);
   
}

function delay7()
{
    
     player1.stop();
  player2.stop();
  player3.stop();
  player4.stop();
  player5.stop();
  player6.stop(); 
    if(check[7])
    {
      player1.play();
    }
    
    if(check[16])
    {
      player2.play();
    }
    
    if(check[25])
    {
      player3.play();
    }
    
    if(check[34])
    {
      player4.play();
    }
    
    if(check[43])
    {
      player5.play();
    }
    
    if(check[52])
    {
      player6.play();
    }
    
    setTimeout(delay8,x);
   
}

function delay8()
{
    
     player1.stop();
  player2.stop();
  player3.stop();
  player4.stop();
  player5.stop();
  player6.stop(); 
    if(check[8])
    {
      player1.play();
    }
    
    if(check[17])
    {
      player2.play();
    }
    
    if(check[26])
    {
      player3.play();
    }
    
    if(check[35])
    {
      player4.play();
    }
    
    if(check[44])
    {
      player5.play();
    }
    
    if(check[53])
    {
      player6.play();
    }
    setTimeout(delay0,x);
   
}


function delay0()
{
  if(check[0])
    {
      player1.play();
    }
    
    if(check[9])
    {
      player2.play();
    }
    
    if(check[18])
    {
      player3.play();
    }
    
    if(check[27])
    {
      player4.play();
    }
    
    if(check[36])
    {
      player5.play();
    }
    
    if(check[45])
    {
      player6.play();
    }
    
    
    setTimeout(delay1,x);
}
void mousePressed()
{
  if(mouseY>460)
  {x= mouseX+200;}
  player1.stop();
  player2.stop();
  player3.stop();
  player4.stop();
  player5.stop();
  player6.stop();
  if(mouseX>275 && mouseX<375 && mouseY>375 && mouseY<425)
  {
    delay0();
    
  }
 
  if(mouseX>105 && mouseX<155 && mouseY>0 && mouseY<50)
   {
     player1.cue(0);
     player1.play();
     check[0] = !check[0];
   }

   if(mouseX>160 && mouseX<210 && mouseY>0 && mouseY<50)
   {
     player1.cue(0);
     player1.play();
     check[1] = !check[1];
   }
   if(mouseX>215 && mouseX<265 && mouseY>0 && mouseY<50)
   {
     player1.cue(0);
     player1.play();
     check[2] = !check[2];
   }
   if(mouseX>270 && mouseX<320 && mouseY>0 && mouseY<50)
   {
     player1.cue(0);
     player1.play();
     check[3] = !check[3];
   }
   if(mouseX>325 && mouseX<375 && mouseY>0 && mouseY<50)
   {
     player1.cue(0);
     player1.play();
     check[4] = !check[4];
   }
   if(mouseX>380 && mouseX<430 && mouseY>0 && mouseY<50)
   {
     player1.cue(0);
     player1.play();
     check[5] = !check[5];
   }
   if(mouseX>435 && mouseX<485 && mouseY>0 && mouseY<50)
   {
     player1.cue(0);
     player1.play();
     check[6] = !check[6];
   }
   if(mouseX>490 && mouseX<540 && mouseY>0 && mouseY<50)
   {
     player1.cue(0);
     player1.play();
     check[7] = !check[7];
   }
   if(mouseX>545 && mouseX<595 && mouseY>0 && mouseY<50)
   {
     player1.cue(0);
     player1.play();
     check[8] = !check[8];
   }
   
   
  
  if(mouseX>105 && mouseX<155 && mouseY>55 && mouseY<105)
   {
     player2.cue(0);
     player2.play();
     check[9] = !check[9];
   }

   if(mouseX>160 && mouseX<210 && mouseY>55 && mouseY<105)
   {
     player2.cue(0);
     player2.play();
     check[10] = !check[10];
   }
   if(mouseX>215 && mouseX<265 && mouseY>55 && mouseY<105)
   {
     player2.cue(0);
     player2.play();
     check[11] = !check[11];
   }
   if(mouseX>270 && mouseX<320 && mouseY>55 && mouseY<105)
   {
     player2.cue(0);
     player2.play();
     check[12] = !check[12];
   }
   if(mouseX>325 && mouseX<375 && mouseY>55 && mouseY<105)
   {
     player2.cue(0);
     player2.play();
     check[13] = !check[13];
   }
   if(mouseX>380 && mouseX<430 && mouseY>55 && mouseY<105)
   {
     player2.cue(0);
     player2.play();
     check[14] = !check[14];
   }
   if(mouseX>435 && mouseX<485 && mouseY>55 && mouseY<105)
   {
     player2.cue(0);
     player2.play();
     check[15] = !check[15];
   }
   if(mouseX>490 && mouseX<540 && mouseY>55 && mouseY<105)
   {
     player2.cue(0);
     player2.play();
     check[16] = !check[16];
   }
   if(mouseX>545 && mouseX<595 && mouseY>55 && mouseY<105)
   {
     player2.cue(0);
     player2.play();
     check[17] = !check[17];
   }
   
   
    
  if(mouseX>105 && mouseX<155 && mouseY>110 && mouseY<160)
   {
     player3.cue(0);
     player3.play();
     check[18] = !check[18];
   }

   if(mouseX>160 && mouseX<210 && mouseY>110 && mouseY<160)
   {
     player3.cue(0);
     player3.play();
     check[19] = !check[19];
   }
   if(mouseX>215 && mouseX<265 && mouseY>110 && mouseY<160)
   {
     player3.cue(0);
     player3.play();
     check[20] = !check[20];
   }
   if(mouseX>270 && mouseX<320 && mouseY>110 && mouseY<160)
   {
     player3.cue(0);
     player3.play();
     check[21] = !check[21];
   }
   if(mouseX>325 && mouseX<375 && mouseY>110 && mouseY<160)
   {
     player3.cue(0);
     player3.play();
     check[22] = !check[22];
   }
   if(mouseX>380 && mouseX<430 && mouseY>110 && mouseY<160)
   {
     player3.cue(0);
     player3.play();
     check[23] = !check[23];
   }
   if(mouseX>435 && mouseX<485 && mouseY>110 && mouseY<160)
   {
     player3.cue(0);
     player3.play();
     check[24] = !check[24];
   }
   if(mouseX>490 && mouseX<540 && mouseY>110 && mouseY<160)
   {
     player3.cue(0);
     player3.play();
     check[25] = !check[25];
   }
   if(mouseX>545 && mouseX<595 && mouseY>110 && mouseY<160)
   {
     player3.cue(0);
     player3.play();
     check[26] = !check[26];
   }
   
   
   
   
  if(mouseX>105 && mouseX<155 && mouseY>165 && mouseY<215)
   {
     player4.cue(0);
     player4.play();
     check[27] = !check[27];
   }

   if(mouseX>160 && mouseX<210 && mouseY>165 && mouseY<215)
   {
     player4.cue(0);
     player4.play();
     check[28] = !check[28];
   }
   if(mouseX>215 && mouseX<265 && mouseY>165 && mouseY<215)
   {
     player4.cue(0);
     player4.play();
     check[29] = !check[29];
   }
   if(mouseX>270 && mouseX<320 && mouseY>165 && mouseY<215)
   {
     player4.cue(0);
     player4.play();
     check[30] = !check[30];
   }
   if(mouseX>325 && mouseX<375 && mouseY>165 && mouseY<215)
   {
     player4.cue(0);
     player4.play();
     check[31] = !check[31];
   }
   if(mouseX>380 && mouseX<430 && mouseY>165 && mouseY<215)
   {
     player4.cue(0);
     player4.play();
     check[32] = !check[32];
   }
   if(mouseX>435 && mouseX<485 && mouseY>165 && mouseY<215)
   {
     player4.cue(0);
     player4.play();
     check[33] = !check[33];
   }
   if(mouseX>490 && mouseX<540 && mouseY>165 && mouseY<215)
   {
     player4.cue(0);
     player4.play();
     check[34] = !check[34];
   }
   if(mouseX>545 && mouseX<595 && mouseY>165 && mouseY<215)
   {
     player4.cue(0);
     player4.play();
     check[35] = !check[35];
   }
   
   
   
    
  if(mouseX>105 && mouseX<155 && mouseY>220 && mouseY<270)
   {
     player5.cue(0);
     player5.play();
     check[36] = !check[36];
   }

   if(mouseX>160 && mouseX<210 && mouseY>220 && mouseY<270)
   {
     player5.cue(0);
     player5.play();
     check[37] = !check[37];
   }
   if(mouseX>215 && mouseX<265 && mouseY>220 && mouseY<270)
   {
     player5.cue(0);
     player5.play();
     check[38] = !check[38];
   }
   if(mouseX>270 && mouseX<320 && mouseY>220 && mouseY<270)
   {
     player5.cue(0);
     player5.play();
     check[39] = !check[39];
   }
   if(mouseX>325 && mouseX<375 && mouseY>220 && mouseY<270)
   {
     player5.cue(0);
     player5.play();
     check[40] = !check[40];
   }
   if(mouseX>380 && mouseX<430 && mouseY>220 && mouseY<270)
   {
     player5.cue(0);
     player5.play();
     check[41] = !check[41];
   }
   if(mouseX>435 && mouseX<485 && mouseY>220 && mouseY<270)
   {
     player5.cue(0);
     player5.play();
     check[42] = !check[42];
   }
   if(mouseX>490 && mouseX<540 && mouseY>220 && mouseY<270)
   {
     player5.cue(0);
     player5.play();
     check[43] = !check[43];
   }
   if(mouseX>545 && mouseX<595 && mouseY>220 && mouseY<270)
   {
     player5.cue(0);
     player5.play();
     check[44] = !check[44];
   }
   
   
   
   
  if(mouseX>105 && mouseX<155 && mouseY>275 && mouseY<325)
   {
     player6.cue(0);
     player6.play();
     check[45] = !check[45];
   }

   if(mouseX>160 && mouseX<210 && mouseY>275 && mouseY<325)
   {
     player6.cue(0);
     player6.play();
     check[46] = !check[46];
   }
   if(mouseX>215 && mouseX<265 && mouseY>275 && mouseY<325)
   {
     player6.cue(0);
     player6.play();
     check[47] = !check[47];
   }
   if(mouseX>270 && mouseX<320 && mouseY>275 && mouseY<325)
   {
     player6.cue(0);
     player6.play();
     check[48] = !check[48];
   }
   if(mouseX>325 && mouseX<375 && mouseY>275 && mouseY<325)
   {
     player6.cue(0);
     player6.play();
     check[49] = !check[49];
   }
   if(mouseX>380 && mouseX<430 && mouseY>275 && mouseY<325)
   {
     player6.cue(0);
     player6.play();
     check[50] = !check[50];
   }
   if(mouseX>435 && mouseX<485 && mouseY>275 && mouseY<325)
   {
     player6.cue(0);
     player6.play();
     check[51] = !check[51];
   }
   if(mouseX>490 && mouseX<540 && mouseY>275 && mouseY<325)
   {
     player6.cue(0);
     player6.play();
     check[52] = !check[52];
   }
   if(mouseX>545 && mouseX<595 && mouseY>275 && mouseY<325)
   {
     player6.cue(0);
     player6.play();
     check[53] = !check[53];
   }
}


