
import ddf.minim.*;



Minim minim;

AudioPlayer g1;
AudioPlayer g2;
AudioPlayer g3;
AudioPlayer g4;
AudioPlayer g5;
AudioPlayer g6;
AudioPlayer g7;
AudioPlayer g8;
AudioPlayer g9;

AudioPlayer b1;
AudioPlayer b2;
AudioPlayer b3;
AudioPlayer b4;
AudioPlayer b5;
AudioPlayer b6;
AudioPlayer b7;
AudioPlayer b8;
AudioPlayer b9;

void setup(){
 
      minim = new Minim(this);
      
      g1 = minim.loadFile("guitarsound1.wav");
      g2 = minim.loadFile("guitarsound2.wav");
      g3 = minim.loadFile("guitarsound3.wav");
      g4 = minim.loadFile("guitarsound4.wav");
      g5 = minim.loadFile("guitarsound5.wav");
      g6 = minim.loadFile("guitarsound6.wav");
      g7 = minim.loadFile("guitarsound7.wav");
      g8 = minim.loadFile("guitarsound8.wav");
      g9 = minim.loadFile("guitarsound9.wav");
      
      b1 = minim.loadFile("basssound1.wav");
      b2 = minim.loadFile("basssound2.wav");
      b3 = minim.loadFile("basssound3.wav");
      b4 = minim.loadFile("basssound4.wav");
      b5 = minim.loadFile("basssound5.wav");
      b6 = minim.loadFile("basssound6.wav");
      b7 = minim.loadFile("basssound7.wav");
      b8 = minim.loadFile("basssound8.wav");
      b9 = minim.loadFile("basssound9.wav");
      
     
//if (e>50){
    //song = minim.loadFile("basssound9.wav");

    //song.play();}
  
  size (500,500);
background (0);
smooth();
}

int y = 50;
int a = 50;
int b = 50;
int c = 50;

int d = 0;
int e = 0;
int f = 0;
int d1 = 0;
int e1 = 0;
int f1 = 0;
int d2 = 0;
int e2 = 0;
int f2 = 0;

int r = 450;
int s = 450;
int t = 450;
int u = 450;
int v = 450;

int w = 100;
int x =233;
int z =366;

int j = 50;

int o =0;

