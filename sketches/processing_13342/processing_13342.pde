
import beads.*;

AudioContext ac;


void setup() {
  size(600, 400,P3D);
  background(255);
  smooth(); //anti-aliased
  ac = new AudioContext();

 Clock clock = new Clock(ac, 100);
 clock.addMessageListener(
  //this is the on-the-fly bead
  new Bead() {
    //this is the method that we override to make the Bead do something
     public void messageReceived(Bead message) {
       Clock c = (Clock)message;
        if(c.isBeat()) {
          WavePlayer wp = new WavePlayer(ac, (float)Math.random() * 3000 + 100, Buffer.SINE);
          //WavePlayer wp = new WavePlayer(ac, (float)Math.random() * 3000 + 100, Buffer.SAW);
          Gain g = new Gain(ac, 1, 0.1);
          g.addInput(wp);
          ac.out.addInput(g);
          
       }
       
     }
   }
 );
 ac.out.addDependent(clock);
 ac.stop();

}


void mouseClicked() {
  background(255);
  ac.start();
 
}

void draw(){
  float a = random (0,width*0.3);
  stroke(#999999);
  strokeWeight(0.5);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, a, a);
  
}

