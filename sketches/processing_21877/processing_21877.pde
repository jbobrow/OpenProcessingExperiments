
import ddf.minim.*;

Minim minim;
//AudioSample kick;
AudioPlayer groove;
AudioPlayer kick; 
AudioPlayer tam; 

float triggerX=250;
float triggerY=0;
float trigger2Y=100;
float trigger3Y=200;
float trigger4Y=300;
float trigger5Y=400;
float xpos=0,ypos=0;

boolean musicAPlayed=false;
boolean musicBPlayed=false;
boolean musicCPlayed=false;

float radius = 100;
float rad=0;
float frequency = 2;
float x;

boolean flag = false;
float angle = 0;
float locationX = 0;
float locationY = 0;

int polarX = 1, polarY = 1;

void setup() {
  size(500,500);
  smooth();
  rectMode(CENTER);
  locationX = width/2;
  locationY = height/2;
  minim = new Minim(this);

  // load BD.wav from the data folder
  kick = minim.loadFile( "bass.mp3", // filename
  512      // buffer size
  );
  groove = minim.loadFile( "drummer.mp3", // filename
  512     // buffer size
  );
  tam = minim.loadFile( "tambourine.mp3", // filename
  512    // buffer size
  );
}
void draw() {
  noStroke();
  fill(255,241,0);
  background(255);
  beginShape();
  vertex(0,0);
  bezierVertex(0,00,triggerX,triggerY,500,0);
  vertex(500,0);
  vertex(500,100);
  vertex(0,100);
  endShape(CLOSE);
  ///
  fill(247,143,30); //orange
  beginShape();
  vertex(0,100);
  bezierVertex(0,100,triggerX,trigger2Y,500,100);
  vertex(500,100);
  vertex(500,200);
  vertex(0,200);
  endShape(CLOSE);
  //

  fill(237,0,140); //pink
  beginShape();
  vertex(0,200);
  bezierVertex(0,200,triggerX,trigger3Y,500,200);
  vertex(500,200);
  vertex(500,300);
  vertex(0,300);
  endShape(CLOSE);
  //
  beginShape();
  fill(165,66,152); //purple
  vertex(0,300);
  bezierVertex(0,300,triggerX,trigger4Y,500,300);
  vertex(500,300);
  vertex(500,400);
  vertex(0,500);
  endShape(CLOSE);
  //
  beginShape();
  fill(0,147,239); // blue
  vertex(0,400);
  bezierVertex(0,400,triggerX,trigger5Y,500,400);
  vertex(500,400);
  vertex(500,500);
  vertex(0,500);
  endShape(CLOSE);
  //

  for (int i = 0; i < kick.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, kick.bufferSize(), 0, width);
    float x2 = map(i+1, 0, kick.bufferSize(), 0, width);
    noStroke();

    fill(237,0,140); //pink
    quad(x1, 200 - kick.mix.get(i)*50,   x2, 200 - kick.mix.get(i+1)*50  ,x2,300, x1,300);
    fill(165,66,152); //purple
    quad(x1, 300 - groove.mix.get(i)*50, x2, 300 - groove.mix.get(i+1)*50,x2,300, x1,300);  
    fill(0,147,239); // blue
    quad(x1, 400 - tam.mix.get(i)*50,    x2, 400 - tam.mix.get(i+1)*50   ,x2,500, x1,500);
  }


  fill(33);
  translate(locationX, locationY);
  rotate(angle);
  rect(rad, rad,10,10);

  if (!flag) {
    angle += 0.055;
  }


  if(rad>50) {
    if(musicAPlayed == false) {
      kick.loop();
      musicAPlayed=true;
    }
  }

  if(rad>150) {
    if(musicBPlayed == false) {
      groove.loop();
      musicBPlayed=true;
    }
  }
    if(rad>200) {
    if(musicCPlayed == false) {
      tam.loop();
      musicCPlayed=true;
    }
  }
}
void keyPressed() {
  //rotate(mouseY);
  rad++;
  
  println(rad);
  flag = true;
}
void keyReleased() {
  flag = false;

  locationX += rad * polarX;
  locationY += rad * polarY;
  rad = 0;
}

void stop()
{
  kick.close();
  minim.stop();

  super.stop();
}


