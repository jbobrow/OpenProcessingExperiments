
//////////set command number///////

////////image command set///////

PImage img01,img02,img03,img04,img05,img06;

/////////object position/////////

int x01 = 131;
int x02 = 90;
int x03 = 104;
int x04 = 94;
int x05 = 101;
int x06 = 142;

/////////object speed/////////

int y01 = 30;      
int y02 = 20;
int y03 = 10;
int y04 = 10;
int y05 = 20;
int y06 = 30;


//////////setup standard///////////

void setup(){
size(450, 450);
noStroke();
smooth();

////////loading image////////////
shadow = loadImage("shadow.png");
img01 = loadImage("ap01.png");
img02 = loadImage("ap02.png");
img03 = loadImage("ap03.png");
img04 = loadImage("ap04.png");
img05 = loadImage("ap05.png");
img06 = loadImage("ap06.png");

///////////basic speed///////////

frameRate(60);
}

///////////roll comand/////////////

void draw() {
  background(0);       //butthakejama
  
image(shadow,100,70);    //position
  
  tint(50,250,50);       //color
  image(img01,x01,70);   //image set
    x01 = x01 - y01;     //object speed
    if (x01 <= -399) {   //warp point black
      x01 = 501;         //warp point white
  }
  
  tint(250,250,50);      //ika onaji
  image(img02,x02,180);
    x02 = x02 + y02;
    if (x02 >= 498) {
      x02 = -402;
  }
  
  tint(250,180,50);
  image(img03,x03,220);
    x03 = x03 - y03; 
    if (x03 <= -351) {
      x03 = 549;
  }
  
  tint(255,20,20);
  image(img04,x04,260);
    x04 = x04 + y04; 
    if (x04 >= 494) {
      x04 = -406;
  }
  
  tint(190,0,180);
  image(img05,x05,296);
    x05 = x05 + y05;
    if (x05 >= 513) {
      x05 = -387;
  }
  
  tint(120,130,255);
  image(img06,x06,330);
    x06 = x06 - y06;
    if (x06 <= -381) {
      x06 = 519;
  }
}

////////////slowing///////////

void mousePressed() {
  frameRate(2);
}

/////////fasting/////////

void mouseReleased() {
  frameRate(60);
}

/////////slot stop/////////

void keyPressed() {
  if ( key == 's' ) {
size(450,450); 
frameRate(30);

y01 = 0;
y02 = 0;
y03 = 0;
y04 = 0;
y05 = 0;
y06 = 0;

//////////sand storm//////////

for(int y = 0; y <= height; y += 10){
  stroke(255);
  strokeWeight(1);
  line(0, y, width, y);  
    }
  }
  
/////////slot go/////////
  
  if ( key == 'g' ) {
size(450,450); 
frameRate(60);

y01 = 30;
y02 = 20;
y03 = 10;
y04 = 10;
y05 = 20;
y06 = 30;

/////////sand storm////////

for(int y = 0; y <= height; y += 10){
  stroke(255);
  strokeWeight(1);
  line(0, y, width, y);  
    }
  }
} 





