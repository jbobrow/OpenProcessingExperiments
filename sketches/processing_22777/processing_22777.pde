
float z = 0;   
//float posizione ;
//float vel ;
int alfa ;




import ddf.minim.*;
AudioPlayer player0;AudioPlayer player1;AudioPlayer player2;AudioPlayer player3;
AudioPlayer player4;AudioPlayer player5;AudioPlayer player6;AudioPlayer player7;
AudioPlayer player8;AudioPlayer player9;AudioPlayer player10;AudioPlayer player11;
AudioPlayer player12;AudioPlayer player13;AudioPlayer player14;AudioPlayer player15;
AudioPlayer player16;AudioPlayer player17;AudioPlayer player18;AudioPlayer player19;
AudioPlayer player20;AudioPlayer player21;AudioPlayer player22;AudioPlayer player23;
AudioPlayer player24;AudioPlayer player25;AudioPlayer player26;

Minim minim;


void setup() {
  size(600,600);
  loadPixels();  
  noStroke ();
  alfa = 0;
  //posizione = 0 ;
  //vel =0.01;

  minim = new Minim(this);
  player0 = minim.loadFile("calm_night_ambience.mp3", 2048); 
  player1= minim.loadFile("people1.mp3", 2048);
  player2 = minim.loadFile("people2.mp3", 2048);
  player3 = minim.loadFile("people3.mp3", 2048);
  player4 = minim.loadFile("people4.mp3", 2048);
  player5 = minim.loadFile("people5.mp3", 2048);
  player6 = minim.loadFile("people6.mp3", 2048);
  player7 = minim.loadFile("people7.mp3", 2048);
  player8 = minim.loadFile("people8.mp3", 2048);
  player9 = minim.loadFile("people9.mp3", 2048);
  player10= minim.loadFile("people10.mp3", 2048);
  player11= minim.loadFile("people11.mp3", 2048);
  player12= minim.loadFile("people12.mp3", 2048);
  player13= minim.loadFile("people13.mp3", 2048);
  player14= minim.loadFile("people14.mp3", 2048);
  player15= minim.loadFile("people15.mp3", 2048);
  player16= minim.loadFile("people16.mp3", 2048);
  player17= minim.loadFile("people17.mp3", 2048);
  player18= minim.loadFile("people18.mp3", 2048);
  player19= minim.loadFile("people19.mp3", 2048);
  player20= minim.loadFile("people20.mp3", 2048);
  player21= minim.loadFile("people21.mp3", 2048);
  player22= minim.loadFile("baby.mp3", 2048);
  player23= minim.loadFile("cat.mp3", 2048);
  player24= minim.loadFile("comic_laghing.mp3", 2048);
  player25= minim.loadFile("dogs.mp3", 2048);
}


