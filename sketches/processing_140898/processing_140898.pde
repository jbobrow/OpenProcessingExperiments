
float timer=0;


int gamestate=0;
int INSTRUCTION=0;
int INTRO=1;
int PLAYSTATE=2;

int CHOOSE=3;
int WIN=4;
int LOSE=5;

int clickcount=0;
int click1=0;


PFont times;
PImage stormy;
PImage castle;
PImage werewolf;
PImage vampire;
PImage lady;
PImage pistol;
PImage letter;
PImage wallet;
PImage bullet;
PImage letter1;
PImage handcuffs;
PImage weapon;
PImage caseclosed;

void setup(){
  frameRate(30);
  size(600,600);
  colorMode(HSB,360,100,100);
  
  castle = requestImage("supercastle2.jpg");
  werewolf = requestImage("werewolf.png");
  vampire = requestImage("vampire.png");
  lady = requestImage("woman.png");
  pistol = requestImage("pistol.png");
  letter = requestImage("letter.png");
  wallet = requestImage("wallet.png");
  bullet = requestImage("bullet.png");
  letter1 = requestImage("letter.png");
  handcuffs = requestImage("Handcuffs.jpg");
  stormy = requestImage("stormynight.jpg");
  weapon= requestImage("weapon.jpg");
  caseclosed=requestImage("caseclosed.jpg");
  times = createFont("Times New Roman",14);
 
}

