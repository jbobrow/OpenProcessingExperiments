

int card = 0; 
int textX = 200;
int textY = 200;
PImage page1;
PImage b1;
PImage b2;
PImage b3;
PImage b4;
PImage b5;
PImage b6;
PImage b7;
PImage b8;

PFont f;

int y2= 60;
  int y3= 50;


void setup() {
  size(600,389);
  f = loadFont("YDSDJ-20.vlw");
  textFont(f);
}

void draw() {

  if (card == 0) {
                  b1 = loadImage("alone.jpg");
image(b1,0,0,600,389);
text ("White Whale Story",textX,textY);
  }
  



  else if (card == 1) {  
                         b1= loadImage("alone.jpg");
                         
 image(b1,0,0,600,389);
 translate (300,250);
 whale(0,0,80,4,67);
   
  } 
  else if (card  == 2) {  
                         b2= loadImage("find.jpg");
 image(b2,0,0,600,389);
 translate (500,300);
 whale2(0,0,250,10,200);
 jellyfish2(-400,0,250);
    
  }
  else if (card  == 3) { 
                        b3= loadImage("dis.jpg");
 image(b3,0,0,600,389);
 translate (300,250);
 whale3(200,0,120,5,100);
 jellyfish3(-210,-60,75,//6blue
           -130,-10,95,//5pink
           -170,-85,50,//4green
           -90,-60,70,//3pink
           -300,30,140,//2blue
           -50,5,120//1green
           );
  }
  else if (card  == 4) {  
                        b4= loadImage("sad.jpg");
 image(b4,0,0,600,389);
 translate (260,200);
 whale4(0,0,200,10,160);
    
  } 
  else if (card  == 5) { 
                        b5= loadImage("after.jpg");
 image(b5,0,0,600,389);
 translate (400,300);
 whale5(0,0,200,8,170);
 translate(0,-120);
 wFriend5(-300,0,100,5,-380); 
   
  } 
  else if (card  == 6) {  
                        b6= loadImage("sunrise.jpg");
 image(b6,0,0,600,389);
 translate (450,200);
 whale6(0,0,150,7,120);
 translate(0,100);
 wFriend6(-300,0,150,7,-420);
  } 
  else if (card == 7) {  
                        b7= loadImage("happy.jpg");
 image(b7,0,0,600,389);
 translate (400,200);
 whale7(0,0,200,10,150);
 wFriend7(-200,0,200,10,-350);
 translate(-300,10);
 stroke(255);
 line(0,0,400,0);
 line(10,10,390,10);
 line(20,20,380,20);
 line(30,30,370,30);
 line(40,40,360,40);
 line(50,50,350,50);
 line(60,60,340,60);
 line(70,70,330,70);
 line(80,80,320,80);
 line(90,90,310,90);
 line(100,100,300,100);
 line(110,110,290,110);
 line(120,120,280,120);
 line(130,130,270,130);
  }
}

void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 0;
  }
}







//
//
//
//
//1
void whale(int whaleX, int whaleY, int whaleSize, int eyeSize, int distance ){
 noStroke();
 smooth();
 //mom
 fill(255,230,230);
 arc(whaleX,whaleY,whaleSize, whaleSize, PI, TWO_PI-PI/2);
 arc(whaleX,whaleY, whaleSize, whaleSize, TWO_PI-PI/2, TWO_PI);
 //ggori
 arc(distance, whaleY, whaleSize/2, whaleSize/3, PI, TWO_PI-PI/2);
 
  //eye1
  fill(100,100,100);
  ellipse (whaleX-30,whaleY-7,eyeSize,eyeSize);
  //eye2 
  fill(100,100,100);
  ellipse (whaleX-5,whaleY-7,eyeSize,eyeSize);
}












