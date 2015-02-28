
import ddf.minim.*;

Minim minim;
AudioPlayer player;
boolean playSwitch = false;
boolean fadeaway=false;
boolean funkycolours=false;
boolean differentrange=false;
boolean reverseit=false;
int fadelevel=20;
float yFloor = 250;
float yPos = yFloor;
float volumeLevel = 0;
float volumeMin = 0.01;
float volumeScale = 250;
float strokesize=20;
float strokemax=100;
float xmax=250;
float xmin=0;
float xpos=0;
color colour=color (255);



void setup() {
  size(250,250);



  
  minim = new Minim(this);
  player = minim.loadFile("Household Goods.mp3", 512);
}

void draw() {
  if(!playSwitch) {
    player.pause();  
    background(0,0,0);
  }
  if (playSwitch) {
    player.play();
  }
  if (fadeaway) {
    fill(0,0,0,fadelevel);
    noStroke();
    rect(0,0,500,300);
    xpos++;
  }
  if (fadeaway&&reverseit) {
    xpos--;
    fill(0,0,0,fadelevel);
    noStroke();
    rect(0,0,500,300);
  }
  if(funkycolours) {
    colour=color (mouseX,mouseY,-mouseX);
    xpos++;
  }
  if(funkycolours&&reverseit) {
    xpos--;
    colour=color (mouseX,mouseY,-mouseX);
  }

  if (differentrange && key=='.') {
    strokesize++;
    xpos++;
    if (strokesize>=100) {
      strokesize=strokemax;
    }
    strokeWeight(strokesize);
  }
  if (differentrange && key==',') {
    strokesize--;
    xpos++;
    if (strokesize==0) {
      strokesize=1;
    }
    strokeWeight(strokesize);
  }
  if (differentrange) {
    xpos++;
    strokeWeight(strokesize);
  }
  if (differentrange && key=='.'&&reverseit) {
    strokesize++;
    xpos--;
    if (strokesize>=100) {
      strokesize=strokemax;
    }
    strokeWeight(strokesize);
  }
  if (differentrange && key==','&&reverseit) {
    strokesize--;
    xpos--;
    if (strokesize==0) {
      strokesize=1;
    }
    strokeWeight(strokesize);
  }
  if (differentrange&&reverseit) {
    xpos--;
    strokeWeight(strokesize);
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
  stroke(colour);
  point(xpos,yPos);
  strokeWeight(1);
  if(reverseit) {
    stroke(yPos,0,127);
    line(xpos,0,xpos,height);
    xpos--;
    if(xpos==xmin) {
      xpos=250;
    }
  }


  if ( yPos < height ) {
    yPos = yFloor;
  }
  if(xpos>xmax) {
    xpos=0;
  }

  println("Fade Out? " + fadeaway + "  Funky Colours? " + funkycolours +"  Dot Size? " +differentrange+ "  Stroke " + strokesize + "  Reverse? " +reverseit);
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
      strokesize=0;
    }
  }
  if(key=='r') {
    if(!reverseit) {
      reverseit=true;
    }
    else if(reverseit) {
      reverseit=false;
    }
  }
}


