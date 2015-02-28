
// Bashcode© Switch v.1.0 (2012) by Natanijel Vasic  


int x = 400;
int y = 500;

int[] bw = new int[810];
int row_count;
int[] rec_pos_x = {
  0, 100, 200, 300, 400, 500, 600, 700
};

int[] row_y = new int[100];
int w = 255;
int b = 0;

float speed = 500;
float accel;

color col_green = color(0, 255, 0);
color col_white = color(255, 255, 255);
color col_blue = color(0, 0, 150);
color black = color (0);

PImage title;
PFont font;
PFont font2;

int bin;
int last;

int score;
int health;
float distance = 600;
int health_y;

int state = 0;

void setup() {
  size(800, 600);
  smooth();
  noCursor();
  noStroke();
  
  for (int count3 = 0; count3 < 800; count3++){
  
    bw[count3] = int(random(0, 2));
   
  }

  for (int count = 0; count < 100 ; count++) {
    row_y[count] = -count*100;
  }
  title = loadImage("title2.png");
  font = loadFont("Calibri-50.vlw");
  font2 = loadFont("AgencyFB-Bold-48.vlw");
}


int menu_fill = 255;
int x_menu = 0;

void menu(){
  for(int count5 = 0 ; count5 < 6 ; count5++){
   if(x_menu == 0 || x_menu == 200 || x_menu == 400){menu_fill = 255;}
   else {menu_fill = 0;}
  fill(menu_fill);
  rect(0, x_menu, 800, 100);
  x_menu += 100;
  }
  image(title, 100, 0);
  textFont(font2, 60); 
  text("Click to Play!", 260, 270);
  fill(255);
  textFont(font2, 20); 
  text("Natanijel Vasic©", 680, 580);
  if(mousePressed && (mouseButton == LEFT)){state = 1;}
}

void fail(){
  background(0);
  fill(#F2DB00);
 textFont(font2, 60); 
 text("You tried and failed.", 35, 210);
 
 fill(5, 200, 100);
 textFont(font2, 60); 
 text((600 - distance), 530, 450);
 
  if(mousePressed && (mouseButton == LEFT)){
    distance = 600;
    health_y = 0;
    speed = 500;
    accel = 0;
  state = 1;}
  if(keyPressed == true){
    if(key == 'r'){
    distance = 600;
    health_y = 0;
    speed = 500;
    state = 1;}}
  }

void win(){
  background(0);
  fill(255);
 textFont(font2, 60); 
 text("Ja.Lo.Io.Gr:127.0.0.1", 35, 210);
  if(mousePressed && (mouseButton == LEFT)){
    distance = 600;
    health_y = 0;
    speed = 500;
    accel = 0;
  state = 1;}
  if(keyPressed == true){
    if(key == 'r'){
    distance = 600;
    health_y = 0;
    speed = 500;
    accel = 0;
    state = 1;}}
  }
  
  void cheat(){
 background(0); 
 fill(255);
 textFont(font2, 60); 
 text("Stop cheating and play the game!", 35, 210);
  if(mousePressed && (mouseButton == LEFT)){
    distance = 600;
    health_y = 0;
    speed = 500;
    accel = 0;
  state = 1;}
 
  }


void draw() {
  
  if (state == 0){menu();} //main menu
  if (state == 3){fail();}
  if (state == 4){win();}
  if (state == 5){cheat();}
  if (state == 1){ //gameplay
  
  background(col_white);
  
    if(keyPressed == true){
    if(key == 'r'){
    distance = 600;
    health_y = 0;
    speed = 500;
    accel = 0;
    state = 1;}
  }
  
  
  pushMatrix();
  
  if(speed >= 10000){speed = 500;}

  translate(0, speed);
  speed += accel;
  accel += 0.002;
  
  if(last == 1 && bin == 0){
    if(b == 0){b = 255; w = 0;}
    else{b = 0; w = 255;}
  }
  
  for(int count4 = 0; count4 < 100; count4 ++){  

  
  for (row_count = 0; row_count < 8; row_count++) {
    
    if(bw[row_count + (count4*8)] == 0 ){fill(b);}
    if(bw[row_count + (count4*8)] == 1 ){fill(w);}
    
      rect(rec_pos_x[row_count], row_y[count4], 100, 101);
 
  }
 
}

  popMatrix();
  last = bin;
  bin = 0;

color pixel = get(mouseX, mouseY);

  fill(col_green);
  ellipse(mouseX, mouseY, 20, 20);

 if (mousePressed && (mouseButton == LEFT)) {bin = 1;}
  
 distance -= 0.1;
 
 if(pixel == black){health_y += 2;}
 if(mouseX > 800 || mouseX < 0 || mouseY > 600 || mouseY < 0){state = 5;}//anti-cheat!
 health = 100-(health_y/6);
 
 fill(5, 60, 200);
   rect(0, distance, 20, 600);
 fill(5, 20, 200);
   rect(20, 0, 5, 600);
 
 fill(5, 200, 100);
   rect(780, health_y, 20, 600);
 fill(4, 185, 100);
   rect(775, 0, 5, 600);

 fill(#F2DB00);
 textFont(font2, 60); 
   text("Distance: ", 35, 570);
 fill(0, 0, 240);
 textFont(font2, 60); 
   text(distance, 240, 570);
 fill(#F2DB00);
 textFont(font2, 60); 
   text("Health: ", 480, 570);
 fill(5, 200, 100);
 textFont(font2, 60); 
   text((health), 660, 570);
 
 if (health <= 0){state = 3;}//fail
 if (distance <= 0){state = 4;}//win

 }

}