void draw() {
  background (0);
  fill(255);



  
  //////bars//////
fill (180,210,255);
if ((50<d)&&(100>d)&&(r<166)) {
fill (160,190,255);}
if ((50<d)&&(53>d)&&(r<166)) {
    g9.loop(0);}
if ((50<e)&&(100>e)&&(r<332)) {
fill (160,190,255);}
if ((50<e)&&(55>e)&&(r<332)) {
  g9.loop(0);}
if ((50<f)&&(100>f)&&(r<499)) {
fill (160,190,255);}
if ((50<f)&&(57>f)&&(r<499)) {
  g9.loop(0);}
  
if ((50<d2)&&(100>d2)&&(r<166)) {
fill (160,190,255);}
if ((50<d2)&&(53>d2)&&(r<166)) {
  b9.loop(0);}
if ((50<e2)&&(100>e2)&&(r<332)) {
fill (160,190,255);}
if ((50<e2)&&(55>e2)&&(r<332)) {
  b9.loop(0);}
if ((50<f2)&&(100>f2)&&(r<499)) {
fill (160,190,255);} 
if ((50<f2)&&(57>f2)&&(r<499)) {
  b9.loop(0);}

  quad (50,r,100,r,100,500,50,500);

fill (180,210,255);
if ((100<d)&&(150>d)&&(1<y)) {
fill (140,180,255);}
if ((100<d)&&(103>d)&&(1<y)) {
 g8.loop(0);}
if ((100<e)&&(150>e)&&(166<y)) {
fill (140,180,255);}
if ((100<e)&&(105>e)&&(166<y)) {
  g8.loop(0);}
if ((100<f)&&(150>f)&&(333<y)) {
fill (140,180,255);}
if ((100<f)&&(107>f)&&(333<y)) {
 g8.loop(0);} 

if ((100<d2)&&(150>d2)&&(1<y)) {
fill (140,180,255);}
if ((100<d2)&&(103>d2)&&(1<y)) {
 b8.loop(0);}
if ((100<e2)&&(150>e2)&&(166<y)) {
fill (140,180,255);}
if ((100<e2)&&(105>e2)&&(166<y)) {
 b8.loop(0);}
if ((100<f2)&&(150>f2)&&(333<y)) {
fill (140,180,255);}
if ((100<f2)&&(107>f2)&&(333<y)) {
 b8.loop(0);}

  rect(100, 0, 50, y);

fill (180,210,255);
if ((150<d)&&(200>d)&&(t<166)) {
fill (120,170,255);}
if ((150<d)&&(153>d)&&(t<166)) {
  g7.loop(0);}
if ((150<e)&&(200>e)&&(t<332)) {
fill (120,170,255);}
if ((150<e)&&(155>e)&&(t<332)) {
  g7.loop(0);}
if ((150<f)&&(200>f)&&(t<499)) {
fill (120,170,255);}
if ((150<f)&&(157>f)&&(t<499)) {
  g7.loop(0);}

if ((150<d2)&&(200>d2)&&(t<166)) {
fill (120,170,255);}
if ((150<d2)&&(153>d2)&&(t<166)) {
  b7.loop(0);}
if ((150<e2)&&(200>e2)&&(t<332)) {
fill (120,170,255);}
if ((150<e2)&&(155>e2)&&(t<332)) {
  b7.loop(0);}
if ((150<f2)&&(200>f2)&&(t<499)) {
fill (120,170,255);}
if ((150<f2)&&(157>f2)&&(t<499)) {
  b7.loop(0);}

  quad (150,t,200,t,200,500,150,500);
  

fill (180,210,255);

if ((200<d)&&(250>d)&&(1<a)) {
fill (100,160,255);}
if ((200<d)&&(203>d)&&(1<a)) {
  g6.loop(0);}
if ((200<e)&&(250>e)&&(166<a)) {
fill (100,160,255);}
if ((200<e)&&(205>e)&&(166<a)) {
  g6.loop(0);}
if ((200<f)&&(250>f)&&(333<a)) {
fill (100,160,255);}
if ((200<f)&&(207>f)&&(333<a)) {
  g6.loop(0);}


if ((200<d2)&&(250>d2)&&(1<a)) {
fill (100,160,255);}
if ((200<d2)&&(203>d2)&&(1<a)) {
 b6.loop(0);}
if ((200<e2)&&(250>e2)&&(166<a)) {
fill (100,160,255);}
if ((200<e2)&&(205>e2)&&(166<a)) {
  b6.loop(0);}
if ((200<f2)&&(250>f2)&&(333<a)) {
fill (100,160,255);}
if ((200<f2)&&(207>f2)&&(333<a)) {
  b6.loop(0);}

  rect(200, 0, 50, a);

fill (180,210,255);
if ((250<d)&&(300>d)&&(u<166)) {
fill (80,150,255);} 
if ((250<d)&&(253>d)&&(u<166)) {
  g5.loop(0);}
if ((250<e)&&(300>e)&&(u<332)) {
fill (80,150,255);}
if ((250<e)&&(255>e)&&(u<332)) {
  g5.loop(0);}
if ((250<f)&&(300>f)&&(u<499)) {
fill (80,150,255);}
if ((250<f)&&(257>f)&&(u<499)) {
  g5.loop(0);}

if ((250<d2)&&(300>d2)&&(u<166)) {
fill (80,150,255);}
if ((250<d2)&&(253>d2)&&(u<166)) {
  b5.loop(0);}
if ((250<e2)&&(300>e2)&&(u<332)) {
fill (80,150,255);}
if ((250<e2)&&(255>e2)&&(u<332)) {
  b5.loop(0);}
if ((250<f2)&&(300>f2)&&(u<499)) {
fill (80,150,255);}
if ((250<f2)&&(257>f2)&&(u<499)) {
  b5.loop(0);}

    quad (250,u,300,u,300,500,250,500);

fill (180,210,255);
 if ((300<d)&&(350>d)&&(1<b)){
fill (60,140,255);}
if ((300<d)&&(303>d)&&(1<b)) {
  g4.loop(0);}
 if ((300<e)&&(350>e)&&(166<b)) {
fill (60,140,255);}
if ((300<e)&&(305>e)&&(166<b)) {
  g4.loop(0);}
 if ((300<f)&&(350>f)&&(333<b)) {
fill (60,140,255);}
if ((300<f)&&(307>f)&&(333<b)) {
  g4.loop(0);}

 if ((300<d2)&&(350>d2)&&(1<b)) {
fill (60,140,255);}
if ((300<d2)&&(303>d2)&&(1<b)) {
  b4.loop(0);}
 if ((300<e2)&&(350>e2)&&(166<b)) {
fill (60,140,255);}
if ((300<e2)&&(305>e2)&&(166<b)) {
  b4.loop(0);}
 if ((300<f2)&&(350>f2)&&(333<b))  {
fill (60,140,255);}
if ((300<f2)&&(307>f2)&&(333<b)) {
  b4.loop(0);}
 
  rect(300, 0, 50, b);

fill (180,210,255);
  if ((350<d)&&(400>d)&&(v<166)) {
fill (40,130,255);}
if ((350<d)&&(353>d)&&(v<166)) {
  g3.loop(0);}
  if ((350<e)&&(400>e)&&(v<332)) {
fill (40,130,255);}
if ((350<e)&&(355>e)&&(v<332)) {
  g3.loop(0);}
  if ((350<f)&&(400>f)&&(v<499)) {
fill (40,130,255);}
if ((350<f)&&(357>f)&&(v<1499)) {
  g3.loop(0);}

if ((350<d2)&&(400>d2)&&(v<166)) {
fill (40,130,255);}
if ((350<d2)&&(353>d2)&&(v<166)) {
  b3.loop(0);}
  if ((350<e2)&&(400>e2)&&(v<332)) {
fill (40,130,255);}
if ((350<e2)&&(355>e2)&&(v<332)) {
  b3.loop(0);}
  if ((350<f2)&&(400>f2)&&(v<499)) {
fill (40,130,255);}
if ((350<f2)&&(357>f2)&&(v<499)) {
  b3.loop(0);}

      quad (350,v,400,v,400,500,350,500);

fill (180,210,255);
 if ((400<d)&&(450>d)&&(1<c)) {
fill (20,120,255);}
if ((400<d)&&(403>d)&&(1<c)) {
  g2.loop(0);}
 if ((400<e)&&(450>e)&&(166<c)) {
fill (20,120,255);} 
if ((400<e)&&(405>e)&&(166<c)) {
  g2.loop(0);}
 if ((400<f)&&(450>f)&&(333<c)) {
fill (20,120,255);} 
if ((400<f)&&(407>f)&&(333<c)) {
  g2.loop(0);}

 if ((400<d2)&&(450>d2)&&(1<c))  {
fill (20,120,255);}
if ((400<d2)&&(403>d2)&&(1<c)) {
  b2.loop(0);}
 if ((400<e2)&&(450>e2)&&(166<c)) {
fill (20,120,255);}
if ((400<e2)&&(405>e2)&&(166<c)) {
  b2.loop(0);}
 if ((400<f2)&&(450>f2)&&(333<c)) {
fill (20,120,255);}
if ((400<f2)&&(407>f2)&&(333<c)) {
  b2.loop(0);}

  rect(400, 0, 50, c);
  
fill (180,210,255);
if ((450<d)&&(500>d)&&(s<166)) {
fill (0,100,255);} 
if ((450<d)&&(453>d)&&(s<166)) {
  g1.loop(0);}
if ((450<e)&&(500>e)&&(s<332)) {
fill (0,100,255);}
if ((450<e)&&(455>e)&&(s<332)) {
  g1.loop(0);}
if ((450<f)&&(500>f)&&(s<499)) {
fill (0,100,255);} 
if ((450<f)&&(457>f)&&(s<499)) {
  g1.loop(0);}

if ((450<d2)&&(500>d2)&&(s<166)) {
fill (0,100,255);}
if ((450<d2)&&(453>d2)&&(s<166)) {
  b1.loop(0);}
if ((450<e2)&&(500>e2)&&(s<332)) {
fill (0,100,255);}
if ((450<e2)&&(455>e2)&&(s<332)) {
  b1.loop(0);}
if ((450<f2)&&(500>f2)&&(s<499)) {
fill (0,100,255);} 
if ((450<f2)&&(457>f2)&&(s<499)) {
  b1.loop(0);}
  quad (450,s,500,s,500,500,450,500);


 
 //////coloured boxes/////
 
  fill (185,0,0,100); 
  rect (d,0,50,166);
  if (d>0) {
     d=d+1;}
  if (d>499) {
 d=d-489;}   
  fill (185,0,0); 
  rect (0,0,50,166);
  
   fill (185,0,0,150); 
  rect (d1,0,50,166);
  if (d1>0) {
     d1=d1+1;}
  if (d1>499) {
 d1=d1-489;}   
  fill (185,0,0); 
   rect (0,0,50,166);
  
   fill (185,0,0,200); 
 rect (d2,0,50,166);
  if (d2>0) {
     d2=d2+1;}
  if (d2>499) {
 d2=d2-489;}   
  fill (185,0,0); 
   rect (0,0,50,166);
  
  
 
  fill (210,0,0,100);
  rect (e,166,50,166);
  if (e>0) {
    e=e+2;}
     if (e>499) {
 e=e-489;}  
    fill (210,0,0);
  rect (0,166,50,166);
    
    fill (210,0,0,150);
   rect (e1,166,50,166);
  if (e1>0) {
    e1=e1+2;}
     if (e1>499) {
 e1=e1-489;}  
    fill (210,0,0);
  rect (0,166,50,166);
  
   fill (210,0,0,200);
  rect (e2,166,50,166);
  if (e2>0) {
    e2=e2+2;}
     if (e2>499) {
 e2=e2-489;}  
    fill (210,0,0);
  rect (0,166,50,166);
  
 
  fill (255,0,0,100);
 rect (f,332,50,166); 
  if (f>0) {
    f=f+3;}
     if (f>499) {
 f=f-489;}  
   fill (255,0,0);
  rect (0,332,50,166); 

 fill (255,0,0,150);
 rect (f1,332,50,166); 
  if (f1>0) {
    f1=f1+3;}
     if (f1>499) {
 f1=f1-489;}  
   fill (255,0,0);
  rect (0,332,50,166); 

 fill (255,0,0,200);
  rect (f2,332,50,166); 
  if (f2>0) {
    f2=f2+3;}
     if (f2>499) {
 f2=f2-489;}  
   fill (255,0,0);
  rect (0,332,50,166); 



}
//void stop()

