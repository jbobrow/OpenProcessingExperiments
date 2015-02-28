
float timer=0;

int gamestate=0;
int INTRO=0;
int PLAYSTATE=1;

PFont times;
PImage castle;
PImage werewolf;
PImage vampire;
PImage lady;
PImage pistol;
PImage letter;
PImage wallet;
PImage bullet;
PImage letter1;

void setup(){
  size(600,600);
  castle = requestImage("supercastle.jpg");
  werewolf = requestImage("werewolf.png");
  vampire = requestImage("vampire.png");
  lady = requestImage("woman.png");
  pistol = requestImage("pistol.png");
  letter = requestImage("letter.png");
  wallet = requestImage("wallet.png");
  bullet = requestImage("bullet.png");
  letter1 = requestImage("letter.png");
  
  times = createFont("Times New Roman",14);
}

void draw(){
  if(gamestate == INTRO)
  {
    timer = timer +(1.0/30.0);
    textSize(18);
    
    background(0);
    if(timer>2){
    fill(255);
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
    text("My day just got a whole lot more interesting.",50,450);}
  }
  if(timer>18){
    gamestate= PLAYSTATE;}
  
  
  
  
  if(gamestate==PLAYSTATE){
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
  println(mouseX,mouseY);
  textFont(times);
  
    if(mouseButton==LEFT && mouseX> 340
    && mouseY >280
    && mouseX <490
    && mouseY<430){
      text(" James: With these big hands, I wouldn't have been able to strangle her.",0,20,500,500);
    }
    else if(mouseButton==LEFT && mouseX> 120
    && mouseY>320
    && mouseX <270
    && mouseY<470){
      text("Drake: Officer, no bite marks means I didn't kill her."
    ,0,20, 500,500);}
    
    else if(mouseButton==LEFT && mouseX>296
    && mouseY>386
    && mouseX<316
    && mouseY<406){
      text("It appears to be a letter of some kind. The contents read: Dear Mother, I don't know what to do. I love James, but Drake is also so very welcoming."
      ,0,20,500,500);
    }
    else if(mouseButton==LEFT && mouseX>518
    && mouseY >400
    && mouseX<548
    && mouseY<430){
      text("A 9mm pistol. It hsdn't been fired yet. It is not loaded either.",
      0,20);}
    else if(mouseButton==LEFT && mouseX>200
    && mouseY>490
    && mouseX<320
    && mouseY<610)
    {
      text("Margaret 0'leary, the victim.Numerous bruises on her face and body. No bite or claw marks present. She seems to be have been strangled to death.",
      0,20,500,500);}
    else if(mouseButton==LEFT && mouseX>380
    && mouseY>580
    && mouseX<400
    &&mouseY<600){
    text("The victim's wallet. A few credit cards and a receipt that lists the purchase of several silver bullets.",
    0,20,500,500);}
    
    else if(mouseButton==LEFT && mouseX>8
    && mouseY>427
    && mouseX<28
    && mouseY<447){
    text("Several silver bullets lie here, enough to kill a human.",0,20);}
    
    else if(mouseButton==LEFT && mouseX>75
    && mouseY>430
    && mouseX<95
    && mouseY<450)
    {
    text("A letter whose contents read: Dear Mother, I know you don't approve of it, but I'm leaving with James. I know he loves me.",0,20,500,500);}
    else if(mouseButton==LEFT && mouseX>550
    && mouseY>490
    && mouseX<570
    && mouseY<510){
      text("A letter whose contents read: Dear Mother, I wish you would stop worrying, James has enough money to afford a castle and he lives with a friendly lord named Drake.",0,20,500,500);
    }
    
      
}
  
  
}



