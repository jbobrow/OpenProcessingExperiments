




import ddf.minim.*;

AudioPlayer player;
Minim minim;
float last,interval;
void setup()
{
  size(512, 600);

  minim = new Minim(this);

  background(0);


  changePlayer("impulsepingpong.mp3");

  last = millis();
  interval=9750; // 300 msecs

}



void draw()
{
  if(millis()- last > interval) {
    background(random(0,180));  
    
   

    last = millis();
  }

  if(frameCount % 5==0) {
  fill(0,0,0, 5);
  rect(0,0, width,height);
  }



  for(int i = 0; i < player.left.size()-1; i++)
  { 
    stroke(255);
    line(i, tan(50 + player.left.get(i)*50)*2, i+1, sin(50 + player.left.get(i+1)*50));
    line(i, 175 + player.right.get(i)*200, i+1, 175 + player.right.get(i+1)*200);
    
    float col = 1.5 *(150 + player.right.get(i)*50);
    float Rcol = map (col, 216, 229, 100, 200);
    float Gcol = map (col, 216, 299, 100, 255);
    
    noStroke();
    fill (Rcol, Gcol, random(200),random(200));
    smooth();
    ellipse(width/2.5,height-150,(50 + player.left.get(i)*50),(90 + player.left.get(i)*35));
    }
}

// change AudioPlayer to use new file, taking care of closing
// existing file if already playing
void changePlayer(String s) {
  if(player!=null) player.close();
    player = minim.loadFile(s, 512); //this makes a big difference in size if the graphic and smoothness of play
  player.loop();  
    last=last-100000;
}

void keyPressed () {
  if(key=='p')delay(2000);
  if(key=='1') changePlayer("Yo.mp3");
  if(key=='2') changePlayer("impulsepingpong.mp3");

}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();

  super.stop();
}




