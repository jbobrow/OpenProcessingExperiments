

float speed;
Maxim maxim;
AudioPlayer player;
float power=0;
boolean play = false;

void setup () {
size (800, 900);
noStroke();
frameRate(20);
//maxim = new Maxim(this);
//player = maxim.loadFile("mybeat.wav");
//player.setLooping(true);
//player.setAnalysing(true);
rectMode(CENTER);
}
 
void draw () {
  
  
 // if ( play )
 // {
   // player.play();
  //  power = player.getAveragePower();
  //  fill(random(255),random(255),random(255),250);
  //  ellipse(mouseX,mouseY,power*500,500*power);
 // }
//}
  speed=abs(mouseX-pmouseX);
  fill(random(255),random(255),random(255),250);
  ellipse(mouseX+random(-60,60),mouseY+random(-60,60),speed,speed);
  ellipse(mouseX,mouseY,speed,speed);
  
   if (mousePressed == true) {
     
    stroke(0, 50);
     
    line(mouseX, mouseY, width, mouseX);
    line(mouseX, mouseY, 0, mouseX);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

 }



