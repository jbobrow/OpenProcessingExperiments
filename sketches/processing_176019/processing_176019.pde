
boolean swi = false;

int b = millis()/1000;
int q = 0;


import ddf.minim.*;
int w = millis()/250;
Minim minim0, minim1,minim2,minim3,minim4,minim5,minim6,minim7,minim8,minim9,minim10, minim11,minim12,minim13,minim14,minim15,minim16;

AudioPlayer player0;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
AudioPlayer player9;
AudioPlayer player10;
AudioPlayer player11;
AudioPlayer player12;
AudioPlayer player13;
AudioPlayer player14;
AudioPlayer player15;
AudioPlayer player16;


PImage img1;


PImage[] images = new PImage[4]; // Image array

PImage img1gone;
PImage img2gone;
PImage img3gone;
PImage img4gone;
PImage img5gone;
PImage img6gone;
PImage img7gone;
PImage img8gone;
PImage img9gone;
PImage img10gone;
PImage img11gone;
PImage img12gone;
PImage img13gone;
PImage img14gone;
PImage img15gone;
PImage img16gone;
PImage img17gone;

int counter = 1;

void setup() {
  size(800,700);
  imageMode(CENTER);
  frameRate(4);
  images[1] = loadImage("Gabrielll.png");
  images[2] = loadImage("GabrielGa.png");
  images[3] = loadImage("GabrielBr.png");
  images[0] = loadImage("Gabrielie.png");
  
  img1 = loadImage("gabrielTotally.png");
  img1gone = loadImage("gabrielTotally1gone.png");
  img2gone = loadImage("gabrielTotally2gone.png");
  img3gone = loadImage("gabrielTotally3gone.png");
  img4gone = loadImage("gabrielTotally4gone.png");
  img5gone = loadImage("gabrielTotally5gone.png");
  img6gone = loadImage("gabrielTotally6gone.png");
  img7gone = loadImage("gabrielTotally7gone.png");
  img8gone = loadImage("gabrielTotally8gone.png");
  img9gone = loadImage("gabrielTotally9gone.png");
  img10gone = loadImage("gabrielTotally10gone.png");
  img11gone = loadImage("gabrielTotally11gone.png");
  img12gone = loadImage("gabrielTotally12gone.png");
  img13gone = loadImage("gabrielTotally13gone.png");
  img14gone = loadImage("gabrielTotally14gone.png");
  img15gone = loadImage("gabrielTotally15gone.png");
  img16gone = loadImage("gabrielTotally16gone.png");
  img17gone = loadImage("gabrielTotally17gone.png");
  
  
  minim0 = new Minim(this);
  minim1 = new Minim(this);
  minim2 = new Minim(this);
  minim3 = new Minim(this);
  minim4 = new Minim(this);
  minim5 = new Minim(this);
  minim6 = new Minim(this);
  minim7 = new Minim(this);
  minim8 = new Minim(this);
  minim9 = new Minim(this);
  minim10 = new Minim(this);
  minim11 = new Minim(this);
  minim12 = new Minim(this);
  minim13 = new Minim(this);
  minim14 = new Minim(this);
  minim15 = new Minim(this);
  minim16 = new Minim(this);

  player0 = minim0.loadFile("gabriel0.mp3");
  player1 = minim1.loadFile("gabriel1.mp3");
  player2 = minim2.loadFile("gabriel2.mp3");
  player3 = minim3.loadFile("gabriel3.mp3");
  player4 = minim4.loadFile("gabriel4.mp3");
  player5 = minim5.loadFile("gabriel5.mp3");
  player6 = minim6.loadFile("gabriel6.mp3");
  player7 = minim7.loadFile("gabriel7.mp3");
  player8 = minim8.loadFile("gabriel8.mp3");
  player9 = minim9.loadFile("gabriel9.mp3");
  player10 = minim10.loadFile("gabriel10.mp3");
  player11 = minim11.loadFile("gabriel11.mp3");
  player12 = minim12.loadFile("gabriel12.mp3");
  player13 = minim13.loadFile("gabriel13.mp3");
  player14 = minim14.loadFile("gabriel14.mp3");
  player15 = minim15.loadFile("gabriel15.mp3");
  player16 = minim16.loadFile("gabriel16.mp3");
  
  
}

