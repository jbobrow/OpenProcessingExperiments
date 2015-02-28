


import ddf.minim.*;

AudioPlayer player;
Minim minim;

float angle;
float jitter;
 

void setup() {
 size(800, 500, P3D);
 smooth();
 minim = new Minim(this); 
 player = minim.loadFile("song3.mp3"); //mp3ファイルを指定する 
  player.play();
player.loop();  //再生
 frameRate(30);

}

void draw() {
  background(255,255,255);
  
  pointLight(mouseX,80,210, // Color
             200, -200, 0); // Position
  
  // Blue directional light from the left
  directionalLight(210,  mouseX, 80, // Color
                   300, 300, 0); // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  spotLight(80,210, mouseX, // Color
            100, 50, 400, // Position
            0, -0.9, -2, // Direction
            PI / 2, 2); // Angle, concentration
  
  smooth();
 for(int i = 0; i < player.left.size()-1; i++)
  {
  angle = angle - jitter;
  float c = sin(angle);
  translate(width/2, height/2);
  rotateY(frameCount*PI/120);
  rotate(player.right.get(i)/20);
  noStroke();
  box(player.right.get(i)*250,player.right.get(i)*250,player.right.get(i)*250); 

  
  

  pushMatrix();
  translate(width/-4, height/-20);
  rotateY(frameCount*PI/120);
  translate(20, 400);
  noStroke();
  box(player.right.get(i)*150,player.right.get(i)*150,player.right.get(i)*150); //半径30pxの球
  popMatrix();

  pushMatrix();
  translate(width/-80, height/6);
  rotateY(frameCount*PI/120);
  translate(-50, -600);
  noStroke();
  box(player.right.get(i)*150,player.right.get(i)*150,player.right.get(i)*150); //半径30pxの球
  popMatrix();
 
 
  
  pushMatrix();
  translate(width/8, height/6);
  rotateY(frameCount*PI/120);
  translate(-150, -90);
  noStroke();
  box(player.right.get(i)*150,player.right.get(i)*150,player.right.get(i)*150); //半径30pxの球
  popMatrix();
 
 

 

  }
  
 }
 
void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  
  super.stop();
}

