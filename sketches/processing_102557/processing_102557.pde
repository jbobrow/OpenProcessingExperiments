
float mx;
float my;
float easing = 0.5;
int radius = 24;
int edge = 100;
int t = 0;
int inner = edge + radius;
int trans  = 25;
PImage bg;
PImage clear;
PImage mount;
PImage rain0;
PImage rain1;
PImage rain2;
PImage sun1;
PImage sun2;
PImage sun3;
Maxim maxim;
AudioPlayer player;
/* @pjs preload="gray.jpg"; */
void setup() {
  size(700, 600);
  bg = loadImage("gray.jpg");
  clear = loadImage("cloudscl.GIF");
  mount = loadImage("colormountb.jpg");
  rain0 = loadImage("rain0.GIF");
  rain1 = loadImage("rain1.GIF");
  rain2 = loadImage("rain2.GIF");
  sun1 = loadImage("transition0.GIF");
  sun2 = loadImage("transition1.GIF");
  sun3 = loadImage("transition2.GIF");
  noStroke(); 
  imageMode(CENTER);
  maxim = new Maxim(this);
  player = maxim.loadFile("rain-06.wav");
  player.setLooping(false);
}
void mousePressed() {
  if (trans < 230){
  player.cue(0);
  player.play(); }
}
  
void draw() { 
  background(0);
  image(bg, 350, 300, 700, 600);
  
  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }
  
  mx = constrain(mx, 100, 600);
  my = constrain(my,60, 140);
  
  tint(255, trans);  // Display at half opacity
  
  image(mount, 350, 300, 700, 600);
  tint(255, 255);
  if (trans < 225) {
      image(clear, mx, my, 350, 154);
  } else if (trans >= 225 && trans < 240) {
      image(sun1, mx,my, 350, 154);
      player.stop();
      trans += 5;
  } else if (trans >= 240 && trans < 255) {
       image(sun2, mx,my, 350, 154);
       trans += 5;
  } else if (trans >= 255) {
    image(sun3, 200, 60, 350, 154);
    player.stop();
    
    //image(mount, 400, 301, 800, 602);
  }
  if (mousePressed == true) {
    if (trans < 230){
    player.cue(0);
    player.play();}
    
    if (trans < 225){
      t += 1;
      if (t <= 3){
          image(rain0, mx, my+350, 200, 690);
      }
      else if (3 < t && t <= 6){
          image(rain1, mx, my+350, 200, 690);
      }
      else if  (6 < t && t<= 9){
           image(rain2, mx, my+350, 200, 690);
      }
      else if (t >= 9){
        t = 0;
        trans += 25;
      }
          
      }
      
    }
  }
  


void mouseReleased() {
  //trans += 15;
  player.stop();
}


