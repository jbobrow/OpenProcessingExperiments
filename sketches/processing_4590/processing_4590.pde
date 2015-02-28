
/** 
*Name generator
*9/13/09
*/
int r = int(random(0,255));
int g = int(random(0,255));
int b = int(random(0, 255));
String text = "";


void setup(){
 size(600, 300);
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
  rect(195, 220, 220, 30);
  
  textFont(fontA, 12);
  fill(255);
  text( "click here for monster names!" , 200, 240);
  
  if (mousePressed ) {
  background(r, b, g);
  int r = int(random(0,255));
  int g = int(random(0,255));
  int b = int(random(0, 255));
  String printName =  makeName();
    
  fill(r, g, b);
  textFont(fontA, 32);
  text( printName , width/2 - 100, height/2);
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
  int ran = int(random(1,10));

  
  if (ran == 1){
   word = "Mr. ";
  }
  
   if (ran == 2){
   word = "Mrs. ";
  }

 if (ran == 3){
   word= "Ms. ";
  }
  
   if (ran == 4){
   word = "Dr. ";
  }
   if (ran == 5){
   word = "Prof. ";
  }
  
  
  println("title: " + word);
  return word;

}

String prefix(){
 String word = "";
 int pre = int(random(1,20));
 
 if(pre == 1){
  word = "Gl"; 
 }
 
 if(pre == 2){
  word = "Hr"; 
 }
 if(pre == 4){
  word = "Fm"; 
 }
 
 if(pre == 5){
  word = "Zr"; 
 }
 if(pre == 6){
  word = "Ox"; 
 }
 if(pre == 7){
  word = "Dh"; 
 }
 if(pre == 8){
  word = "Gu"; 
 }
 if(pre == 9){
  word = "Zu"; 
 }
 if(pre == 10){
  word = "Xu"; 
 }
 if(pre == 11){
  word = "Xy"; 
 }
 if(pre == 12){
  word = "Ku"; 
 }
 if(pre == 13){
  word = "Du"; 
 }
 if(pre == 14){
  word = "XXu"; 
 }
 if(pre == 15){
  word = "De"; 
 }
 if(pre == 16){
  word = "Oo"; 
 }if(pre == 17){
  word = "Lum"; 
 }
 if(pre == 18){
  word = "Py"; 
 }
 if(pre == 19){
  word = "Puu"; 
 }
 if(pre == 19){
  word = "Wu"; 
 }
 
 println("prefix: " + word);

return word;

}


String middle(){
 String word = "";
 int pre = int(random(1,20));
 
 if(pre == 1){
  word = "ee"; 
 }
 
 if(pre == 2){
  word = "eo"; 
 }
 if(pre == 4){
  word = "uo"; 
 }
 
 if(pre == 5){
  word = "00"; 
 }
 if(pre == 6){
  word = "10"; 
 }
 if(pre == 6){
  word = "oo"; 
 }
 if(pre == 7){
  word = "a"; 
 }
 
 if(pre == 8){
  word = "1e"; 
 }
 if(pre == 9){
  word = "--"; 
 }
 if(pre == 10){
  word = "<3"; 
 }
 if(pre == 11){
  word = "ee"; 
 }
 if(pre == 12){
  word = "aaaaaaa"; 
 }
 if(pre == 13){
  word = "ae"; 
 }
 if(pre == 14){
  word = "oao"; 
 }
 if(pre == 15){
  word = "eeee"; 
 }
 if(pre == 16){
  word = "oho"; 
 }
 if(pre == 17){
  word = "eae"; 
 }
 if(pre == 18){
  word = "o"; 
 }
 if(pre == 19){
  word = "oakao"; 
 }
 if(pre == 20){
  word = "obo"; 
 }
 

println("middle: " + word);
return word;

}


// make the last part of the monster name
String suffix(){
 String word = "";
 int pre = int(random(1,20));
 
 if(pre == 1){
  word = "dly"; 
 }
 
 if(pre == 2){
  word = "er"; 
 }
 if(pre == 4){
  word = "xt"; 
 }
 
 if(pre == 5){
  word = "s"; 
 }
 if(pre == 6){
  word = "z"; 
 }
 if(pre == 6){
  word = "oooog"; 
 }
 if(pre == 7){
  word = "p"; 
 }
  if(pre == 8){
  word = "ed"; 
 }
 if(pre == 9){
  word = "opt"; 
 }
 
 if(pre == 10){
  word = "loaf"; 
 }
 if(pre == 11){
  word = "didle"; 
 }
 if(pre == 12){
  word = "enheimer"; 
 }
 if(pre == 13){
  word = "eister"; 
 }
 if(pre == 14){
  word = "tapus"; 
 }
 if(pre == 15){
  word = "varos"; 
 }
 if(pre == 16){
  word = "mer"; 
 }
 if(pre == 17){
  word = "-smith"; 
 }
 if(pre == 18){
  word = "dada"; 
 }
 if(pre == 19){
  word = "bug"; 
 }
 if(pre == 20){
  word = "orp"; 
 }

println("suffix: " + word);
return word;

}



