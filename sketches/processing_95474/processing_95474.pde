
/* @pjs preload="BossShip.png, badguy.png, badguy2.png, boom1.png, boom2.png, bullet.png, bulletF.png, cursor.png, e_0000.gif, e_0001.gif, e_0002.gif, e_0003.gif, e_0004.gif, e_0005.gif, e_0006.gif, e_0007.gif, e_0008.gif, e_0009.gif, e_0010.gif, e_0011.gif, e_0012.gif, e_0013.gif, e_0014.gif, e_0015.gif, e_0016.gif, e_0017.gif, e_0018.gif, e_0019.gif, e_0020.gif, e_0021.gif, e_0022.gif, e_0023.gif, e_0024.gif, e_0025.gif, e_0026.gif, e_0027.gif, e_0028.gif, e_0029.gif, gameover.jpg, pship.png, scoreback.png, scoreback1.png, scoreback2.png, space.jpg, space1.jpg"; 
 */









 PImage img;
 PImage img2;
 PImage img3;
 PImage img4;
 PImage img5;
 PImage img6;
 PImage img7;
 PImage img8; 
 PImage img9; 
 PImage img10; 
 
   //smoke trail
int[] trail_x;
int[] trail_y;
int index = 0;

//for lazer overheat
float g2heat = 0;

//for Explosion Sprites
Animation animation1;


//for Lazer bullets
import java.util.concurrent.CopyOnWriteArrayList; 
PImage b;
CopyOnWriteArrayList<Bullet> franks=new CopyOnWriteArrayList<Bullet>(); 

//Variables pertaining to the powerups
int powerT =0;
float powerSpeed = -800;

//HUD HEADS UP DISPLAY (top of game) 
 PFont f;
 PFont f2;
 int score = 0;        // User's score
 int level = 1;        // What level are we on
 int lives = 100;       // 100% (10 ships can impact you) -10% a ship
 int levelCounter = 0;


//Number of Ships 
 int Eship = 5;
 int time = 0;

//moving the background to simulate progress in level
 float y = 0;
 
//Pexplosion (Particle Explosion)
 ArrayList plist = new ArrayList();
 int MAX = 40;
 
 
//SHIPS
  
  int sphereDiameter = 18;
  
  //Lazer shooting boolean
  boolean shoot = false;
  
  int randx(){
    return int(random(600));
  }
   
  int[] sphereXCoords = new int[40];
  int[] sphereYCoords = new int[40];
  
  
  
//**********************************************************************************  
  
void setup(){
    
 
    frameRate(24);
    
    size(600,620);
    img = loadImage("pship.png");
    img2 = loadImage("space.jpg");
    img3 = loadImage("badguy.png");
    img4 = loadImage("boom1.png"); 
    img5 = loadImage("boom2.png"); 
    img6 = loadImage("scoreback.png");
    img7 = loadImage("BossShip.png");
    img8 = loadImage("bulletF.png"); 
    img9 = loadImage("cursor.png"); 
    b = loadImage("bullet.png");
    img10 = loadImage("gameover.jpg"); 





//Loads Animation for explosions
animation1 = new Animation("e_", 30);


// Adding fonts to write text on the screen  
    f = createFont("Xirod",12,true); 
    f2 = createFont("Arial",12,true);
    
  //enemy jet trail  
    smooth();
trail_x = new int[50];
trail_y = new int[50];


  for(int i = 0; i < sphereXCoords.length; i++){ 
    sphereXCoords[i] = randx();
  }


}
  



//*****************************************************************************************  

  
void draw(){ 
    
playgame(); 
 
}
  









//*******************************************************************************  
  

void keyPressed(){
    shoot = true;
   
   //for weapon overheat  
  g2heat+=10.5;
  if(g2heat>=520){
   shoot = false; 
  }
  if(g2heat<520){
  shoot = true;
  }
   
   
 
}

Bullet frank;  
void mousePressed(){
  frank=new Bullet();
    frank.bulletOn=1; frank.bulletX=mouseX; frank.bulletY=mouseY;
    franks.add(frank);
    imageMode(CENTER); 
 if (mouseX > 0 && mouseY > 0){

   
   
 } 

//}
  }

  
 
  
  
//SMOKE low health
  

