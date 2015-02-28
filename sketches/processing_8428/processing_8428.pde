
import ddf.minim.*;
Minim minim;
AudioInput in;
AudioRecorder recorder;
AudioPlayer playerT, playerR, playerV;

void setup(){
  minim = new Minim(this);
  size(470, 420);
  stroke(255);
  smooth();
  in = minim.getLineIn(Minim.STEREO, 2048);
  recorder = minim.createRecorder(in, "myrecording.wav", true);

  textFont(createFont("SanSerif", 12));
}

PImage SunMoon, runner, old, babe, tree, light, thundergo;

int rain, thunder, sunmoonsize = 60;
float runx, babex, oldx;

void draw(){
  runner = loadImage("runner.jpg");
  old = loadImage("old.jpg");
  babe = loadImage("babe.jpg");
  tree = loadImage("tree.jpg");
  light = loadImage("light.jpg");

  if(hour() >= 6 && hour() < 18){    //Sun or moon && tree or light
    background(0, 128, 255, 240);
    SunMoon = loadImage("sun.jpg");
    thundergo = loadImage("thundermorning.jpg");
    fill(255);
    for(int x = 120; x < 430; x = x + 50){   //draw cloud
      noStroke();
      ellipse(x, 30, 70, 50);
    }
    image(SunMoon, 20, 20 , sunmoonsize, sunmoonsize);

    for(int x = 0; x<= 385; x = x+35){
      image(tree, x, 140, 15, 20);
    }

  }
  else{
    background(0);
    SunMoon = loadImage("moon.jpg");
    thundergo = loadImage("thundernight.jpg");
    fill(140, 140, 140);
    for(int x = 120; x < 430; x = x + 50){
      noStroke();
      ellipse(x, 30, 70, 50);
    }
    image(SunMoon, 20, 20 , sunmoonsize, sunmoonsize);

    for(int x = 0; x<= 385; x = x+35){
      image(light, x, 130, 15, 20);
    }
  }
  stroke(255);
  fill(128, 0, 0, 240);                //跑道
  rect(0, 160, 470, 80);
  rect(0, 240, 470, 80);
  rect(0, 320, 470, 80);
  line(420, 160, 420, 400);             

  runx = 420 - second() * 7;        //跑者們
  image(runner, runx, 330, 50, 60);
  babex = 420 -(minute() + norm(second(), 0, 60)) * 7;
  image(babe, babex, 250, 50, 60);
  oldx = 420 - ((hour() % 12) + norm(minute(), 0, 60)) * 35;
  image(old, oldx, 170, 50, 60);                  

  if ( recorder.isRecording() ){    //判斷錄音
    fill(255);
    text("Currently recording...", 100, 240);
  }
  else{
    fill(255);
    text("Not recording.", 100, 240);
  }
}

void mouseClicked(){
       //判斷打雷
    image(thundergo, 130, 50, 60, 75);
    image(thundergo, 250, 50, 60, 75);
    image(thundergo, 370, 50, 60, 75);
    playerT = minim.loadFile("thunder.mp3", 2048);
    playerT.play();
}
  
void keyPressed(){
  if(key == 'B' || key == 'b'){    //太陽月亮變大
    sunmoonsize = 120;
  }
  if(key == 'R' || key == 'r'){   //是否下雨
  playerR = minim.loadFile("rain.mp3", 2048);
  playerR.play();
    for(int y = 50; y <= 400; y = y + 40){
      for(int x = 100; x <= 450 ; x = x + 30){
        line(x, y, x, y + 15);
      }
    }
  }
  if(key == 'x' || key == 'X'){
  playerV = minim.loadFile("myrecording.wav", 2048);
  playerV.play();
 }
}

void keyReleased(){
  if(key == 'B' || key == 'b'){
    sunmoonsize = 60;
  }
  if(key == 'v' || key == 'V'){
    if ( recorder.isRecording() ){
      recorder.endRecord();
    }
    else{
      recorder.beginRecord();
    }
  }
  if(key == 'c' || key == 'C'){
    recorder.save();
    println("Done saving.");
  }  
}

void stop(){
  // always close Minim audio classes when you are done with them
  playerT.close();
  playerR.close();
  playerV.close();
  minim.stop();  
  super.stop();
}





