
/*
  Using the distance sensor on arduino you can slide through
  30 pictures and every picture has his own song
*/

import ddf.minim.*;
Minim minim;
AudioPlayer zero;
AudioPlayer one;
AudioPlayer two;
AudioPlayer three;
AudioPlayer four;
AudioPlayer five;
AudioPlayer six;
AudioPlayer seven;
AudioPlayer eight;
AudioPlayer nine;
AudioPlayer ten;
AudioPlayer eleven;
AudioPlayer twelve;
AudioPlayer thirteen;
AudioPlayer fourteen;
AudioPlayer fifteen;
AudioPlayer sixteen;
AudioPlayer seventeen;
AudioPlayer eighteen;
AudioPlayer nineteen;
AudioPlayer twenty;
AudioPlayer twentyone;
AudioPlayer twentytwo;
AudioPlayer twentythree;
AudioPlayer twentyfour;
AudioPlayer twentyfive;
AudioPlayer twentysix;
AudioPlayer twentyseven;
AudioPlayer twentyeight;
AudioPlayer twentynine;

 float xoutput = 0;        // arduino output
 float speed = 0;            //startlocation of gallery
 

// the number of pictures you load
int numPics = 30;
int picsDisplayed;
int mX;
int picWidth;
int picHeight;
int picMaxWidth = 600;
int picMaxHeight = int(picMaxWidth * 0.7566667);
PImage[] images = new PImage[numPics];
float slider_width;