//{


//g1.close();

 // minim.stop();
//
 // super.stop();


//}



void mouseDragged() 
{


  //////top bars//////
  
  if((mouseX>100)&&(mouseX<150)&&(mouseY>0)){
  //y =y + (mouseY - pmouseY); 
  y = mouseY;
  }
  //if (y > 500) {
  //  y = 500;
  //}
if((mouseX>200)&&(mouseX<250)&&(mouseY>0)){
 // a = a + (mouseY - pmouseY);
 a= mouseY;
  }
  //if (a > 500) {
    //a = 500;
 // }
  if((mouseX>300)&&(mouseX<350)&&(mouseY>0)){
  b = mouseY;
  }
 // if (b > 500) {
   // b = 500;
  //}
  if((mouseX>400)&&(mouseX<450)&&(mouseY>0)){
  c = mouseY;
  }
  //if (c > 500) {
   // c = 500;
  //}
  
  
 /////bottom bars/////
// &(mouseY<500)

if((mouseX>50)&&(mouseX<100)&&(mouseY<500)){
 // a = a + (mouseY - pmouseY);
 r = mouseY;
 }

if((mouseX>150)&&(mouseX<200)&&(mouseY<500)){
 // a = a + (mouseY - pmouseY);
 t = mouseY;
 }
 
 if((mouseX>250)&&(mouseX<300)&&(mouseY<500)){
 // a = a + (mouseY - pmouseY);
 u = mouseY;
 }
 
 if((mouseX>350)&&(mouseX<400)&&(mouseY<500)){
 // a = a + (mouseY - pmouseY);
 v = mouseY;
 }
 
 if((mouseX>450)&&(mouseX<500)&&(mouseY<500)){
 // a = a + (mouseY - pmouseY);
 s = mouseY;
 }
 
}