void draw() {

  noiseDetail(6, 0.4);    // usa 6 ottave e accentua le ottave più alte del 40%

  for(int h= 0;  h < height;  h++) {   // per y da 0 a (quasi) height ...
    for(int j = 0;  j < width;  j++) {   // per x da 0 a (quasi) width ...

      float grigio = noise( j/300.0,  h/300.0,  z );    // ottieni il valore Perlin noise corrispondente alla posizione x/40,y/40,z

        //pixels[j+h*width] = color(grigio*255);
          pixels[j+h*width] = color(grigio*255, grigio*191+64, grigio*127+128);    // imposta un livello di blu-azzurro proporzionale al valore ottenuto
    }


    updatePixels();    // aggiorna l'area di visualizzazione con i pixel modificati
    //filter( THRESHOLD, 0.6 );
    z += 0.00009;        // spostati al piano successivo
  }
  {
    if (keyPressed) {
      if (key == 'b' || key == 'B') {
        player0.play();
        player1.play();
        player1.loop(12);
        player3.play();
        player4.play();
        player4.loop(4);
        player5.play();
        player5.loop(2);
        player6.play();
        player6.loop(17);
        player7.play();
        player7.loop(4);
        player8.play();
        player5.loop(7);
        player9.play();
        player5.loop(7);
        player10.play();
        player10.loop(7);
        player11.play();
        player11.loop(37);
        player12.play();

        player13.play();
        player13.loop(20);
        player14.play(); 
        player15.play();
        player16.play();
        player17.play();
        player18.play();
        player19.play();
        player20.play();
        player21.play();
        player22.play();

        player23.play();
        player24.play();
        player25.play();
      }
    }
  }



  //antenna-----------------------------------------
  PImage antena = loadImage("antenna-rooftop2.png");
  PImage antena2 = loadImage("antenna-rooftop3.png");
  //luna---------------------------------------------

  // background(37,50,131);
  // float x = lerp(0,500,posizione);
  //float y = lerp(300,0,posizione);
//edifici----------------------------------
image(antena2,5,450);
fill(#082F4D);
rect(0,450,20,150);//(*1*)
fill(247,240,0);
rect(3,455,10,10);//F1
rect(3,470,10,10);//F2
fill(76,79,80);
rect(3,485,10,10);//F3
fill(247,240,0);
rect(3,500,10,10);//F4
rect(3,515,10,10);//F5
fill(76,79,80);
rect(3,530,10,10);//F6
fill(247,240,0);
rect(3,545,10,10);//F7
//fill(62,33,5);
rect(3,560,10,10);//F8
rect(3,575,10,10);//F9
rect(3,590,10,10);//F10

for ( int i=555; i<570 ;i++)
{
  float r = random(255);
  stroke (r);
  rect(i,555,i,570 );
}

fill(#082F4D);
rect(20,475,30,170);//(*2*)
fill(76,79,80);
rect(23,480,10,10);//f1
fill(247,240,0);
rect(23,495,10,10);//f2
rect(23,510,10,10);//f3
fill(76,79,80);
rect(23,525,10,10);//f4
fill(247,240,0);
rect(23,540,10,10);//f5
rect(23,555,10,10);//f6
rect(23,570,10,10);//f7
rect(23,585,10,10);//f8


image(antena,50,365);
fill(#082F4D);
rect(50,400,75,200);//(*3*)
//finestra sinistra
fill(247,240,0);
rect(55,405,20,20);//Fs1
fill(76,79,80);
rect(55,430,20,20);//Fs2
fill(247,240,0);
rect(55,455,20,20);//Fs3
fill(76,79,80);
rect(55,480,20,20);//Fs4
rect(55,505,20,20);//Fs5
fill(247,240,0);
rect(55,530,20,20);//Fs6
rect(55,555,20,20);//Fs7
rect(55,580,20,20);//Fs8

//finsetra destra
fill(76,79,80);
rect(100,405,20,20);//Fd1
fill(247,240,0);
rect(100,430,20,20);//Fd2
fill(247,240,0);
rect(100,455,20,20);//Fd3
rect(100,480,20,20);//Fd4
fill(76,79,80);
rect(100,505,20,20);//Fd5
fill(247,240,0);
rect(100,530,20,20);//Fd6
rect(100,555,20,20);//Fd7
rect(100,580,20,20);//Fd8

fill(#082F4D);
rect(130,425,60,180);//(*4*)
//finestra sinistra
fill(76,79,80);
rect(135,430,10,10);//fl1
fill(247,240,0);
rect(135,445,10,10);//fl2
rect(135,460,10,10);//fl3
rect(135,475,10,10);//fl4
fill(76,79,80);
rect(135,490,10,10);//fl5
fill(76,79,80);
rect(135,505,10,10);//fl6
fill(247,240,0);
rect(135,520,10,10);//fl7
rect(135,535,10,10);//fl8
rect(135,550,10,10);//fl9
rect(135,565,10,10);//f20
rect(135,580,10,10);//f2l
rect(135,595,10,10);//f22
//finestra centro
fill(247,240,0);
rect(155,430,10,10);//fc1
rect(155,445,10,10);//fc2
fill(247,240,0);
rect(155,460,10,10);//fc3
fill(76,79,80);
rect(155,475,10,10);//fc4
rect(155,490,10,10);//fc5
fill(247,240,0);
rect(155,505,10,10);//fc6
rect(155,520,10,10);//fc7
fill(76,79,80);
rect(155,535,10,10);//fc8
rect(155,550,10,10);//fc9
rect(155,565,10,10);//fc10
fill(247,240,0);
rect(155,580,10,10);//fc11
rect(155,595,10,10);//fc12

//finestra destra
rect(175,430,10,10);//fr1
fill(247,240,0);
rect(175,445,10,10);//fr2
rect(175,460,10,10);//fr3
rect(175,475,10,10);//fr4
rect(175,490,10,10);//fr5
fill(247,240,0);
rect(175,505,10,10);//fr6
rect(175,520,10,10);//fr7
fill(76,79,80);
rect(175,535,10,10);//fr8
rect(175,550,10,10);//fr9
rect(175,565,10,10);//fr10
rect(175,580,10,10);//fr11
rect(175,595,10,10);//fr12

fill(#082F4D);
rect(300,500,40,150);//(*5*)
//finestra sinistra

fill(76,79,80);
rect(305,505,15,5);//Fs'1
fill(247,240,0);
rect(305,515,15,5);//Fs'2
rect(305,525,15,5);//Fs'3
fill(76,79,80);
rect(305,535,15,5);//Fs'4
fill(247,240,0);
rect(305,545,15,5);//Fs'5
rect(305,555,15,5);//Fs'6
fill(76,79,80);
rect(305,565,15,5);//Fs'7
rect(305,575,15,5);//Fs'8
fill(247,240,0);
rect(305,585,15,5);//Fs'9
rect(305,595,15,5);//Fs'10
rect(305,605,15,5);//Fs'11
//finestra destra
fill(247,240,0);
rect(330,505,5,5);//Fd'1
rect(330,515,5,5);//Fd'2
rect(330,525,5,5);//Fd'3
rect(330,535,5,5);//Fd'4
fill(76,79,80);
rect(330,545,5,5);//Fd'5
rect(330,555,5,5);//Fd'6
fill(247,240,0);
rect(330,565,5,5);//Fd'7
rect(330,575,5,5);//Fd'8
rect(330,585,5,5);//Fd'9
rect(330,595,5,5);//Fd'10
rect(330,605,5,5);//Fd'11

fill(#082F4D);
rect(340,450,30,170);//(*6*)
//finestra
fill(247,240,0);
rect(345,455,10,10);//f1
fill(76,79,80);
rect(345,475,10,10);//f2
rect(345,495,10,10);//f3
fill(247,240,0);
rect(345,515,10,10);//f4
rect(345,535,10,10);//f5
rect(345,555,10,10);//f6
rect(345,575,10,10);//f7
rect(345,595,10,10);//f8


fill(#082F4D);
rect(370,550,30,130);//(*7*)
//finestra
fill(247,240,0);
rect(375,560,15,5);//F1
rect(375,570,15,5);//F2
rect(375,580,15,5);//F3
rect(375,590,15,5);//F4
rect(375,600,15,5);//F5

image(antena,400,375);
fill(#082F4D);
rect(400,410,100,190);//(*8*)
fill(247,240,0);
//finestra sinestra
rect(405,415,20,10);//fs1
rect(405,435,20,10);//fs2
fill(76,79,80);
rect(405,455,20,10);//fs3
rect(405,475,20,10);//fs4
fill(247,240,0);
rect(405,495,20,10);//fs5
fill(76,79,80);
rect(405,515,20,10);//fs6
fill(247,240,0);
rect(405,535,20,10);//fs7
rect(405,555,20,10);//fs8
rect(405,575,20,10);//fs9
rect(405,595,20,10);//fs10


//finestra centro
fill(76,79,80);
rect(435,415,20,10);//fc1
rect(435,435,20,10);//fc2
fill(247,240,0);
rect(435,455,20,10);//fc3
fill(76,79,80);
rect(435,475,20,10);//fc4
fill(76,79,80);
rect(435,495,20,10);//fc5
fill(247,240,0);
rect(435,515,20,10);//fc6
rect(435,535,20,10);//fc7
rect(435,555,20,10);//fc8
rect(435,575,20,10);//fc9
rect(435,595,20,10);//fc10

//finestra destra
rect(465,415,20,10);//fd1
rect(465,435,20,10);//fd2
rect(465,455,20,10);//fd3
fill(76,79,80);
rect(465,475,20,10);//fd4
fill(247,240,0);
rect(465,495,20,10);//fd5
rect(465,515,20,10);//fd6
rect(465,535,20,10);//fd7
rect(465,555,20,10);//fd8
rect(465,575,20,10);//fd9
rect(465,595,20,10);//fd10


fill(#082F4D);
rect(500,430,70,180);//(*9*)
//finestra sinestra
fill(247,240,0);
rect(505,435,20,20);//fs1
rect(505,465,20,20);//fs2
fill(76,79,80);
rect(505,495,20,20);//fs3
fill(247,240,0);
rect(505,525,20,20);//fs4
fill(76,79,80);
rect(505,555,20,20);//fs5
fill(247,240,0);
rect(505,585,20,20);//fs6
//finestra destra

rect(535,435,30,20);//fd1
fill(247,240,0);
rect(535,465,30,20);//f2d
rect(535,495,30,20);//f3d
rect(535,525,30,20);//f4d
rect(535,555,30,20);//f5d
fill(76,79,80);
rect(535,585,30,20);//f6d

image(antena2,545,365);
fill(#082F4D);
rect(570,390,30,220);//(*10*)
fill(247,240,0);
//finestra sinistra
rect(575,395,5,5);//FS1
rect(575,405,5,5);//FS2
fill(76,79,80);
rect(575,415,5,5);//FS3
fill(247,240,0);
rect(575,425,5,5);//FS4
rect(575,435,5,5);//FS5
rect(575,445,5,5);//FS6
rect(575,455,5,5);//FS7
rect(575,465,5,5);//FS8
fill(76,79,80);
rect(575,475,5,5);//FS9
fill(247,240,0);
rect(575,485,5,5);//FS10
rect(575,495,5,5);//FS11
rect(575,505,5,5);//FS12
rect(575,515,5,5);//FS13
rect(575,525,5,5);//FS14
rect(575,535,5,5);//FS15
fill(76,79,80);
rect(575,545,5,5);//FS16
rect(575,555,5,5);//FS17
fill(247,240,0);
rect(575,565,5,5);//FS18
rect(575,575,5,5);//FS19
rect(575,585,5,5);//FS20
rect(575,595,5,5);//FS21
fill(247,240,0);
//finestra destra
rect(590,395,5,5);//Fd1
rect(590,405,5,5);//Fd2
rect(590,415,5,5);//Fd3
fill(76,79,80);
rect(590,425,5,5);//Fd4
rect(590,435,5,5);//Fd5
fill(247,240,0);
rect(590,445,5,5);//Fd6
rect(590,455,5,5);//Fd7
rect(590,465,5,5);//Fd8
rect(590,475,5,5);//Fd9
rect(590,485,5,5);//Fd10
rect(590,495,5,5);//Fd11
rect(590,505,5,5);//Fd12
rect(590,515,5,5);//Fd13
rect(590,525,5,5);//Fd14
fill(76,79,80);
rect(590,535,5,5);//Fd15
rect(590,545,5,5);//Fd16
fill(247,240,0);
rect(590,555,5,5);//Fd17
rect(590,565,5,5);//Fd18
rect(590,575,5,5);//Fd19
rect(590,585,5,5);//Fd20
rect(590,595,5,5);//Fd21

//stella
PImage c = loadImage("Star3.png");
if((frameCount % 15) == 0) {
  image(c,10,10);
  image(c,270,180);
  image(c,400,150);
  image(c,580,100);
  image(c,400,10);
  image(c,60,150);
  alfa = 255 ;
}
if (alfa > 0 ) {
  fill(255,alfa);
  image(c,150,70);
  image(c,350,89);
  image(c,250,20);
  image(c,500,27);
  image(c,180,210);
  image(c,50,70);
  image(c,550,220);
  image(c,225,100);
  image(c,475,170);
  image(c,100,20);
  image(c,70,220);
  image(c,350,230);
  alfa -=688;
}



}
//smooth();
//PImage a = loadImage("luna2_resize.png");
//filter(BLUR,0.01);  
//image(a,x,y );

// posizione +=vel;
// if (posizione > 1){
//  posizione =300;
//} 
//  x = lerp(300,0,posizione);
// y = lerp(0,300,posizione);
//  posizione +=vel ;
// if(posizione>1){
//posizione =-vel ;  





//sole--------------------------------
//PImage sole = loadImage("sun6.png");
//image(sole,3,400);



