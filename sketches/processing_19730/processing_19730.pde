
Wallpaper wallpaper;
Monster[] monster = new Monster[5];
Ground ground;
float backColor = 175;
int h = 359;
int s = 100;
int hsB = 100;
int a = 100;
 
void setup() {
  size(600,400);
  smooth();
  noStroke();
  rectMode(CENTER);
  
  wallpaper = new Wallpaper();
  ground = new Ground();
  for (int j = 0; j < monster.length; j++) {
   monster[j] = new Monster(random(width),random(215,325),random(.75,3));
    }
 }
 
void draw() {
  wallpaper.displayW();
  ground.ground();
  for (int j = 0; j < monster.length; j++) {
    monster[j].display();
    monster[j].move();
    monster[j].change(); 
}
}
 
void mousePressed() {
    colorMode(RGB,255,255,255);
    Monster b = new Monster (mouseX,mouseY,random(3,9));
     monster = (Monster[]) append(monster,b);
     
  }

void keyPressed(){ //change color of background when 'b' key is pressed
  colorMode(HSB,h,s,hsB,a);
  
  if ((key == 'b') || (key == 'B')) {
      background(random(h),random(s - 75, s),random(hsB - 40,hsB)); 
      }
 }



