
PImage bathroomdoor;
PImage danceWithGirl;
PImage drinkWithGirl;
PImage drinkWithGirl2;
PImage drinkSelf;
PImage drinkSelfBystanders;
PImage headInToilet;
PImage inLine;
PImage inLine1;
PImage inLine2;
PImage inLine4;
PImage inLine5;
PImage inLineBouncer;
PImage inLineDoor;
PImage bouncer;
PImage mainFloor;
PImage mainFloorbartender;
PImage mainFloordoor;
PImage mainFloorgirls;
PImage meetsGirls;
PImage meetsGirlsLeft;
PImage meetsGirlsRight;
PImage rejected;
PImage sleepWithGirl;
PImage sleepAlone;
PImage urinal;

PFont font;

int thrownOut;
int rejectedByGirl;

boolean PNP;

PImage [] images;

int count;
int midx;
int midy;
int state;
int numDrinks;

void setup(){
 size(500, 350);
 
 font = loadFont("Aharoni-Bold-20.vlw");
 
 bathroomdoor = loadImage("bathroomdoor.jpg");
 danceWithGirl = loadImage("dance_with_girl.jpg");
 drinkWithGirl = loadImage("drink_with_girl.jpg");
 drinkWithGirl2 = loadImage("drink_with_girl2.jpg");
 drinkSelf = loadImage("drink_self.jpg");
 drinkSelfBystanders = loadImage("drink_self_bystander.jpg");
 headInToilet = loadImage("head_in_toilet.jpg");
 inLine = loadImage("inLineWhite.jpg");
 inLine1 = loadImage("inLineWhite1.jpg");
 inLine2 = loadImage("inLineWhite2.jpg");
 inLine4 = loadImage("inLineWhite4.jpg");
 inLine5 = loadImage("inLineWhite5.jpg");
 inLineBouncer = loadImage("inLineWhitebouncer.jpg");
 inLineDoor = loadImage("inLineWhitedoor.jpg");
 bouncer = loadImage("bouncer.jpg");
 mainFloor = loadImage("mainFloor.jpg");
 mainFloorbartender = loadImage("mainFloor_bartender.jpg");
 mainFloordoor = loadImage("mainFloor_door.jpg");
 mainFloorgirls = loadImage("mainFloor_girls.jpg");
 meetsGirls = loadImage("meets_girls.jpg");
 meetsGirlsLeft = loadImage("meets_girls_left.jpg");
 meetsGirlsRight = loadImage("meets_girls_right.jpg");
 rejected = loadImage("rejected.jpg");
 sleepWithGirl = loadImage("sleep_with_girl.jpg");
 sleepAlone = loadImage("sleeping_alone.jpg");
 urinal = loadImage("urinal.jpg");
 
 PNP = false;
 images = new PImage[26];
 images[0] = inLine;
 images[1] = danceWithGirl;
 images[2] = headInToilet;
 images[3] = bathroomdoor;
 images[4] = bouncer;
 images[5] = meetsGirls;
 images[6] = rejected;
 images[7] = sleepWithGirl;
 images[8] = sleepAlone;
 images[9] = mainFloor;
 images[10] = urinal;
 images[11] = drinkWithGirl;
 images[12] = mainFloorbartender;
 images[13] = mainFloordoor;
 images[14] = mainFloorgirls;
 images[15] = drinkWithGirl2;
 images[16] = drinkSelf;
 images[17] = drinkSelfBystanders;
 images[18] = inLine1;
 images[19] = inLine2;
 images[20] = inLine4;
 images[21] = inLine5;
 images[22] = inLineBouncer;
 images[23] = inLineDoor;
 images[24] = meetsGirlsLeft;
 images[25] = meetsGirlsRight;
 
 count = 0;
 state = 0;
 numDrinks = 0;
 thrownOut = 0;
 rejectedByGirl = 0;
 
 midx = width/2;
 midy = height/2;
 
 imageMode(CENTER);
 textAlign( CENTER, CENTER);
 textFont(font);
 
}

