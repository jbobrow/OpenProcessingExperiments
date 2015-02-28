
//house narrative
int time = 0;
int room = 0;
int state = 0;
//rooms are as follows
//room 0 = sons room
//room 1 = daughters room
//room 2 = parents room
//room 3 = attic
//room 4 = kitchen
//room 5 = living room
//room 6 = basement
//room 7 = garage

PImage title1;
PImage title2;

Room0 room0;
Room1 room1;
Room2 room2;
Room3 room3;
Room4 room4;
Room5 room5;
Room6 room6;
Room7 room7;

Clock clock;

Navigator nav;

void setup(){
  size(640,480);
  smooth();
  
  clock = new Clock(12, 384);
  nav = new Navigator(496, 380);
  
  room0 = new Room0();
  room1 = new Room1();
  room2 = new Room2();
  room3 = new Room3();
  room4 = new Room4();
  room5 = new Room5();
  room6 = new Room6();
  room7 = new Room7();
  
  title1 = loadImage("title1.png");
  title2 = loadImage("title2.png");
  
}

void draw(){
  
  if(state == 0){
    image(title1, 0, 0); 
  }
  
  if(state == 1){
    image(title2, 0, 0);
    nav.xpos = 260;
    nav.ypos = 312;
    nav.update();
  }
  
  if(time > 23){
    time = 0; 
  }
  if(time < 0){
    time = 23; 
  }
  
  if(state > 1){
    
    nav.xpos = 496;
    nav.ypos = 380;
  
    room0.update();
    room1.update();
    room2.update();
    room3.update();
    room4.update();
    room5.update();
    room6.update();
    room7.update();
    
    clock.update();
    nav.update();
  
  }
  
  
} 

void keyReleased(){
  if (key == CODED){
    if(keyCode == UP){
      time = time+1;
    }
    if(keyCode == DOWN){
      time = time-1; 
    }
  }
  
}//end keypressed

void mouseReleased(){
  if(state < 2){
    state ++;
  }
  
  if(state > 0){
    if(mouseX > nav.xpos + 8 && mouseX < nav.xpos + 99 && mouseY > nav.ypos + 8 && mouseY < nav.ypos + 27){
      room = 3;
      time++;
    }
    if(mouseX > nav.xpos + 8 && mouseX < nav.xpos + 35 && mouseY > nav.ypos + 32 && mouseY < nav.ypos + 47){
      room = 0;
      time++; 
    }
    if(mouseX > nav.xpos + 40 && mouseX < nav.xpos + 67 && mouseY > nav.ypos + 32 && mouseY < nav.ypos + 47){
      room = 1;
      time++;
    }
    if(mouseX > nav.xpos + 72 && mouseX < nav.xpos + 99 && mouseY > nav.ypos + 32 && mouseY < nav.ypos + 47){
      room = 2;
      time++; 
    }
    if(mouseX > nav.xpos + 8 && mouseX < nav.xpos + 55 && mouseY > nav.ypos + 52 && mouseY < nav.ypos + 67){
      room = 5; 
      time++;
    }
    if(mouseX > nav.xpos + 60 && mouseX < nav.xpos + 99 && mouseY > nav.ypos + 52 && mouseY < nav.ypos + 67){
      room = 4; 
      time++;
    }
    if(mouseX > nav.xpos + 104 && mouseX < nav.xpos + 131 && mouseY > nav.ypos + 52 && mouseY < nav.ypos + 67){
      room = 7; 
      time++;
    }
    if(mouseX > nav.xpos + 8 && mouseX < nav.xpos + 99 && mouseY > nav.ypos + 72 && mouseY < nav.ypos + 87){
      room = 6;
      time++;
    }
  }
}//end mouseReleased
//Clock Class

class Clock{
  
  PImage clock_1;
  PImage clock_2;
  PImage clock_3;
  PImage clock_4;
  PImage clock_5;
  PImage clock_6;
  PImage clock_7;
  PImage clock_8;
  PImage clock_9;
  PImage clock_10;
  PImage clock_11;
  PImage clock_12;
  
  
  int xpos;
  int ypos;
  
  Clock(int X, int Y){
    xpos = X;
    ypos = Y;
    
    clock_1 = loadImage("clock_1.png");
    clock_2 = loadImage("clock_2.png");
    clock_3 = loadImage("clock_3.png");
    clock_4 = loadImage("clock_4.png");
    clock_5 = loadImage("clock_5.png");
    clock_6 = loadImage("clock_6.png");
    clock_7 = loadImage("clock_7.png");
    clock_8 = loadImage("clock_8.png");
    clock_9 = loadImage("clock_9.png");
    clock_10 = loadImage("clock_10.png");
    clock_11 = loadImage("clock_11.png");
    clock_12 = loadImage("clock_12.png");
    
  }//end constructor
    
