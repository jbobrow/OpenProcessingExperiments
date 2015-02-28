



// press the D and K keys to spell out Donkey Kong over the screen//



PFont dan;
PImage kong;

void setup (){
  size(250,250);
  
  dan=loadFont("Leelawadee-Bold-20.vlw");
   kong=loadImage("kong.png");

  background(kong);
  
}

 void draw(){
 }

  void keyPressed (){
 if(keyPressed && key=='d'){
   
   fill(240,253,0);
   textSize(60);
   text("DONKEY", pmouseX,pmouseY);
 }
  

 if(keyPressed && key=='k'){
    fill(240,253,0);
 textSize(60);
 text("KONG", pmouseX,pmouseY);
  }
  

  }
  

