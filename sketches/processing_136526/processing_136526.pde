
int myState = 0 ; 
int op = 0 ; 
int ra = 5;
int x = 16;
int yes  = 0;
int no = 0;
PFont W ;
PImage Beat ;
PImage vidcat ;
PImage HD;
PImage smile ;
PImage sb ;
PImage mi ;
PImage cool ;
PImage notcool ;
PImage hc ;

void setup(){
  size(600,500); 
 W = createFont("Revalia-Regular.tff",200) ;
 Beat = loadImage("Beatles-HDN.jpg") ;
 vidcat = loadImage("animals-playing-video-games.jpg") ;
 HD = loadImage("helpdog.png") ;
 smile = loadImage("Smile.jpg") ;
 sb = loadImage("sponge.jpg") ;
 mi = loadImage("mi.jpg") ;
 cool = loadImage("you-are-cool.png");
 notcool = loadImage("not-cool.jpg");
 hc = loadImage("hc.jpg");
}

void draw() {
  
  background(0);
  
  switch(myState) {
   
    case 0 :
    fill(0);
   rect(20,70,600,50);
   fill(255);
    textFont(W,40) ;
    text("Welcome To The Cool Quiz", 35,100) ;
    textFont(W,30); 
    text("To Find Out How Cool You Are,",80,200);
    text("Answer The Following Questions With",27,250);
    text("'Y' For Yes And 'N' For No",125,300);
   fill(0);
   rect(x,60,600,50);
   x = x + 5;
    fill(0);
   rect(x-600,150,10000,60);
    fill(0);
   rect(x-1200,200,10000,60);
    fill(0);
   rect(x-1800,260,10000,60);
       fill(0);
    textFont(W,30);
    fill(255,op) ;
    text("Press 'C' To Continue",125,400,600);
    op = op + ra;
    if(op > 100) {
      ra = -5 ;}
    if(op < 0) {
      ra = 5;}
       fill(0);
       rect(x-2000,350,10000,60);
    break;
    
    case 1:
    image(Beat,0,0,600,500);
    fill(255);
    textFont(W,30);
text("Do You Listen To The Beatles?",95,255);
    break;
    
    case 2:
image(vidcat,0,0,600,500);
    textFont(W,40);
    text("Do You Enjoy Videogames?",35,55);
    break;
    
    case 3:
image(HD,0,0,600,500);
    textFont(W,40);
    text("Do You Often Help Others?",35,400);
    break;
    
     case 4:
image(smile,0,0,600,500);
    textFont(W,40);
    String s = "Do You Often Smile In a Non-Creepy Fashion?";
    text(s,35,20,560,200);
    break;
    
    case 5:
image(sb,0,0,600,500);
fill(0);
    textFont(W,30);
    text("When Spongebob Comes On While",50,25);
   text("Channel Surfing Do You Stop And Watch?",1,55);
   
    break;
    
    case 6:
image(mi,150,100,300,300);
fill(255);
    textFont(W,30);
    text("Can You Play An Instrument Or Sing?",35,50);
    break;
    
    case 7 :
    image(hc,0,0,600,500);
    fill(0);
    textFont(W,40) ;
    text("Do You Like Hammocks?",35,30);
    break;
    
    case 8:
       image(cool,0,0,600,500);
     fill(0) ;
      textFont(W,20);
    String laaa = "Press 'Q' To Play Again" ;
    text(laaa,300,320,150,450);
    break;
    
    case 9:
      image(notcool,0,0,600,500);
     fill(0) ;
      textFont(W,20);
      String laa = "Press 'Q' To Play Again" ;
    text(laa,300,320,150,450);
    break;
    
  }
  if(myState > 7) {
  if(yes > 3) {
    myState = 8 ;
  }
}
  if(myState > 7) {
  if(no > 3) {
    myState = 9 ;}}
  println(mouseX + "," + mouseY) ;
}

void keyPressed() {
  
  switch(key) {
    case 'c':
    if(myState < 1){
    myState = 1;}
    break; 
    
    case 'y' :
    if(myState > 0){
      myState = myState + 1;
     yes = yes + 1;}
     if(myState > 7) {
       myState = myState;}
    break;
    
    case 'n' :
     if(myState > 0){
      myState = myState + 1;
    no = no + 1;}
     if(myState > 7) {
       myState = myState;}
    break ; 
    
    case 'q' :
     if(myState > 7){
       myState = 0;
     yes = 0;
    no = 0 ;}
       break;
  }
}



