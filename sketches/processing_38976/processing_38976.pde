
float tSize = 50;
Word[] words;
int numberWords=0;
String[] vocab = { "The Doors","perception","shaken", "animal", "obsessed", "martyrs", 
"arena", "crucified", "insulated", "ecstasy", "Brave New World", "mescaline", "transgressions",
"abstinence", "cat's meat", "liturgy", "HUXLEY", "malice", "dogmatism", "zeal", "fiction", 
"realm", "crisis", "swarm", "beefeater", "repertory"};
String randomWord = vocab[int(random(vocab.length))];
int textColor = 255;

void setup() {
   size(800, 800);
   background(0);
   textSize(tSize);
   words = new Word[50];
   textAlign(CENTER);
   smooth();
 }
		  
 void draw() {
   background(0);
   fill(textColor);
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
    textColor=int(random(100,255));
    fill(textColor);
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
  fill(tcolor);
  textSize(z);
  text(word, x, y);
}
}


