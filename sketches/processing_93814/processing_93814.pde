
int page = 1;
 
 
///////////////////////////SETUP
void setup()
{
  ///////////////////////Window
  size(800,300);
   
}
 
///////////////////////////DRAW
void draw()
{
   
  if (page == 1)
  {pageOne();}
  else if (page == 2)
  {pageTwo();}
  else if (page == 3)
  {pageThree();}
  else if (page == 4)
  {pageFour();}
  else if (page == 5)
  {pageFive();}
  else if (page == 6)
  {pageSix();}
  else if (page == 7)
  {pageSeven();}
  else if (page == 8)
  {pageEight();}
  else if (page == 9)
  {pageNine();}
  else if (page == 10)
  {pageTen();}
  else if (page == 11)
  {pageEleven();}
  else if (page == 12)
  {pageTwelve();}
  else if (page == 13)
  {pageThirteen();}
  else if (page == 14)
  {pageFourteen();}
  else if (page == 15)
  {pageFifteen();}
  else if (page == 16)
  {pageSixteen();}
  else if (page == 17)
  {pageSeventeen();}
  else if (page == 18)
  {pageEightteen();}
  else if (page == 19)
  {pageNineteen();}
  else if (page == 20)
  {pageTwenty();}
  else if (page == 21)
  {pageTwentyOne();}
  else if (page == 22)
  {pageTwentyTwo();}
  else if (page == 23)
  {pageTwentyThree();}
  else if (page == 24)
  {pageTwentyFour();}
  else if (page == 25)
  {pageTwentyFive();}
  else if (page == 26)
  {pageTwentySix();}
  else if (page == 27)
  {pageTwentySeven();}
  else if (page == 28)
  {pageTwentyEight();}
  else if (page == 29)
  {pageTwentyNine();}
  else if (page == 30)
  {pageThirty();}
  else if (page == 31)
  {pageThirtyOne();}
  else if (page == 32)
  {pageThirtyTwo();}
  else if (page == 33)
  {pageThirtyThree();}
  else if (page == 34)
  {pageThirtyFour();}
  else if (page == 35)
  {pageThirtyFive();}
  else if (page == 36)
  {pageThirtySix();}
  else if (page == 37)
  {pageThirtySeven();}
  else if (page == 38)
  {pageThirtyEight();}
  else if (page == 39)
  {pageThirtyNine();}
  else if (page == 40)
  {pageFourty();}
  else if (page == 41)
  {pageFourtyOne();}
  else if (page == 42)
  {pageFourtyTwo();}
  else if (page == 43)
  {pageFourtyThree();}
  else if (page == 44)
  {pageFourtyFour();}
  else if (page == 45)
  {pageFourtyFive();}
  else if (page == 46)
  {pageFourtySix();}
  else if (page == 47)
  {pageFourtySeven();}
  else if (page == 48)
  {pageFourtyEight();}
  else if (page == 49)
  {pageFourtyNine();}
  else if (page == 50)
  {pageFifty();}
  else if (page == 51)
  {pageFiftyOne();}
  else if (page == 52)
  {pageFiftyTwo();}
  else if (page == 53)
  {pageFiftyThree();}
  else if (page == 54)
  {pageFiftyFour();}
  else if (page == 55)
  {pageFiftyFive();}
  else if (page == 56)
  {pageFiftySix();}
  else if (page == 57)
  {pageFiftySeven();}
  else if (page == 58)
  {pageFiftyEight();}
  else if (page == 59)
  {pageFiftyNine();}
  else if (page == 60)
  {pageSixty();}
  else if (page == 61)
  {pageSixtyOne();}
  else if (page == 62)
  {pageSixtyTwo();}
}
 
 
///////////////////////////LEFT AND RIGHT MOUSE CLICK
void mouseClicked()
{
  ////////////////////////////////////////////1 - Man Or Woman///////////////////////////////////////////////////////
  if (page == 1)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 2;//Man
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 2; //Woman
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////2 - You are shaking///////////////////////////////////////////////////
  else if (page == 2)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 3;//Go to Pool
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 4;//Go to Doorway
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////3 - Go to Pool///////////////////////////////////////////////////
  else if (page == 3)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 5;//Pull Flashlight out
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 4;//Go to Doorway
    }
  }
 ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////4 - Go to Doorway ///////////////////////////////////////////////////
  else if (page == 4)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 26;//Non-Lit Doorway
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 40;//Lit Doorway
    }
  }
 ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////5 - Pull Flashlight Out ///////////////////////////////////////////////////
  else if (page == 5)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 6;//Go In Water
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 4;//Lit Doorway
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////6 - In Water ///////////////////////////////////////////////////
  else if (page == 6)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 7;//Pull Body Out
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 4;//Go back to Doorway
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////7 - Its Clark ///////////////////////////////////////////////////
  else if (page == 7)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 8;//Search Body
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 4;//Go back to Doorway
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////8 - Searched Clark ///////////////////////////////////////////////////
  else if (page == 8)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 9;//Go Back in Water
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 4;//Go back to Doorway
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////9 - In Water Again ///////////////////////////////////////////////////
  else if (page == 9)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 11;//Left To Turn on Flashlight in Water
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 10;//Keep Swimming Blindly
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////10 - Swim Blindly ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER ///////////////////////////////////////////////////
  else if (page == 10)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART ANY BUTTON
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART ANY BUTTON
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////11 - Flash Light On ///////////////////////////////////////////////////
  else if (page == 11)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 12;//GO DOWN SUN HALLWAY
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 13;//GO DOWN FISH HALLWAY
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////12 - SUN HALL 1 ///////////////////////////////////////////////////
  else if (page == 12)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 14;//Swim Towards
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 13;//GO DOWN FISH HALLWAY
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
  //////////////////////////////////////////////13 - GO BACK TO FISH HALL ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER ///////////////////////////////////////////////////
  else if (page == 13)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 61;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 62;//RESTART
    }
  }
  //////////////////////////////////////////////14 - SUN HALL 2 ///////////////////////////////////////////////////
  
  else if (page == 14)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 15;//STAIRS
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 13;//FISH HALLWAY
    }
  }
  //////////////////////////////////////////////15 - STAIRS ///////////////////////////////////////////////////
  
  else if (page == 15)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 16;//BREACH SURFACE
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 13;//FISH HALLWAY
    }
  }
  //////////////////////////////////////////////16 - BREACH SURFACE///////////////////////////////////////////////////
  
  else if (page == 16)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 17;//Doorway
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 18;//Window
    }
  }
  //////////////////////////////////////////////17 - DOORWAY///////////////////////////////////////////////////
  
  else if (page == 17)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 19;//Stay Still
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 18;//Window
    }
  }

  //////////////////////////////////////////////19 - Stay Still///////////////////////////////////////////////////
  
  else if (page == 19)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 20;//Familiar Voice
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 18;//Window
    }
  }
  //////////////////////////////////////////////20 - Familiar Voice///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER ///////////////////////////////////////////////////
  else if (page == 20)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
  //////////////////////////////////////////////18 - WINDOW///////////////////////////////////////////////////
  
  else if (page == 18)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 21;//Listen
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 24;//Peer Over
    }
  }
  //////////////////////////////////////////////21 - Listen///////////////////////////////////////////////////
  
  else if (page == 21)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 22;//Sneak Away
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 23;//Take Gun
    }
  }
  //////////////////////////////////////////////22 - Sneak Away///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER ///////////////////////////////////////////////////
  else if (page == 22)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
  //////////////////////////////////////////////23 - TAKE GUN///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU WIN THE GAME///////////////////////////////////////////////////
  else if (page == 23)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
  //////////////////////////////////////////////24 - Peer Over///////////////////////////////////////////////////
  
  else if (page == 24)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 25;//KILL WOMAN
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 22;//SNEAK AWAY
    }
  }
  //////////////////////////////////////////////25 - KILL WOMAN///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU WIN THE GAME///////////////////////////////////////////////////
  else if (page == 25)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }


//////////////////////////////////////////////26 - Non-Lit Door///////////////////////////////////////////////////
  
  else if (page == 26)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 27;//Keep Going Down Bird Symbol
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 40;//Lit Door
    }
  }  
  
 //////////////////////////////////////////////27 - Pedastul w/Carcuss ///////////////////////////////////////////////////
  
  else if (page == 27)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 28;//Lef Hallway
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 40;//Lit Door
    }
  }   
  //////////////////////////////////////////////28 - Hallway of Bones ///////////////////////////////////////////////////
  
  else if (page == 28)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 29;//Lights Ahead
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 40;//Lit Door
    }
  }  
  //////////////////////////////////////////////29 - Lights Ahead ///////////////////////////////////////////////////
  
  else if (page == 29)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 30;//Grab Pockets
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 31;//Slide Down
    }
  } 
   //////////////////////////////////////////////31 - DEAD ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER ///////////////////////////////////////////////////
  else if (page == 31)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
  //////////////////////////////////////////////30 - Grab Pockets ///////////////////////////////////////////////////
  
  else if (page == 30)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 32;//Jump From Current Pocket
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 33;//Climb Up and try other pocket
    }
  } 
  //////////////////////////////////////////////32 - Try and Pull Self Up ///////////////////////////////////////////////////
  
  else if (page == 32)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 34;//try and pull yourself up
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 35;//Scream
    }
  } 
   //////////////////////////////////////////////34 - Try and Pull Self Up Again ///////////////////////////////////////////////////
   //////////////////////////////////////////////YOU ARE DEAD GAME OVER ///////////////////////////////////////////////////
  else if (page == 34)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  } 
  //////////////////////////////////////////////35 - SCREAM ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER ///////////////////////////////////////////////////
  else if (page == 35)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  } 
  //////////////////////////////////////////////33 - Climbed to the Pocket Above You ///////////////////////////////////////////////////
  
  else if (page == 33)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 37;//Attempt another Climb
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 36;//Jump from This Pocket
    }
  } 
 //////////////////////////////////////////////36 - Attempt another Climb ///////////////////////////////////////////////////
 //////////////////////////////////////////////YOU ARE DEAD GAME OVER ///////////////////////////////////////////////////
  else if (page == 36)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  } 
  //////////////////////////////////////////////37 - JUMP from Second Pocket ///////////////////////////////////////////////////
  
  else if (page == 37)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 38;//Boat Now
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 39;//Morning
    }
  }
  //////////////////////////////////////////////38 - Boat Now ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU WIN THE GAME///////////////////////////////////////////////////
  else if (page == 38)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 39;//RESTART
    }
  }
  //////////////////////////////////////////////39 - MORNING ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER///////////////////////////////////////////////////
  else if (page == 39)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }

  //////////////////////////////////////////////40 - LIT DOOR ///////////////////////////////////////////////////
  
  else if (page == 40)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 41;//Forward
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 26;//Non Lit Door
    }
  }
  //////////////////////////////////////////////41 - Forward ///////////////////////////////////////////////////
  
  else if (page == 41)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 42;//Leap Gap
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 26;//Non Lit Door
    }
  }
  //////////////////////////////////////////////42 - Gap Leaped ///////////////////////////////////////////////////
  
  else if (page == 42)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 43;//Hallway
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 46;//Look Over With Flashlight
    }
  }
  //////////////////////////////////////////////43 - Hallway ///////////////////////////////////////////////////
  
  else if (page == 43)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 44;//Night
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 45;//Morning
    }
  }
  //////////////////////////////////////////////44 - NIGHT ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU WIN THE GAME///////////////////////////////////////////////////
  else if (page == 44)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//WIN
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//WIN
    }
  }
  //////////////////////////////////////////////45 - Morning ///////////////////////////////////////////////////
   //////////////////////////////////////////////YOU ARE DEAD GAME OVER///////////////////////////////////////////////////
  else if (page == 45)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
 //////////////////////////////////////////////46 - Look Over With Flashlight ///////////////////////////////////////////////////
  
  else if (page == 46)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 48;//Proceed Down Hall
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 47;//Stop Moving
    }
  }
  //////////////////////////////////////////////48 - PROCEED DOWN HALL ///////////////////////////////////////////////////
  
  else if (page == 48)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 49;//FLASH KNIFE
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 50;//GRAB ON
    }
  }
   //////////////////////////////////////////////49 - FLASH KNIFE ///////////////////////////////////////////////////
   //////////////////////////////////////////////YOU ARE DEAD GAME OVER///////////////////////////////////////////////////
  else if (page == 49)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
   //////////////////////////////////////////////50 - GRAB ON TO WALL ///////////////////////////////////////////////////
  
  else if (page == 50)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 51;//KNIFE THROW
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 52;//FLASHLIGHT BLIND
    }
  }
   //////////////////////////////////////////////51 - KNIFE THROW ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER///////////////////////////////////////////////////
  else if (page == 51)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
    //////////////////////////////////////////////52 - FLASHLIGHT BLIND ///////////////////////////////////////////////////
  
  else if (page == 52)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 53;//KNIFE THROW
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 54;//RUN
    }
  }
  //////////////////////////////////////////////53 - THROW KNIFE KEEP STABBING ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU WIN THE GAME///////////////////////////////////////////////////
  else if (page == 53)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
  //////////////////////////////////////////////54 - RUN - MONSTER RUNS LOOSE AND YOU LOSE A LEG///////////////////////////////////////////////////
   //////////////////////////////////////////////YOU WIN THE GAME///////////////////////////////////////////////////
  else if (page == 54)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
  //////////////////////////////////////////////47 - STOP MOVING ///////////////////////////////////////////////////
  
  else if (page == 47)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 55;//RUN and DIE
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 56;//STOP MOVING 2
    }
  }
   //////////////////////////////////////////////56 - RUN AND DIE ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER///////////////////////////////////////////////////
  else if (page == 56)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
  //////////////////////////////////////////////55 - STOP MOVING 2 ///////////////////////////////////////////////////
  
  else if (page == 55)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 57;//STOP MOVING GOES TO KILL ENEMIES ON ISLAND CAUSE IT HEARS GUN FIRE
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 58;//LUNGE AT CREATURE AND DIE
    }
  }
  //////////////////////////////////////////////58 - LUNGE AND DIE ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER///////////////////////////////////////////////////
  else if (page == 58)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
  //////////////////////////////////////////////57 - STOP MOVING 3 LITTLE CREATURES///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER///////////////////////////////////////////////////
  else if (page == 57)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//RESTART
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//RESTART
    }
  }
   //////////////////////////////////////////////58 - Lunge and Kill the Monster ///////////////////////////////////////////////////
  
  else if (page == 58)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 59;//TRAVERSE JUNGLE AT NIGHT
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 60;//TRAVERSE JUNGLE IN MORNING
    }
  }
    //////////////////////////////////////////////59 - NIGHT ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU WIN THE GAME///////////////////////////////////////////////////
  else if (page == 59)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//WIN
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//WIN
    }
  }
    //////////////////////////////////////////////60 - MORNING ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER///////////////////////////////////////////////////
  else if (page == 60)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 59;//LOSE
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 60;//LOSE
    }
  }
  //////////////////////////////////////////////61 - Kill Shark ///////////////////////////////////////////////////
  //////////////////////////////////////////////YOU ARE DEAD GAME OVER///////////////////////////////////////////////////
  else if (page == 61)
  {
    if((mouseButton == LEFT)== true)
    {
      page = 1;//GAME OVER
    }
    else if((mouseButton == RIGHT) == true)
    {
      page = 1;//GAME OVER
    }
  }
  
  
  
  
  
  
}






