

color yellow = color(255, 209, 0);
color green = color(165, 239, 0);
color pink = color(201, 0, 122);
color blue = color(100, 150, 255);
LightPink[] lightPinks;
LightYellow[] lightYellows;
LightGreen[] lightGreens;
LightBlue[] lightBlues;
int idPink;
int idYellow;
int idGreen;
int idBlue;


void setup(){
  background(0);
  size(300,300);
  noStroke();
  lightPinks = new LightPink[48];
  lightYellows = new LightYellow[48];
  lightGreens = new LightGreen[48];
  lightBlues = new LightBlue[48];
  for(int i=0; i<48; i++){
    if( i<16 ){
      lightPinks[i] = new LightPink( 20 * (i+1), 40 , i, 1);
      lightYellows[i] = new LightYellow( 20 * (i+1), 100 , i, 1);
      lightGreens[i] = new LightGreen( 20 * (i+1), 160 , i, 1);
      lightBlues[i] = new LightBlue( 20 * (i+1), 220 , i, 1);
    }else if((i >= 16) && (i < 32)){
      lightPinks[i] = new LightPink( 20 * (i-16+1), 60 , i, 1);
      lightYellows[i] = new LightYellow( 20 * (i-16+1), 120 , i, 1);
      lightGreens[i] = new LightGreen( 20 * (i-16+1), 180 , i, 1);
      lightBlues[i] = new LightBlue( 20 * (i-16+1), 240 , i, 1);
    }else if((i >= 32) && (i < 48)){
      lightPinks[i] = new LightPink( 20 * (i-32+1), 80 , i, 1);
      lightYellows[i] = new LightYellow( 20 * (i-32+1), 140 , i, 1);
      lightGreens[i] = new LightGreen( 20 * (i-32+1), 200 , i, 1);
      lightBlues[i] = new LightBlue( 20 * (i-32+1), 260 , i, 1);
    }
  }
  //minim = new Minim(this);
  //song = minim.loadSnippet("christmas1.mp3");
  
  frameRate(30);
}

void draw(){
  for(int i=0; i<48; i++){
    lightPinks[i].update();
    lightYellows[i].update();
    lightGreens[i].update();
    lightBlues[i].update();
    lightPinks[i].lightUp();
    lightYellows[i].lightUp();
    lightGreens[i].lightUp();
    lightBlues[i].lightUp();
    //lightBlues[i].mouseClicked();
  }
  
  fill(0,50);
  rect(0,0,width,height);
}

void mouseClicked(){
  for(int i=0; i<48; i++){
    lightBlues[i].mouseClicked();
    lightGreens[i].mouseClicked();
    lightYellows[i].mouseClicked();
    lightPinks[i].mouseClicked();
  }
}

/*void stop(){
  song.close();
  minim.stop();
  super.stop();
}

void keyPressed(){
  if( key == 'p' ){
    song.rewind();
    song.play();
  }
  
}*/
class LightBlue {
  int x, y;
  int idBlue;
  float r;
  float a;
  int lightUpFlag = 1;

  LightBlue(int xpos, int ypos, int colorID, int LIFlag) {
    x = xpos;
    y = ypos;
    idBlue = colorID;
    lightUpFlag = LIFlag;
  }

  void update() {
    if ((mouseX< x+15)&&(x-15<mouseX)) {
      if ((mouseY< y+15)&&(y-15<mouseY)) {
        r = cos(a);
        a += PI/40;
        fill(blue);
        noStroke();
        smooth();
        ellipse(x, y, r * 15, r * 15);

        noStroke();
        smooth();
        fill(255, 255, 255, 150);
        ellipse(x, y, r * 10, r * 10);

        noStroke();
        smooth();
        fill(255, 255, 255, 250);
        ellipse(x, y, r * 5, r * 5);
      }
    }
  }
  void lightUp() {
    if (lightUpFlag == -1) {
      r = cos(a);
      a += PI/40;
      fill(blue);
      noStroke();
      smooth();
      ellipse(x, y, r * 15, r * 15);

      noStroke();
      smooth();
      fill(255, 255, 255, 150);
      ellipse(x, y, r * 10, r * 10);

      noStroke();
      smooth();
      fill(255, 255, 255, 250);
      ellipse(x, y, r * 5, r * 5);
    }
  }
  void mouseClicked(){
    if ((mouseX< x+15)&&(x-15<mouseX)) {
      if ((mouseY< y+15)&&(y-15<mouseY)) {
        lightUpFlag *= -1;
      }
    }
  }
  
}
class LightGreen{
  int x, y;
  int idGreen;
  float r;
  float a;
  int lightUpFlag = 1;

  
  LightGreen(int xpos, int ypos, int colorID, int LIFlag){
    x = xpos;
    y = ypos;
    idGreen = colorID;
    lightUpFlag = LIFlag;
    
  }
  
