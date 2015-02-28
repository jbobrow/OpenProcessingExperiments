
/*Joseph Kotay. Practice Computattional Methods. Professor Nick Senske. Conditions and Random Animation.
This sketch uses a matrix based on colors.  Conditionals are used to establish the positioning of the
cards.*/

int num = 50;
Card[] myCard= new Card[num];  //initialize array for new array
color[] myColors = new color[6];
  
void setup(){
   
  size(400,400);
  background(255);
  smooth();
  frameRate(50);
   
  myColors[0] = color(80,140,0,random (100)); //set up color matrix.
  myColors[1] = color(200,15,0,random (100));
  myColors[2] = color(155,50,0,random (100));
  myColors[3] = color(0,60,200,random (mouseX));
  myColors[4] = color(50,0,200, random (mouseY));
  myColors[5] = color(200,15,0,random (100));
 
    
  for(int i=0; i<num; i++){ 
  myCard[i] = new Card();
  }
}
 void draw(){
  for (int i=0; i<num; i++){ // when int. i is true, create a new card.
    myCard[i] .update();
    myCard[i] .draw();
  }
}
  
class Card { // establish class.
   
  float xpos = random(50,width-50);
  float ypos = random(50,height-50);
  color col = myColors[floor(random(0,6))];
   
  Card(){
  }
    
  void update(){
      
    xpos = xpos+ random(-2,2);
    ypos = ypos + random(-2,2);
  }
    
  void draw(){
    if (mousePressed) { //left click mouse to clear the screen.
      background(255);
    } else{
    rectMode(CENTER);
     stroke(0);
     fill(xpos+4,ypos-15,random(0,150));
     rect(xpos,ypos,20,40);
    }
  }
}

