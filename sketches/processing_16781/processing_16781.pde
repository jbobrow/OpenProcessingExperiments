
PenroseSnowflakeLSystem ps;
Wanderer[] wanderer = new Wanderer[1000];

//PenroseSnowflakeLSystem ps;


PFont f;
String message = "La pensée 考えていた。لفكر.思想。생각.Σκέψης.חשבתי.Мысль.ความคิด یں نے سوچا. Tư tưởng.געדאַנק.";
String message2 = "La pensée 考えていた。لفكر.思想。생각.Σκέψης.חשבתי.Мысль.ความคิด یں نے سوچا. Tư tưởng.געדאַנק.";
// An array of Letter objects
Letter[] letters;
Letter[] letters2;

//PImage img2;
//PImage img;



void setup() {
  //size((img.width),(img.height));
  size (600,400);
  tint (250, 70);
 background(#97A4B4);
  //background(0);
  
  stroke(255);
  noFill();
  smooth();
  ps = new PenroseSnowflakeLSystem();
  ps.simulate(4);
 
  
  
  
 // img = loadImage ("nuage1.jpg");
  //img2 = loadImage ("nuage2.jpg");
  // Load the font
  f = createFont("Arial",30,true);
  textFont(f);

  // Create the array the same size as the String
  letters = new Letter[message.length()];
  letters2 = new Letter[message2.length()];
  // Initialize Letters at the correct x location
  int x = 5;
  for (int i = 0; i < message.length(); i++) {
    letters[i] = new Letter(x,height/2,message.charAt(i)); 
    x += textWidth(message.charAt(i));
  }
  for (int i = 0; i < message2.length(); i++) {
    letters2[i] = new Letter(x, (height/2) + 50, message2.charAt(i)); 
    x += textWidth(message2.charAt(i));
  }
  
   for (int i=0; i<wanderer.length; i++)
 {
   wanderer[i] = new Wanderer(random(width), random(height));
 }
 
 int m = minute ();
}


void draw() { 
  //background(255);
  fill(random(200,255));
  noStroke();
  for (int i=0; i<wanderer.length; i++)
 {
   wanderer[i].stayInsideCanvas();
   wanderer[i].move();
   rect(wanderer[i].getX(), wanderer[i].getY(), 40, 40);
 }
noFill();
noStroke();

//ps.render();


 //int m= minute();
 //for (int i=1; i < m; i++) {
 //textAlign(CENTER);
 //loop();
  //if(i <=1 ) {  
  //letters[i].shake();
  
  //background();
  //background (img);
  //image(img,random(-7,5), random(-4,5) );
  //image (img,0,0, width,height);


  
  
  //image (img2,0,100);
  for (int i = 0; i < letters.length; i++) {
    // Display all letters
    letters[i].display();

    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    //if (mousePressed) {
    letters[i].shake();
    //} else {
    //letters[i].home();
    // }
  }
  
  ps.render();

  for (int i = 0; i < letters2.length; i++) {
    // Display all letters
    letters2[i].display();

    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    //if (mousePressed) {
    letters2[i].shake();
    //} else {
    //letters[i].home();
    // }
  }
  

  
  
  
}

