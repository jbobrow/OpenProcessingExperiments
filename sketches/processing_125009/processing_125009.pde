
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
*/
//AudioPlayer player;
//Minim minim;

PImage eart;

int x = 0;
color[] pallys= {
  #F79A02, #FA0D30, #FAEF0D, #FA3C0D, #FA3C0D
};
color[] pally= {
  #99BBF5, #99F5BE, #8DC10A, #0A82C1, #052739
};

void setup() {

  //minim = new Minim(this);
 // player = minim.loadFile("dreammix.wav");
  //player.play();

  eart = loadImage("eart.png");
  size(900, 600);
}
void draw() {




  background(0);
  image(eart, 0, 0);





  for (int x = 50; x < 600; x += 250) {
    fill(pallys[int(random(1, 5))]);
    
    ellipse(105 + x, mouseX + 50, 300, 300);
    
    fill(pally[int(random(1, 5))]);
    
    ellipse(65 + x, mouseY, 140, 140);
    fill(random(200));
     ellipse(105 + x + 50, mouseY +100 + 50, 140, 140);
  }
}




