
//determine enemy
void detai()
{
  chara2 = int(random(4));
  
  while(chara1 == chara2){chara2 = int(random(4));}
  
  if(chara2 == 0)
  {
    ainame = "Mean Green";
    aicolor = color(92,156,92);
  }
  if(chara2 == 1)
  {
    ainame = "Fighty Whitey";
    aicolor = color(236,236,236);
  }
  if(chara2 == 2)
  {
    ainame = "Mellow Yellow";
    aicolor = color(252,252,104);
  }
  if(chara2 == 3)
  {
    ainame = "Cool Blue";
    aicolor = color(164,184,252);
  }
}



void aimove()
{
  //determine direction
  if(aidirection == 0 && playerx > aix){aidirection = 1;}
  if(aidirection == 1 && playerx < aix){aidirection = 0;}
  
  //move based on direction
  if(aiblock == false)
  {
    aispecialattack();
    if(aidirection == 0)
    {
      if(aix > playerx+wd/2+25 && attacktimer < 15){aix -= speed*0.8; attacktimer = 15;}
      else if(aix < playerx+wd/2+25 && jump == false){aix += speed;}
      //attack if close enough
      else{aiattack();}
    }
    if(aidirection == 1)
    {
      if(aix < playerx-wd/2-25 && attacktimer < 15){aix += speed*0.8; attacktimer = 15;}
      else if(aix > playerx-wd/2-25 && jump == false){aix -= speed;}
      //attack if close enough
      else{aiattack();}
    }
  }
  
  //block
  if(punchnum > 2){aiblock = true;}
  else{aiblock = false;}
  
  if(aiblock == true)
  {
    stroke(255);
    if(aidirection == 1){line(aix+(wd/2)+(5),300,aix+(wd/2)+(5),300-(ht/2));}
    if(aidirection == 0){line(aix-(wd/2)-(5),300,aix-(wd/2)-(5),300-(ht/2));}
    fill(124,140,224);
    textAlign(CENTER);
    textFont(font,16);
    text("block!",aix,300-ht);
  }
}


void aiattack()
{
  if(attacktimer > 0){attacktimer --;}
  if(attacktimer == 0)
  {
    stroke(255);
    if(aidirection == 0){line(aix-wd/2-5,300-ht/4,aix-wd/2-15,300-ht/4);}
    if(aidirection == 1){line(aix+wd/2+5,300-ht/4,aix+wd/2+15,300-ht/4);}
    fill(124,140,224);
    move2 = "punch!";
    movetimer2 = 5;
    attacktimer += 10;
    if(block == false){health -= 5;}
    else{attacktimer += 5;}
  }
}

void aispecialattack()
{
  if(aispecialtimer == 0)
  {
    if(chara2 == 0)
    {
      stroke(252,252,104);
      if(playerx > aix && playerx < aix+50)
      {
        line(aix+wd,playery,playerx-wd/2,playery);
      }
      if(playerx < aix && playerx > aix-50)
      {
        line(aix-wd,playery-ht/4,playerx+wd/2,playery);
      }
      health -= 2;
      fill(124,140,224);
      move2 = "fireball!";
      movetimer2 = 5;
      aispecialtimer = 80;
    }
    if(chara2 == 1)
    {
      if(playerx > aix) {
        aix = playerx+wd+wd/2;
        direction = 0;
      }
      else {
        aix = playerx-wd-wd/2; 
        direction = 1;
      }
      health -= 3;
      move2 = "Zap!";
      movetimer2 = 5;
      aispecialtimer = 120;
    }
    if(chara2 == 2)
    {
      stroke(252,252,104);
      if(playerx > aix)
      {
        playerx = aix+wd+wd/2;
        direction = 1;
        line(aix+wd/2,playery-ht/4,playerx-wd/2,playery-ht/4);
      }
      else
      {
        playerx = aix-wd-wd/2; 
        direction = 0;
        line(aix-wd/2,playery-ht/4,playerx+wd/2,playery-ht/4);
      }
      health -= 3;
      move2 = "Lasso!";
      movetimer2 = 5;
      aispecialtimer = 120;
    }
    if(chara2 == 3)
    {
      if(playerx > aix && playerx < aix+50) {
        playerx = aix + 200;
      }
      if(playerx < aix && playerx > aix-50) {
        playerx = aix - 200;
      }
      health -= 10;
      move2 = "BOOM!";
      movetimer2 = 5;
      aispecialtimer = 150;
    }
  }
}

