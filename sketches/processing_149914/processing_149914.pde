
//Interactive code http://www.openprocessing.org/sketch/38976
/* @pjs font="Pacifico.ttf"; */



float tSize = 50;
Word[] words;
int numberWords=0;
String[] vocab = { "Laziness" , "Playing Games", "Watching TV", "Sleep", "Don't Care", "Too Challenging", "Not priority", "Distractions", 
"friends", "bad habbits", "excuses", "worrying about failure", "other's fault", "Confidence", "Inspiration", "Energy", "Percistance"};
String randomWord = vocab[int(random(vocab.length))];
int textColor = 255;
PFont font;


void setup() {
   size(800, 800);
   background(0);
   textSize(tSize);
   words = new Word[50];
   textAlign(CENTER);
   smooth();
   font= createFont("Pacifico.ttf");
 }
           
 void draw() {
   background(0);
   textSize(70);
   fill(255);
   text("Success", 350,400);
   
   textFont(font);
   
   fill(255,0,0);
   textSize(tSize);
   text(randomWord, mouseX, mouseY);
   if(tSize>=0) tSize=tSize-0.5;
   for(int i=0; i<numberWords; i++){
     words[i].draw();
   }
 }
      
void mouseMoved(){
  if(tSize<50) tSize=tSize+0.75;
}
 
void mousePressed(){
  if (numberWords<50) {
    words[numberWords]=new Word(randomWord,mouseX,mouseY,tSize,textColor);
    randomWord = vocab[int(random(vocab.length))];
    numberWords++;
    textColor=int(random(175,230));
    fill(255,0,0);
  }
}
 
class Word{
int x, y, tcolor;
String word;
float z;

Word(String nword, int xpos, int ypos, float zpos, int colour){
  word = nword;
  x = xpos;
  y = ypos;
  z = zpos;
  tcolor = colour;
 
}
 
void draw(){
  fill(tcolor,0,0);
  textSize(z);
  text(word, x, y);
}
}



