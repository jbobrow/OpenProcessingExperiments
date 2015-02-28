
int prevSec;
int millisRolloverTime;
int mins;
int numberHours;
//library images
PImage library;
PImage openbook;
PImage stack1;
PImage stack2;
PImage stack3;
PImage stack4;
PImage stack5;
PImage stack6;
PImage stack7;
PImage stack8;
PImage iliad3;
PImage iliad6;
PImage iliad9;
PImage iliad12;
//Declare Variables
//int min = duration of minutes
//int setHours = number of hours 
//int millisRolloverTime = find current millisecond
//int prevSec = previous second value
String w[]={"Pg 1 Beware you lose the substance", "Pg 2 This is not a book. This", "Pg 3 When people show you who they", "Pg 4 What you do speaks so loudly", "Pg 5 If you have no character" };
String w2[]={"by grasping at the shadow", "is libel, slander, a gob of spit", "are, belive them the first time", "I cannont hear what you say", "to loose, people loose faith in you"  };

void setup() {
  size(965, 650);
  smooth();
  millisRolloverTime = 0;
  mins = 60;
  numberHours = hour();
  openbook = loadImage("openbook.png");
  stack1 = loadImage("stack1.png");
  stack2 = loadImage("stack2.png");
  stack3 = loadImage("stack3.png");
  stack4 = loadImage("stack4.png");
  stack5 = loadImage("stack5.png");
  stack6 = loadImage("stack6.png");
  stack7 = loadImage("stack7.png");
  stack8 = loadImage("stack8.png");
  iliad3 = loadImage("iliad3.png");
  iliad6 = loadImage("iliad6.png");
  iliad9 = loadImage("iliad9.png");
  iliad12 = loadImage("iliad12.png");
  library = loadImage("library.jpg");
}

void draw() {
  imageMode (CENTER);
  background (loadImage("library.jpg"));

  // Fetch the current time
  int H = hour();
  int M = minute();
  int S = second();
  // Reckon the current millisecond, 
  // particularly if the second has rolled over.
  // Note that this is more correct than using millis()%1000;
  if (prevSec != S) {
    millisRolloverTime = millis();
  } 
  prevSec = S;
  int mils = millis() - millisRolloverTime;

  //WRITE TEXT
  image (openbook, width/2, 280);
  float words = map(mils, 0, 1000.0, 410, 435);
  fill(#400505);
  textAlign(LEFT);

  
  int wchoice=minute()%w.length;
  text(w[wchoice].substring(0,(int)map(second(),0,60,1,w[wchoice].length())), 420, 240, 60, 100);
  
  textAlign(RIGHT);
  float words2 = map(mils, 0, 1000.0, 410, 435);

  fill(#DE0D0D);
  int w2choice=minute()%w2.length;
  text(w2[w2choice].substring(0,(int)map(second(),0,60,1,w2[w2choice].length())), 494, 248, 60, 100);

//hour bits coded with help from Sarah Keeling's Coffee Clock; thank you Sarah!
  //12:00 
  
  if (H == 0) {
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    image(stack6, 655, 276);
    image(iliad9, 680, 260);
    image(stack7, 670, 233);
    image(stack8, 656, 215);
    image(iliad12, 670, 195);
  }
 
//1 AMZZZ  
  if (H == 1) {
     image(stack1, 300, 320);
  }
  
  if(H == 2){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
  }
  
  if (H == 3){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
  }
    
  if (H == 4){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
  }
  
  if (H == 5){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
}
if (H == 6){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    }
    
if(H == 7){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    }
    
if (H == 8){
   image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    image(stack6, 655, 276);
    }
    
if( H == 9){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    image(stack6, 655, 276);
    image(iliad9, 680, 260);
    }
if( H == 10){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    image(stack6, 655, 276);
    image(iliad9, 680, 260);
    image(stack7, 670, 233);
    }
if (H == 11){
   image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    image(stack6, 655, 276);
    image(iliad9, 680, 260);
    image(stack7, 670, 233);
    image(stack8, 656, 215);
    }
    
if (H ==12){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    image(stack6, 655, 276);
    image(iliad9, 680, 260);
    image(stack7, 670, 233);
    image(stack8, 656, 215);
    image(iliad12, 670, 195);
}

//PMZZZZZ
 if (H == 23){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    image(stack6, 655, 276);
    image(iliad9, 680, 260);
    image(stack7, 670, 233);
    image(stack8, 656, 215);  
} 
  if (H == 22){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    image(stack6, 655, 276);
    image(iliad9, 680, 260);
    image(stack7, 670, 233);
} 
  if (H == 21){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    image(stack6, 655, 276);
    image(iliad9, 680, 260);
} 
  if (H == 20){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
    image(stack6, 655, 276);
} 
  if(H == 19){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
    image(stack4, 660, 295);
} 
  if(H == 18){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
    image(iliad6, 670, 320);
} 
  if(H == 17){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
    image(stack5, 300, 240);
} 
  if(H == 16){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
    image(stack3, 300, 265);
} 
  if(H == 15){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
    image(iliad3, 310, 290);
}
  if(H == 14){
    image(stack1, 300, 320);
    image(stack2, 280, 305);
} 
  if(H == 13){
  image(stack1, 300, 320);
}

//Night filter
if (H >=12){
     fill(0, 175);
     rect(0, 0, 965, 650); 
  }
  
}