  void update(){
    
    if(time == 1){
      image(clock_1, xpos, ypos);
    }
    if(time == 2){
      image(clock_2, xpos, ypos);
    }
    if(time == 3){
      image(clock_3, xpos, ypos);
    }
    if(time == 4){
      image(clock_4, xpos, ypos);
    }
    if(time == 5){
      image(clock_5, xpos, ypos);
    }
    if(time == 6){
      image(clock_6, xpos, ypos);
    }
    if(time == 7){
      image(clock_7, xpos, ypos);
    }
    if(time == 8){
      image(clock_8, xpos, ypos);
    }
    if(time == 9){
      image(clock_9, xpos, ypos);
    }
    if(time == 10){
      image(clock_10, xpos, ypos);
    }
    if(time == 11){
      image(clock_11, xpos, ypos);
    }
    if(time == 12){
      image(clock_12, xpos, ypos);
    }
    if(time == 13){
      image(clock_1, xpos, ypos);
    }
    if(time == 14){
      image(clock_2, xpos, ypos);
    }
    if(time == 15){
      image(clock_3, xpos, ypos);
    }
    if(time == 16){
      image(clock_4, xpos, ypos);
    }
    if(time == 17){
      image(clock_5, xpos, ypos);
    }
    if(time == 18){
      image(clock_6, xpos, ypos);
    }
    if(time == 19){
      image(clock_7, xpos, ypos);
    }
    if(time == 20){
      image(clock_8, xpos, ypos);
    }
    if(time == 21){
      image(clock_9, xpos, ypos);
    }
    if(time == 22){
      image(clock_10, xpos, ypos);
    }
    if(time == 23){
      image(clock_11, xpos, ypos);
    }
    if(time == 0){
      image(clock_12, xpos, ypos);
    }
  }//end update
  
  
}//end cover
//Navigator Class

class Navigator{
  
  PImage house; 
  
  int xpos = 0;
  int ypos = 0;
  
  Navigator(int X, int Y){
    xpos = X;
    ypos = Y;
    
    house = loadImage("house.png");
    
  }//end constructor
    
  void update(){
    image(house, xpos, ypos);

    
  }//end update
  
  
}//end cover

/*void mouseReleased(){
  if(mouseX > 8 && mouseX < 99 && mouseY > 8 && mouseY < 27){
    room = 3; 
  }
}//end mouseReleased*/

//Room0 Class

class Room0{
  
  PImage srEmpty; 
  PImage srHomework; 
  PImage srReading; 
  PImage srWriting; 
  PImage srSleeping; 
  
  int xpos = 0;
  int ypos = 0;
  
  Room0(){
    
    srEmpty = loadImage("sons_room_empty.png");
    srHomework = loadImage("sons_room_homework.png");
    srReading = loadImage("sons_room_reading.png");
    srWriting = loadImage("sons_room_writing.png");
    srSleeping = loadImage("sons_room_sleeping.png");
    
  }//end constructor
    
  void update(){
    if(room == 0){
      if(time >= 3 && time <= 6){
        image(srSleeping,0,0);
      }
      if(time >= 7 && time <= 15){
        image(srEmpty,0,0);
      }
      if(time >= 16 && time <= 18){
        image(srReading,0,0);
      }
      if(time == 19){
        image(srEmpty,0,0); 
      }
      if(time >= 20 && time <= 22){
        image(srHomework,0,0);
      }
      if((time >= 23)||(time >= 0 && time <= 2)){
        image(srWriting,0,0);
      }
    }

    
  }//end update
  
  
}//end Room0

//Room1 Class
//room1 class, aka Daughters room
class Room1{
  
  PImage drEmpty; 
  PImage drReading; 
  PImage drSleeping;  
  
  int xpos = 0;
  int ypos = 0;
  
  Room1(){
    
    drEmpty = loadImage("daughters_room_empty.png");
    drReading = loadImage("daughters_room_reading.png");
    drSleeping = loadImage("daughters_room_sleeping.png");
    
  }//end constructor
    
  void update(){
    if(room == 1){
      if((time >= 0 && time <= 2)||(time >= 21 && time <= 24)){
        image(drSleeping,0,0);
      }
      if(time >= 3 && time <= 19){
        image(drEmpty,0,0);
      }
      if(time ==20){
        image(drReading,0,0); 
      }
    }//end room check

    
  }//end update
  
  
}//end Room1

//Room2 Class
//room2 class, aka parents room
class Room2{
  
