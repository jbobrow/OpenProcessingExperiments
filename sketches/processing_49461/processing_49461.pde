
/**
*ludlum novel Name generator
*9/13/09  edited by danearthursteinlicht.com on 1/17/12
*/
int r = int(random(0,255));
int g = int(random(0,255));
int b = int(random(0, 255));
String text = "";
 
 
void setup(){
 size(800, 300);
 PFont fontA = loadFont("CourierNew36.vlw");
 
// Set the font and its size (in units of pixels)
textFont(fontA, 32);
//frameRate(1);
smooth();
  background(r, b, g);
}
 
void draw(){
  PFont fontA = loadFont("CourierNew36.vlw");
  fill(#ff0000);
  rect(195, 220, 400, 30);
   
  textFont(fontA, 12);
  fill(255);
  text( "click for new, posthumous Robert Ludlum Novel names!" , 200, 240); //button rectangle
   
  if (mousePressed ) {
  background(r, b, g);
  int r = int(random(0,255));
  int g = int(random(0,255));
  int b = int(random(0, 255));
  String printName =  makeName();
     
  fill(r, g, b);
  textFont(fontA, 38);
  text( printName , width/2 - 260, height/2);
   }
  delay(100);
}
 
String makeName(){
   
  String title = title();
  String prefix = prefix();
  String suffix = suffix();
  String middle = middle();
  String monsterName = title + prefix + middle + suffix + "!";
  println(prefix);
   
  return monsterName;
}
 
String title(){
 
  String word = ""; 
  int ran = int(random(1,20));
 
   
  if (ran == 1){
   word = "The ";
  }
   
   if (ran == 2){
   word = "The ";
  }
 
 if (ran == 3){
   word= "The ";
  }
   
   if (ran == 4){
   word = "The ";
  }
   if (ran == 5){
   word = "The ";
  }
  
   if (ran == 6){
   word = "The ";
  }
   
   if (ran == 7){
   word = "The ";
  }
 
 if (ran == 8){
   word= "The ";
  }
   
   if (ran == 9){
   word = "The ";
  }
   if (ran == 10){
   word = "The ";
  }
   
     if (ran == 11){
   word = "The ";
  }
   
   if (ran == 12){
   word = "The ";
  }
 
 if (ran == 13){
   word= "The ";
  }
   
   if (ran == 14){
   word = "The ";
  }
   if (ran == 15){
   word = "The ";
  }
  
   if (ran == 16){
   word = "The ";
  }
   
   if (ran == 17){
   word = "The ";
  }
 
 if (ran == 18){
   word= "The ";
  }
   
   if (ran == 19){
   word = "The ";
  }
   if (ran == 20){
   word = "The ";
  }
  
  
  println("title: " + word);
  return word;
 
}
 
String prefix(){
 String word = "";
 int pre = int(random(1,20));
  
 if(pre == 1){
  word = "Scarlatti";
 }
  
 if(pre == 2){
  word = "Osterman";
 }
 if(pre == 4){
  word = "Matlock";
 }
  
 if(pre == 5){
  word = "Gemini";
 }
 if(pre == 6){
  word = "Chancellor";
 }

 if(pre == 7){
  word = "Holcraft";
 }
 if(pre == 8){
  word = "Matarese";
 }
 if(pre == 9){
  word = "Bourne";
 }
 if(pre == 10){
  word = "Bourne";
 }
 if(pre == 11){
  word = "Bourne";
 }
 if(pre == 12){
  word = "Parsifal";
 }
 if(pre == 13){
  word = "Icarus";
 }
 if(pre == 14){
  word = "Aquitaine";
 }
 if(pre == 15){
  word = "Scorpio";
 }
 if(pre == 16){
  word = "Apacalypse";
 }
 if(pre == 17){
  word = "Lazarus";
 }
 if(pre == 18){
  word = "Prometheus";
 }
 if(pre == 19){
  word = "Sigma";
 }
 if(pre == 20){
  word = "Infinity";
 }
  
 println("prefix: " + word);
 
return word;
 
}
 
 
String middle(){
 String word = "";
 int pre = int(random(1,20));
  
 if(pre == 1){
  word = " ";
 }
  
 if(pre == 2){
  word = " ";
 }
 if(pre == 4){
  word = " ";
 }
 if(pre == 4){
  word = " ";
 }
  
 if(pre == 5){
  word = " ";
}
 if(pre == 6){
  word = " ";
 }
 if(pre == 7){
  word = " ";
 }
  
 if(pre == 8){
  word = " ";
 }
 if(pre == 9){
  word = " ";
 }
 if(pre == 10){
  word = " ";
 }
 if(pre == 11){
  word = " ";
 }
 if(pre == 12){
  word = " ";
 }
 if(pre == 13){
  word = " ";
 }
 if(pre == 14){
  word = " ";
 }
 if(pre == 15){
  word = " ";
 }
 if(pre == 16){
  word = " ";
 }
 if(pre == 17){
  word = " ";
 }
 if(pre == 18){
  word = " ";
 }
 if(pre == 19){
  word = " ";
 }
 if(pre == 20){
  word = " ";
 }
  
 
println("middle: " + word);
return word;
 
}
 
 
// make the last part of the monster name
String suffix(){
 String word = "";
 int pre = int(random(1,20));
  
 if(pre == 1){
  word = "Inheritance";
 }
  
 if(pre == 2){
word = "Weekend";
 }
 if(pre == 3){
  word = "Paper";
 }
  
 if(pre == 4){
  word = "Exchange";
 }
 if(pre == 5){
  word = "Vector";
 }
 if(pre == 6){
  word = "Manuscript";
 }
 if(pre == 7){
  word = "Covenant";
 }
  if(pre == 8){
  word = "Vendetta";
 }
 if(pre == 9){
  word = "Identity";
 }
  
 if(pre == 10){
  word = "Mosaic";
 }
 if(pre == 11){
  word = "Progression";
 }
 if(pre == 12){
  word = "Supremacy";
 }
 if(pre == 13){
  word = "Agenda";
 }
 if(pre == 14){
  word = "Ultimatum";
 }
 if(pre == 15){
  word = "Illusion";
 }
 if(pre == 16){
  word = "Supremacy";
 }
 if(pre == 17){
  word = "Deception";
 }
 if(pre == 18){
  word = "Protocol";
 }
 if(pre == 19){
  word = "Directive";
 }
 if(pre == 20){
  word = "Betrayal";
 }
 
println("suffix: " + word);
return word;
 
}


