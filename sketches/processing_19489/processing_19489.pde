
import ddf.minim.*;

Minim minim;
AudioPlayer player;
boolean playSwitch = false;
boolean fadeaway=false;
boolean funkycolours=false;
boolean differentrange=false;
boolean reverseit=false;
int fadelevel=4;
float yFloor = 70;

float yPos = yFloor;

float volumeLevel = 0;
float volumeMin = 0.01;
float volumeScale = 70;
float strokesize=10;
float strokemax=50;
float xmax=360;
float xmin=0;
float xpos=0;
color colour=color (255);
PFont font;


void setup() {
  size(250,250);

  font=createFont("Futura",40);


  minim = new Minim(this);
  player = minim.loadFile("09 avril 14th.mp3", 512);
}

void draw() {
  if(!playSwitch) {
    player.pause();  
    background(0,0,0);
  }
  if (playSwitch) {
    player.play();
    xpos++;
  }
   if (playSwitch&&reverseit) {
    player.play();
    xpos--;
  }
  if (fadeaway) {
    fill(0,0,0,fadelevel);
    noStroke();
    rect(0,0,width,height);
    
  }

  if(funkycolours) {
    colour=color (random(yPos,255),random(yPos,255),random(yPos,255));
    
  }


  if (differentrange && key=='.') {
    strokesize++;
    
    if (strokesize>=50) {
      strokesize=strokemax;
    }
    textFont(font,strokesize);
  }
  if (differentrange && key==',') {
    strokesize--;
    
    if (strokesize==0) {
      strokesize=1;
    }
    textFont(font,strokesize);
  }
  if (differentrange) {
    
    textFont(font,strokesize);
  }



  volumeLevel=0;
  for(int i = 0; i < player.bufferSize() - 1; i++) {
    if ( abs(player.mix.get(i)) > volumeLevel ) {
      volumeLevel = abs(player.mix.get(i));
    }
  }

  if(volumeLevel>volumeMin) {
    yPos -= volumeLevel * volumeScale;
    
  }
pushMatrix();
translate(width/2-strokesize,height/2);
rotate(radians(xpos));
  fill(colour);
  textFont(font,strokesize);
  text("L2R 3R9",yPos,yPos);
     text("L2R 3R9",yPos*-1,yPos*-1);
    
    popMatrix();
  strokeWeight(1);
  
  if ( yPos < width ) {
    yPos = yFloor;
  }
  
  

  println(xpos+"Fade Out? " + fadeaway + "  Funky Colours? " + funkycolours +"  Dot Size? " +differentrange+ "  Stroke " + strokesize + "  Reverse? " +reverseit);
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}

void keyPressed() {
  if(key==' ') {

    if(!playSwitch) {
      playSwitch=true;
    }
    else if(playSwitch) {
      playSwitch=false;
    }
  }
  if(key=='1') {
    if(!fadeaway) {
      fadeaway=true;
    }
    else if(fadeaway) {
      fadeaway=false;
    }
  }
  if(key=='2') {
    if(!funkycolours) {
      funkycolours=true;
    }
    else if(funkycolours) {
      funkycolours=false;
      colour=color(255);
    }
  }
  
  
  if(key=='3') {
    if(!differentrange) {
      differentrange=true;
    }
    else if(differentrange) {
      differentrange=false;
      strokesize=10;
    }
  }
}