void inLine(){
  image(images[0], midx, midy, 500, 350); 
  
  // been thrown out
  if( mouseX > 136 && mouseX < 164){
      if( mouseY > 97  && mouseY < 235){ 
       
       if( thrownOut > 0) 
        text("Back here again...", 300, height/4);
      }
  }
  
  // highlight door;
  if( mouseX > 48 && mouseX < 102){
      if( mouseY > 58  && mouseY < 225){    
    // highlight door;
        image(images[23], midx, midy, 500, 350); 
     if( mousePressed  && PNP == false)
      state = 1; 
  }
  }
   // highlight bouncer;
   if( mouseX > 26 && mouseX < 59){
      if( mouseY > 97  && mouseY < 262){    
    
        image(images[22], midx, midy, 500, 350); 
        
        if( thrownOut == 0)
        text("Have your ids out please!", 300, height/4);
        
        if( thrownOut > 0)
        text("Didn't I just throw you out?...", 300, height/4);

  }
  }
  
  // highlight person 1;
   if( mouseX > 104 && mouseX < 132){
      if( mouseY > 122  && mouseY < 238){    
    
        image(images[18], midx, midy, 500, 350); 
        
        if( thrownOut == 0)
        text("I'm over twenty-one at 12!!\n Let me in!", 300, height/4);
        
        if( thrownOut > 0)
        text("Only 10 more minutes...", 300, height/4);
  }
  }
  // highlight person 2;
   if( mouseX > 169 && mouseX < 190){
      if( mouseY > 109  && mouseY < 241){    
    
        image(images[19], midx, midy, 500, 350); 
        
        if( thrownOut == 0)
         text("two + two = five...", 300, height/4);
         
        if( thrownOut > 0)
         text("No wait... two + two = four...", 300, height/4);
  }
  }
  
  // highlight person 4;
   if( mouseX > 224 && mouseX < 245){
      if( mouseY > 114  && mouseY < 237){    
    
        image(images[20], midx, midy, 500, 350); 
        
        if( thrownOut == 0)
        text("four people in front of me? \n only ten hours to go...", 300, height/5);
        
        if( thrownOut > 0)
        text("STOP CUTTING ME!!", 300, height/5);
  }
  }
  // highlight person 5;
   if( mouseX > 443 && mouseX < 463){
      if( mouseY > 114  && mouseY < 237){    
    
        image(images[21], midx, midy, 500, 350); 
        
        if( thrownOut == 0)
         text("Maybe I should go home \n How I met your Mother's \non in ten minutes...", 300, height/5);
         
        if( thrownOut > 0)
         text("time to use Barney's moves... ", 300, height/5);
  }
  }
  
}

void bouncer(){
  image(images[4], midx, midy, 500, 350); 
  
  if( mouseX > 120 && mouseX < 380){
    if( mouseY > 45 && mouseY < 320 ){
     if( mousePressed  && PNP == false)
      state = 2; 
  }
  }
}

void sleepAlone(){
  image(images[8], midx, midy, 500, 350); 
  text("YOU LOSE, TRY AGAIN?", 380, 220);
  if( mousePressed  && PNP == false){
      rejectedByGirl =0;
      numDrinks = 0;
      thrownOut = 0;
      state = 0; 
  }
}

void mainFloor(){
  image(images[9], midx, midy, 500, 350); 
  
  // mouse on girls
  if( mouseX > 67 && mouseX < 195){
    if( mouseY > 100 && mouseY < 345 ){
      image(images[14], midx, midy, 500, 350); 
      
      if( numDrinks < 3)
      text("How are you?", width/4, height/5);
      
      if( numDrinks > 2 && numDrinks <  6)
      text("Hello there!", width/4, height/5);
      
      if( numDrinks >=6)
      text("Umm... get away you creep!", width/3, height/5);
      
     if( mousePressed && PNP == false)
      state = 3; 
  }
  }
  
  //mouse on bathroom door
  if( mouseX > 210 && mouseX < 245){
    if( mouseY > 104 && mouseY < 180 ){
      image(images[13], midx, midy, 500, 350); 
     if( mousePressed  && PNP == false)
      state = 8; 
  }
  }
  
  // mouse on bartender
  if( mouseX > 380 && mouseX < 460){
    if( mouseY > 70 && mouseY < 210 ){
      image(images[12], midx, midy, 500, 350); 
      if( numDrinks < 6)
      text("What will you be having today?", width/2, height/3);
      
      if( numDrinks >= 6)
      text("I think you've had enough for tonight....", width/2, height/3);
     if( mousePressed  && PNP == false){
      state = 7; 
      numDrinks++;
     }
  }
  }
  
}

void meetGirls(){
  
   float chooser = 0;

   if( numDrinks < 6)
   chooser  =  random(2,  10 - numDrinks);
   
   else if( numDrinks >= 6)
   chooser = random( 1000);
  
  image(images[5], midx, midy, 500, 350); 

  // mouse on left girl
   if( mouseX > 0 && mouseX < 90){
    if( mouseY > 0 && mouseY < 235 ){
      image(images[24], midx, midy, 500, 350);
      
       text("Go for Sylvia", 100, height/3);      
     if( mousePressed  && PNP == false){     
      if( chooser < 4 && numDrinks < 6){
      state = 5; 
      }   
      if( chooser >= 4 || numDrinks >= 6){
      state = 4; 
      }      
     }     
  }
  }
  
  //mouse on right girl
   if( mouseX > 110 && mouseX < 300){
    if( mouseY > 0 && mouseY < 210 ){
      
      image(images[25], midx, midy, 500, 350);
     text("Go for Becky", 250, height/3);      
     if( mousePressed  && PNP == false){     
      if( chooser < 4 && numDrinks < 6){
      state = 5; 
      }   
       if( chooser >= 4 || numDrinks >= 6){
      state = 4; 
      }      
     }     
  }
  }
  
  if( mouseX > 302){
    
  text("Head back to\n main floor", width/3, height/3);  
  if( mousePressed  && PNP == false){
  state = 2;
  } 
  
  }
}