void setup() {
  // sets the size of the window 
  size( 600, 615 );

 
 /* making the picWidth 3 times als small as the width of 
    the screen so in this case 200
 */
  picWidth = width / 3;
  // making the picHeight 151
  picHeight = int(picWidth * 0.7566667);  
  
  // the with of the slider which is in the top of the screen
  slider_width = (numPics * picWidth)-width;
   
  // makes the background white
  background( 255 );
  
  /* if the number of pictures is increased the number of 
  pictures shown in the slider also increases
  */
  picsDisplayed = int( numPics );
  
  // load all imgaes into the array
  for(int i=0; i<numPics; i++) {
    String imageName = "0" + i + ".jpg";
    images[i] = loadImage(imageName);
  }
 
 // loads all the songs
  minim = new Minim(this);
  zero = minim.loadFile("00.mp3"); //Above two lines load .mp3 from data.
  zero.cue(48600);

  minim = new Minim(this);
  one = minim.loadFile("01.mp3"); //Above two lines load .mp3 from data.
  one.cue(48600);

  minim = new Minim(this);
  two = minim.loadFile("02.mp3"); //Above two lines load .mp3 from data.
  two.cue(48600);
 
  minim = new Minim(this);
  three = minim.loadFile("03.mp3"); //Above two lines load .mp3 from data.
  three.cue(48600);

  minim = new Minim(this);
  four = minim.loadFile("04.mp3"); //Above two lines load .mp3 from data.
  four.cue(48600);

  minim = new Minim(this);
  five = minim.loadFile("05.MP3"); //Above two lines load .mp3 from data.
  five.cue(48600);

  minim = new Minim(this);
  six = minim.loadFile("06.mp3"); //Above two lines load .mp3 from data.
  six.cue(48600);

  minim = new Minim(this);
  seven = minim.loadFile("07.mp3"); //Above two lines load .mp3 from data.
  seven.cue(48600);

  minim = new Minim(this);
  eight = minim.loadFile("08.mp3"); //Above two lines load .mp3 from data.
  eight.cue(48600);
  
  minim = new Minim(this);
  nine = minim.loadFile("09.mp3"); //Above two lines load .mp3 from data.
  nine.cue(48600);

  minim = new Minim(this);
  ten = minim.loadFile("010.mp3"); //Above two lines load .mp3 from data.
  ten.cue(48600);

  minim = new Minim(this);
  eleven = minim.loadFile("011.mp3"); //Above two lines load .mp3 from data.
  eleven.cue(48600);

  minim = new Minim(this);
  twelve = minim.loadFile("012.mp3"); //Above two lines load .mp3 from data.
  twelve.cue(48600);

  minim = new Minim(this);
  thirteen = minim.loadFile("013.mp3"); //Above two lines load .mp3 from data.
  thirteen.cue(48600);

  minim = new Minim(this);
  fourteen = minim.loadFile("014.mp3"); //Above two lines load .mp3 from data.
  fourteen.cue(48600);

  minim = new Minim(this);
  fifteen = minim.loadFile("015.mp3"); //Above two lines load .mp3 from data.
  fifteen.cue(48600);

  minim = new Minim(this);
  sixteen = minim.loadFile("016.mp3"); //Above two lines load .mp3 from data.
  sixteen.cue(48600);

  minim = new Minim(this);
  seventeen = minim.loadFile("017.mp3"); //Above two lines load .mp3 from data.
  seventeen.cue(48600);

  minim = new Minim(this);
  eighteen = minim.loadFile("018.mp3"); //Above two lines load .mp3 from data.
  eighteen.cue(48600);

  minim = new Minim(this);
  nineteen = minim.loadFile("019.mp3"); //Above two lines load .mp3 from data.
  nineteen.cue(48600);

  minim = new Minim(this);
  twenty = minim.loadFile("020.mp3"); //Above two lines load .mp3 from data.
  twenty.cue(48600);

  minim = new Minim(this);
  twentyone = minim.loadFile("021.mp3"); //Above two lines load .mp3 from data.
  twentyone.cue(48600);

  minim = new Minim(this);
  twentytwo = minim.loadFile("022.mp3"); //Above two lines load .mp3 from data.
  twentytwo.cue(48600);

  minim = new Minim(this);
  twentythree = minim.loadFile("023.mp3"); //Above two lines load .mp3 from data.
  twentythree.cue(48600);

  minim = new Minim(this);
  twentyfour = minim.loadFile("024.mp3"); //Above two lines load .mp3 from data.
  twentyfour.cue(48600);

  minim = new Minim(this);
  twentyfive = minim.loadFile("025.mp3"); //Above two lines load .mp3 from data.
  twentyfive.cue(48600);

  minim = new Minim(this);
  twentysix = minim.loadFile("026.mp3"); //Above two lines load .mp3 from data.
  twentysix.cue(48600);

  minim = new Minim(this);
  twentyseven = minim.loadFile("027.mp3"); //Above two lines load .mp3 from data.
  twentyseven.cue(48600);

  minim = new Minim(this);
  twentyeight = minim.loadFile("028.mp3"); //Above two lines load .mp3 from data.
  twentyeight.cue(48600);

  minim = new Minim(this);
  twentynine = minim.loadFile("029.mp3"); //Above two lines load .mp3 from data.
  twentynine.cue(48600);
}

