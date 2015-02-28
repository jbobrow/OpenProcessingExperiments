
/*Jason Fitzgerald
 2-15-2011 homework
 with some major help from processing.org tutorials!
 
 This week's homework is about combining a bunch of the skills you have and pushing them further. This week's sketch should: 
 
 1. Be interactive
 2. Use at least one for-loop
 3. Use at least 4 conditionals (ones from the bouncing ball example don't count)
 
 The possibilities for this project are endless--this is an invitation to play and explore. Choose something you are interested in and try to create a simple sketch of it. For example, you might create a piece of interactive fiction that changes with the user's input. Or you might make a complex drawing tool that creates interesting aesthetic effects. Or you might try creating a simple game that is engaging to play. 
 
 Below are some references in the book to techniques that you may find useful:
 Conditionals: page 51
 For-loops: page 61
 Mouse Input: page 205
 Keyboard Input: page 223*/


int num = 300;
float mx[] = new float[num];
float my[] = new float[num];

void setup(){
  size(400,400);
  colorMode(HSB, 365, 100, 100);
  background(186, 41, 100);
  smooth();
  frameRate(30);
  for (int y = 10; y < 390; y+= 10){
    for (int x = 10; x < 390; x+= 10){
      noFill();
      stroke(235,0,100);
      rect(x,y,10,10);
    }
  }
}

void draw(){

  if(mousePressed == true){
    float r = random(-10, 60);
    float x = random(-20, 60);



    fill(random(178,257), random(100), random(50,100));

    strokeWeight(1);


    rect(mouseX,mouseY,r,x);
    ellipse(mouseX, mouseY, r, x);

  }
}
void keyReleased(){
  if (key=='a') setup();
}






