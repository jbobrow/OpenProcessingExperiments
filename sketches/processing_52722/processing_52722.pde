
//declare font names, strings and image
PFont font1;
PFont font2;
int posX;
PImage img;


void setup() {
  //environment
  size (600,400);
  background (82,81,81);
  smooth();
  posX=0;
  textAlign(CENTER);
  //load fonts
  font1 = loadFont ("TradeGothicLT-15.vlw");
  font2 = loadFont ("TradeGothicLT-18.vlw");
  fill(255);
  textFont(font2);
  text("My sister and I both claim a memory of falling off a horse", width/2, 150);
  text("when we were little. The memories are the same, down to a", width/2, 175);
  text("detail of narrowly missing a pile of manure.",width/2, 200);
  text("We have no way to prove which one of us it was.",width/2,225);
  //load image
  img = loadImage ("beckypony2.jpg");
  }
 
 void mouseClicked() { //image of girl on horse
  background(81,82,82);
   image (img,0,0);
   image (img,300,0);
   
 }
   void mouseDragged(){//barthes quote about certainty of photographs
   
   background(82,81,81);
    if (mouseY>90 && mouseY<115) {
   textFont(font1);
   textAlign(CENTER);
    fill (255);
    text("'One day I received from a photographer a picture of myself",300,100);
  } 
 if (mouseY>115 && mouseY<140) {
   textFont(font1);
   textAlign(CENTER);
   fill (255);
  text("which I could not remember being taken, for all my efforts;", 300, 125);
 }
 if (mouseY>140 && mouseY<165) {
   textFont(font1);
   textAlign(CENTER);
   fill(255);
   text("I inspected the tie, the sweater, to discover in what circumstances",300,150);
 }
 if (mouseY>165 && mouseY<185) {
   textFont(font1);
   textAlign(CENTER);
   fill(255);
   text("I had worn them; to no avail. And yet, because it was a photograph", 300,175);
 }
 if(mouseY>220 && mouseY<240){
   textFont(font1);
   textAlign(CENTER);
   fill(255);
   text("I could not deny that I had been there (even if I did not know where).",300,225);
 }
 if(mouseY>240 && mouseY<265){
   textFont(font1);
   textAlign(CENTER);
   fill(255);
   text("This distortion between certainty and oblivion gave me a kind of vertigo,",300,250);
 }
 if(mouseY>265 && mouseY<285){
 textFont(font1);
 textAlign(CENTER);
 fill(255);
 text("something of a 'detective' anguish; I went to the photographer's show",300,275);
 }
 if(mouseY>285 && mouseY<315){
 textFont(font1);
 textAlign(CENTER);
 fill(255);
 text("as to a police investigation, to learn at last what I no longer knew about myself.'",300,300);
 }
  }
  

 void draw() { //pics or it didn't happen
  textFont(font1);//use a different font
   text("pics or it didn't happen",mouseX,mouseY);
 
 }


  







