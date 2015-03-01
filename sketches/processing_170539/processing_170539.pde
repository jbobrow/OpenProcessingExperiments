
PImage nice;
PImage crazy;
float timer = 0;
float FR = 100;
//String word;
//int x_speed = 5;
//int y_speed = 2;
//int[] x = new int[8];
//int[] y = new int[8];
String[] word = new String[9];
 
 
void setup(){
  size(500,500);
  //frameRate = FR;
  nice = loadImage("nice.jpg");
  crazy = loadImage("crazy.jpg");
  font = loadFont("FFScala.ttf");
  font2 = loadFont("Shojumaru-Regular.ttf");
  word[0] = "NICE";
  word[1] = "happy";
  word[2] = "Innocent";
  word[3] = "cute";
  word[4] = "passive";
  word[5] = "SHY";
  word[6] = "quiet";
  word[7] = "cool-tempered";
  word[8] = "SWEET"; 
  word[9] = "nice"; 
  for(i = 0; i <= 9; i++){
  word[i] = new Words (word[i], 500, 150, 5, 2);
  }
}
 
void draw(){
  
   
  if(timer < 4){
  nice.resize(500,500);
  image(nice,0,0);
  }
  else{
  crazy.resize(500,500);
  image(crazy,0,0);
  }
  
/*  if(timer > 10){
  crazy.resize(500, 5000);
  image(crazy, 0,0);
  }
  else{
  nice.resize(500, 500);
  image(nice, 0, 0); 
  }
 */  
  for(i = 0; i <= 9; i++){
    if (timer >= .25 * i){
    word[i].move();
    word[i].draw();
    }
  }
   
  if(timer >= 4.5 && timer <= 9.5){
    fill(random(255), random(225), random(225));
    textFont(font2,48);
    text("WTF",random(50,200),random(50,200));
  }
    if(timer >= 4.9 && timer <= 6.5){
    fill(255);
    textFont(font2,random(20,48));
    text("CRAZY",random(400,150),random(100,150));
    }
    if(timer >= 5.5 && timer <= 6.5){
    fill(255);
    textFont(font2,random(20,48));
    text("funny",random(150,200),random(150,200));
    }
    if(timer >= 6 && timer <= 7){
    fill(255);
    textFont(font2,random(20,48));
    text("Rabid Mario and K-pop fan?",random(50,50),random(100,200));
    }
    if(timer >= 6.5 && timer <= 9){
    fill(255);
    textFont(font2,random(20,48));
    text("Passionate",random(250,300),random(250,300));
    }
    if(timer >= 6 && timer <= 9.6){
    fill(255, 248, 15);
    textFont(font2,random(20,48));
    text("Fierce",random(150,250),random(300,350));
    }
    if(timer >= 5.5 && timer <= 9.5){
    fill(255);
    textFont(font2,random(20,48));
    text("Risk Taker",random(100,450),random(350,400));
    }
    if(timer >= 5.5 && timer <= 9.5){
    fill(random(255), random(255), random(255));
    textFont(font2,random(20,48));
    text("???",100,450,350,400);
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
    textFont(font,20);
    text(word,x,y);
  }
    
  void move(){
     if(y <= 125){
     y_speed *= 1;
     }
     if(y >= 175){
     y_speed *= 1.02;
     }
     x -= x_speed;
     y += y_speed;
  }
    
}


