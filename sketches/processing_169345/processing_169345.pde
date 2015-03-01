
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/149830*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PImage ocean;
PImage stormocean;
float timer = 0;
float FR = 60;
String word;
int x_speed = 2;
int y_speed = 2;
int[] x = new int[8];
int[] y = new int[8];
String[] word = new String[8];


void setup(){
  size(500,500);
  frameRate = FR;
  ocean = loadImage("ocean.jpg");
  stormocean = loadImage("stormocean.jpg");
  font = loadFont("FFScala.ttf");
  font2 = loadFont("Shojumaru-Regular.ttf");
  word[0] = "Many people think I am very";
  word[1] = "secretive";
  word[2] = "concavity";
  word[3] = "cold";
  word[4] = "introverted";
  word[5] = "uncommunicative";
  word[6] = "calm";
  word[7] = "quiet";
  word[8] = "independent";  
  for(i = 0; i <= 8; i++){
  word[i] = new Words (word[i], 500, 150, 5, 1);
  }
}

void draw(){
 
  
  if(timer <= 4){
  ocean.resize(500,500);
  image(ocean,0,0);
  }
  else{
  stormocean.resize(500,500);
  image(stormocean,0,0);
  }
  
  for(i = 0; i <= 8; i++){
    if (timer >= .25 * i){
    word[i].move();
    word[i].draw();
    }
  }
  
  if(timer >= 4.5 && timer <= 5.5){
    fill(255);
    textFont(font2,48);
    text("In fact I am very",random(50,100),random(50,100));
  }
    if(timer >= 5 && timer <= 6){
    fill(255);
    textFont(font2,random(20,48));
    text("thoughtful",random(100,150),random(100,150));
    }
    if(timer >= 5.5 && timer <= 6.5){
    fill(255);
    textFont(font2,random(20,48));
    text("self-aware",random(150,200),random(150,200));
    }
    if(timer >= 6 && timer <= 7){
    fill(255);
    textFont(font2,random(20,48));
    text("observant",random(200,250),random(200,250));
    }
    if(timer >= 6.5 && timer <= 7.5){
    fill(255);
    textFont(font2,random(20,48));
    text("fun",random(250,300),random(250,300));
    }
    if(timer >= 7 && timer <= 8){
    fill(255);
    textFont(font2,random(20,48));
    text("cute",random(150,250),random(300,350));
    }
    if(timer >= 7.5 && timer <= 8.5){
    fill(255);
    textFont(font2,random(20,48));
    text("creative",random(100,150),random(350,400));
    }
  
  timer += 1/(FR);
  }
  
 class Words{
  float x;
  float y;
  float x_speed;
  float y_speed;
  String word;
   
  Words (String WORD, float CLASS_X, float CLASS_Y, float X_Speed, float Y_Speed){
    word = WORD;
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
  void draw(){
    fill(0);
    textFont(font,30);
    text(word,x,y);
  }
   
  void move(){
     if(y <= 125){
     y_speed *= -1;
     }
     if(y >= 175){ 
     y_speed *= -1;
     }
     x -= x_speed;
     y += y_speed;
  }
   
}

   





