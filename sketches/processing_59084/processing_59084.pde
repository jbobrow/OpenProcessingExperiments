
//Sgt Pepper By Elke Steen z333435
// inspired by: Buchcover - Roman

//I used the random function to jumble strings of text. The aim was to have 
//readable sentences once the mouse was pressed. I used the random function
//to create the movement, and mouseX and mouseY to create the changeable
//background.


PFont font; 
float x = -100;
float y = 500;


String [] line1 = {"Sgt Pepper's", "Elke's", "Katie's", "Sarah's", "Emily's", "Chere's",  "Elki's", "Amy's", "Jaye's", "Daniel's", "Antonia's", "Lily's", "Holly's", "Brad's","John's","Callin's", "Cecilla's", "Toni's", "Jessica's"};
String [] line2 = {"lonely hearts", "phony hearts", "angry hearts", "lame hearts", "tame hearts", "famed hearts", "broken hearts", "artificial hearts", "hollow hearts", "shallow hearts", "mellow hearts", "high hearts", "sly hearts", "wry hearts", "crafty hearts", "love hearts", "smug hearts"};
String [] line3 = {"club", "group", "fraterinity", "association", "alliance", "fellowship", "society"};
String [] line4 = {"band", "ensemble", "orchestra", "symphony", "troupe", "sinfionetta"};
//Create Strings and set the values

void setup(){
  size(780,500);
  font = loadFont("Candara-48.vlw"); 
  smooth(); 
}

void draw(){
  fill(0);
  textSize(random(10, 24)); //random text size between 10 and 24pt
  background(mouseX /2, mouseY/2, 300, 700); //background colour chnage based on the mouse position


  
  
if (mousePressed) { 

  noLoop(); //using noLoop to stop the movement when the mouse is pressed
  x = 100;  //changing the x and y values to create a read able sentense when the mouse is pressed
  y = 100;
  
 
} else {
  x = -100;
  y = 500;
 
}
  
  String word1 = line1[int(random(line1.length))];
  String word2 = line2[int(random(line2.length))];
  String word3 = line3[int(random(line3.length))];
  String word4 = line4[int(random(line4.length))];
//using the random functionto generate random word combinations from the String lines
 
  text(word1, random(x - 50 ,y -50), random(x,y));
  text(word2,random(x + 100,y +150), random(x,y));
  text(word3,random(x + 300,y + 300), random(x,y));
  text(word4,random(x + 500, y + 500), random(x,y));
//setting the word parameters, they appear randomly between the dimensions
  

}
void mouseReleased() {  // void mouse released makes the movement continue when the mouse isnt held down
  loop();

}




