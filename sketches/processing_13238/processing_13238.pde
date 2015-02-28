
//When the letters that spell sydney are pressed, a connection between them is drawn, forming a constellation

Star[] stars = new Star[0];
//use a variable (eg counter) to specify size of array
initial[] initials = new initial[0];
//WordLetter[] word = new WordLetter[6];
PFont fontA;
//create a string(same thing as array) with the word sydney. Then search through the array of letters and mark boolean yes/no for each letter of the string.

 PImage d;

void setup() {
  
 
d = loadImage("Untitled6.jpg");


  size(1066,936);
 background (d);
  smooth();
  frameRate(30);
  //initialise star index to 0
//  stars[0] = new Star (50,0,16);
//  word[0] = new WordLetter("S");
  //word[1] = new WordLetter("Y");
 // word[2] = new WordLetter("D");
  //word[3] = new WordLetter("N");
  //word[4] = new WordLetter("E");
  //word[5] = new WordLetter("Y");
 
 
   fontA = loadFont("CourierNew36.vlw");
  textAlign(CENTER);
  // Set the font and its size (in units of pixels)
  textFont(fontA, 32);
 
}
void draw () {
 
  //update and display all stars
 
 // println(stars.length);
  for (int i=0; i<initials.length; i++) {
 
    stars[i].display();
  }
  for (int i=0; i<initials.length; i++) {
  
//    initials[i].display();
  }
}
 
void keyPressed() {
  //a new star object
 
  Star b = new Star(mouseX,mouseY,10);
//  initial b = new initial();
 
  char initial;
  initial = char(key);
   text(initial, mouseX,mouseY);
  //apppend to array
  stars = (Star[]) append(stars,b);
  println("stars:" + stars.length + "x:" + b.x + "y:" + b.y);
  if (stars.length > 1) {
      print("previousStarX:" + stars[(stars.length - 2)].x + " ");
      println("previousStarY:" + stars[(stars.length - 2)].y);
      println();
      line(stars[(stars.length - 2)].x,stars[(stars.length - 2)].y,
        b.x,b.y);
  } else {
    println("Initial Point");
    println();
  }
  
 //initial = (initial[]) append(initial,b);
}
 
//class WordLetter }
  public float x;
  public float y;
  public char letter;
  boolean isSet;
 
//WordLetter(char l){
//    letter = l;
//  } 
//}
class initial {
//for (int i = 0; i < initial;length; i++)
    char initial;
//  initial = char(key);
   // Draw the letter to the screen
//   text(initial, mouseX,mouseY);
 
  }

class Star {
  float x;
  float y;
  float speed;
  float w;
 
  Star(float tempX, float tempY, float tempW){
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
  }
 
 
 
  void display() {
    for (int i = 0; i < initials.length; i++)
    //display the star
   
    fill(255);
    noStroke();
    char initial;
    initial = char(key);
    text(initial,x,y);
   image(d , 0, 0);

    
   
     

  
  }

}
//

