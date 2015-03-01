
//My first experiment with Processing
// JediSith 1.1

// Variable initialization: Sound and Images
Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
PImage luke;
PImage vader;
PImage back;
PImage handle;
PImage handlenemy;



void setup()
{
  size(500, 600);
  maxim = new Maxim(this);
  player = maxim.loadFile("clash.wav");
  player.setLooping(false);
  player2 = maxim.loadFile("SlowSabr.wav");
  player2.setLooping(false);
  //No looping on the lightsaber sounds
    player3 = maxim.loadFile("imperial.wav");
  player3.setLooping(true);
  //Set looping for the background music
  player.volume(0.6);
  rectMode(CENTER);
    player3.play();
    luke = loadImage("luke.png");
    vader = loadImage("vader.png");
    back = loadImage("starback.jpg");
    handle = loadImage("handle.png");
    handlenemy = loadImage("handlenemy.png");

}

void draw()
{
  image(back, 1/width-400, 1/height-100, back.width/1.5, back.height/1.5);
  //The first image is the background
  image(vader, width/3.2, height/1.7, vader.width/5, vader.height/5);
  image(luke, width/3.7, height/30, luke.width, luke.height);
  // Vader and Luke, one in the first half of the screen and
  // the other above
  image(handle, mouseX-2, mouseY-2, handle.width/9, handle.height/9);
  //the lightsaber handle will follow the mouse 
 
float green = dist(mouseY,0,height/1.3,0);
float red = dist(mouseY,0,1/height,0);
//the code colour for appearing a green lightsaber in
// the first half of this screen and red in the other half
float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
float lineWidth = map(speed, 0, 100, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  
  stroke(red, green, 0, 255);
  strokeWeight(lineWidth);


line(pmouseX-110,pmouseY-73,mouseX, mouseY);
//lightsaber size 
  stroke(255, 255, 255);
  strokeWeight(4);
  line(pmouseX-110,pmouseY-73,mouseX, mouseY);
// White glow
}

void mouseDragged()
{


  player.stop();
  player2.play();
// When the mouse is dragged, stop playing previous sound
// animations and start playing the lightsaber sound

float redenemy = dist(mouseY,0,height/1.3,0);
float greenenemy = dist(mouseY,0,1/height,0);
//the color code is inverted for the enemy lightsaber
float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
float lineWidth = map(speed, 0, 100, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  
  stroke(redenemy, greenenemy, 0, 255);
  strokeWeight(lineWidth);


line(pmouseX-140,pmouseY+20,mouseX-28, mouseY-70);
//Enemy lightsaber crossing yours
  stroke(255, 255, 255);
  strokeWeight(4);
  line(pmouseX-140,pmouseY+20,mouseX-28, mouseY-70);
// White glow in the enemy's sabre
image(handlenemy, pmouseX-190, pmouseY+19, handle.width/9, handle.height/9);
// You can use the same height and width properties as the handle.png



}

void mouseReleased()
{
//When the mouse is released stop playing the lightsaber sound
// and start playing the lightsaber clash sound
  player.play();
  player2.stop();
  

        
}



