
PImage alfa;
PImage bravo;
PImage charlie;
PImage delta;
PImage echo;
PImage foxtrot;
PImage golf;

int X=0;

PFont write;

void setup(){
  write = createFont("MVBoli-48.vlw");
  
  frameRate(10);
  
  size(500,500);
  background(#030303);
 
 
 alfa = loadImage("walking.png");
bravo = loadImage("evil.png");
charlie = loadImage("Userious.png");
delta = loadImage("confrontation.png");
echo = loadImage("Same.png");
foxtrot = loadImage("yinyang.png");
golf = loadImage("Accept.png");
 
  
}


void draw(){
  X++;
    
  
 image(alfa, 50, 50);
  textFont(write,30);
  fill(#FFFFFF);
  text("Mostly I just walk around", 110,300);
  if(X>=20){
    fill(#AAAAAA);
  text("like", 100,340);
  }
  if(X>=40){
    fill(#767676);
  text("Doo-doot Doo", 70,370);
  
  
  //evil side coming
}
  if (X>=60){
    fill(#000000);
    rect(0,0,600,600);
  image(bravo,50,50);
  fill(#FFFFFF);
  text("BUT THEN!", 100,70);
}
if(X>=80){
    fill(#FFFFFF);
  text("My EVIL Side", 70,250);
  }
  if(X>=100){
    fill(#FFFFFF);
  text("Comes Out of Nowhere", 150,370);
  }



  if (X>=120){
    fill(#030303);
    rect(0,0,600,600);
  image(charlie,0,100);
  fill(#FFFFFF);
  text("I'm Always Like", 100,200);
}
if(X>=140){
    fill(#FFFFFF);
    textSize(40);
  text("Bruh", 200,300);
  }
 if(X>=150){
    fill(#FFFFFF);
    textSize(40);
  text("U Serious?", 300,400);
  }




if (X>=180){
  fill(#030303);
    rect(0,0,600,600);
  image(delta,50,0);
  fill(#FFFFFF);
    textSize(60);
  text("FIGHT TIME", 100,250);
}
 if(X>=200){
    fill(#FFFFFF);
    textSize(20);
  text("Then I Realize", 200,400);
  }


 if (X>=240){
   fill(#030303);
    rect(0,0,600,600);
  image(echo,0,100);
  fill(#FFFFFF);
  textSize(40);
  text("We're Two Sides", 100,390);
}
 if(X>=260){
    fill(#FFFFFF);
    textSize(40);
  text("To The Same Coin", 100,430);
  }


  if (X>=300){
    fill(#030303);
    rect(0,0,600,600);
  image(foxtrot,10,20);
  fill(#8E8E8E);
  text("There Must Be Harmony", 50,300);
}
if (X>=330){
  fill(#030303);
    rect(0,0,600,600);
  image(golf,0,100);
  fill(#FFFFFF);
  text("You Have To Learn", 80, 70);
}
   if(X>=340){
    fill(#FFFFFF);
    textSize(40);
  text("To Accept Yourself", 100,460);
  }
  
  
  
}


