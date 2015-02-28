
import ddf.minim.*;
Minim minim;
AudioPlayer song;
float diameter = 5;
float space = 10;
float counter = 50;
float distance;
void setup(){
   minim = new Minim(this);
    song = minim.loadFile("Chimes.mp3");
    
  size (500,500);
  background (0);
  smooth();
  

}
void draw() {
background(2);
  if (mousePressed == true) {
    ellipse (mouseX,mouseY,20,20);
    fill(255);
  } 
  if (mousePressed == true) {
    song.play();
  }
 

  
    


 for (float x = 0; x < 100; x = x + 1)
  {
    for (float y = 0; y < 150; y = y + 3)
    {
    
  ellipse(x * counter, y *space , diameter, diameter);
  }
  }
   
  counter = counter + 0.2;
  

  if (counter > 100)
  {
    counter = 10;
  }
}
void stop()
{
    song.close();

minim.stop();
    super.stop();
        
      


}



