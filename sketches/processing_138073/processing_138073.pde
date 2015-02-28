
import ddf.minim.*;

//My title of this artistics is called 'The Enhanced of the final version'
//My intention/artistics
//1. To draw the circle, triangle and rectangle in uniform pattern

//2. The color of the pattern depends of the key 1,2,3,4,5
//To save the picture press s, 
//To delete just press delete or backspace
//3. To play a music just press m

//Global Varaibles 
color strokeColor = color(3,10);
Minim minim;

//AudioPlayer musics;
AudioSample musics;

//setup()
void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100); 
  noFill();
  background(360);
  //Load audio file from HDD
  minim=new Minim(this);
  musics = minim.loadSample("techbeat.wav");
  //bells.play();
}
//draw()
void draw() {
  if (mousePressed) {
    pushMatrix();
    
    //style
    strokeWeight(2);
    stroke(strokeColor);
    ellipse(mouseX/2, mouseY/2, mouseX/2, mouseY/2);
    rect(mouseX/2, mouseY/2, mouseX/2, mouseY/2);
    ellipse(mouseX/4, mouseY/4, mouseX/4, mouseY/4);
    rect(mouseX/4, mouseY/4, mouseX/4, mouseY/4);
    ellipse(mouseX/6, mouseY/6, mouseX/6, mouseY/6);
    rect(mouseX/6, mouseY/6, mouseX/6, mouseY/6);

    popMatrix();
  }
}
//keyPressed()
void keyReleased() {
  if(key=='m')musics.trigger();
  if(key=='m')println("Can you hear the music?");
  if (key == DELETE || key==BACKSPACE) background(360);
  if (key== 's' || key=='S') saveFrame("yourpicture.png");

  switch(key) {
  case '1':
    strokeColor = color(200, 120, 50, 10);
    break;

  case '2':
    strokeColor = color(100, 100, 24, 10);
    break;

  case '3':
    strokeColor = color(152, 200, 80, 20);
    break;
    
  case '4':
    strokeColor = color(162, 210, 90, 20);
    break;
    
  case '5':
    strokeColor = color(172, 220, 100, 20);
    break;
  }
}


