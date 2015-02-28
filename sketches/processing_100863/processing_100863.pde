
int DROP_ARRYA_LENGHT = 2000;
Drop[] drop_array = new Drop[DROP_ARRYA_LENGHT];
PImage bg;
int waterfall_y_start=200;
int looper=0;
int waterfall_x_start=270; 
int waterfall_x_end=390;

//Maxim maxim;
//AudioPlayer player;

class Drop{
  int xpos;
  int ypos;
  color drop_color;
  
  Drop(){
    restart(true);
  }
  
  void restart(boolean first_start){
    int r = int(random(220,255));
    int g = int(random(230,255));
//    int b = int(random(255,255));
    int b = 255;
    drop_color = color(r,g,b);
    xpos=int(random(waterfall_x_start, waterfall_x_end));
    if (first_start){
      ypos=int(random(waterfall_y_start, 480));
    }else{
      ypos=int(random(waterfall_y_start, waterfall_y_start+10));
    }
      
  }
  
  void move(){
     xpos=xpos+int(random(-2,2));
     ypos=ypos+int(random(0,8));
     if (ypos>height){
       restart(false);
     }
  }
  void display(){
    int alpha=20;
    int waterfall_middle=int((waterfall_x_start+waterfall_x_end)/2);
    int dist_from_waterfall_middle=abs(xpos-waterfall_middle);
    if (dist_from_waterfall_middle>80){
      alpha=0;
    }else if(dist_from_waterfall_middle>50){
      alpha = int(map(sq(dist_from_waterfall_middle), 0, 6400, alpha, 0));
    }
    stroke(drop_color, alpha);
     point(xpos,ypos); 
  }
  
}

void setup(){
  size(640,480);
  frameRate(15);
  bg=loadImage("bg.jpg");
//  maxim = new Maxim(this);
//  player = maxim.loadFile("waterfall_sound.wav");
//  player.setLooping(true);
  for (int i=0; i<drop_array.length;i++){
    drop_array[i]=new Drop();
  }
  tint(255,255);
  image(bg,0,0);
//  background(bg);
}


void mousePressed()
{

// code that happens when the mouse button
// is pressed
//  player.cue(0);
//  player.play();
}

void draw(){
  looper++;
  if (looper==10){
     player.play(); 
  }
  tint(255,7);
  image(bg,0,0);
  strokeWeight(6);
  for (int i=0; i<drop_array.length;i++){
    drop_array[i].move(); 
    drop_array[i].display(); 
  } 
}


