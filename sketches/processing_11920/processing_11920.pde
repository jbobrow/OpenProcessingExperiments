
PFont font; //command for  font class
PImage a1;// command for image class which I have named a1
PImage a2;//second command for image class which I have called a2

int s = second(); //class iniation for seconds command




  
void setup() //this is the setup of your program
{


  size(500,500);// this is the size of my window
 
  //current= new PImage(a,0,0);
  //background(0);
  a1 = loadImage("tegrotegrof.jpg");//this is the image to be loaded from the sketch folder called tegrotegrof.jpg
  a2 = loadImage("666.jpg"); // this is the image the other image to be loaded called 666.jpg
  
 //loadImage[] images = { "tegrotegrof.jpg", "666"};
  
 a1.resize(500,500);// this is the resizing of the a1 image to 500 * 500 pixels to fit the screen size
  a2.resize(500,500);// this is the other "a2" image that is to be resized to 500* 500
  
  

  font = loadFont ("Handwriting-Dakota-48.vlw"); // this is the font that I have created to be uploaded called Dakota Handwriting

  textFont (font, 32);// this is the font that I have assigned to the font which happens to be 32 sized font

  String[] words = { 
    "cut", "photo", "grave", "hand" //these are random words that I have assigned in a string in setup to be previewed at the bottom of the processing applcation
  };
  int index = int(random(words.length));  // this creates and initation index that strings the words together randomly
  println(words[index]);  // this command in setup allows the word to be printed in the "index" part of the processor application
}




 








void draw()  // this is the draw function that reads setup and allows the sketch to be drawn
{
 
 int s = second();// this creates and initiation that stands for seconds, which runs with the computers clock to assign time
 line(s, 0, s, 500);  // this creates a line that acts as a second hand that "ticks" from left to right, starting at the 0 point and moving right
 if (s < 5) {  // this line is saying that if the seconds that coordinate with the computer are under 5 the background will be a1 image
background (a1);} else { background (a2);// and over 5 seconds the background is the a2 image
}


  


   
text("feeling", 225, random(height));  //these are a series of text to be drawn, this word is "feeling" to be assign point 225 and move up and down the height of the page randomly
  text("decision", random(width),225);  // this word is "decision" to start at a height of 225 and be assigned a random width
  text("forget", random(width),180);  // this text is "forget" with a height of 180 and a randomly assigned width
  text("to get", 180, random(height));// this text is "to get" with a width of 180 and a randomly assigned height
  text("love", 150, random(height)); // this text is "love" which has a width of 150 with a randomly assigned height
  text("hate", random(width),140);  // this text is "hate" with a height of 140 and a randomly assigned width
  text("welcome", 110, random(height)); // this text is "welcome" with a width of 110 and a randomly assigned height

   }




void mousePressed()  // this is a command which activates when the mouse is pressed
{
   noLoop();// this is telling the program to stop looping when the mouse is pressed
  
  
}



 
void keyPressed(){  //this is a command which activates when a key is pressed

if (key == 's') // this is code is saying that if the 's' key is pressed
  save("frame.jpg"); // to save the frame as a 'frame.jpg'
  if (key == 'r') // this line of code is saying that when key 'r' is pressed the program will loop, this is because pressing the mouse will stop the loop and this is just reinitiating loop
  
   loop();

   if (key == ' ')// this is saying that if the space bar is pressed the program will exit
   exit();
    
  }
 
  
  
  
  


 