//////coloured boxes/////

void mousePressed() {
  if (mouseButton == LEFT) {
  if((mouseX>1)&&(mouseX<50)&&(mouseY>0)&&(mouseY<166)){
     d = d +1;
   }
   if((mouseX>1)&&(mouseX<50)&&(mouseY>166)&&(mouseY<333)){
     e = e +1;
   } 
   if((mouseX>1)&&(mouseX<50)&&(mouseY>333)&&(mouseY<500)){
     f = f +1;
   }
   
  }

  if (mouseButton == RIGHT) {
   if((mouseX>1)&&(mouseX<50)&&(mouseY>0)&&(mouseY<166)){
     d2 = d2 +1;
   }
   if((mouseX>1)&&(mouseX<50)&&(mouseY>166)&&(mouseY<333)){
     e2 = e2 +1;
   } 
   if((mouseX>1)&&(mouseX<50)&&(mouseY>333)&&(mouseY<500)){
     f2 = f2 +1;
   }
   
  }

}

void keyPressed() {
if(keyPressed) {
  if (key == 'a' || key == 'A') {
   d=10;
   } 
} 
if(keyPressed) {
  if (key == 's' || key == 'S') {
   e=10;
   } 
} 
if(keyPressed) {
  if (key == 'd' || key == 'D') {
   f=10;
   } 
} 
if(keyPressed) {
  if (key == 'q' || key == 'Q') {
   d1=10;
   } 
} 
if(keyPressed) {
  if (key == 'w' || key == 'W') {
   e1=10;
   } 
} 
if(keyPressed) {
  if (key == 'e' || key == 'E') {
   f1=10;
   } 
} 
if(keyPressed) {
  if (key == 'r' || key == 'R') {
   d=0;
   e=0;
   f=0;
   d1=0;
   e1=0;
   f1=0;
   d2=0;
   e2=0;
    f2=0;
   } 
} 

} 


    //song.close();

    //minim.stop();

   // super.stop();


//}

