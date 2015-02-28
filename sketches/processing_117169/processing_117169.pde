
PFont font1, font2;
String p1 = "ERROR";
String p2 = "All of your datas are deleted";
String p3 = "Rebuting...";
String p4 = "All of your memories are erased";
String p5 = "there's a no ways to fix";
String p6 = "Because Time never come back";
String p7 = "Try onemore time?"; 
String p8 = "Rebuting...Rebuting...";

float page = int(0);

void setup(){
 size(480,800);
 font1 = loadFont("Mistral-48.vlw");
 font2 = loadFont("MrsEavesRoman-48.vlw");
}

void draw(){
 
if(page == 0){

  background(0,0,255); //make page! important
  fill(255);
  textFont(font1); //you can write only font
  textAlign(CENTER);
  text(p1,width/2,200);
  text(p1,width/2,400);
  text(p1,width/2,600);
  }  else if(page == 1){
  background(0,0,255);
  fill(255);
  textFont(font2); //you can write only font
  textAlign(CENTER);
  text(p2,width/2,400);
  fill(255,90); 
  text(p2,width/2-10,390); 
  text(p2,width/2-10,410); 
  } else if(page ==2){
  background(0);
  fill(255);
  textFont(font2); //you can write only font
  textAlign(CENTER);
  text(p3,width/2,400);
  }else if(page == 3){
  background(0,0,255);
  fill(255);
  textFont(font2); //you can write only font
  textAlign(CENTER);
  text(p4,width/2,400);
  fill(255,90); 
  text(p4,width/2-10,390); 
  text(p4,width/2-10,410); 
  }else if(page ==4){
  background(0,0,255);
  fill(255);
  textFont(font2);
  textAlign(CENTER);
  text(p5,width/2,400);
  }else if(page ==5){
  background(0,0,255);
  fill(255);
  textFont(font2);
  textAlign(CENTER);
  text(p6,width/2,400);
  }else if(page ==6){
  background(0,0,255);
  fill(255);
  textFont(font2);
  textAlign(CENTER);
  text(p7,width/2,400);
  }else if(page ==7){
  background(0);
  fill(255);
  textFont(font2);
  textAlign(CENTER);
  text(p8,width/2,400);
  }


}

void mousePressed(){
 if(page == 0){page=int(random(0,6)); println(page);} 
 else if(page ==1){page=int(random(0,9));}
 else if(page ==2){page=int(random(0,9));}
 else if(page ==3){page=int(random(0,9));}
 else if(page ==4){page=2;}
 else if(page ==5){page=0;}
 else if(page ==6){page=int(random(0,9));}
 else if(page ==7){page=int(random(0,9));}}



