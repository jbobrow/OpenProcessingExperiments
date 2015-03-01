
int y = 50;
float r = 0;
//This are my two variable

//sub+is+verb+pre+the+adj+noun

String[] sub = {"Hehe", "Eason", "Bobby", "Shaurya", "Samuel", "Nicholas",
 "Alice", "Maizy", "Umair", "Jerry", "Sarrah", "Michael", "Matthew", "Jesselyn", "Filip", "Aditya"};
//This is the first that the computer will pick from as a subject

String[] is = {"is"};
//I want the computer to pick "is" as the verb so I only put one opition

String[] ver = {"dancing", "singing", "walking", "crying", "bleeding", "studying", "eating", 
 "flying", "looking", "melting", "driving", "crawling", "jumping", "" };
//This is the first that the computer will pick from as a verb 

String[] pre = {"under", "in front of", "above", "behind", "inside", "besides", "against", "on"};
  //This is the first that the computer will pick from as a pre
  
String[] the = {"the"};
//I want the computer to pick "is" as the verb so I only put one opition

String[] adj = {"beautiful", "dirty", "tasty", "fat", "dump", "smart", "clean", "evil", "happy", "sad", "scary", 
"nosy", "large", "small", "funny", "lovely", "dangerous", "lazy", ""};
//This is the first that the computer will pick from as a adj

String[] nou = {"toilet", "lab", "gym", "canteen", "library", "office", "hospital", "sandwich", "panda", "lego", 
"school", "doctor", "angel", "flower", "tree"};
//This is the first that the computer will pick from as a noun

void write_word(String[] words) {
  int n = int(random(words.length));
  //This tell the computer to pick a ramdom word length
  textSize(random(20, 40));
  text(words[n], random(50, 150), y);
  y = y + 30;}
  //This tell the computer to pick the size of the word randomly 

void new_sentence() {
  background(random(0,250), random(0,250),random(0,255));
  y = 50;
  //This tell the computer to pick a random background 
  
  write_word(sub);
  write_word(is);
  write_word(ver);
  write_word(pre);
  write_word(the);
  write_word(adj);
  write_word(nou);}
  //This is how the sentence is form
  //The order of word come here 

void setup() {
  size(500, 400);
  //This set a size of a window
  background(255);
  //This set the background colour
  fill(#258FBF);
  new_sentence();}

void draw(){ stroke(random(0,256),random(0,256),random(0,256));
  float distance_left = random(500);
  line(distance_left,0, distance_left,500);
  fill(255);
  rotate(r);
  //This set of code make the colourful line This is from: 
  //http://www.funprogramming.org/9-Change-screen-size-animate-colorful-lines.html   
 
  float circle_size = random(5, 15);
  ellipse(100 + r, 10, circle_size, circle_size);
  r = r + 0.2;
  println(r); }
 //This set of code make the colourful circle from the upper rigth conner 
 //This is from: http://www.funprogramming.org/27-Animating-while-rotating.html

void mousePressed() {
  new_sentence();}
  //This code tell the computer that when ever you 
  //click on the screan it change to the new poem
  
void keyPressed() {
  int random_number = int(random(1000000));
  save(random_number + ".png");}
  
  //Most of my code came from www.funprogramming.org/57-A-random-sentence-generator-writes-nonsense.html
  
  
  
  
  
  