//
//
//
//
//2
void whale2(int whale2X, int whale2Y, int whale2Size, int eye2Size, int distance2 ){
 noStroke();
 smooth();
 //mom
 fill(255,230,230);
 arc(whale2X,whale2Y,whale2Size, whale2Size, PI, TWO_PI-PI/2);
 arc(whale2X,whale2Y, whale2Size, whale2Size, TWO_PI-PI/2, TWO_PI);
 //ggori
 arc(distance2, whale2Y, whale2Size/2, whale2Size/3, PI, TWO_PI-PI/2);
  //eye1
  fill(100,100,100);
  ellipse (whale2X-100,whale2Y-20,eye2Size,eye2Size);
  fill(255);
  ellipse (whale2X-97,whale2Y-20,3,3);
  //eye2 
  fill(100,100,100);
  ellipse (whale2X-5,whale2Y-20,eye2Size,eye2Size);
  fill(255);
  ellipse (whale2X-2,whale2Y-20,3,3);
}
void jellyfish2(int jelly22X, int jelly22Y, int jelly22Size){
 noStroke();
 smooth();
 //mom
 fill(230,255,230);
 arc(jelly22X,jelly22Y, jelly22Size,jelly22Size, PI, TWO_PI-PI/2);
 arc(jelly22X,jelly22Y, jelly22Size,jelly22Size, TWO_PI-PI/2, TWO_PI);
}










//
//
//
//
//3
void whale3(int whale3X, int whale3Y, int whale3Size, int eye3Size, int distance3 ){
 noStroke();
 smooth();
 
 //mom
 fill(255,230,230);
 arc(whale3X,whale3Y,whale3Size, whale3Size, PI, TWO_PI-PI/2);
 arc(whale3X,whale3Y, whale3Size, whale3Size, TWO_PI-PI/2, TWO_PI);
 //ggori
 arc(whale3X+distance3, whale3Y, whale3Size/2, whale3Size/3, PI, TWO_PI-PI/2);
  //eye1
  fill(100,100,100);
  ellipse (whale3X-46,whale3Y-15,eye3Size,eye3Size);
  //eye2 
  fill(100,100,100);
  ellipse (whale3X-10,whale3Y-15,eye3Size,eye3Size);
}


void jellyfish3(int jelly6X,int jelly6Y,int jelly6Size,
               int jelly5X,int jelly5Y,int jelly5Size,
               int jelly4X,int jelly4Y,int jelly4Size,
               int jelly3X,int jelly3Y,int jelly3Size,
               int jelly2X,int jelly2Y,int jelly2Size,
               int jellyX, int jellyY, int jellySize 
               ){
 noStroke();
 smooth();
  
 //4
 fill(230,255,230);
 arc(jelly4X,jelly4Y, jelly4Size,jelly4Size, PI, TWO_PI-PI/2);
 arc(jelly4X,jelly4Y, jelly4Size,jelly4Size, TWO_PI-PI/2, TWO_PI);
 //6
 fill(230,230,255);
 arc(jelly6X,jelly6Y, jelly6Size,jelly6Size, PI, TWO_PI-PI/2);
 arc(jelly6X,jelly6Y, jelly6Size,jelly6Size, TWO_PI-PI/2, TWO_PI);
//3
 fill(255,230,230);
 arc(jelly3X,jelly3Y, jelly3Size,jelly3Size, PI, TWO_PI-PI/2);
 arc(jelly3X,jelly3Y, jelly3Size,jelly3Size, TWO_PI-PI/2, TWO_PI);
 //2
 fill(220,220,255);
 arc(jelly2X,jelly2Y, jelly2Size,jelly2Size, PI, TWO_PI-PI/2);
 arc(jelly2X,jelly2Y, jelly2Size,jelly2Size, TWO_PI-PI/2, TWO_PI);
 //5
 fill(255,220,220);
 arc(jelly5X,jelly5Y, jelly5Size,jelly5Size, PI, TWO_PI-PI/2);
 arc(jelly5X,jelly5Y, jelly5Size,jelly5Size, TWO_PI-PI/2, TWO_PI);
 //1
 fill(230,255,230);
 arc(jellyX,jellyY, jellySize,jellySize, PI, TWO_PI-PI/2);
 arc(jellyX,jellyY, jellySize,jellySize, TWO_PI-PI/2, TWO_PI);
 
//1 
stroke(230,255,230);
line(0,0,10,50);
line(-5,0,5,50);
line(-10,0,0,50);
  line(-15,0,-5,50);
  line(-20,0,-10,50);
  line(-25,0,-15,50); 
  line(-30,0,-20,50); 
  line(-40,0,-35,50);
  line(-45,0,-40,50);
  line(-55,0,-60,50);
  line(-60,0,-65,50);
  line(-65,0,-70,50);
  line(-75,0,-85,50);  
  line(-80,0,-90,50);
  line(-85,0,-95,50);
line(-90,0,-100,50);
line(-95,0,-105,50);
line(-100,0,-110,50);

//2
translate (-240,25);
stroke(220,220,255);
line(0,0,10,y2);
line(-5,0,5,y2);
line(-10,0,0,y2);
  line(-15,0,-5,y2);
  line(-20,0,-10,y2);
  line(-25,0,-15,y2); 
  line(-30,0,-20,y2); 
  line(-40,0,-35,y2);
  line(-45,0,-40,y2);
  line(-55,0,-60,y2);
  line(-60,0,-65,y2);
  line(-65,0,-70,y2);
  line(-75,0,-85,y2);  
  line(-80,0,-90,y2);
  line(-85,0,-95,y2);
line(-90,0,-100,y2);
line(-95,0,-105,y2);
line(-100,0,-110,y2);

//5
translate (170,-40);
stroke(255,220,220);
line(0,0,10,y3);
line(-5,0,5,y3);
line(-10,0,0,y3);
  line(-15,0,-5,y3);
  line(-20,0,-10,y3);
  line(-25,0,-15,y3); 
  line(-30,0,-20,y3); 
  line(-40,0,-35,y3);
  line(-45,0,-40,y3);
  line(-55,0,-60,y3);
  line(-60,0,-65,y3);
  line(-65,0,-70,y3);
  line(-75,0,-85,y3);  
  line(-80,0,-90,y3);
  line(-85,0,-95,y3);
line(-90,0,-100,y3);
line(-95,0,-105,y3);
line(-100,0,-110,y3);
}










