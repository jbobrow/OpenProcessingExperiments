
PImage img;
PFont building;
PFont wisdom;
float timer = 0.00;
float y= 0;
float y2 = 0;
float y3 = 0;
int timer;
int x;
int y;
int y2;

 
void setup()
{
 timer=0;
  size(500,500);
  img = loadImage ("white.jpg");
  building = createFont ("Building", 40);
  wisdom = createFont ("Wisdom Script", 40);
  
}
 
void draw(){
 
  //First Quoate (sail away from the safe harbour
  background(255);
  y= y + 1;
  timer++;
  textFont (building);
  
  if (timer>=50) {
  fill(0,0,0);
  textSize(146);
  text("SAIL",y , 200);
  
}
  
 
  if (timer>=100){
  fill (0,0,0);
  textSize(121);
  text ("AWAY",y, 290);
  }
  
  if (timer>=150) {
  fill (0,0,0);
  textSize(33);
  text ("FROM",y+150, 290);
  }
  
  if (timer>=200) {
  fill (0,0,0);
  textSize(33);
  text ("THE",y-50, 290);
  }
  
  if (timer>=250) {
  fill (0,0,0);
  textSize(129);
  text ("SAFE",y, 390);
  }
  
  if (timer>=300) {
  fill (0,0,0);
  textSize(66);
  text ("HARBOUR",y, 440);
  }
  
 
    
  
 //Second Wave of Text ( creativity related adjectives0
   if (timer >28)
   y2= y2 + 2;
   
  textFont (wisdom);

  fill (#E0E0E0);
  textSize(40);
  text ("leading", (700-y2), 300);
  
  fill(#E0E0E0);
  textSize(20);
  text("good", (610 - y2), 300);
   
  fill(#E0E0E0);
  textSize(28);
  text("Complex", (770 - y2), 450);
   
  fill(#E0E0E0);
  textSize(23);
  text("innovative", (840 - y2), 63);
   
  fill(#E0E0E0);
  textSize(25);
  text("OG", (925- y2), 275);
   
  fill(#E0E0E0);
  textSize(20);
  text("way-out", (725- y2), 150);
   
  fill(#E0E0E0);
  textSize(32);
  text("different", (1075- y2), 325);
   
  fill(#E0E0E0);
  textSize(25);
  text("visionary", (950- y2), 250);
   
  fill(#E0E0E0);
  textSize(34);
  text("ingenious", (910- y2), 470);
   
  fill(#E0E0E0);
  textSize(18);
  text("inspired", (600- y2), 235);
   
  fill(#E0E0E0);
  textSize(29);
  text("creative", (767- y2), 475);
   
  fill(#E0E0E0);
  textSize(33);
  text("formative", (1025- y2), 420);
   
  fill(#E0E0E0);
  textSize(38);
  text("inventive", (1150- y2), 250);
   
  fill(#E0E0E0);
  textSize(28);
  text("productive", (1130- y2), 166);
   
  fill(#E0E0E0);
  textSize(52);
  text("demiurgic", (940- y2), 95);
   
  fill(#E0E0E0);
  textSize(34);
  text("aimar", (825- y2), 130);
   
  fill(#E0E0E0);
  textSize(36);
  text("cool", (955- y2), 390);
   
  fill(#E0E0E0);
  textSize(31);
  text("clever", (1000- y2), 280);
   
  fill(#E0E0E0);
  textSize(34);
  text("hip", (1100- y2), 430);
   
  fill(#E0E0E0);
  textSize(28);
  text("gifted", (1200- y2), 360);
   
  fill(#E0E0E0);
  textSize(37);
  text("original", (1000- y2), 200);

  if (timer>30);
  //y3=y3+3;
  
  textFont(building);
  
  fill (0,0,0);
  textSize (89.91);
  if (timer>=350) {
  text ("SMOOTH",150, 100);
  }
  
  if (timer>=400) {
  fill (0,0,0);
  textSize (103.35);
  text ("SEA",150, 180);
  }
  
  if (timer>=450){
  fill (0,0,0);
  textSize (50.47);
  text ("NEVER",250, 140);
  }
  if (timer>=500) {
  fill(0,0,0);
  textSize(51.68);
  text("MAKE",250 , 180);
  }
  
  if (timer>=550) {
  fill (0,0,0);
  textSize (76.32);
  text ("A SKILLED",150, 250);
  }
  
  if (timer>=600) {
  fill (0,0,0);
  textSize (105.4);
  text ("SAILOR",150, 330);
}
}



