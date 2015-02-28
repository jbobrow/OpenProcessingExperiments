
//Lauren Ruoff lruoff copyright 2014
//press '+' to increase speed
//press '-' to decrease speed
//press space bar to stop
//press any other key to exit
//mouse press to change text color

String [] dataStrings;
StringList newStringList, newStringList2;
float y;
int edgeCase;
float size;
PFont font;
color fontColor;
int counter;
float speed;
boolean textColor = false;
boolean page1 = true;

//////////////////////////////ALL THE STRINGS\\\\\\\\\\\\\\\\////////////////////
void setup() {
  size(400, 500);
  background( 255 );
  fill( 255 );
  textAlign( LEFT );

  font = loadFont("TimesNewRomanPSMT-10.vlw");
  textFont(font, 32);
  fontColor = color(255);

  size = 10;
  textSize( size );
  edgeCase = int( width/( size*(1.8/3.5 )));
  int i = edgeCase;
  int a = 0;
  counter = 0;
  speed = .08;


  dataStrings = loadStrings( "tuck everlasting excerpt ch 12 copy copy.txt" );
  String joinedStrings = join( dataStrings, " " );
  newStringList = new StringList( );
  newStringList2 = new StringList( );

  ///////////\\\\\\\\\\\\checking the edge and creating substrings\\\\\\\\\\\\\////////////

  while ( i < joinedStrings.length ()) {
    while ( joinedStrings.charAt ( i ) != ' ' ) {
      i--;
    }
    if(counter < 40) {
    newStringList.append(joinedStrings.substring(a, i));
    a = i;
    i+=edgeCase;
    counter++;
  }
  else{
    newStringList2.append(joinedStrings.substring(a, i));
    a = i;
    i+=edgeCase;
  }
  }
  
  if(i < joinedStrings.length ( ) + edgeCase){
     newStringList2.append(joinedStrings.substring(a,joinedStrings.length()));
  }

  int s = newStringList.size(); //////////checking
  println(s);                   //////////the size of newString
}

////////\\\\\\\\\\\\\\\\\\\\DOING THINGS/////////////\\\\\\\\\\\\\\\\\\
void draw() {
  
  int increment = 0;

  background(255);

  //////////////rectangle/////////////////////////////// 
  y = y+speed;
  noStroke();
  fill(200, 100, 0);
  rect(0, 0, width, y);

  if (y > height) {
    y = 0;
    page1 = !page1;
  }
  

  ///////////////display text///////////////////////////////////
  fill(fontColor);
  if (page1) {
    for (int k = 0; k < newStringList.size(); k++) {
      text(newStringList.get(k), 20, k*12+20);
    }
  }
  else {
    for (int k = 0; k < newStringList2.size(); k++)
      text(newStringList2.get(k), 20, k*12+20);
  }
}

void keyPressed() {
  if(key == '+' || key == '=') {
     speed += .1;
  }
  else if(key == '-' || key == '_') {
    speed -= .1;
    if(speed < 0) {
      speed = 0;
    }
  }
  else if(key == ' ') {
    speed = 0;
  }
  else{
    exit();
  } 
}

void mousePressed() {
  if(textColor) {
    fontColor = color(0);
  }
  else{
    fontColor = color(255);
  }
  textColor =! textColor; 
}