  PImage prEmpty; 
  PImage prMomSleeping; 
  PImage prDadSleeping;
  PImage prBothSleeping;  
  
  int xpos = 0;
  int ypos = 0;
  
  Room2(){
    
    prEmpty = loadImage("parents_room_empty.png");
    prMomSleeping = loadImage("parents_room_mom_sleeping.png");
    prDadSleeping = loadImage("parents_room_dad_sleeping.png");
    prBothSleeping = loadImage("parents_room_both_sleeping.png");
    
  }//end constructor
    
  void update(){
    if(room == 2){
      if((time >= 0 && time <= 5)||(time >= 23 && time <= 24)){
        image(prBothSleeping,0,0);
      }
      if(time == 6){
        image(prDadSleeping,0,0); 
      }
      if(time >= 7 && time <= 22){
        image(prEmpty,0,0); 
      }
      
    }//end room check

    
  }//end update
  
  
}//end Room2

//Room3 Class
//room3 class, aka Attic
class Room3{
  
  PImage aDaughterTelescope; 
  PImage aEmpty; 
 
  
  int xpos = 0;
  int ypos = 0;
  
  Room3(){
    
    aDaughterTelescope = loadImage("attic_daughter_telescope.png");
    aEmpty = loadImage("attic_empty.png");
    
  }//end constructor
    
  void update(){
    if(room == 3){
      if(time >= 3 && time <= 6){
        image(aDaughterTelescope, 0,0); 
      }
      else{
        image(aEmpty, 0, 0); 
      }
      
    }//end room check

    
  }//end update
  
  
}//end Room3

//Room4 Class
//room4 class, aka kitchen
class Room4{
  
  PImage kDadCook;
  PImage kEmpty;
  PImage kAllEating;
 
  
  int xpos = 0;
  int ypos = 0;
  
  Room4(){
    
    kDadCook = loadImage("kitchen_dad_cooking.png");
    kEmpty = loadImage("kitchen_empty.png");
    kAllEating = loadImage("kitchen_everyone_eating.png");
    
  }//end constructor
    
  void update(){
    if(room == 4){
      if(time == 7 || time == 19){
        image(kAllEating, 0, 0); 
      }
      if(time == 17 || time == 18){
        image(kDadCook, 0, 0); 
      }
      if(time != 17 && time !=18 && time !=7 && time !=19){
        image(kEmpty, 0, 0); 
      }
      
    }//end room check

    
  }//end update
  
  
}//end Room4

//Room5 Class
//room5 class, aka living Room
class Room5{
  
  PImage lrDaughterHomework;
  PImage lrEmpty;
  PImage lrMotherDaughterTV;
 
  
  int xpos = 0;
  int ypos = 0;
  
  Room5(){
    
    lrDaughterHomework = loadImage("living_room_daughter_homework.png");
    lrEmpty = loadImage("living_room_empty.png");
    lrMotherDaughterTV = loadImage("living_room_mother_daughter_tv.png");
    
  }//end constructor
    
  void update(){
    if(room == 5){
      if(time == 15 || time == 16 || time == 17){
        image(lrDaughterHomework, 0, 0); 
      }
      else if(time == 18){
        image(lrMotherDaughterTV, 0, 0); 
      }
      else{
        image(lrEmpty, 0, 0); 
      }
      
      
    }//end room check

    
  }//end update
  
  
}//end Room5

//Room6 Class
//room6 class, aka basement
class Room6{
  
  PImage bEmpty;
  PImage bPainting;
 
  
  int xpos = 0;
  int ypos = 0;
  
  Room6(){
    
    bEmpty = loadImage("basement_empty.png");
    bPainting = loadImage("basement_mom_painting.png");
    
  }//end constructor
    
  void update(){
    if(room == 6){
      if(time >= 20 && time <= 23){
         image(bPainting, 0, 0);
      }
      else{
        image(bEmpty, 0, 0); 
      }
      
      
    }//end room check

    
  }//end update
  
  
}//end Room6

//Room7 Class
//room7 class, aka garage
class Room7{
  
  PImage gEmptyBefore;
  PImage gWorking;
  PImage gEmptyAfter;
 
  
  int xpos = 0;
  int ypos = 0;
  
  Room7(){
    
    gEmptyBefore = loadImage("garage_before_war_machines.png");
    gWorking = loadImage("garage_dad_building.png");
    gEmptyAfter = loadImage("garage_war_machines.png");
    
  }//end constructor
    
  void update(){
    if(room == 7){
      if(time >= 0 && time <= 19){
        image(gEmptyBefore, 0, 0); 
      }
      else{
        image(gWorking, 0, 0); 
      }
      
      
    }//end room check

    
  }//end update
  
  
}//end Room7