  void update(){
    if((mouseX< x+15)&&(x-15<mouseX)){
      if((mouseY< y+15)&&(y-15<mouseY)){
        r = cos(a);
        a += PI/40;
        fill(green);
        noStroke();
        smooth();
        ellipse(x, y, r * 15, r * 15);
      
        noStroke();
        smooth();
        fill(255,255,255,150);
        ellipse(x, y, r * 10, r * 10);
      
        noStroke();
        smooth();
        fill(255,255,255,250);
        ellipse(x, y, r * 5, r * 5);
        
      }
    }
  }
  void lightUp() {
    if (lightUpFlag == -1) {
      r = cos(a);
      a += PI/40;
      fill(green);
      noStroke();
      smooth();
      ellipse(x, y, r * 15, r * 15);

      noStroke();
      smooth();
      fill(255, 255, 255, 150);
      ellipse(x, y, r * 10, r * 10);

      noStroke();
      smooth();
      fill(255, 255, 255, 250);
      ellipse(x, y, r * 5, r * 5);
    }
  }
  void mouseClicked(){
    if ((mouseX< x+15)&&(x-15<mouseX)) {
      if ((mouseY< y+15)&&(y-15<mouseY)) {
        lightUpFlag *= -1;
      }
    }
  }
  
}
class LightPink{
  int x, y;
  int idPink;
  float r;
  float a;
  int lightUpFlag = 1;

  
  LightPink(int xpos, int ypos, int colorID, int LIFlag){
    x = xpos;
    y = ypos;
    idPink = colorID;
    lightUpFlag = LIFlag;
    
  }
  
  void update(){
    if((mouseX< x+15)&&(x-15<mouseX)){
      if((mouseY< y+15)&&(y-15<mouseY)){
        r = cos(a);
        a += PI/40;
        fill(pink);
        noStroke();
        smooth();
        ellipse(x, y, r * 15, r * 15);
      
        noStroke();
        smooth();
        fill(255,255,255,150);
        ellipse(x, y, r * 10, r * 10);
      
        noStroke();
        smooth();
        fill(255,255,255,250);
        ellipse(x, y, r * 5, r * 5);
        
      }
    }
  }
  void lightUp() {
    if (lightUpFlag == -1) {
      r = cos(a);
      a += PI/40;
      fill(pink);
      noStroke();
      smooth();
      ellipse(x, y, r * 15, r * 15);

      noStroke();
      smooth();
      fill(255, 255, 255, 150);
      ellipse(x, y, r * 10, r * 10);

      noStroke();
      smooth();
      fill(255, 255, 255, 250);
      ellipse(x, y, r * 5, r * 5);
    }
  }
  void mouseClicked(){
    if ((mouseX< x+15)&&(x-15<mouseX)) {
      if ((mouseY< y+15)&&(y-15<mouseY)) {
        lightUpFlag *= -1;
      }
    }
  }
  
  
}
class LightYellow{
  int x, y;
  int idYellow;
  float r;
  float a;
  int lightUpFlag = 1;

  
  LightYellow(int xpos, int ypos, int colorID, int LIFlag){
    x = xpos;
    y = ypos;
    idYellow = colorID;
    lightUpFlag = LIFlag;
    
  }
  
  void update(){
    if((mouseX< x+15)&&(x-15<mouseX)){
      if((mouseY< y+15)&&(y-15<mouseY)){
        r = cos(a);
        a += PI/40;
        fill(yellow);
        noStroke();
        smooth();
        ellipse(x, y, r * 15, r * 15);
      
        noStroke();
        smooth();
        fill(255,255,255,150);
        ellipse(x, y, r * 10, r * 10);
      
        noStroke();
        smooth();
        fill(255,255,255,250);
        ellipse(x, y, r * 5, r * 5);
        
      }
    }
  }
  void lightUp() {
    if (lightUpFlag == -1) {
      r = cos(a);
      a += PI/40;
      fill(yellow);
      noStroke();
      smooth();
      ellipse(x, y, r * 15, r * 15);

      noStroke();
      smooth();
      fill(255, 255, 255, 150);
      ellipse(x, y, r * 10, r * 10);

      noStroke();
      smooth();
      fill(255, 255, 255, 250);
      ellipse(x, y, r * 5, r * 5);
    }
  }
  void mouseClicked(){
    if ((mouseX< x+15)&&(x-15<mouseX)) {
      if ((mouseY< y+15)&&(y-15<mouseY)) {
        lightUpFlag *= -1;
      }
    }
  }
  
}


