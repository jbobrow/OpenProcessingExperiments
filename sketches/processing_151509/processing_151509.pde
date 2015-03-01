
int numdrills = 4;
int dirt_y_start = 1125;
int numrocks = 50;
PImage[] drills = new PImage[numdrills - 1];
PImage[] dirt_row1 = new PImage[30];
PImage[] dirt_row2 = new PImage[30];
PImage[] dirt_row3 = new PImage[30];
PImage[] dirt_row4 = new PImage[30];
PImage[] dirt_row5 = new PImage[30];
PImage[] dirt_row6 = new PImage[30];
PImage[] dirt_row7 = new PImage[30];
PImage[] dirt_row8 = new PImage[30];
PImage[] dirt_row9 = new PImage[30];
PImage[] dirt_row10 = new PImage[30];
PImage[] dirt_row11 = new PImage[30];
PImage[] dirt_row12 = new PImage[30];
PImage[] dirt_row13 = new PImage[30];
PImage[] dirt_row14 = new PImage[30];
PImage[] dirt_row15 = new PImage[30];
PImage[] dirt_row16 = new PImage[30];
PImage[] dirt_row17 = new PImage[30];
PImage[] dirt_row18 = new PImage[30];
PImage[] dirt_row19 = new PImage[30];
PImage[] dirt_row20 = new PImage[30];
PImage[] dirt_row21 = new PImage[30];
PImage[] dirt_row22 = new PImage[30];
PImage[] dirt_row23 = new PImage[30];
PImage[] dirt_row24 = new PImage[30];
PImage[] dirt_row25 = new PImage[30];
PImage[] dirt_row26 = new PImage[30];
PImage[] dirt_row27 = new PImage[30];
PImage[] dirt_row28 = new PImage[30];
PImage[] dirt_row29 = new PImage[30];
PImage[] dirt_row30 = new PImage[30];
PImage[] rock = new PImage [100];
PImage sky;
PImage rocks;
PImage dead_dirts;
PImage treasure;
float timer = 0;
int frate = 60;
int[] rockwidth = new int[numrocks];
int[] rockheight = new int[numrocks];
boolean win;
 
void setup(){
  size(750,750);

  for (int i = 0; i <= numdrills-1; i++){
   drills[i] = loadImage ( i + ".png"); 
  }
  drill = new Drills (375 , 250 , 0);
  dirts = loadImage ("dirt.jpg");
  dead_dirts = loadImage("deaddirt.jpg");
  rocks = loadImage ("rock.png");
  sky = loadImage ("sky.jpg"); 
  treasure = loadImage("treasure.jpg");
  font = loadFont("FFScala.ttf");
  
  for(int i = 0; i <= numrocks; i++){
    rockwidth[i] = random(width);
  }
   for(int i = 0; i <= numrocks; i++){
    rockheight[i] = random(50,700);
  }
  
}