///////////////////////////DEBUG
void debug()
{
}
 
 
 
//////////////////////////////////////PAGE VOIDS START HERE///////////////////////////////////////////////////////////////
 
///////////////////////////PAGE 1//////////////////
void pageOne()
{
  //Background
  background(5);
  String s = "Are you a Man or a Woman?";
  text(s, 10, 20, 700, 280);
  
  text("Left Click if Man", 10, 250);
  text("Right Click if Woman", 10, 280);
}
 
///////////////////////////PAGE 2//////////////////
void pageTwo()
{
  //Background
  background(5);
  String s = "You are shaking. You awake from unconsciousness and topple over onto your hands and knees. You throw up water: A lot of water. You are soaking wet and the scuba suit you are wearing is torn around your torso. Just a little scratched, probably from some coral. You catch as much breath as you can and proceed to look around. The room you are in, is dimly lit by the natural light peeking in from a hole in the roof. You search your person and find nothing but a knife and flashlight both strapped to your thigh. (Both are secured by a scuba suit holster.) From what you can tell, your breathing apparatus has been torn off of your scuba gear. No trace of its whereabouts in sight. You do notice a pool of water in the corner of the room to your right and a doorway to your left.  ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Go to Pool of Water ", 10, 250);
  text("Right Click to Go to Doorway ", 10, 280);
}
 
