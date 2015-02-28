


int savedTime;
int totalTime = 5000;


String[] terms = {
  "Dude" ,
  "Brother" ,
  "Friend" ,
  "Bro" ,
  "Buddy" ,
  "Son" ,
  "Pops",
  "Baby" ,
  "Man" ,
  "Dude" ,
  "Brother" ,
  "Nigger" ,
  "Cocksucker" ,
  "Friend" ,
  "Bro" ,
  "Buddy" ,
  "Faggot" ,
  "Son" ,
  "Pops",
  "Slut",
  "Fucker" ,
  "Mother Fucker" ,
  "Son-of-a-bitch",
  "Cracker",
  "Negro" ,
  "Devil" ,
  "Baby" ,
  "Man" ,
};

PFont f; 
float x; 

int index = 0;

void setup() {
  size(600,600);
  f = loadFont( "PerpetuaTitlingMT-Light-200.vlw" );
  textFont(f,200);


  
  x = width;
  
}

void draw() {
  
  background(0);
  fill(255);
  

 textFont(f,250);
  textAlign (CENTER);
  text(terms[index],x,height/2);
   if(mousePressed == true) {
    noCursor();
  } 
  
 x = x - 7;
 
 
 float w = textWidth(terms[index]);
  if (x < -w) {
    x = width; 
    index = ((index + 2) % terms.length);
  }
  
}

