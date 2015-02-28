
//Maxim maxim; 
//Audioplayer player1;


//boolean playit = false;

boolean bStop; //this allows to pause with keyPressed
void keyPressed()
{
  bStop = !bStop;
  if (bStop)
    noLoop();
  else
    loop();
}
 

void setup()
{
  size(600,600);
  smooth();
  background(0);
  frameRate(24); 
  
//maxim = new Maxim(this);
//player1 = maxim.loadFile();
//player.setLooping(true);


}


void draw(){
  strokeWeight(10);
  
  for (int x = 0; x < 600; x+=100){
    for (int y = 0; y < 600; y+=100){
//      color from = color(0,0,255);
//      color to = color(0,0,255);
      fill(random(0, 255), random(0, 255), random(0, 255));
//      fill(lerpColor(from, to, 0.5));
      
      rect(x,y,100,100);
    }
  }
}

//void mousePressed() {
//
//  playit = !playit;
//
//  if (playit) {
//
//    player.play();
//  } 
//  else {
//
//    player.stop();
//  }
//}





