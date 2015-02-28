
import netscape.javascript.*;

PFont font1, font2, font3, font4, font5 ;
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9;

String p0 = "A bear, however hard he tries, Grows tubby without exercise.";
String p1 = "Our Teddy Bear is short and fat,";
String p2 = "Which is not to be wondered at; He gets what exercise he can";
String p3 = "We, too, can divide ourselves, it's true.";
String p4 = "But generally seems to lack";
String p5 = "But only into flesh and a broken whisper.";
String p6 = "Into flesh and poetry.";
String p7 = "Even such is time, which takes in trust.";


String[] p = {"A bear, however hard he tries, Grows tubby without exercise.","Our Teddy Bear is short and fat,","Which is not to be wondered at; He gets what exercise he can",
"We, too, can divide ourselves, it's true.","But generally seems to lack","But only into flesh and a broken whisper.","Into flesh and poetry.",
"Even such is time, which takes in trust.","Our youth, our joys, and all we have,","And pays us but with age and dust,","Who in the dark and silent grave",
"When we have wandered all our ways","Shuts up the story of our days,","And from which earth, and grave, and dust","The Lord shall raise me up, I trust."};
int page = 0;

void setup(){
  size(700,450);
  font1= loadFont("BauerBodoniStd-BoldItalic-33.vlw");
  font2= loadFont("ACaslonPro-SemiboldItalic-200.vlw");
  font3= loadFont("FuturaStd-Light-33.vlw");
  font4= loadFont("Bello-WordsSolo-33.vlw");
  font5= loadFont("BrainFlower-33.vlw");
  
  img1 = loadImage("01.png");
  img2 = loadImage("02.png");
  img3 = loadImage("03.png");
  img4 = loadImage("04.png");
  img5 = loadImage("05.png");
  img6 = loadImage("06.png");
  img7 = loadImage("07.png");
  img8 = loadImage("08.png");
  img9 = loadImage("09.png");

}


void draw(){
  
  
  textAlign(CENTER);
  if (page ==0){
  background(255);
  pushMatrix();
  image(img1,0,0);
  popMatrix();
  textFont(font1, 33); // fonttype setting
  text(p[6],width/2,height/2.5); // loadtyping ~string
   }
  
 
  if (page ==1) {
  
  textAlign(RIGHT);
  image(img8,0,0);
  fill(random(0,255),random(0,255),random(0,255)); 
  textFont(font2,11);
  text(p[0],mouseX,450);
  }
  
  if (page ==2) {
  image(img2,0,0);
  img2.filter(INVERT);
  textAlign(CENTER);
  fill(255); 
  textFont(font3,13);
  text(p[1],600,100);
  }
  
  
  if (page ==3) {
  background(random(0,255),random(0,255),random(0,255),11);
  image(img3,0,0);
  textAlign(LEFT);
  fill(0); 
  textFont(font4,22);
  text(p[2],0,100);
  }
  
  
   if (page ==4) {
  image(img4,0,0);
  textAlign(LEFT);
  fill(0); 
  textFont(font5,22);
  text(p[3],mouseY,300);
  }
  
  
  if (page ==5) {
  image(img5,0,0);
  textAlign(LEFT);
  fill(random(0,255),random(0,255),random(0,255)); 
  textFont(font3,20);
  text(p[4],360,130);
  }
  
  if (page ==6) {
  image(img6,0,0);
  textAlign(LEFT);
  fill(255); 
  textFont(font3,17);
  text(p[5],400,160);
  }

  if (page ==7) {
  image(img7,0,0);
  textAlign(LEFT);
  fill(255); 
  textFont(font5,20);
  text(p[6],mouseX,mouseY);
  }
  
  if (page ==8) {
  background(255);
  image(img9,0,0);
  textAlign(CENTER);
  fill(255); 
  textFont(font5,33);
  text(p[7],width/2,height/2);
  }



}

void mousePressed() {
  if ( page == 0) {
    page = 1;}
    
  else if ( page == 1 ){
     page = int(random(0,7));} // if 0~3 > 1,2
   
  else if ( page == 2 ){
     page = 3;}
     
  else if ( page == 3 ){
     page = 4;}
  
  else if ( page == 4 ){
     page = int(random(5,8));}
  
  else if ( page == 5 ){
     page = 6;}
  
  else if ( page == 6 ){
     page = 7;}
  
  else if ( page == 7 ){
     page = 8; }    
  
  else if ( page == 8 ){
    page = 0; }

     
    println(page);
}


