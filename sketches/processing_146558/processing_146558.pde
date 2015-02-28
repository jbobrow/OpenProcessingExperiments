
//After giving this program to my 6 year old cousin, I found that he wish the game went on for longer and wished he could do more than just the shark. I also had to explain the game to him, it would have been easier if I added instruction but that is hard to do for people who can't really read to begin with. 
//Citations: Ciara Keegan, Ms. Freed, and Maddy Nakada gave me emotional support.
//

 
boolean s=false;
boolean h=false;
boolean a=false;
boolean r=false;
boolean k=false;
boolean e=false;
boolean d=false;
boolean t=false;
boolean s2=false;
boolean h2;
boolean a2;
boolean r2;
boolean k2;
//int x1=410:
//int x2=30;
float lives = 0;
int[] xy= {
  mouseX, mouseY
};//declaring create and define array

PImage frustratedshark;//naming shark that follows fish
int sharkX=0;//declaring variable
int sharkY=0;

void setup() {
  background(18, 28, 44);//dark blue color
  size(500, 500);//size of screen
  frustratedshark=loadImage("shark.gif");//getting shark image from data folder
}
void draw() {
  background(18, 28, 44);
  textMode(CENTER);
  textSize(32);
  text("S", 50, 400);
  text("H", 100, 200);
  text("T", 200, 300);
  text("R", 300, 50);
  text("K", 400, 450);
  text("E", 400, 200);
  text("D", 150, 75);
  text("A", 335, 315);

  rect(400, 0, 100, 40);
  float b =atan2((mouseY-sharkY)/2, (mouseX-sharkX)/2);//getting angle between 
  imageMode(CENTER);//this makes my images draw from the center as opposed to a corner

  pushMatrix();//confines rotate to shark
  sharkX =(sharkX+(mouseX-sharkX)/20);//this makes the shark travel 1/40th of the distance to the object each time the code runs through
  sharkY=(sharkY+(mouseY-sharkY)/30);
  translate(sharkX, sharkY);//this moves the origin of the rotation to the middle of the shark
  rotate(b);//rotates the shark the angle specified by atan2


  image(frustratedshark, 0, 0, 100, 50);//draws my shark
  popMatrix();



  if (dist(50, 400, sharkX, sharkY)<30) {
    s=true;
  }
  if (dist(100, 200, sharkX, sharkY)<30) {
    h=true;
  }
  if (dist(200, 300, sharkX, sharkY)<30) {
    t=true;
  }
  if (dist(300, 50, sharkX, sharkY)<30) {
    r=true;
  }
  if (dist(400, 450, sharkX, sharkY)<30) {
    k=true;
  }
  if (dist(400, 200, sharkX, sharkY)<30) {
    e=true;
  } 
  if (dist(150, 75, sharkX, sharkY)<30) {
    d=true;
  }
  if (dist(335, 315, sharkX, sharkY)<30) {
    a=true;
  }
  // if ((a=true)&&(h=true)||
  if (s==true){ 
   s2=true;}
    if (s2==true){
     fill(200, 100, 300);
    text("S", 10, 30);
    fill(255);
  }
  if ((s==true)&&(h==true)) {
    h2=true;}
   if(h2==true){
    fill(200, 100, 300);
    text("H", 35, 30);
    fill(255);}
 if ((r==false)&&(s==true)&&(h==true)&&(k==false)&&(a==true)) {
    a2=true;
  }   
  if (a2==true) {
    fill(200, 100, 300);
    text("A",60,30);
    fill(255);}


  if ((r==true)&&(s==true)&&(h==true)&&(k==false)&&(a==true)) {
    r2=true;
  }   
  if (r2==true) {
    fill(200, 100, 300);
    text("R", 85, 30);
    fill(255);
  }
  if ((k==true)&&(r==true)&&(s==true)&&(h==true)&&(r==true)&&(a==true)) {
    k2=true;
  }
  if (k2==true) {
    fill(200, 100, 300);
    text("K", 110, 30);
    fill(255);
  }
  if (dist(200, 300, sharkX, sharkY)<30) {
    lives=lives+1;
  }

  if (dist(150, 75, sharkX, sharkY)<30) {
   lives=lives+1;
  }
  if (dist(400, 200, sharkX, sharkY)<30) {
    lives=lives+1;
  }
  if ((s==true)&&(h==true)&&(dist(50, 400, sharkX, sharkY)<30)) {
    lives=lives+1;
  }
    if ((h==true)&&(a==true)&&(dist(100, 200, sharkX, sharkY)<30)) {
      lives=lives+1;
    }
    if ((a==true)&&(r==true)&&(dist(335, 315, sharkX, sharkY)<30)) {
      lives=lives+1;
    }
    if ((r==true)&&(k==true)&&(dist(300, 50, sharkX, sharkY)<30)) {
      lives=lives+1;
    }
    if ((dist(100, 200, sharkX, sharkY)<30)&&(s==false)) {
      lives=lives+1;
    }
    if ((dist(100, 200, sharkX, sharkY)<30)&&(h==false)&&(s==false)){
    lives=lives+1;}
     if ((dist(300, 50, sharkX, sharkY)<30)&&(a==false)&&(h==false)&&(s==false)){
    lives=lives+1;}
     if ((dist(400, 450, sharkX, sharkY)<30)&&(r==false)&&(a==false)&&(h==false)&&(s==false)){
    lives=lives+1;}//if k is touched before s r a and h
    
    if (lives>=15){
      fill(0);
  text("X", 410, 30);
  fill(255);}//if lives goes above 15 then the first X will appear
  
  if (lives>=35){
    fill(0);
  text("X", 435, 30);
  fill(255);}//if lives goes above 35 then the second X will appear
  
  if(lives>=60){
    fill(0);
  text("X", 460, 30);
  fill(255);}//if lives goes above 60 then the third X will appear

  }
  


