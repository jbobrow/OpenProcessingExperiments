
//CMS3 Processing Mini Project
//Student name: Siu Ho Wun
//SID: 52623053
//The idea of this project is come from the baby .I would like to create an interactive game to make fun with babies or children.When the baby or children are crying,you can trun this programme on to play with them
//so they will stop crying after watching the interesting movement of the character and toys in this programme. 
//I have chosen an upbeat background music in order to create a happy moment.The colourful tone of this programme is aim to capture the attention of the children and babies.
import ddf.minim.*;
Minim minim;
AudioSample toybi;
AudioPlayer bgmusic;
int numFrames = 2; // number of frames in the animation
int frame = 0;
PImage[] mrhappy = new PImage[numFrames]; //array
PImage[] mrfattie = new PImage[numFrames]; 
PImage img1,img2,img3,img4,img5,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16,img17,img18,img19,img20,img21,img22,img23,img24,img25;


void setup()
{
  size(600,500);
  img1 = loadImage("1.png"); 
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img9 =loadImage("4.png");
  img4 = loadImage("ball1.png");
  img5 = loadImage("ball2.png");
  img6 = loadImage("ball3.png");
  img7 = loadImage("a.png");
  img8 = loadImage("b.png");
  img10 = loadImage("bear.png");
  img11 = loadImage("bear2.png");
  img12 = loadImage("hourse.png");
  img13 = loadImage("hourse2.png");
  img14 = loadImage("elephant.png");
  img15 = loadImage("elephant2.png");
  img16 = loadImage("car.png");
  img17 = loadImage("car2.png");
  img18 = loadImage("duck.png");
  img19 = loadImage("duck2.png");
  img20 = loadImage("ballon.png");
  img21 = loadImage("ballon2.png");
  img22 = loadImage("flower.png");
  img23 = loadImage("flower2.png");
  img24 = loadImage("robort.png");
  img25 = loadImage("robort2.png");
  mrhappy[0] = loadImage("1.png");
  mrhappy[1] = loadImage("2.png");
  mrfattie[0] = loadImage("3.png");
  mrfattie[1] = loadImage("4.png");
  minim = new Minim(this);
  toybi = minim.loadSample("toybi.mp3");
  bgmusic = minim.loadFile("bbsong.mp3");
  bgmusic.play();
  bgmusic.loop();
 

}


void draw()
{
  //run the function
   mrhappy();
   mrfattie();
   mouseEvent();
   
}

void mrfattie(){  // if user click the "a" or "s" button, the character on the left will have some movements.
 if (key == 'a'){  
     image(img3,70,150);
  } 
  else if( key =='s')
    {
      
      image(img9,70,150);
    }
    else{
     
      image(img3,70,150);
    }
}


void mrhappy(){
  background(255,39,93);
  if (mousePressed == true) 
  {  
     toybi.trigger(); //create sound effect when mouse clicked
     frame = frame +1; // keep looping the image
  }
    if(frame>=numFrames)
    {
      
      frame=0; // frame turn back to 0 so that the animation will keep looping if clicked the mouse. 
    } 
   
  
    image(mrhappy[frame],350,170);// run the array
     
}


void mouseEvent(){ // if the mouse is on the position of these image, they will change the position
//The ball 
  if (mouseX<=90 && mouseX>=30 && mouseY<=90 && mouseY>=50) {
    image(img4,30,50);
}
else
   image(img6,30,50);
   
//The toy duck
   if (mouseX<=300 && mouseX>=250 && mouseY<=80 && mouseY>=20) {
    image(img18,250,20);
}
else
   image(img19,250,20);
   
//The teddy bear
if(mouseX<=500 && mouseX>=450 && mouseY<=140 && mouseY>=40) {
    image(img10,450,40);
}
else
   image(img11,450,40);
   
//The Hourse
if(mouseX<=600 && mouseX>=500 && mouseY<=450 && mouseY>=350) {
    image(img12,500,350);
}
else
   image(img13,500,350);

//The ball  
if(mouseX<=400 && mouseX>=250 && mouseY<=550 && mouseY>=400) {
    image(img14,250,400);
}
else
   image(img15,250,400);
 
//The robort  
if(mouseX<=80 && mouseX>=25 && mouseY<=350 && mouseY>=200) {
    image(img24,25,200);
}
else
   image(img25,25,200);
  
//The ballon 
if (mouseX<=350 && mouseX>=280 && mouseY<=350 && mouseY>=200) {
    image(img20,280,200);
}
else
   image(img21,280,200);

//The flower
if(mouseX<=600 && mouseX>=500 && mouseY<=300 && mouseY>=200) {
    image(img22,500,200);
}
else
   image(img23,500,200);

//The toy car
if(mouseX<=80 && mouseX>=17 && mouseY<=500 && mouseY>=400) {
    image(img16,17,400);
}
else
   image(img17,17,400);
}