void draw() {
  
  counter++;
  
  background(random(50,150));
  
  loop();
  
  image(img1,width/2,height/2);
  

  if ( counter == 4) {
   counter = 0; 
  }
  
  /*
      if ((key == 's')){
        q++;
  }
    */
    
if (swi == true) {
  q++;
}

  if ( swi == false) {
   q=q;
  }
  
   if (key == 'p'){
    swi = false; 
   }
    
 if (key == 'o'){
    swi = true;   
   }

  
   //noLoop();
  if (counter == 1) {
  player0.play();
  player0.loop();// = minim0.loadFile("gabriel0.mp3);
  player1.play();
  player1.loop();// = minim1.loadFile("gabriel1.mp3");
  player2.play();
  player2.loop();// = minim2.loadFile("gabriel2.mp3");
  player3.play();
  player3.loop();// = minim3.loadFile("gabriel3.mp3");
  player4.play();
  player4.loop();// = minim4.loadFile("gabriel4.mp3");
  player5.play();
  player5.loop();// = minim5.loadFile("gabriel5.mp3");
  player6.play();
  player6.loop();// = minim6.loadFile("gabriel6.mp3");
  player7.play();
  player7.loop();// = minim7.loadFile("gabriel7.mp3");
  player8.play();
  player9.loop();// = minim8.loadFile("gabriel8.mp3");
  player9.play();
  player9.loop();// = minim9.loadFile("gabriel9.mp3");
  player10.play();
  player10.loop();// = minim10.loadFile("gabriel10.mp3");
  player11.play();
  player11.loop();// = minim11.loadFile("gabriel11.mp3");
  player12.play();
  player12.loop();// = minim12.loadFile("gabriel12.mp3");
  player13.play();
  player13.loop();// = minim13.loadFile("gabriel13.mp3");
  player14.play();
  player14.loop();// = minim14.loadFile("gabriel14.mp3");
  player15.play();
  player15.loop();// = minim15.loadFile("gabriel15.mp3");
  player16.play();
  player16.loop();// = minim16.loadFile("gabriel16.mp3");

  }
  
  image(images[counter], 440, 166, images[counter].width/8, images[counter].height/8);//1
  image(images[counter], 458, 645, images[counter].width/3, images[counter].height/3);//2
  image(images[counter], 690, 422, images[counter].width/9, images[counter].height/8);//3
  image(images[counter], 386, 210, images[counter].width/9, images[counter].height/9);//4
  image(images[counter], 148, 454, images[counter].width/5, images[counter].height/4);//5
  image(images[counter], 618, 532, images[counter].width/(3.3), images[counter].height/3);
  image(images[counter], 646, 392, images[counter].width/6, images[counter].height/6);//7
  image(images[counter], 450, 76, images[counter].width/6, images[counter].height/7);//8
  image(images[counter], 300, 658, images[counter].width/5, images[counter].height/5);//9
  image(images[counter], 680, 310, images[counter].width/5, images[counter].height/5);//10
  image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
 
  
  if ((q >= 12) && (q<30)){
    player0.close();
    minim0.stop();
    
    image(img1gone,width/2,height/2);
    
    image(images[counter], 458, 645, images[counter].width/3, images[counter].height/3);//2
  image(images[counter], 690, 422, images[counter].width/9, images[counter].height/8);//3
  image(images[counter], 386, 210, images[counter].width/9, images[counter].height/9);//4
  image(images[counter], 148, 454, images[counter].width/5, images[counter].height/4);//5
  image(images[counter], 618, 532, images[counter].width/(3.3), images[counter].height/3);
  image(images[counter], 646, 392, images[counter].width/6, images[counter].height/6);//7
  image(images[counter], 450, 76, images[counter].width/6, images[counter].height/7);//8
  image(images[counter], 300, 658, images[counter].width/5, images[counter].height/5);//9
  image(images[counter], 680, 310, images[counter].width/5, images[counter].height/5);//10
  image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th
  
    
  }

  if ((q>= 30) && (q<55)) {
    player1.close();
    minim1.stop();
    image(img2gone,width/2,height/2);
    image(images[counter], 690, 422, images[counter].width/9, images[counter].height/8);//3
  image(images[counter], 386, 210, images[counter].width/9, images[counter].height/9);//4
  image(images[counter], 148, 454, images[counter].width/5, images[counter].height/4);//5
  image(images[counter], 618, 532, images[counter].width/(3.3), images[counter].height/3);
  image(images[counter], 646, 392, images[counter].width/6, images[counter].height/6);//7
  image(images[counter], 450, 76, images[counter].width/6, images[counter].height/7);//8
  image(images[counter], 300, 658, images[counter].width/5, images[counter].height/5);//9
  image(images[counter], 680, 310, images[counter].width/5, images[counter].height/5);//10
  image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
  }
  
  
  if ((q>= 55) && (q<67)) {
    player2.close();
    minim2.stop();
    image(img3gone,width/2,height/2);
  image(images[counter], 386, 210, images[counter].width/9, images[counter].height/9);//4
  image(images[counter], 148, 454, images[counter].width/5, images[counter].height/4);//5
  image(images[counter], 618, 532, images[counter].width/(3.3), images[counter].height/3);
  image(images[counter], 646, 392, images[counter].width/6, images[counter].height/6);//7
  image(images[counter], 450, 76, images[counter].width/6, images[counter].height/7);//8
  image(images[counter], 300, 658, images[counter].width/5, images[counter].height/5);//9
  image(images[counter], 680, 310, images[counter].width/5, images[counter].height/5);//10
  image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 67) && (q< 75)) {
    player3.close();
    minim3.stop();
    image(img4gone,width/2,height/2);
    
  image(images[counter], 148, 454, images[counter].width/5, images[counter].height/4);//5
  image(images[counter], 618, 532, images[counter].width/(3.3), images[counter].height/3);
  image(images[counter], 646, 392, images[counter].width/6, images[counter].height/6);//7
  image(images[counter], 450, 76, images[counter].width/6, images[counter].height/7);//8
  image(images[counter], 300, 658, images[counter].width/5, images[counter].height/5);//9
  image(images[counter], 680, 310, images[counter].width/5, images[counter].height/5);//10
  image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  
 
  if ((q>=75) && (q< 90))  {
    player4.close();
    minim4.stop();
    image(img5gone,width/2,height/2);
    
  image(images[counter], 618, 532, images[counter].width/(3.3), images[counter].height/3);
  image(images[counter], 646, 392, images[counter].width/6, images[counter].height/6);//7
  image(images[counter], 450, 76, images[counter].width/6, images[counter].height/7);//8
  image(images[counter], 300, 658, images[counter].width/5, images[counter].height/5);//9
  image(images[counter], 680, 310, images[counter].width/5, images[counter].height/5);//10
  image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 90) && (q< 110))  {
    player5.close();
    minim5.stop();
    image(img6gone,width/2,height/2);
    
  image(images[counter], 646, 392, images[counter].width/6, images[counter].height/6);//7
  image(images[counter], 450, 76, images[counter].width/6, images[counter].height/7);//8
  image(images[counter], 300, 658, images[counter].width/5, images[counter].height/5);//9
  image(images[counter], 680, 310, images[counter].width/5, images[counter].height/5);//10
  image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
    
  }
  if ((q>= 110) && (q< 118))  {
    player6.close();
    minim6.stop();
    image(img7gone,width/2,height/2);
    
  image(images[counter], 450, 76, images[counter].width/6, images[counter].height/7);//8
  image(images[counter], 300, 658, images[counter].width/5, images[counter].height/5);//9
  image(images[counter], 680, 310, images[counter].width/5, images[counter].height/5);//10
  image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 118) && (q< 130))  {
    player7.close();
    minim7.stop();
    image(img8gone,width/2,height/2);
    
    image(images[counter], 300, 658, images[counter].width/5, images[counter].height/5);//9
  image(images[counter], 680, 310, images[counter].width/5, images[counter].height/5);//10
  image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 130) && (q< 150))  {
    player8.close();
    minim8.stop();
    image(img9gone,width/2,height/2);
    
    image(images[counter], 680, 310, images[counter].width/5, images[counter].height/5);//10
  image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 150) && (q< 170))  {
    player9.close();
    minim9.stop();
    image(img10gone,width/2,height/2);
    
    image(images[counter], 342, 158, images[counter].width/4, images[counter].height/4);//11
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 170 ) && (q< 187))  {
    player10.close();
    minim10.stop();
    image(img11gone,width/2,height/2);
    
  
  image(images[counter], 362, 334, images[counter].width/8, images[counter].height/8);//12
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 187) && (q< 200))  {
    player11.close();
    minim11.stop();
    image(img12gone,width/2,height/2);
    
  
  image(images[counter], 502, 405, images[counter].width/3, images[counter].height/3);//14
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 200) && (q< 230))  {
    player12.close();
    minim12.stop();
    image(img13gone,width/2,height/2);
    
  image(images[counter], 238, 424, images[counter].width/4, images[counter].height/4);//13
  image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 230) && (q< 260)) {
    player13.close();
    minim13.stop();
    image(img14gone,width/2,height/2);
    
    image(images[counter], 363, 480, images[counter].width/3, images[counter].height/3);//15
  image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 260) && (q< 270))  {
    player14.close();
    minim14.stop();
    image(img15gone,width/2,height/2);
    
    image(images[counter], 214, 542, images[counter].width/5, images[counter].height/5);//16
  image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if ((q>= 270) && (q< 312))  {
    player15.close();
    minim15.stop();
    image(img16gone,width/2,height/2);
    image(images[counter], 173, 230, images[counter].width/(2.5), images[counter].height/(2.5));//17th head
  
    
  }
  if (q>= 312) {
    player16.close();
    minim16.stop();
    image(img17gone,width/2,height/2);
    
  }


  

 
 println(q);
 println(b);




}