void PdamageS(float size, int positionX, int positionY){
  
  
  for (int i=0; i < trail_x.length; i++) {
    int pos = (index+(i)) % trail_x.length;
    colorMode(HSB);
    fill(map(i, 0, trail_x.length, 0, 255),0 ,map(i, 0, trail_x.length, 0, 100), 20);  
    noStroke();
    ellipse(trail_x[pos], trail_y[pos], 5+i/size, 5+i/size); 
    colorMode(RGB);
 
}    

  
  
for (int i=0; i<Eship; i++){

  trail_x[index] = positionX;
  trail_y[index] = positionY;
  index++;
  if (index >= trail_x.length){ 
  index = 0;
  }
  //if(i >= 40){
  //i = 39;
  //}
}   
  
  
  
}
 void gameEnder(){
 

 
 image(img10, 0, 0); 
  

     textFont(f,20);
        text("Score:" + score, width/2, 340); 
        text("Waves Survived: " + level, width/2, 370);

 
 
 }
 void gameEnder2(){
    
        
        //background(255);
        
        textFont(f,38);
        textAlign(CENTER);
        fill(0,255,100);
        text("MISSION COMPLETE",width/2,height/2);
        
        noLoop();

    }
void enemyswarm(){  
  
  float a = 0; 
  
  
    stroke(255);
    fill(255);
    imageMode(CENTER);
    
    
    for (int i=0; i<Eship; i++){
      
      if(sphereYCoords[i] > height+100){
       sphereYCoords[i] = -100;
       sphereXCoords[i] = randx();
      } 
      
//Impact with the Player 
      if(sphereXCoords[i]+15 > mouseX && sphereXCoords[i]+15 < mouseX+20 && sphereYCoords[i]+15 > mouseY && sphereYCoords[i]+15 < mouseY+20){
        
          image(img5,sphereXCoords[i], sphereYCoords[i],sphereDiameter*4, sphereDiameter*4); 
          
          for (int q = 0; q < 10; q ++) {
          plist.add(new Particle(sphereXCoords[i], sphereYCoords[i]));
           }
           if(plist.size() > 5*MAX){
           plist.remove(0);
            }
      sphereYCoords[i] =0;

      //lose a life      
      lives-=10;
    }  
        
       a = a + 4;
      
      image(img3,sphereXCoords[i], sphereYCoords[i]+=a, 3*sphereDiameter, 4*sphereDiameter);  
      
   }
    
    imageMode(CORNER);
  
}
void primaryG(){
  boolean hit = false;
  

  
  for (Bullet frank:franks) {
    image(b, frank.bulletX, frank.bulletY, b.width/2, b.height/2);
    frank.bulletY=frank.bulletY-30;//bullet speed
    if(frank.bulletY<=0){
    franks.remove(frank);
    }
    
    
 for (int i=0; i<Eship; i++){
   if((frank.bulletX >= (sphereXCoords[i]-sphereDiameter/2)) && (frank.bulletX <= (sphereXCoords[i]+sphereDiameter/2)) && (frank.bulletY <= (sphereYCoords[i]-sphereDiameter/2))){
    
    franks.remove(frank);
  
   
 
  
  
  
  //explosion
     image(img5,sphereXCoords[i], sphereYCoords[i],sphereDiameter*4, sphereDiameter*4); 
     plist.add(new Particle(sphereXCoords[i], sphereYCoords[i]));
     plist.add(new Particle(sphereXCoords[i], sphereYCoords[i]));
     plist.add(new Particle(sphereXCoords[i], sphereYCoords[i]));
     plist.add(new Particle(sphereXCoords[i], sphereYCoords[i]));
      if(plist.size() > 5*MAX){
      plist.remove(0);
      }
    sphereXCoords[i] = randx();
    sphereYCoords[i] = 0;
    score += 10;
   } 
 }
}
  



}



class Bullet {
  int bulletOn;
  int bulletX, bulletY;
  int bulletP;
}
 void secondaryG(int shotX){
    boolean hit = false;
    
    
    
    for (int i = 0; i < Eship; i++){
      
      if((shotX >= (sphereXCoords[i]-sphereDiameter/2)) && (shotX <= (sphereXCoords[i]+sphereDiameter/2))){
        hit = true;
        strokeWeight(9);
        line(mouseX, mouseY, mouseX, sphereYCoords[i]);
        strokeWeight(3);
        stroke(255);
        line(mouseX, mouseY, mouseX, sphereYCoords[i]);
     
     
 //particle Explosion
       for (int q = 0; q < 10; q ++) {
        plist.add(new Particle(sphereXCoords[i], sphereYCoords[i]));
       }
        if(plist.size() > 5*MAX){
        plist.remove(0);
        }
          
     
 //explosion image
        image(img4, sphereXCoords[i], sphereYCoords[i],sphereDiameter+205, sphereDiameter+205);
        sphereXCoords[i] = randx();
        sphereYCoords[i] = 0;

     
 //Increase Score
score += 10;
     }    
  }  
    
     
     if(hit == false){
      strokeWeight(9);
      line(mouseX, mouseY, mouseX, 0);
      stroke(255);
      strokeWeight(3);
      line(mouseX, mouseY, mouseX, 0);
      strokeWeight(0);
     }  
  








}
//How do we make the particles fade within a certain distance of the ship 
//it exploded from?