void rejected(){
   image(images[6], midx, midy, 500, 350); 
   text("REJECTED!!", width-100, height/2);  

   if( mousePressed  && PNP == false){
     rejectedByGirl++;
      state = 2; 
   }
    
   
}
void drinkWithGirl(){
  
  if( numDrinks %2 == 0)
   image(images[11], midx, midy, 500, 350); 
   
   if( numDrinks %2 != 0)
   image(images[15], midx, midy, 500, 350); 
   
   if( mouseX > 172 && mouseX < 280){
    if( mouseY > 34 && mouseY < 230 ){
       text("Cheers!!", width/2 + 50, height/2);  
    }
    }
   
    if( mousePressed  && PNP == false){
      state = 6;
      numDrinks++;
    }
  
}
void danceWithGirl(){
   image(images[1], midx, midy, 500, 350); 
   
   float randColor = random( 0, 255);
   
   tint( randColor, randColor, randColor);
   
   if( mouseX > 50 && mouseX < 245){
    if( mouseY > 117 && mouseY < 350 ){
       text("Having fun?!", 150, height/3); 
    }
   }
   
   if( mouseX > 245 && mouseX < 432){
    if( mouseY > 137 && mouseY < 350 ){
      
      if( numDrinks < 6)
       text("No!!", 400, height/3); 
       
      if( numDrinks >= 6)
       text("Yeah!!", 400, height/3);
    }
   }
   
   if( mousePressed  && PNP == false){
     
     noTint();
     
     if( numDrinks < 6)
     state = 2;
     
     if( numDrinks >= 6) 
     state = 11;
      
   }
    
}
void getDrink(){
 
    
    image(images[16], midx, midy, 500, 350); 
    text("Drinks : " + numDrinks, width-250, height/4);
    
    if( mouseX > 337 && mouseX < 427){
    if( mouseY > 136 && mouseY < 289 ){
      
      if( numDrinks < 6)
      text("YEAH!!", width-100, height/5);
      
      if( numDrinks >= 6)
      text("Why are we still\n watching this guy?", width-100, height/5);
    }
  }
  
   if( mousePressed  && PNP == false)
      state = 2;  

}
void bathroom(){
  image(images[3], midx, midy, 500, 350);
 
   if( mousePressed  && PNP == false)
      state = 9;  
}

void throwup(){
    image(images[2], midx, midy, 500, 350);
  
    
    text("Ughhhh", width / 5, height/2);
    numDrinks = 0;
    
    if( mousePressed  && PNP == false){
    thrownOut++;
    state = 0;
    }
}

void urinal(){

  image(images[10], midx, midy, 500, 350);
  
  if( mouseX > 174 && mouseX < 300){
    if( mouseY > 19 && mouseY < 239 ){
      text("Ahhhhhh", width/4, height/5);
      
  
    }
  }
  
  if( mousePressed  && PNP == false)
      state = 2;  
}
void sleepWithGirl(){
  image(images[7], midx, midy, 500, 350);
  
  text("The End", width - 100, height/2);  
}


void draw(){
  
  println("MouseX : " + mouseX);
  println("MouseY: " + mouseY);
  
 if( numDrinks > 9)
 state = 10;
 
 if(thrownOut > 1 || rejectedByGirl > 5)
 state = 12;
 
 if( state != 6)
 tint( 255, 100 - numDrinks * 10);
 
 switch( state) {
   
 case 0: inLine();
         break;
 case 1: bouncer();
         break;
 case 2: mainFloor();
         break;
 case 3: meetGirls();
         break;
 case 4: rejected();
         break;
 case 5: drinkWithGirl();
         break;
 case 6: danceWithGirl();
         break; 
 case 7: getDrink();
         break;
 case 8: bathroom(); 
         break;
 case 9: urinal();
         break;
 case 10: throwup();
         break;
 case 11: sleepWithGirl();
         break;
 case 12: sleepAlone();
         break;  
 default: sleepAlone();
         break;
 
 
 
 }
 
 PNP = mousePressed;
 
  
  
}