void draw() {
  // sets the image on 0
  int img = 0;
  
  if(keyPressed){
 if(key == 'a' || key == 'A') {if(key == 'b' || key == 'B') {xoutput=0;} else {xoutput=1;}}
 else if(key == 'c' || key == 'C') {xoutput=-1;}
 else {xoutput=0;}
 }

  /* changes the scroll speed depending on the number of
     pictures so more pictures makes the scroll speed faster
     */
  for (int x=0; x<numPics; x++) {
    /* makes the pictures slide
     x*picWidth makes the pictures appear next to each other 
     x is for the translation speed*/
    translate(x*picWidth, 0);
   
    /* if the image name (also number) is smaller than the number
      of pictures then
    */
    if (img<numPics) {
      //changes the arduino input into speed
      speed = speed + xoutput;
      
      /* map converts the x position of the mouse to the 
         x position of the scroll bar
      */
      mX = int( map(speed, 0, width, 0, slider_width ) );
      // the size of the pict in the slider
      
      image( images[img], -mX, 0, picWidth, picHeight );
      
      // img is raised with 1
      img++;
    }
   // if this isn't true img = 0
    else{
      img = 0;
    }
    // -x is for translating to the left
    translate(-x*picWidth,0);
  }
  
  /* the current picture is the picture at the position of the mouse 
    compared to the with of the slider as defined by mX
    making a map again mX has te vallue 0 to the with of the slider
    200*the number of pictures
    this converts the slider with to the number of pictures
  */
  int curPic = int( map( mX, 0, slider_width, 0, numPics) );
  /* pX is the half of the screen width minus half of the max picwidth
     this makes sure the x value for the display in this case 0
  */
  int pX = ( width / 2) - (picMaxWidth / 2);
  /* display the current picture at px, picture height +10(the 10 is for the distance
     between the slider and the picture
     and the last 2 values
     make sure that the pictures are displayed in the same size
  */
  image( images[curPic], pX, picHeight+10, 600, 454 );
 
  /* with every picture an other song is played and all the other songs are put on pause
     so when you put you hand suddenly in fornt of the sensor it wouldn't play more songs
     at the same time
  */
  if (curPic==0){
    zero.play();
    one.pause(); two.pause(); three.play(); four.pause();  five.pause(); 
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic==1){
    one.play();//Commands AudioPlayer to play the "happy" song.
    zero.pause();
    two.pause(); three.play(); four.pause();  five.pause(); 
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
    }
    
    if (curPic == 2){
    two.play();
    zero.pause(); one.pause(); 
    three.play(); four.pause();  five.pause(); 
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if (curPic == 3){
    three.play(); 
    zero.pause(); one.pause(); two.pause();
    four.pause();  five.pause(); 
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  
  if (curPic == 4){
    four.play();
    zero.pause(); one.pause(); two.pause(); three.pause();
    five.pause(); six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if (curPic == 5){
    five.play();
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic == 6){
    six.play();
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic == 7 ){
    seven.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause();
    eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic == 8 ){
    eight.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause();
    nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic == 9){
    nine.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause();
    ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic == 10){
    ten.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause();
    eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic == 11){
    eleven.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause();
    twelve.pause();  thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic == 12){
    twelve.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause();
    thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic == 13){
    thirteen.play();
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause();
    fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic == 14){
    fourteen.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause();
    fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }
  
  if ( curPic == 15){
    fifteen.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause();
    sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 16){
    sixteen.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 17){
    seventeen.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    eighteen.pause(); nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 18){
    eighteen.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause();
    nineteen.pause(); twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 19){
    nineteen.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause();
    twenty.pause();  twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 20){
    twenty.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause();
    twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 21){
    twentyone.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 22){
    twentytwo.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause(); twentyone.pause();
    twentythree.pause(); twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 23){
    twentythree.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause(); twentyone.pause();
    twentytwo.pause();
    twentyfour.pause(); twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 24){
    twentyfour.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause(); twentyone.pause();
    twentytwo.pause(); twentythree.pause();
    twentyfive.pause(); 
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 25){
    twentyfive.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause(); twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause();
    twentysix.pause(); twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 26){
    twentysix.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause(); twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause();
    twentyseven.pause(); twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 27){
    twentyseven.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause(); twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause();
    twentysix.pause();
    twentyeight.pause(); twentynine.pause();
  }

  if ( curPic == 28){
    twentyeight.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause(); twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause();
    twentysix.pause(); twentyseven.pause();
    twentynine.pause();
  }

  if ( curPic == 29){
    twentynine.play(); 
    zero.pause(); one.pause(); two.pause(); three.pause(); four.pause(); five.pause();
    six.pause(); seven.pause(); eight.pause(); nine.pause(); ten.pause(); eleven.pause(); 
    twelve.pause(); thirteen.pause(); fourteen.pause(); fifteen.pause(); sixteen.pause();
    seventeen.pause(); eighteen.pause(); nineteen.pause(); twenty.pause(); twentyone.pause();
    twentytwo.pause(); twentythree.pause(); twentyfour.pause(); twentyfive.pause();
    twentysix.pause(); twentyseven.pause(); twentyeight.pause();
  }
}

 