void draw(){
  background(0,0,0);
  
  image(sky,width/2,dirt_y_start-925,750,400);
  
  for (int i = 0; i <= 30; i++){
    dirt_row1[i] = new Dirt (0+i*25,dirt_y_start-725);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row2[i] = new Dirt (0+i*25,dirt_y_start-700);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row3[i] = new Dirt (0+i*25,dirt_y_start-675);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row4[i] = new Dirt (0+i*25,dirt_y_start-650);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row5[i] = new Dirt (0+i*25,dirt_y_start-625);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row6[i] = new Dirt (0+i*25,dirt_y_start-600);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row7[i] = new Dirt (0+i*25,dirt_y_start-575);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row8[i] = new Dirt (0+i*25,dirt_y_start-550);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row9[i] = new Dirt (0+i*25,dirt_y_start-525);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row10[i] = new Dirt (0+i*25,dirt_y_start-500);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row11[i] = new Dirt (0+i*25,dirt_y_start-475);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row12[i] = new Dirt (0+i*25,dirt_y_start-450);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row13[i] = new Dirt (0+i*25,dirt_y_start-425);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row14[i] = new Dirt (0+i*25,dirt_y_start-400);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row15[i] = new Dirt (0+i*25,dirt_y_start-375);
  }
   for (int i = 0; i <= 30; i++){
    dirt_row16[i] = new Dirt (0+i*25,dirt_y_start-350);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row17[i] = new Dirt (0+i*25,dirt_y_start-325);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row18[i] = new Dirt (0+i*25,dirt_y_start-300);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row19[i] = new Dirt (0+i*25,dirt_y_start-275);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row20[i] = new Dirt (0+i*25,dirt_y_start-250);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row21[i] = new Dirt (0+i*25,dirt_y_start-225);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row22[i] = new Dirt (0+i*25,dirt_y_start-200);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row23[i] = new Dirt (0+i*25,dirt_y_start-175);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row24[i] = new Dirt (0+i*25,dirt_y_start-150);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row25[i] = new Dirt (0+i*25,dirt_y_start-125);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row26[i] = new Dirt (0+i*25,dirt_y_start-100);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row27[i] = new Dirt (0+i*25,dirt_y_start-75);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row28[i] = new Dirt (0+i*25,dirt_y_start-50);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row29[i] = new Dirt (0+i*25,dirt_y_start-25);
  }
  for (int i = 0; i <= 30; i++){
    dirt_row30[i] = new Dirt (0+i*25,dirt_y_start);
  }
   for (int i = 0; i <= numrocks; i++){
   rock[i] = new Rock (rockwidth[i],dirt_y_start - rockheight[i]);
  }
  
  for (int i = 0; i <= 30; i++){
  dirt_row1[i].collide();
  dirt_row1[i].draw();
  }
  for (int i = 0; i <= 30; i++){
  dirt_row2[i].collide();
  dirt_row2[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row3[i].collide();
  dirt_row3[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row4[i].collide();
  dirt_row4[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row5[i].collide();
  dirt_row5[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row6[i].collide();
  dirt_row6[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row7[i].collide();
  dirt_row7[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row8[i].collide();
  dirt_row8[i].draw();
   }
   for (int i = 0; i <= 30; i++){
  dirt_row9[i].collide();
  dirt_row9[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row10[i].collide();
  dirt_row10[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row11[i].collide();
  dirt_row11[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row12[i].collide();
  dirt_row12[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row13[i].collide();
  dirt_row13[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row14[i].collide();
  dirt_row14[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row15[i].collide();
  dirt_row15[i].draw();
  }
  for (int i = 0; i <= 30; i++){
  dirt_row16[i].collide();
  dirt_row16[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row17[i].collide();
  dirt_row17[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row18[i].collide();
  dirt_row18[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row19[i].collide();
  dirt_row19[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row20[i].collide();
  dirt_row20[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row21[i].collide();
  dirt_row21[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row22[i].collide();
  dirt_row22[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row23[i].collide();
  dirt_row23[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row24[i].collide();
  dirt_row24[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row25[i].collide();
  dirt_row25[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row26[i].collide();
  dirt_row26[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row27[i].collide();
  dirt_row27[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row28[i].collide();
  dirt_row28[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row29[i].collide();
  dirt_row29[i].draw();
  }
   for (int i = 0; i <= 30; i++){
  dirt_row30[i].collide();
  dirt_row30[i].draw();
  }
  for (int i = 0; i <= numrocks; i++){
   rock[i].collide();
   rock[i].draw();
  }
  
 
 
  drill.move();
  drill.spin();
  drill.draw();

 if( drill.drill_spin == true ){
   timer += 1;
   dirt_y_start = dirt_y_start -4;
 }
 
 image(treasure,375,dirt_y_start + 150);
 
 if (dirt_y_start <= 175){
   win = true;
 }
 
 if (win == true){
   fill(0,0,0);
   rect(0,0,750,750);
   fill(255);
    textFont(font,48);
    text("I hope you like treasure.",150,200);
    image(treasure,375,350);
    text("Because you got some.",150,525);
   noLoop();
 }
 
}

/////////////////////////////////////////////////Dirt Class
    
  class Dirt {
    float x;
    float y;
    boolean dead;
    int permadead;
    
    Dirt (float DIRT_X, float DIRT_Y) {
      x = DIRT_X;
      y = DIRT_Y;
    }
   
    
    void draw(){
      noStroke();
      imageMode(CENTER);
      if(dead == false){
        if(permadead == 0){
        image(dirts,x,y);
      }}
      else{
        image(dead_dirts,x,y);
        permadead = permadead + 1;
      }}
    
    
    void collide(){
     if  (x >= drill.drill_x - 25 && x <= drill.drill_x +25 && y >= drill.drill_y - 30 && y <= drill.drill_y + 30){
       dead = true;
    }
    }
    
  
  }
  
  /////////////////////////////////////////////////Rock Class
  
    class Rock {
    float x;
    float y;
    boolean dead;
 
    
    Rock (float ROCK_X, float ROCK_Y) {
      x = ROCK_X;
      y = ROCK_Y;
    }
   
    
    void draw(){
      noStroke();
      imageMode(CENTER);
      if(dead == false){
        image(rocks,x,y);
      }
      else{
        fill(255,0,0);
        rect(0,0,750,750);
        noLoop();
        drill.resize(100,50);
        
      }}
    
    
    void collide(){
     if  (x >= drill.drill_x - 25 && x <= drill.drill_x +25 && y >= drill.drill_y - 30 && y <= drill.drill_y + 30){
       dead = true;
    }
    }
    
  
  }

/////////////////////////////////////////////////Drill class

class Drills {
  float drill_x;
  float drill_y;
  float drill_rotate;
  int drill_loaded;
  boolean drill_spin;
  
  Drills (float DRILL_X, float DRILL_Y, float DRILL_ROTATE) {
    drill_x = DRILL_X;
    drill_y = DRILL_Y;
    drill_rotate = DRILL_ROTATE;
  }
  
  void draw(){
    pushMatrix();
    imageMode(CENTER);
    translate(drill_x,drill_y);
    rotate(radians(drill_rotate));
    translate(-drill_x,-drill_y);
    drills[drill_loaded].resize(50,75);
    image(drills[drill_loaded],drill_x,drill_y);
    popMatrix();
    }
  
  void spin(){
    if(key == 'd' || key == 'D'){
    drill_spin = true;
    }
    if(drill_spin == true){
      drill_loaded ++;
    }
    if (drill_loaded == 3){
      drill_loaded = 0;
    }

  if( key == ' '){
    drill_spin = false;
    }
  }
  
  void move(){
    
 
    if(drill_rotate < -90 || drill_rotate > 90){
    int drill_x_move = .2*abs(drill_rotate/2);
    if(drill_y >= height-60){
      drill_y = height-59;
      }
    if(drill_y <= 60){
      drill_y = 59;
      }
  if(drill_x >= width-25 ){
    drill_x = width-24;
  }
    if (drill_x <= 25 ){
      drill_x = 26;
    }
  
    }
    else{
    int drill_x_move = .2*abs(drill_rotate);
    if(drill_y >= height-60){
      drill_y = height-59;
      }
    if(drill_y <= 60){
      drill_y = 59;
      }
  if(drill_x >= width-25 ){
    drill_x = width-24;
  }
    if (drill_x <= 25 ){
      drill_x = 26;
    }
  }
  
  if(drill_rotate <= 25 && drill_rotate >= -25){
    int drill_x_move = 1+.2*abs(drill_rotate);
  }
    
    
  if(drill_spin == true){
      drill_y = drill_y;
    
    if(drill_rotate < 0){
    drill_x += drill_x_move;
    }
    if(drill_rotate > 0){
    drill_x -= drill_x_move;
    }
    else{
      drill_x = drill_x;
    }
  }
  
  if (keyPressed == true){
    if (keyCode == RIGHT){
      drill_rotate -= 5;
      if (drill_rotate <= -60){
        drill_rotate = -60;
      }
    }
    if (keyCode == LEFT){
      drill_rotate += 5;
    }
    if (drill_rotate >= 60){
        drill_rotate = 60;
      }
  }
  }
  
}


