
int km = 0;
String tempKm = "";
String eat = "";
boolean store = false;
Food food = new Food();
int cal = 0;

PImage dundee;
PImage burger;
PImage fruitsalad;
PImage pringles;
PImage carrots;
PImage yoghurt;
PImage thePeach;

PFont font;
PFont small;

String line;
String line2;


void setup(){
  
  size(600,400);
  smooth();
  font= loadFont("ArialUnicodeMS-20.vlw");
  small = loadFont("Arial-BoldMT-15.vlw");
  dundee = loadImage("dundee.jpg");
  burger = loadImage("burger.png");
  fruitsalad = loadImage("Fruitsalad.jpg");
  pringles = loadImage("pringles.jpg");
  carrots = loadImage("sliced_carrots.jpg");
  yoghurt = loadImage("yogurt.jpg");
  thePeach = loadImage("the_peach.jpg");
  
  
}
void draw(){
  background(255);
  tint(255,127); 
  image(dundee,0,0);
  tint(255,255); 
  textFont(font);
  if(store == true){
    fill(0);
    text("= "+cal + " calories", 100, 200);
    fill(#F298B3);
    food.draw();
  }else{
  fill(#98F2B6);
  }
  rect(45,182, 50, 20);
  fill(0);
  
  text(km, 50,200);
  textFont(small);
  fill(255,200);
  noStroke();
  rect(0,300,600,200);
  fill(0);
  text("Please enter the amount km you have travelled on your bike \n"+
  "The program will calculate how many calories you've burned and what you could eat", 0, 350);
  textFont(font);
    
  
}

void keyPressed() {
  if(store == false){
  if(key >= '0' && key <= '9') {
   tempKm+=char(key);
   
   println(km);
   if(tempKm.length() > 3){
    tempKm="0"; 
   }
   km=int(tempKm);
   cal = (km*18);
  }
  }
  if(key == ENTER || key == RETURN) {
    store=true;
    
    println("Store!"); 
   
  }
  
}

class Food{
  
 public Food(){
  
 }
void draw(){
 
  if(store== true){
   if(cal >= 200  ){
     image(burger, 300, 100);
    eat="YOU, SIR, CAN HAVE ONE BURGER.";
   } else if( cal >= 150 && cal < 200) {
     image(yoghurt, 300, 100);
    eat="Go ahead and have a yoghurt.";
   } else if(cal >= 100 && cal < 150) {
     image(pringles, 300, 100);
    eat="You can have 10 Pringles of your choice!" ;
   
    } else if(cal >= 80 && cal < 100) {
     image(fruitsalad, 300, 100);
    eat="Why not have some fruitsalad!" ;
   
    } else if(cal >= 60 && cal < 80) {
     image(thePeach, 300, 100);
    eat="EAT THE PEACH!" ;
   
    } else if(cal >= 0 && cal < 60) {
     image(carrots, 300, 100);
    eat="Get on the bike"+"\n"+ "and have some sliced carrots." ;
   }
  }
  fill(0);
  text(eat,240,60);
  fill(#F298B3);
} 
  
  
}