///////////////////////////PAGE 3//////////////////
void pageThree()
{
  //Background
  background(5);
  String s = "You approach the pool of water. The water is murky, and with the lack of light in the cave, its near impossible to tell what lies within it. You squint your eyes, attempting to get a better idea of what lies in the pool, and see something shimmering in the water. You could almost swear it moved, but it could just be a trick of the light. Whatever it is, it could be helpful.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to use Flashlight", 10, 250);
  text("Right Click to Go to Doorway", 10, 280);
}
///////////////////////////PAGE 4//////////////////
void pageFour()
{
  //Background
  background(5);
  String s = "You proceed to the doorway. Just as you are in front of the door, a tile below your feet descends into the ground. The wall to your right starts to shake and move. Another Doorway appears. This one is brighter than the other. But while this happens, the ceiling collapses over the pool of water and covers it up. The way you came in is no longer an option. You take out your Knife and Flashlight.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Go through NON LIT Doorway", 10, 250);
  text("Right Click to Go through LIT Doorway", 10, 280);
}
///////////////////////////PAGE 5//////////////////
void pageFive()
{
  //Background
  background(5);
  String s = "You pull your flashlight out of its holster, turn it on with a flick of the switch, and aim it into the pool. What you see next startles you: a dead scuba diver. You can’t tell who it is exactly, its face is covered by a diving mask, but judging by the gear it’s another diver from your expedition. You can also now see that the murkiness of the water is from the blood of scuba diver that now pollutes it. ";
  text(s, 10, 20, 700, 300);
  
  
  
  text("Left Click to Go into the Pool and Pull Body out of the Water", 10, 250);
  text("Right Click to Go to Doorway", 10, 280);
}
///////////////////////////PAGE 6//////////////////
void pageSix()
{
  //Background
  background(5);
  String s = "You jump into the dark water, and diving down a couple feet, you grab the body and drag it back up onto the floor.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Take off Mask", 10, 250);
  text("Right Click to Go to Doorway", 10, 280);
}
///////////////////////////PAGE 7//////////////////
void pageSeven()
{
  //Background
  background(5);
  String s = "You remove the scuba mask. It's Clark; your brother. You see a long spear poking out from his chest, but you don’t remember having any spear guns on the expedition. Someone must have done this. A chill goes down your spine. You aren’t alone.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Search Clark's Body", 10, 250);
  text("Right Click to Go to Doorway", 10, 280);
}
///////////////////////////PAGE 8//////////////////
void pageEight()
{
  //Background
  background(5);
  String s = "You slowly search Clark’s body, your fingers trembling as you do. His mask is still intact, his breathing apparatus and air tank are intact as well. His knife is gone and so is his flashlight. You begin to contemplate your next step. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Go back into the Water", 10, 250);
  text("Right Click to Go to Doorway", 10, 280);
}
///////////////////////////PAGE 9//////////////////
void pageNine()
{
  //Background
  background(5);
  String s = "You put on Clark’s scuba gear, and take one last look at him. This might be the last time you see him. Then, with a sigh of trepidation, you dive into the bloody water. As a precaution you take out your flashlight and knife. You can’t see much. In the water and the only light you have is from the dim lit cave above the surface, which isn’t much. You remember someone killed Clark and that there is blood in the water";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Turn on Flashlight", 10, 250);
  text("Right Click to Keep Swimming without it in case whoever speared your brother might be down here", 10, 280);
}
///////////////////////////PAGE 10//////////////////
void pageTen()
{
  //Background
  background(5);
  String s = "You Start to swim blindly. The area around you gets murky as you swim forward. You feel a rush of unnatural water movement behind you. You frantically turn towards it and turn on your flash light. But its tool late. A shark as wide as the staircase walls viciously attacks you and rips you to shredds.";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 11//////////////////
void pageEleven()
{
  //Background
  background(5);
  String s = "You Click on the Flash Light. Visibility is getting better as you swim forward. The pool is now deeper than previously thought and ancient ruins dip down further. This is a staircase. The blood dissipates behind you as you proceed down the ruin staircase. As you go down the staircase your flipper catches a string and triggers a collapse behind you. You cannot go back. You swim on to the end of the staircase and come to a split. Two hallways: To your Left, the hallway has light at the end of it. Your flashlight reveals A Sun Symbol on its walls. To your right, it is completely dark but your flashlight reveals Fish Symbols on its walls. You grip your flashlight and knife tightly. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to go down Sun Hall", 10, 250);
  text("Right Click to go down Fish Hall", 10, 280);
}
///////////////////////////PAGE 12//////////////////
void pageTwelve()
{
  //Background
  background(5);
  String s = "You go left. Sun symbol must mean something. Maybe a way to the surface? As you swim further and further down the hall. The light now seems to be moving slowly and unnaturally. You instinctively turn off your flashlight. You are scared and the only light is coming from the end of the Sun hallway. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to swim towards light", 10, 250);
  text("Right Click to go down Fish Hall", 10, 280);
}
///////////////////////////PAGE 13//////////////////
void pageThirteen()
{
  //Background
  background(5);
  String s = "The Fish hallway is darker than you expected. As you go further down your flash light starts to flicker. It turns off for a couple seconds. Then on again. A shark is directly in front of you.";
  text(s, 10, 20, 700, 300);
  
  //text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 14//////////////////
void pageFourteen()
{
  //Background
  background(5);
  String s = "You swim towards the light. Slowly but surely, the hallway becomes visible. Another Sun symbol appears, this time with a mirror that is reflecting the Sun’s rays. In front of you is a staircase that seems to be the source of the light.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to go to Stairs", 10, 250);
  text("Right Click to go down Fish Hall", 10, 280);
}
///////////////////////////PAGE 15//////////////////
void pageFifteen()
{
  //Background
  background(5);
  String s = "You swim up the stairs. These stairs are taller than you expected; much taller. You keep swimming. The light protrudes brighter than before and the surface is a mere couple of feet away. The unnatural light moves again towards you as you swim upwards. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Breach Surface", 10, 250);
  text("Right Click to go down Fish Hall", 10, 280);
}
///////////////////////////PAGE 16//////////////////
void pageSixteen()
{
  //Background
  background(5);
  String s = "You Breach the Surface of the Water. Cautiously, you take off your mask. You smell fresh air. You peer around the Room, knife and flashlight still in hand. The Unnatural light actually is from the night sky protruding through the opening in ceiling bouncing off a mirror into the hallway. The unnatural flicker was from the clouds passing over. You breathe deeply and settle some nerves and remove your flippers, breathing apparatus, and air tank. In the room there is a Doorway and a window.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to go to Doorway", 10, 250);
  text("Right Click to go to Window", 10, 280);
}
///////////////////////////PAGE 17//////////////////
void pageSeventeen()
{
  //Background
  background(5);
  String s = "You approach the doorway. As you approach the doorway a flash of manmade engineered light stops you from exiting the through the doorway and you back up with caution. As you step back behind the wall that connects to the doorway, a tile below you descends and the entrance to the Sun Symbol Hallway suddenly disappears. You start to contemplate every move you make from here.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Stay Still", 10, 250);
  text("Right Click to go to Window", 10, 280);
}
///////////////////////////PAGE 18//////////////////
void pageEightteen()
{
  //Background
  background(5);
  String s = "You go to the window. You start to hear chatter. Small bits of dialogue become clearer. You hear a woman say GET A GROOVE ON, LOUDER or something like that. If you peer over you could hear better and possibly see who the speaker is. You remember that you aren’t alone.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Listen", 10, 250);
  text("Right Click to Peer over", 10, 280);
}
///////////////////////////PAGE 19//////////////////
void pageNineteen()
{
  //Background
  background(5);
  String s = "You stay still; Ready for someone to come around the corner. A murmur is heard. Louder and louder the murmur becomes. Closer, the murmur begins to turn into a voice; A familiar voice. The flashlight is almost to the entrance of the Room.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to go to Familiar Voice", 10, 250);
  text("Right Click to go to Window", 10, 280);
}
///////////////////////////PAGE 20//////////////////
void pageTwenty()
{
  //Background
  background(5);
  String s = "You go through the door with the familiar voice, knife ready to stab just in case. Flabbergasted and about ready to kill, you see that it is your friend Jess another person that was also on the expedition. She screams. You pause just as the blade is coming down upon her nose. You are so relieved it is Jess; you put your knife back in the holster, close your eyes, and hug her. She hugs back. She’s holding on so tight to you. You hear a rustle in front of you and you open your eyes. Three woman (that look like they have been in battle for five years) with guns surround you and Jess.  Jess whispers to you.  “I’m so sorry.” One of the Woman approach you and whisper into your ear how fun it will be to watch you squirm as they cook you. ";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 21//////////////////
void pageTwentyOne()
{
  //Background
  background(5);
  String s = "You Listen more. Still Muffled. But you realize this woman you heard is someone you have never heard before. You hear someone complain as they are hit with something. You hear another voice all of a sudden. It’s a familiar voice. Jess. A friend and other expedition member. She’s calling to you. You say to hell with it and peer out the window ever so slightly to listen more and to see well. As you peer over, you see Jess pass the wall that leads to the doorway and a woman, no a couple women shoving her toward the door. They have machine guns. As time is running out before they search the room, you have to make up your mind. You have a knife and a flash light, you could take the farthest woman in back out and use the gun to get rid of the others....or leave Jess.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Sneak Away and Leave Jess", 10, 250);
  text("Right Click to Hop through window and Take Gun", 10, 280);
}
///////////////////////////PAGE 22//////////////////
void pageTwentyTwo()
{
  //Background
  background(5);
  String s = "Waiting for the Jess and the armed woman to pass, you hop out of the window. You slide down a hill and look back. They have just entered the room. As you turn around to start heading towards the beach, you hear a scream, a shot, and then nothing. You make it to the beach and find a boat and escape";
  text(s, 10, 20, 700, 300);
  
  text("YOU HAVE WON. BUT AT WHAT COST", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 23//////////////////
void pageTwentyThree()
{
  //Background
  background(5);
  String s = "You need to save Jess from these woman. You muster up all the anger and rage you can. You hop over the window ledge, take your knife out. Silently you move in back of the last woman in the line, you slice her jugular but lets out a whimper that alerts Jess and the last woman. You start firing the gun as she does the same. Using the dead woman’s body as cover you begin to back up. Doing so, you trip and fall backwards. Your gun fires upwards and you feel your legs leave your body. You’ve been hit by the woman. She stands over you with Jess. She takes your knife and gun. She looks at the knife and kills Jess. She bends down and stabs you in the hand that once held the gun. You scream in agony. She leans in closer to you and whispers. I’m going to enjoy eating you and your friend here. But I’m going to make you watch me eat her first.";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 24//////////////////
void pageTwentyFour()
{
  //Background
  background(5);
  String s = "You peer over the windows ledge. You see Jess. A friend and a crew of the expedition. She is being pushed forward by a woman holding a machine gun. You have a knife and a flashlight. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Kill Woman", 10, 250);
  text("Right Click to Sneak Away", 10, 280);
}
///////////////////////////PAGE 25//////////////////
void pageTwentyFive()
{
  //Background
  background(5);
  String s = "You hop out of the window. You begin to sneak up behind the woman shoving Jess. With one swoop, you take your knife and stab the woman through the neck. Her gun goes off and nicks Jess's arm. She screams. Just another add on to the gunfire noise you started only seconds ago. Jess Hugs you and you hug her. She tells you there is a boat out of here at the beach just north of here.";
  text(s, 10, 20, 700, 300);
  
  text("YOU HAVE WON", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 26//////////////////
void pageTwentySix()
{
  //Background
  background(5);
  String s = "You turn on the Flashlight and enter the Doorway in front of you. You enter cautiously. The flashlight illuminates a hallway that has been overrun by moss and is riddled with broken ancient pottery. While proceeding down the mossy hallway. You come across a symbol on the hallways wall, but it’s covered up by the moss. You tear the moss off and aim your flashlight. A Bird. The end of the hallway is yet to be seen. (If there even is one.)";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to keep going down Bird Hallway", 10, 250);
  text("Right Click to go back to Lit Door", 10, 280);
}
///////////////////////////PAGE 27//////////////////
void pageTwentySeven()
{
  //Background
  background(5);
  String s = "As you proceed down the Bird Symbol hallway you come across a pedestal. Atop the pedestal lies a bird’s carcass. With no sign of an exit or another path yet; you move forward. Little bones are scattered through the hallway now. “More dead birds?” You ask yourself. Your flashlight makes out an ending to the hallway. You arrive there and it turns left.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to keep going down the Bird Hallway", 10, 250);
  text("Right Click to go back to Lit Door", 10, 280);
}
///////////////////////////PAGE 28//////////////////
void pageTwentyEight()
{
  //Background
  background(5);
  String s = "Flashlight and Knife still in hand you arrive at the corner. Crunch, Crunch, Crunch. You look down as see that there are more bones than moss in this hallway. You see light at the end of this hallway. Another symbol is on the wall of this corner. You flash your light over it. A Bird and a Sun. It could mean a way out. It could mean something else. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to keep going Towards Light", 10, 250);
  text("Right Click to go back to Lit Door", 10, 280);
}
///////////////////////////PAGE 29//////////////////
void pageTwentyNine()
{
  //Background
  background(5);
  String s = "You go towards the light, flashlight in hand aiming forward; you flood the hallway with light. The Moss is disappearing underneath the bone littered hallway but the light at the end is in sight and only a couple of feet away. You are having trouble walking among the remains of the ancient deceased. You begin to step heavily and slowly through what now seem like a foot of ligaments of small animals and other bones you don’t have time to identify correctly nor do you want to. You start to speed up towards the door. As you hustle through the decaying calcium and marrow, your left leg sinks down and you here a rumble behind you. A wall erupts from the bones 10 feet behind you. With your Left leg deep into the pile of bird skulls, you cannot stop it. You find yourself sinking further, this time; your whole body is sinking. Skeletons start to swirl around you as descend into the unknown and the light you once saw fades. You are rushing down a shoot of some kind. You begin to see light dipping in an out of the shoot ahead of you. Looks like moonlight. You pass a pocket where moonlight is protruding. You barely make out anything and see only moonlight through the clouds. There are more pockets coming up.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Grab Pocket", 10, 250);
  text("Right Click to Slide Down Shoot", 10, 280);
}
///////////////////////////PAGE 30//////////////////
void pageThirty()
{
  //Background
  background(5);
  String s = "You are going fast down the shoot but manage to grab on to the next pockets ledge. CRACK. Your left arm has been dislocated by the velocity from the shoot. You pull yourself by sheer willpower to the pocket and pier out its window like structure for a better look. You are on an Island of some sort. You see the beach and a boat docked with its lights on. Above you, a tower of some sort but it seems to be non-accessible by climbing and you are in no condition to climb that. Below you, about ten feet is a cliff edge. You might be able to make the jump onto the Cliffside or you could climb up to the next pocket.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Jump to Cliff", 10, 250);
  text("Right Click to Climb Up to Further up Pocket", 10, 280);
}
///////////////////////////PAGE 31//////////////////
void pageThirtyOne()
{
  //Background
  background(5);
  String s = "You slide down the shoot and begin to regret not grabbing onto anything. The end of the shoot in sight and too late for you to make any saving grace Decisions you see a ravine of bones now clearly visible from the moonlight. A ravine full of bones. You fall into the ravine and scream in the split second agony of imminent death as you feel sharp stabs all over your body. You turn your head and realize you aren’t the only human among the bird bones in the ravine. A human corpse almost fresh lies next to you pierced all over just as you are now. They are wearing a scuba suit just like yours. But most of their flesh doesn’t remain. You drift apart from your body as death welcomes you to his realm.";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 32//////////////////
void pageThirtyTwo()
{
  //Background
  background(5);
  String s = "You take out your knife as it might help you stick the landing and jump. You hit the barely hit the edge of the Cliffside and begin to slip. Your knife is the only thing keeping you on the Cliffside. Your body now dangles over the cliffs edge being held by the only arm you have left. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to try and pull self up", 10, 250);
  text("Right Click to Scream", 10, 280);
}
///////////////////////////PAGE 33//////////////////
void pageThirtyThree()
{
  //Background
  background(5);
  String s = "You managed to climb up to the next pocket. You are now above the cliff and nowhere near the edge. But it is about a 15 foot drop. Down the shoot is clearly not an option";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to jump from here", 10, 250);
  text("Right Click to attempt next pocket up to get back to the hallway", 10, 280);
}
///////////////////////////PAGE 34//////////////////
void pageThirtyFour()
{
  //Background
  background(5);
  String s = "As you try and pull yourself up. The knife begins to wiggle too much. As you struggle to find any footing on the Cliffside, you fall. You see the moonlight pierce through the clouds for the last time. ";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 35//////////////////
void pageThirtyFive()
{
  //Background
  background(5);
  String s = "You Scream for Your Life once again. Just as the knife is about to give, a hand grabs you. Its a beautiful woman, but she’s stronger than she looks. You catch your breath and hold your dislocated arm. As you look up to ask her who she is, you get punched in the face then you feel a sharp pain in your chest. Its your knife. The woman has stabbed you. You ask her why she helped you only to do this. She leans down close to you and looks directly into your eyes while grabbing the knife and rotating and changing the position of it. I didn’t want to waste good meat. She pulls the knife out and slits your throat. ";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 36//////////////////
void pageThirtySix()
{ 
 //Background
  background(5);
  String s = "You Attempt a second Climb but fall back and you slide down the shoot and begin to regret the second attempt with a dislocated arm. The end of the shoot in sight and too late for you to make any saving grace Decisions you see a ravine of bones now clearly visible from the moonlight. A ravine full of bones. You fall into the ravine and scream in the split second agony of imminent death as you feel sharp stabs all over your body. You turn your head and realize you aren’t the only human among the bird bones in the ravine. A human corpse almost fresh lies next to you pierced all over just as you are now. They are wearing a scuba suit just like yours. But most of their flesh doesn’t remain. You drift apart from your body as death welcomes you to his realm ";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 37//////////////////
void pageThirtySeven()
{
  //Background
  background(5);
  String s = "You scoot yourself inside the pocket. The Jump is about 20 or so feet. There are some rocks but mostly grass. You finally jump but land on your shoulder, breaking that completely. But you are on solid land. That is something to be grateful for. You look over at the cliff you avoided just barely and spit in it declaring your victory over it; but still, You are injured slowing down.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to go to boat now", 10, 250);
  text("Right Click to Wait till morning", 10, 280);
}
///////////////////////////PAGE 38//////////////////
void pageThirtyEight()
{
  //Background
  background(5);
  String s = "You trek through the islands jungle and get to the boat. No one is there. You start up the engines and leave.";
  text(s, 10, 20, 700, 300);
  
  
  text("YOU HAVE WON", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 39//////////////////
void pageThirtyNine()
{
  //Background
  background(5);
  String s = "You make your way towards the beach but stop about 30 feet before it. You find a nice little area to blanket yourself overnight with foliage and rocks covering you. You awake to the sounds of gun fire about a foot away from you and dogs barking. Three women appear in front of you. One of them leans down and speaks. We heard you activate the shoot. When we didn’t see you next to your friend in the pit, we figured you must be alive somewhere. We never figured you would be this close. The dogs continue to bark and the two woman look at you as if they are going to kill you and grill you. The woman speaks again. We are glad you didn’t go into the pit. That would have been a hassle and you may have gotten rotten. You fear her meaning behind that. She looks back for a mere seconds and shouts. LOOKS LIKE BREAKFAST IS SERVED! And she stabs you in the jugular.";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 40//////////////////
void pageFourty()
{
  //Background
  background(5);
  String s = "You enter the lit doorway. You turn around to make sure you left nothing behind. As you turn back towards the entrance, you ponder on how you ended up here and how you didn’t drown. You proceed on. Small candles along the walls, one on the opposite side after another, light this hallway fairly well. You might not even have to use your flashlight. You then realize these candles couldn’t have been here this whole time. That wouldn’t make any sense. You realize you are not alone. A chill goes down your spine. You clench your knife and flashlight tightly. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Move Forward", 10, 250);
  text("Right Click to go to Non-Lit Doorway", 10, 280);
}
///////////////////////////PAGE 41//////////////////
void pageFourtyOne()
{
  //Background
  background(5);
  String s = "Continuing past more small light sources, you come across a small gap. It’s tiny enough for you to jump across but you cannot see that far down. Wind billows within the pit and you begin to hear noises; Strange noises. The only way to the light is by leaping over this small gap. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Leap Over Gap", 10, 250);
  text("Right Click to go to Non-Lit Doorway", 10, 280);
}
///////////////////////////PAGE 42//////////////////
void pageFourtyTwo()
{
  //Background
  background(5);
  String s = "Just as you leap across the gap without any hassle, you slip forward, landing on your hands, and kick some small rubble ... Your knife and flashlight fall out of your hands in front of you. Your hands are a bit roughed up but it’s nothing. You begin to gather your knife and flashlight and stand up straight again. You realize you never heard the small pieces of rubble hit the ground. You think wow that must be deep. More odd noises project upwards towards you from the pit. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Go down the Hallway", 10, 250);
  text("Right Click to Peer Over Gap w/Flashlight", 10, 280);
}
///////////////////////////PAGE 43//////////////////
void pageFourtyThree()
{
  //Background
  background(5);
  String s = "Finally at the end of the hall you feel a sense of relief as you begin to see moonlight hitting the beginning of a staircase that heads upward. Fresh air blows through and you take a deep breath. As you exit the staircase, a step tile below you descends and you rush to move your legs as the entrance to the Hallway disappears underneath a door that was embedded within the earth. You can’t go back, but you are outside and that’s something to be thankful for. You gather your bearings. You are atop a tower-like structure. You can see everything from this angle. (Full 360) You are on an island. There is a ship docked on the beach with lights on. Could be a way off this island and back to civilization. You hear rustles in the far distance. You begin to crawl towards the edge of the tower staying as low as you can in case of being seen. You see a light coming from the forest in front of you. There is yelling and then gun shots. You fear the worst. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Traverse the Jungle at Night", 10, 250);
  text("Right Click to wait till Morning", 10, 280);
}
///////////////////////////PAGE 44//////////////////
void pageFourtyFour()
{
  //Background
  background(5);
  String s = "You struggle through it. You trek through the islands jungle and get to the boat. No one is there. You start it up the engines and leave.";
  text(s, 10, 20, 700, 300);
  
  text("YOU HAVE WON", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 45//////////////////
void pageFourtyFive()
{
  //Background
  background(5);
  String s = "Tired and aching, you awake to the shouting you heard last night. This time it is right in front of you and brings with it a sharp stab that wakes you out of your silent slumber. A woman in front of you speaks slowly and assertively into your ear. “I can’t wait to taste you foreigner.” You slowly drift away as the woman retracts the knife from your chest and stabs the same spot again but with greater force than before. ";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 46//////////////////
void pageFourtySix()
{
  //Background
  background(5);
  String s = "You turn on your flashlight take a deep breath. You aim the flashlight into the gap very slowly. Aiming lower and lower till the light penetrates the dark as far as it can. The gap is deep; really deep. As you turn around back towards the light at the end, your foot knocks over another small piece of rubble. You watch it go down the pit. The odd noise stops. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Proceed Down Hallway", 10, 250);
  text("Right Click to Move a couple steps from the pit and Stop Moving", 10, 280);
}
///////////////////////////PAGE 47//////////////////
void pageFourtySeven()
{
  //Background
  background(5);
  String s = "You stop moving. You start to hear sounds coming from the pit. The room shakes every so slightly as whatever is in the pit ascends to you.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Keep Still", 10, 250);
  text("Right Click to Run down the hall", 10, 280);
}
///////////////////////////PAGE 48//////////////////
void pageFourtyEight()
{
  //Background
  background(5);
  String s = "Finally at the end of the hall you feel a sense of relief as you begin to see moonlight hitting the beginning of a staircase that heads upward. Suddenly, you hear a horrid screech come from behind. The hall shakes as you run upward as fast as you can. Your leg is snagged from under you and you fall face first into the staircase. Mouth and forehead bleeding you know something is dragging you; something big. You turn to see a giant monster with spider like limbs and giant white eyes and jagged yellow teeth with bird bones sticking between them. It drags you back through the hallway bashing you back and forth against the walls. Seconds left before you descend into the pit with it you, you fight.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to use Flashlight and Knife", 10, 250);
  text("Right Click to try and Grab something", 10, 280);
}
///////////////////////////PAGE 49//////////////////
void pageFourtyNine()
{
  //Background
  background(5);
  String s = "Shining the light into the creatures white eyes and holding your knife as best you can with broken ribs and assured concussions, you take a swing at the creature’s limbs that are keeping you captive. The Creature gets hit and it’s blinded temporarily. It stops dragging you as you cut its arm and proceeds to bash you with its other appendages bring you up towards its face and slams you onto the ground bashing your head in. It slowly recovers from being blinded and drags you slowly from the moonlight into the darkness. ";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 50//////////////////
void pageFifty()
{
  //Background
  background(5);
  String s = "You manage to grab onto something, but your leg is bleeding a lot and this monster whatever it is, is not giving up";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Throw Knife", 10, 250);
  text("Right Click to Throw Flash Light", 10, 280);
}
///////////////////////////PAGE 51//////////////////
void pageFiftyOne()
{
  //Background
  background(5);
  String s = "You throw the knife at it in a flurry but it is for naught: this just makes the creature even more violent. It proceeds to rip off your leg and beat you senseless until your body is moosh.";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 52//////////////////
void pageFiftyTwo()
{
  //Background
  background(5);
  String s = "You throw the flashlight at the creature which blinds it temporarily, just enough time to get free the creature is still recovering from its eyes being hurt by the light. ";
  text(s, 10, 20, 700, 300);
  
  text("Left Throw Knife", 10, 250);
  text("Right Click to Run", 10, 280);
}
///////////////////////////PAGE 53//////////////////
void pageFiftyThree()
{
  //Background
  background(5);
  String s = "You throw the knife at its head. It screeches in agony. You rush towards it, take out your knife and keep stabbing it. The creature fights back and knocks your leg against a wall and breaks it. You stab it more times than this monster could harm you. It slowly dies. You’ve put up a tremendous effort, but at some loss. Your Leg is broken from the impact. But at least you’re alive. ";
  text(s, 10, 20, 700, 300);
  
  text("YOU HAVE WON", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 54//////////////////
void pageFiftyFour()
{
  //Background
  background(5);
  String s = "You start running as fast as you possibly can. Turning the corners and using the walls as springs to rush through. The hall shakes and the screeches get louder. You need to get out. You see the exit: filled with moonlight and the cold. As you exit the staircase, you feel your leg being pushed up from underneath you. You are flung onto a hill near the exit. The creature approaches you with its mouth wide open, ready to beat and play with you: its food. The monster raises his appendage up and brings it down hard into your leg as you scream in anger and fear. You begin to scream. From out of nowhere woman with machine guns come out of the blackness of the jungle and wage war with this monster. It dislikes you now they have made them a more interesting selection of dinner choices.  ";
  text(s, 10, 20, 700, 300);
  
  text("YOU HAVE WON", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 55//////////////////
void pageFiftyFive()
{
  //Background
  background(5);
  String s = "You keep still longer. The Noise has intensified and the shaking of the room has engulfed the whole hallway. From out of the pit comes a giant monster with spider-like limbs and giant white eyes and jagged yellow teeth with bird bones sticking between them. It begins to hiss loudly. It’s looking for something. You.";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Keep Still", 10, 250);
  text("Right Click to Lunge at its Head", 10, 280);
}
///////////////////////////PAGE 56//////////////////
void pageFiftySix()
{
  //Background
  background(5);
  String s = "You start running as fast as you possibly can. Turning the corners and using the walls as springs to rush through. The hall shakes and the screeches get louder. You need to get out. But the creature is too fast It comes up behind you and sweeps your legs from under you. It hisses again as it is about to end you.";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 57//////////////////
void pageFiftySeven()
{
  //Background
  background(5);
  String s = "You Keep still. You and the Monster both hear gun shots come from the end of the hall. The Monster Rushes towards the sounds of the guns. You begin to hear screams and more gun fire. You may infer that the monster has taken care of the people who were here. You take a deep breath and sigh in relief. You have survived the monster. You begin to exit cautiously from the Hallway. You then start to hear little clutter noises from the pit again. The sounds are already behind you. You turn around to see seven little monsters. They all hiss together in the most excruciating harmonization. They attack you from all sides and devour you bones.";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 58//////////////////
void pageFiftyEight()
{
  //Background
  background(5);
  String s = "You Lunge at the monster with all your might. It screeches in agony. You rush towards it again, take out your knife and keep stabbing it. The creature fights tries to fight back but the its brain has been destroyed already. Sigh of relief falling over you, you proceed on. On through this horrible hallway. Finally at the end of the hall you feel a sense of relief as you begin to see moonlight hitting the beginning of a staircase that heads upward. Fresh air blows through and you take a deep breath. As you exit the staircase, a step tile below you descends and you rush to move your legs as the entrance to the Bird and Sun Hallway disappears underneath a door that was embedded within the earth. You can’t go back, but you are outside and that’s something to be thankful for. You gather your bearings. You are atop a tower like structure. You can see everything from this angle. (Full 360) You are on an island. There is a ship docked on the beach with lights on. Could be a way off this island and back to civilization. You hear rustles in the far distance. You begin to crawl towards the edge of the tower staying as low as you can in case of being seen. You see a light coming from the forest in front of you. There is yelling and then gun shots. You fear the worst.  ";
  text(s, 10, 20, 700, 300);
  
  text("Left Click to Leave the Tower Now", 10, 250);
  text("Right Click to Wait till Morning", 10, 280);
}
///////////////////////////PAGE 59//////////////////
void pageFiftyNine()
{
  //Background
  background(5);
  String s = "You leave the tower now and arrive on the beach within a half hour or so. No one is around. Which makes you worry and happy all at the same time. Maybe these people are dealing with more of those monsters. You say to hell with that and hop on the boat and leave this retched place behind.";
  text(s, 10, 20, 700, 300);
  
  text("YOU HAVE WON", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 60//////////////////
void pageSixty()
{
  //Background
  background(5);
  String s = "Tired and aching, you awake to the shouting you heard last night. This time it is right in front of you and brings with it a sharp stab that wakes you out of your silent slumber. A woman in front of you speaks slowly and assertively into your ear. “I can’t wait to taste you foreigner.” You slowly drift away as the woman retracts the knife from your chest and stabs the same spot again but with greater force than before.  ";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 61//////////////////
void pageSixtyOne()
{
  //Background
  background(5);
  String s = "As the light flickers more rapidly, the shark continues to come toward you. You stab it directly in the head. Its jaws being taller than your arm length take your arm holding the flash light. You continue to stab and kill it. Blood fills the room and visibility becomes horribly dark. The flashlight is nowhere to be found as you attempt to search the hallways floor. You feel a rush past you. You feel the flashlight finally and you turn it on. Two more sharks appear from the flickery blood bath you are now in and they rip you apart. ";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}
///////////////////////////PAGE 62//////////////////
void pageSixtyTwo()
{
  //Background
  background(5);
  String s = "You swim as fast as you can down the hall but it is all for naught. The blood trail from Clark has alerted a pack of sharks to you and they maul you viciously. You took more than one shark with you to hell but the blood loss is to much. Your body is now a part of Davy Jones locker.";
  text(s, 10, 20, 700, 300);
  
  text("YOU ARE DEAD - GAME OVER", 10, 230);
  text("Left Click to Restart", 10, 250);
  text("Right Click to Restart", 10, 280);
}

