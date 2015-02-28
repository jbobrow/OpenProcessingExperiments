
void check()
{
  if(dead ==false)
  {
    //check character
    if(wizard == true)
    {
      boxy = 30;
      story1 = wizard1;
      chara = "wizard";
      gender = "He";
      if(wmood == 0){mood = "powerful";}
      else if(wmood == 1){mood = "friendly";}
      else if(wmood == 2){mood = "seriously pissed off";}
      
      if(amulet == false){item = gender+" has a mysterious AMULET.";item1 = loadImage("amulet01.png");}
      else{item = "";item1 = loadImage("nothing.png");}
      

    }
    if(maid == true)
    {
      boxy = 80;
      story1 = maid1;
      chara = "milk maid";
      gender = "she";
      if(mmood == 0){mood = "attractive";}
      else if(mmood == 1){mood = "friendly";}
      else if(mmood == 2){mood = "seriously pissed off";}
      
      if(letter == false){item = gender+" seems to be carrying some kind of LETTER.";}
      else{item = "";item1 = loadImage("nothing.png");}
      

    }
    if(peasant == true)
    {
      boxy = 130;
      story1 = peasant1;
      chara = "peasant";
      gender = "(He?)";
      if(pmood == 0){mood = "studpid looking";}
      else if(pmood == 1){mood = "friendly";}
      else if(pmood == 2){mood = "seriously pissed off";}
    
    
      if(sheepskin == false){item = gender+" is carrying a SHEEPSKIN.";item1 = sheepskin1;}
      else{item = "";item1 = loadImage("nothing.png");}
      

    }
    if(wolf == true)
    {
      boxy = 180;
      story1 = wolf1;
      chara = "wolf";
      gender = "It";
      if(womood == 0){mood = "sinster looking";}
      else if(womood == 1){mood = "friendly (but still sinsiter looking)";}
      else if(womood == 2){mood = "seriously pissed off";}
      
      item = "";
      item1 = loadImage("nothing.png");

    }
    if(bear == true)
    {
      boxy = 230;
      story1 = bear1;
      chara = "bear";
      gender = "He";
      if(bmood == 0){mood = "large";}
      else if(bmood == 1){mood = "friendly";}
      else if(bmood == 2){mood = "seriously pissed off";}
    
      item = "nearby are some ROCKS.";
      item1 = loadImage("rocks01.png");

    }
    if(lion == true)
    {
      boxy = 280;
      story1 = lion1;
      chara = "lion";
      gender = "He";
      if(lmood == 0){mood = "majestic";}
      else if(lmood == 1){mood = "friendly";}
      else if(lmood == 2){mood = "seriously pissed off";}
    
      if(honey == false){item = gender+" has a beehive full of HONEY.";item1 = honey1;}
      else{item = "";item1 = loadImage("nothing.png");}
      
    }
    if(begin == true)
    {
      story1 = loadImage("begin.png");
      item1 = loadImage("nothing.png");
    }
  }
  
  
  
  
  if(begin == false){situation = "You see a "+mood+" "+chara+". "+item;}
  else{situation = "you see a vast opening screen...you should probably do something now.";}
  
}

