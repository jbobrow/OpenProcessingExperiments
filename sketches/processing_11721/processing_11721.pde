
// combinatorial systems (putting things together...)

// -- -- -- The Wall

String [] firstWords = {
  "this", "that","a","which", "the", "what"};

String [] secondWords = {
  "big", "hairy","blue","scary","green", "cute","crying","smooth"};

String [] thirdWords = {
  "cat", "dog","fish","eggplant", "postman", "tractor",};
  
String [] fourthWords = {
  "hiccups", "skips","dances","eats","speeds","slurps"};
  
String [] fifthWords = {
  "elegently", "slowly","crazily","by itself","dreamily"};

// String firstword = "this"; // make a String variable, and set its value
// String secondword = "cat"; // make a String variable, and set its value

PFont georgia;

// -- -- -- Setup


void setup(){
  size(400,400);
  background(255);
  georgia = createFont("Georgia",24); // font name (looks in font library) and then builds bitmaps based on size 24
  noLoop();
}

void draw(){
  
  background(255);
  
  textFont(georgia,24); // use this font and size
  fill(0);
  
  String word1 = firstWords[int(random(firstWords.length))];
  String word2 = secondWords[int(random(secondWords.length))];
  String word3 = thirdWords[int(random(thirdWords.length))];
  String word4 = fourthWords[int(random(fourthWords.length))];
  String word5 = fifthWords[int(random(fifthWords.length))];
  
  text(word1,50,100); 
  text(word2,50,150);
  text(word3,50,200);
  text(word4,50,250);
  text(word5,50,300);

  // println(firstWords[int(random(firstWords.length))]);
  // println(secondWords[int(random(secondWords.length))]);


  String output = firstWords[int(random(firstWords.length))] + " " + secondWords[int(random(secondWords.length))];
  // joining the Strings together (with a space)

  println (output);
  // orubt the result

}

void mouseReleased(){
 redraw(); 
}


