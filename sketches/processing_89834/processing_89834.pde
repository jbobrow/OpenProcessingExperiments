
String[] text;
String[] words;
int numWord;
float wordX;
float wordY;
float counter;

void setup() {
  size(800,600);
  wordX=width/2;
  wordY=height/2;
  text=loadStrings("Seeker.txt");
  String poem=join(text, " ");
  words=splitTokens(poem, " ");
  numWord=words.length;
  background(39);
}

void draw() {
  //for(counter=0;counter<numWord;counter++) { 
  
  if(counter<numWord){
    String indWord=words[int(counter)];
  text(indWord,wordX,wordY);
  wordY=wordY+int(random(-50,50));
  wordX=wordX+int(random(-50,50));
  counter++;
}
}


  




