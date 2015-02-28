
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioPlayer mysound;
 
void setup()
{
  size(700, 630, P2D);
  minim = new Minim(this);                        // cerate a new Minim object
  mysound = minim.loadFile("CheapTrickDreamPolice.mp3");        // load the MP3
  mysound.loop();                                // set it to loop
background (#000000);
}
void draw()
{

smooth();
stroke(255);


/*  {
    ellipse(i, 50 + mysound.left.get(i)*50, i+1, 50 + mysound.left.get(i+1)*50);
    ellipse(i, 150 + mysound.right.get(i)*50, i+1, 150 + mysound.right.get(i+1)*50);
}
 */




noStroke();
for(int i = 0; i < mysound.bufferSize() - 1; i++)          // for every value in the buffer
{fill(#EFFF1A);
ellipse (333,306,mysound.left.get (i)*600, mysound.left.get (i)*600);
}



for(int i = 0; i < mysound.bufferSize() - 1; i++)          // for every value in the buffer
{fill(#8F10AD);
ellipse (333,306,mysound.left.get (i)*500, mysound.left.get (i)*500);

}


for(int i = 0; i < mysound.bufferSize() - 1; i++)          // for every value in the buffer
{fill(#77FF0A);
ellipse (333,306,mysound.right.get (i)*400, mysound.right.get (i)*400);

}


for(int i = 0; i < mysound.bufferSize() - 1; i++)          // for every value in the buffer
{fill(#0AF5FF);
ellipse (333,306,mysound.right.get (i)*300, mysound.right.get (i)*300);

}


for(int i = 0; i < mysound.bufferSize() - 1; i++)          // for every value in the buffer
{fill(#FF0ADF);
ellipse (333,306,mysound.left.get (i)*200, mysound.left.get (i)*200);

}




for(int i = 0; i < mysound.bufferSize() - 1; i++)          // for every value in the buffer
{fill(#FF0000);
ellipse (333,306,mysound.left.get (i)*100, mysound.left.get (i)*100);

}








  }












void mouseClicked() {
//void mousePressed() {
 //println(mouseX + " " + mouseY);
  

 if(mysound.isPlaying()){
    mysound.pause();
  
 
 }
else{
 mysound.play(); 
  
}

}





