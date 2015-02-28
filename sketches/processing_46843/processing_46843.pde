
//key1=bassnectar song
//key2=rusko song
//key3=the bars change with the sound
//key4=is a smile changing with sound
//key5=smile face with circles around the face
//key6= tunnel
//imports minim libary
import ddf.minim.*;
//imports anailizer
import ddf.minim.analysis.*;
//imports the control libary to change aspects of sketch
import controlP5.*;
ControlP5 controlP5;
//the face is a class it controls the smile face
//the eyes
face eye1=new face(200, 150);
face eye2=new face(400, 150);
//the mouth
face mouth1=new face(140, 350);
face mouth2=new face(240, 400);
face mouth3=new face(340, 400);
face mouth4=new face(440, 350);
//minim libary
Minim minim;
AudioPlayer song;
//frequency scanner for the music
FFT fft;
//this is for the if statements it lets me make one of these
//for a key press to switch between visuals
boolean V1, V2, V3, V4;
//for the circle around the face
float angle;
//affets the tunnel
int speed=2;
//the tunnel the array for
spiral[] e=new spiral[speed];
//variable to change color
int ycol=0;
int ycol2=74;
int ycol3=200;
void setup() {
  controlP5 = new ControlP5(this);
  //set all number key vaialbe to false so i can then turn them true in the sketch, 
  //and by key press
  V1=false;
  V2=false;
  V3=false;
  V4=false;
  // the minim libary
  minim = new Minim(this);
  size(600, 600);
  //for loop the tunnel
  for (int i=0;i<speed;i++) {
    e[i]=new spiral(1);
  }
  // the song basenecatar
  //i used the normal buffersize of 1024
  song = minim.loadFile("bassnecter.mp3");
  // the song lenth the frequency it is anazlizing
  fft = new FFT(song.bufferSize(), song.sampleRate());
  //changes the collor when click the box and drag mouse
  controlP5.addNumberbox("colorshift", 0, 10, 10, 100, 14);
  controlP5.addNumberbox("colorshift2", 100, 100, 10, 100, 14);
  controlP5.addNumberbox("colorshift3", 200, 200, 10, 100, 14);
}
void draw() {
  //makes background black
  background(0);
  //key 1 it starts the bars visual
  if (V1) {
    // draws a row of rectangles each going up and down depending on frequency
    //the i=0 starts it at the left botom corner
    //fft is the frequency scanner changing the bars
    for (int i = 0; i < fft.specSize(); i++) {
      //makes its on a hue saturation and brighteness
      colorMode(HSB);
      //ycol changes the color when I click the box and move when mouse is pressed
      fill(ycol, 220, 200);
      //the i*15 is how far apart each rect is
      //600 starts it at bottom
      //the 6 how wide they are
      //negative height to draw upward with *10 to increase scale
      rect(i*15, 600, 6, -fft.getBand(i)*10);
    }
  }
  //V2 starts the first face picture key4
  if (V2) {
    colorMode(HSB);
    //color varialbe so I can change it in the sketch
    fill(150, ycol2, 172);
    //the size of circles of the mouth changes with song
    //the(256)*400; changes how far up and down it can go
    float esize = song.mix.get(256)*400;
    //the 2 eyes
    //this is the for class the location is decaler above
    eye1.display2();  
    eye2.display2(); 
    //the mouth controlled by sound
    mouth1.display(esize);  
    mouth2.display(esize); 
    mouth3.display(esize);  
    mouth4.display(esize);
  }
  //for loop for the cirlce around the face 
  for (int i=0;i<speed;i++) {
    e[i].circle();
    //frequency scanner scanning it forward of my sons
    fft.forward(song.mix);
  }
  //this is the circle around the face i need the circle to be thier
  //for the void circle coming up right after
  circle();
}
//this is the circle around the face
void circle () {
  //key5
  if (V3) {
    //color mode HSB
    colorMode(HSB);
    //color variable changes color with mouse pressed
    fill(0, 255, ycol3);
    for (int i = 0; i < fft.specSize(); i++) {    
      //the push and pop matrix keep the lines going to the outside and not scatered 
      //and not making them scatered inside
      pushMatrix();
      //centers it around the face
      //translate is wehre the object is going to be displayed
     translate(300, 300);
      //rotates it be the angle i gave it
      rotate(angle);
      //the angle is at a constant this spining around the face
      angle +=-10;
      //this is the ellipses around the face easier to see when bass is louder and drops
      //the with of the ellipses become biger with music
      ellipse(i*5, 250, 200, -fft.getBand(i)*1/2);
      //brings it back to nomrmal system tracking
      popMatrix();
    }
  }
}
//stop songs when quits
void stop() {
  song.close();
  minim.stop();
  super.stop();
}
//mouse starts song
void mousePressed() {
  song.play();
}
void keyPressed() {
  //key 1 plays bassnecter
  if (key=='1') {
    song.close();
    song = minim.loadFile("bassnecter.mp3");
    song.play();
  }
  //plays rusko
  if (key=='2') {
    song.close();
    song = minim.loadFile("rusko.mp3");
    song.play();
  }
  //the rectangles
  //i set the rest to false so they do not appear on scree
  //when i click the key buttons.  
  if (key=='3') {
    V1=true;
    V2=false;
    V3=false;
    V4=false;
  }
  //the smile face
  if (key=='4') {
    V2=true;
    V1=false;
    V3=false;
    V4=false;
  }
  //smileface with circle around
  if (key=='5') {
    V3=true;
    V2=true;
    V1=false;
    V4=false;
  }
  //the tunnel of circles
  if (key=='6') {
    V4=true;  
    V1=false;
    V2=false;
    V3=false;
  }
}
//im decaring each box that i declared in the setup each one has its own variable
void colorshift(int color1) {
  ycol=color1;
}
void colorshift2(int color2) {
  ycol2=color2;
}
void colorshift3(int color3) {
  ycol3=color3;
}
 