//
//
//
//
//4
void whale4(int whale4X, int whale4Y, int whale4Size, int eye4Size, int distance4 ){
 noStroke();
 smooth();
 //mom
 fill(200);
 arc(whale4X,whale4Y,whale4Size, whale4Size, PI, TWO_PI-PI/2);
 arc(whale4X,whale4Y, whale4Size, whale4Size, TWO_PI-PI/2, TWO_PI);
 //ggori
 arc(distance4, whale4Y, whale4Size/2, whale4Size/3, PI, TWO_PI-PI/2);
  //eye1
  fill(10);
  ellipse (whale4X-60,whale4Y-20,eye4Size,eye4Size);
  fill(255);
  ellipse (whale4X-57,whale4Y-20,3,3);
  //eye2 
  fill(10);
  ellipse (whale4X-5,whale4Y-20,eye4Size,eye4Size);
  fill(255);
  ellipse (whale4X-7,whale4Y-20,3,3);
}











//
//
//
//
//5

void whale5(int whale5X, int whale5Y, int whale5Size, int eye5Size, int distance5 ){
 noStroke();
 smooth(); 
 //mom
 fill(255,230,230);
 arc(whale5X,whale5Y,whale5Size, whale5Size, PI, TWO_PI-PI/2);
 arc(whale5X,whale5Y, whale5Size, whale5Size, TWO_PI-PI/2, TWO_PI);
 //ggori
 arc(distance5, whale5Y, whale5Size/2, whale5Size/3, PI, TWO_PI-PI/2);
  //eye1
  fill(100,100,100);
  ellipse (whale5X-75,whale5Y-20,eye5Size,eye5Size);
  fill(255);
  ellipse (whale5X-72,whale5Y-20,3,3);
  //eye2 
  fill(100,100,100);
  ellipse (whale5X-5,whale5Y-20,eye5Size,eye5Size);
  fill(255);
  ellipse (whale5X-2,whale5Y-20,3,3);
}
void wFriend5(int wf5X, int wf5Y, int wf5Size, int wf5eyeSize, int wf5distance ){
 noStroke();
 smooth();
 //mom
 fill(210);
 arc(wf5X,wf5Y,wf5Size, wf5Size, PI, TWO_PI-PI/2);
 arc(wf5X,wf5Y,wf5Size, wf5Size, TWO_PI-PI/2, TWO_PI);
 //ggori
 arc(wf5distance, wf5Y, wf5Size/2, wf5Size/3, TWO_PI-PI/2, TWO_PI);
  //eye2
  fill(100,100,255);
  ellipse (wf5X+30,wf5Y-10,wf5eyeSize,wf5eyeSize);
  fill(255);
  ellipse (wf5X+28,wf5Y-10,2,2);
  //eye1
  fill(100,100,255);
  ellipse (wf5X-5,wf5Y-10,wf5eyeSize,wf5eyeSize);
  fill(255);
  ellipse (wf5X-7,wf5Y-10,2,2);
}