class Particle {
  float life = 0;
  float r = 2;
  PVector pos,speed,grav; 
  ArrayList tail;
  float splash = 5;
  int margin = 2;   
  int taillength = (int)random(1, 4); //adjusts the number of dotas tailing each peice

  Particle(float tempx, float tempy) {
    
    float startx = tempx + random(-splash,splash);
    float starty = tempy + random(-splash,splash);
    startx = constrain(startx,-20,width);
    starty = constrain(starty,-20,height);
    float xspeed = random(-8, 8); 
    float yspeed = random(-8, 8);

    pos = new PVector(startx,starty);
    speed = new PVector(xspeed,yspeed);
    grav = new PVector(0,0.02);
    
    tail = new ArrayList();
  }

  
  
  void run() {
    pos.add(speed);
    tail.add(new PVector(pos.x,pos.y,0));
    
    if(tail.size() > taillength) {
      tail.remove(0);
    }
    life++;
  }

  
  
  
  void gravity() {
    speed.add(grav);
  }

  
  
  
  void update() {
    for (int i = 0; i < tail.size(); i++) {
      PVector tempv = (PVector)tail.get(i);
      noStroke();
      fill(6*i + 255, 230, 0, map(life, 0, 15, 255, 0)); //fades away
      ellipse(tempv.x,tempv.y,r,r);
     
    }
  }
}




class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
void playgame() {
   noCursor(); 

  y += 1.5;
    if(y > img2.height/2){
    y=0;
    }
    imageMode(CENTER);
    image(img2, 300, y, img2.width, img2.height);
    image(img2, 300, y+img2.height/2, img2.width, img2.height);

//Big Ship 
powerT++;
if(powerT >= 4000){
  powerSpeed += 3;
   
  image(img7,200,powerSpeed,img7.width*2,img7.height*2);
 
}    
    
    

    
//Lazer COLOR/ lazer function////////////////////////////////////////////////////////
    fill(color(183,240,255,30));
    stroke(color(0,200,255));
    
    if(shoot==true){
      secondaryG(mouseX);
      shoot = false;
    }
    
//Lazer BULLETS function/////////////////////////////////////////    
primaryG();

//smoke DAMAGE
if(lives <= 10){
PdamageS(3,mouseX,mouseY+3);
}


//Player Controled SHIP/////////////////////////////////////////////////////////////////
    //muzzle flair
     if(mousePressed){
     image(img8,mouseX, mouseY-5,img8.width/15, img8.height/8); 
     }
    
    image(img, mouseX, mouseY, img.width/7, img.height/7);
    
if(lives <= 40){
PdamageS(16, mouseX+5, mouseY);
}
    

    
//Initiates ENEMY SHIPS///////////////////////////////////////////////////////////  
enemyswarm();
      


  
//RUNS Particle Explosion/////////////////////////////////////////////////////////////////////
  for(int i = 0; i < plist.size(); i++) {
    Particle p = (Particle) plist.get(i); 
    p.run();
    p.update();
    p.gravity();
    if (p.life > 10){           //particle life span
       plist.remove(p);       // deletes particles  
    }  
  }





// Increasing the amount of enemy ships///////////////////////////////////////////////
time++;
if(time == 800){
 Eship += 3;
 level++;//increases level
 time = 0; 
}

//HUD writing (Heads Up Display)///////////////////////////////////////////////// 
 image(img6, 0, 0, img6.width, img6.height);
 
 textFont(f,14);
 fill(0,204,255);
 text("Health: %" + lives,30,40);
 fill(0,200,248,200);
 noStroke();
 rect(30,44,lives*1.35,10);
 fill(0,204,255);
 text("Score: " + score,30,70);
 textFont(f,50);
 text(level,280,60);

//LAZER over heat 
 fill(0,204,255);
 textFont(f,14);
 text("Super Lazer",30,577);

fill(0,59,74);
rect(30,580,540,10);
fill(0,204,255);
rect(30,580,g2heat,10);
fill(0,59,74); 
textFont(f,10);
text("D A N G E R   O V E R H E A T ",350,588);

if(g2heat>=520){
fill(255,30,0);
rect(30,580,g2heat,10);
fill(0,59,74); 
textFont(f,10);
text("D A N G E R   O V E R H E A T ",350,588);
}


g2heat-=5;

if(g2heat<=0){
  g2heat+=5;
}
if(g2heat>= 520){
  g2heat-=10.5;
}
  
  
  
 

//GAME OVER RUNTHROUGH///////////////////////////////////////////////////////////

//Death Outcome
  if(lives <= 0){
  noLoop(); 
gameEnder(); 
 }

//Victory Outcome
  if(level > 9){
 gameEnder2();
 } 
  
  
  
  
  
}