void draw()
{
  if(gamestate == INSTRUCTION)
  {
   
    background(0);
   
    image(stormy,0,0,width,height);
    textAlign(CENTER);
    fill(357,99,99);
    textSize(20);
    text("A DARK AND STORMY NIGHT",300,20);
    text("BY: SAM ZAPIAIN",300,60);
    textAlign(LEFT);
    fill(116,0,99);
    text("INSTRUCTIONS",10,300);
    textSize(14);
    text("1.Investigate the murder scene by moving the mouse over",10,350);
    text("objects of importance and left clicking.",10,370);
    text("2.You can further investigate some objects by holding down certain keys when prompted",10,390,550,550);
    text("3. You can right click on the handcuffs to enter prosecute mode, which allows you to choose who committed the crime. Be warned, you cannot leave prosecution mode.",10,440,550,500);
    textAlign(CENTER);
    textSize(20);
    text("CLICK TO BEGIN",300,550);
    if(mousePressed==true)
    {
      clickcount+=1;
    }
    if(clickcount==1)
    {
      gamestate=INTRO;
    }
  }
  
  if(gamestate == INTRO)
  {
    timer = timer +(1.0/30.0);
    textAlign(LEFT);
    textSize(18);
    fill(354,0,98);
    background(0);
    if(timer>2){
    
    text("March 9,2014",50,100);}
    if(timer>4){
    text("A day like any other.",50,150);}
    if(timer>6){
    text("Until I got a call from the station.",50,200);}
    if(timer>8){
    text("They tell me that a woman was  found killed at 1 a.m. last night and they want me to investigate.",50,250,550,550);}
    if(timer>10){
    text("Not only that, but it seems that the woman was living with a werewolf named James and a vampire named Drake.",50,350,550,550);}
    if(timer>12){
    text("My day just got a lot more interesting.",50,450);}
  }
  if(timer>18){
    gamestate= PLAYSTATE;}
  
  
  
  
  if(gamestate==PLAYSTATE){
  textAlign(LEFT);

  image(castle,0,0,width,height);
  image(werewolf,340,280,150,150);
  image(vampire,120,320,150,150);
  image(letter,296,386,20,20);
  image(pistol,518,400,30,30);
  image(lady,200,490,120,120);
  image(wallet,380,580,20,20);
  image(bullet,8,427,20,20);
  image(letter1,75,430,20,20);
  image(letter1,550,490,20,20);
  image(letter1,314,286,20,20);
  image(handcuffs,550,0,50,50);

  
  textFont(times);
  
  
  
  
  
  
  fill(116,80,90);
  textSize(13);
    if(mouseButton==LEFT && mouseX> 340
    && mouseY >280
    && mouseX <490
    && mouseY<430){
      
      fill(116,80,90);
      text("Before me lies James the werewolf. He clearly looks distraught and tears roll down from his cheeks.",0,5,500,500); 
      fill(357,0,99);
      text("James: With these big hands, I wouldn't have been able to strangle her.",0,35,500,500);
      fill(116,80,90);
      text("1.Where were you doing the time of the murder?",0,50,500,500);
      text("2: Do you know anyone that could be capable of doing this?",0,65,500,500);
      text("3: What was your relationship with Margaret?",0,80,500,500);
      text("4.Inspect Hands",0,95,500,500);
    }
    else if(mouseButton==LEFT && mouseX> 120
    && mouseY>320
    && mouseX <270
    && mouseY<470){
     fill(116,80,90);
     text("Before me lies Drake the vampire. I've heard the reports on him, a real womanizer. He looks sad and is drinking quite heavily.",0,5,500,500);
     fill(357,0,99);
     text("Drake: Officer, no bite marks means I didn't kill her."
    ,0,35, 500,500);
   fill(116,80,90);
    text("1: Where were you doing during the time of the murder?",0,50,500,500);
    text("2: What was yoor relationship with Margaret?",0,65,500,500);
    text("3: Investigate Drake's hands",0,80,500,500);
  }
    
    else if(mouseButton==LEFT && mouseX>296
    && mouseY>386
    && mouseX<316
    && mouseY<406){
      fill(116,80,90);
      text("It appears to be a letter of some kind. The contents read:",0,20,500,500);
      
      text("Dear Mother, I don't know what to do. I love James, but Drake is also so very welcoming.",0,35,500,500);
      text("Love, Margaret",0,80,500,500);
    }
    else if(mouseButton==LEFT && mouseX>518
    && mouseY >400
    && mouseX<548
    && mouseY<430){
      fill(116,80,90);
      text("A 9mm pistol. It hsdn't been fired yet. It is not loaded either.",
      0,20);}
    else if(mouseButton==LEFT && mouseX>200
    && mouseY>490
    && mouseX<320
    && mouseY<610)
    {
      fill(116,80,90);
      text("Margaret 0'leary, the victim.Numerous bruises on her face and body. No bite or claw marks present. She seems to be have been strangled to death.",
      0,20,500,500);}
    else if(mouseButton==LEFT && mouseX>380
    && mouseY>580
    && mouseX<400
    &&mouseY<600){
    fill(116,80,90);
      text("The victim's wallet. A few credit cards and a receipt that lists the purchase of several silver bullets.",
    0,20,500,500);}
    
    else if(mouseButton==LEFT && mouseX>8
    && mouseY>427
    && mouseX<28
    && mouseY<447){
    fill(116,80,90);
    text("Several silver bullets lie here, enough to kill a human.",0,20);}
    
    else if(mouseButton==LEFT && mouseX>75
    && mouseY>430
    && mouseX<95
    && mouseY<450)
    {fill(116,80,90);
 text("A letter whose contents read:",0,20,500,500);
 text("Dear Mother, I know you don't approve of it, but I'm leaving with James. I know he loves me.",0,35,500,500);
 text("Love,Margaret",0,80,500,500);}
    else if(mouseButton==LEFT && mouseX>550
    && mouseY>490
    && mouseX<570
    && mouseY<510){fill(116,80,90);
      text("A letter whose contents read:",0,20,500,500); 
      text("Dear Mother, I wish you would stop worrying, James has enough money to afford a castle and he lives with a friendly lord named Drake.",0,35,500,500);
      text("Love,Margaret",0,80,500,500);
      
    }
    else if(mouseButton==LEFT && mouseX>314
    && mouseY>286
    && mouseX<334
    && mouseY<306){fill(116,80,90);
      text("A letter whose contents read:",0,20,500,500); 
      text("Dear Margaret, know that I am doing this for you. It will all be over soon. Know that I love you.",0,35,500,500);
      text("Love, Mom",0,80,500,500);
    }
    else if(mouseButton==RIGHT && mouseX>550
    && mouseY>0
    && mouseX<600
    && mouseY<50){
      click1=click1+1;}
    if(click1>0){
      gamestate=CHOOSE;
    }
      
    
   
  
      

   
   
   if(keyPressed == true){
   if(key=='1' && mouseX> 340
    && mouseY >280
    && mouseX <490
    && mouseY<430 && mouseButton==LEFT)
    {fill(357,0,99);
    text("1:I was sleeping in my room when I heard Margaret scream, I rushed down the stairs only to find her laying there with bruises on her face. Then I called the police.",0,110,500,500);}
    
    
    else if(key=='2' && mouseX> 340
    && mouseY >280
    && mouseX <490
    && mouseY<430 && mouseButton==LEFT)
   {fill(357,0,99);
   text("2:I know her mother did not approve of our relationship, but I harldy think she would hurt her own daughter.",0,110,500,500);}
   
   else if(key=='3' && mouseX> 340
    && mouseY >280
    && mouseX <490
    && mouseY<430 && mouseButton==LEFT){fill(357,0,99);
      
    text("3:Margaret was my wife. I know we don't have a traditional romance, but I still loved her.",0,110,500,500);}
    
   else if(key=='4' && mouseX> 340
    && mouseY >280
    && mouseX <490
    && mouseY<430 && mouseButton==LEFT){
     fill(357,0,99);
    text("4: James' hands appear to be dirty and rough",0,110,500,500);} 
    
    else if(key=='1' && mouseX> 120
    && mouseY>320
    && mouseX <270
    && mouseY<470 && mouseButton==LEFT){
      fill(357,0,99);
      text("1:I was in my coffin during the attack. When I heard shouting, I rushed from my room to find James clutching Margaret, who was all bruised and battered.",0,95,500,500);}
      
     else if(key== '2' && mouseX> 120
    && mouseY>320
    && mouseX <270
    && mouseY<470 && mouseButton==LEFT){
      fill(357,0,99);
      text("2: Margaret was a friend of mine. James introduced us when she and he decided to marry. It's a shame she's gone.",0,95,500,500);}
   
   else if(key=='3' && mouseX> 120
    && mouseY>320
    && mouseX <270
    && mouseY<470 && mouseButton==LEFT){
      fill(357,0,99);
      text("3:Drake's hands are shaking and appear very flimsy and brittle",0,95,500,500);}
   }
  }
  
   
  

    if(gamestate==CHOOSE){
     background(0);
     textAlign(LEFT);
     textSize(20);
     text("Well, who done it?",0,20,500,500);
     text("D. Drake, the vampire?",0,60,500,500);
     text("J. James, the werewolf?",0,100,500,500);
     text("M. Margaret's Mother?",0,140,500,500);
     text("A. Margaret?",0,180,500,500);
     
     
       if(key=='d')
       {
         gamestate=LOSE;
       }
       if(key=='j')
       {
        gamestate=LOSE;
       }
       if(key=='m')
       {
         gamestate=WIN;
       }
       if(key=='a')
       {
         gamestate=LOSE;
       }
      
     
     
     
    }
     
     
  if(gamestate==WIN){
    fill(357,0,99);
    background(0);
    textAlign(CENTER);
    text("You followed the clues and arrested Margaret's Mother!",0,20,550,550);
  text("Although Margaret was killed, James and Drake can finally rest easy.",0,40,550,550);
  textAlign(LEFT);
image(caseclosed,150,100,300,300);}
  if(gamestate==LOSE){
    fill(357,99,99);
    background(0);
    textAlign(CENTER);
    text("You arrested the wrong person! The killer remains free!",0,20,500,500);
    text("PLEASE RELOAD BROWSER",300,500);
    image(weapon,150,100,300,300);
    
}
}
    

    
 
    
    
    
    

  
     
     
   
     
    