//
//
//6
void whale6(int whale6X, int whale6Y, int whale6Size, int eye6Size, int distance6 ){
 
 noStroke();
 smooth();
 
 
 //mom
 fill(255,230,230);
 arc(whale6X,whale6Y,whale6Size, whale6Size, PI, TWO_PI-PI/2);
 arc(whale6X,whale6Y, whale6Size, whale6Size, TWO_PI-PI/2, TWO_PI);
 //ggori
 arc(distance6, whale6Y, whale6Size/2, whale6Size/3, PI, TWO_PI-PI/2);
 

  //eye1
  fill(100,100,100);
  ellipse (whale6X-55,whale6Y-10,eye6Size,eye6Size);
  fill(255);
  ellipse (whale6X-52,whale6Y-10,3,3);
  //eye2 
  fill(100,100,100);
  ellipse (whale6X-5,whale6Y-10,eye6Size,eye6Size);
  fill(255);
  ellipse (whale6X-2,whale6Y-10,3,3);
}

void wFriend6(int wf6X, int wf6Y, int wf6Size, int wf6eyeSize, int wf6distance ){
 noStroke();
 smooth();
 //mom
 fill(255);
 arc(wf6X,wf6Y,wf6Size, wf6Size, PI, TWO_PI-PI/2);
 arc(wf6X,wf6Y,wf6Size, wf6Size, TWO_PI-PI/2, TWO_PI);
 //ggori
 arc(wf6distance, wf6Y, wf6Size/2, wf6Size/3, TWO_PI-PI/2, TWO_PI);
  //eye2
  fill(100,100,255);
  ellipse (wf6X+50,wf6Y-10,wf6eyeSize,wf6eyeSize);
  fill(255);
  ellipse (wf6X+52,wf6Y-10,2,2);
  //eye1
  fill(100,100,255);
  ellipse (wf6X-5,wf6Y-10,wf6eyeSize,wf6eyeSize);
  fill(255);
  ellipse (wf6X-3,wf6Y-10,2,2);
}








//
//
//
//
//7

void whale7(int whale7X, int whale7Y, int whale7Size, int eye7Size, int distance7 ){
 noStroke();
 smooth();
 //mom
 fill(255,230,230);
 arc(whale7X,whale7Y,whale7Size, whale7Size, PI, TWO_PI-PI/2);
 arc(whale7X,whale7Y, whale7Size, whale7Size, TWO_PI-PI/2, TWO_PI);
 //ggori
 arc(distance7, whale7Y, whale7Size/2, whale7Size/3, PI, TWO_PI-PI/2);
  //eye1
  fill(100,100,100);
  ellipse (whale7X-85,whale7Y-20,eye7Size,eye7Size);
  fill(255);
  ellipse (whale7X-82,whale7Y-20,3,3);
  //eye2 
  fill(100,100,100);
  ellipse (whale7X-5,whale7Y-20,eye7Size,eye7Size);
  fill(255);
  ellipse (whale7X-2,whale7Y-20,3,3);
}
void wFriend7(int wf7X, int wf7Y, int wf7Size, int wf7eyeSize, int wf7distance ){
 noStroke();
 smooth(); 
 //mom
 fill(255);
 arc(wf7X,wf7Y,wf7Size, wf7Size, PI, TWO_PI-PI/2);
 arc(wf7X,wf7Y,wf7Size, wf7Size, TWO_PI-PI/2, TWO_PI);
 //ggori
 arc(wf7distance, wf7Y, wf7Size/2, wf7Size/3, TWO_PI-PI/2, TWO_PI);
  //eye2
  fill(100,100,255);
  ellipse (wf7X+78,wf7Y-20,wf7eyeSize,wf7eyeSize);
  fill(255);
  ellipse (wf7X+76,wf7Y-20,3,3);
  //eye1 
  fill(100,100,255);
  ellipse (wf7X-5,wf7Y-20,wf7eyeSize,wf7eyeSize);
  fill(255);
  ellipse (wf7X-7,wf7Y-20,3,3);
}




