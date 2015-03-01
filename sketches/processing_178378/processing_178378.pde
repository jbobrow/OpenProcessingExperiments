
// Project 3 (Final Project)
// An Interactive Sketch
// Welcome to my Artistic Universe
// In this final project, I will be adapting on my work from assignment 3 in exploring images in processing.
// This is an interactive created Indian Rangoli which involves the use of mouse and keyboard input. 
// The objective is to keep you calm while listening to music in the backgroud.
// Disover several patterns as you press on different places on screen.
// Together we can bring peace to the world. 
/*
Presenting an Indian Rangoli: a folk art in which patterns are created
on the floor in living rooms. Usually made during Indian festivals.
My Christmas present to you. :) 
*/
//Usage guide:
/*
Click the Mouse to Load an image
Continuously clicking the mouse changes the color 
of a circular object by the Rangoli.
Press t: To load a text.
Press d: To display an interactive Rangoli
Continously pressing d changes the Rangoli's color.
Press p: To play an audio music for your enjoyment! :)
*/


//Import Minim Library files
import ddf.minim.*;

Minim minim;
//AudioPlayer happiness;
AudioSample happiness;


//Declare a PImage variable type
PImage rangoli;
PImage frontPage;

//Troutman colors
color[] parlette = {#206D7C,#04558D,#02628C,#057289, #34D0EA};
//Circle colors of Life
color[] circleStroke = {#631074,#332165,#616F15,#C8E510};
color[] circleFill = {#30C61A,#02753C,#04A639};
float iteration = 100;
float xBallon = 21;
float yBallon = 21;
PFont f;   // declaring PFont variable
String headline = "Welcome to my Artistic Universe";
String body = "Awesome! :)";
int xHeadline = 585; //horizontal location of the text
int yHeadline = 50; 

/*
MOUSE
Each mouse click changes the color

KEYS
del, backspace : erase
t : display text
d : display image
s : save png

*/

//Load Image and Sound file from HDD
void setup(){
  size(800,600);
  rangoli = loadImage("rangoli.jpg");
  frontPage = loadImage("frontPage.jpg");
  minim = new Minim(this);
  //happiness = minim.loadFile("Happiness.mp3");
  happiness = minim.loadSample("Happiness.mp3");
  //happiness.play();
  
  colorMode(HSB, 360, 100, 100, 100);
  //noFill();
  //background(360); // Blank canvas until user input received
  image(frontPage,0,0);
  f = createFont("Arial",15,true); 
}

void draw(){
  //image(rangoli,0,0);
  if(mousePressed){
    //rangoli();  // Expression of beauty method :)
    image(rangoli,0,0);
    stroke(mouseX, mouseY, 50);
    fill(mouseY,mouseY, 75);
    ellipse(680,300,100,100);      
  }
  
  
}

void mouseReleased(){
  //background(random(width),random(height), random(100));
}

void keyReleased(){
  if(key == DELETE || key == BACKSPACE) background(360);
}

void keyPressed(){
  
  if(key=='p' || key=='P'){
    happiness.trigger();
    println("Sample triggered!");
  }
  
  //Saving sketch to data folder
  if(key=='s' || key=='S'){
    saveFrame("screetshot.png");
  }
  if(key=='d' || key=='D'){
    rangoli();
  }
  if(key=='t' || key=='T'){
    textFont(f,15);
    fill(mouseY,mouseY, 75);
    text(headline, xHeadline,21);
    text(body, xHeadline+100,yHeadline);
    
    if(yHeadline < height){
      yHeadline+=50;
    }
  }
}

void rangoli(){
  pushMatrix();
  translate(0,0);  // Origin
 //ellipse
  stroke(circleStroke[int(random(1,3))]);
  strokeWeight(3);
  fill(circleFill[int(random(1,3))]);
  for(int x = 150; x < width-200; x += 300){
    for(int y = 150; y < height; y += 300){
      ellipse(x,y,270,270);
      if(y == 450){
        ellipse(300,450,270,270);
      }
    }    
  }   
  for(int x = 180; x < width-200; x += 240){
    for(int y = 180; y < height; y += 240){
      ellipse(x,y,240,240);

    }    
  }    
  //rectangle
  stroke(#0D0202);
  strokeWeight(random(1,6));
  fill(#FFFFFF);
  
  for(int x=21; x < width-200; x += 453){
    for(int y = 21; y < height; y += 453){
      rect(x,y,105,105);
    }    
  }
  
  for(int x=33; x < width-200; x += 453){
    for(int y = 33; y < height; y += 453){
      rect(x,y,81,81);
    }    
  }
  
  for(int x=45; x < width-200; x += 453){
    for(int y = 45; y < height; y += 453){
      rect(x,y,57,57);
    }    
  }
  
  for(int x=57; x < width-200; x += 453){
    for(int y = 57; y < height; y += 453){
      rect(x,y,33,33);
    }    
  }
    
  //Ballon
  while(iteration > 0){
    xBallon = random(width);
    yBallon = random(height);
    float dBallon = random(40);
    ellipse(xBallon,yBallon,dBallon,dBallon);
    iteration--;
  }
  
  
  //ellipse dot in the square of life
  stroke(#A51414);  
  fill(parlette[int(random(1,4))]);
  //fill(#A51414);
  for(int x=72; x < width-200; x += 453){
    for(int y = 72; y < height; y += 453){
      ellipse(x,y,6,6);
    }    
  }
  
  
  stroke(#FEFF36);
  fill(#AF0909);  // The red truth
  ellipse(300,450,270,270);
  ellipse(300,420,240,240);
  ellipse(300,150,270,270);
  ellipse(300,180,240,240);
   
  ellipse(150,300,270,270);
  ellipse(180,300,240,240);
  ellipse(450,300,270,270);
  ellipse(420,300,240,240); 
  
  
  stroke(#0C3062);
  strokeWeight(3);
  //fill(#34D0EA);  
  fill(parlette[int(random(1,5))]);
  ellipse(300,300,420,162); //The heart of the world in blue
  ellipse(300,300,162,420);
  
  fill(#0D9AB2);
  ellipse(300,300,360,102);
  ellipse(300,300,102,360);
  
  
  fill(#075562);
  ellipse(300,300,51,300);
  ellipse(300,300,300,51);
  
  
  stroke(#631074);
  fill(#30C61A);
  ellipse(300,300,180,180);
  ellipse(300,300,150,150);
  ellipse(300,300,120,120);
  ellipse(300,300,99,99);
  ellipse(300,300,84,84);
  ellipse(300,300,66,66);
  ellipse(300,300,48,48);
  ellipse(300,300,30,30);
  ellipse(300,300,12,12);
  
  //line
  stroke(#C8E510);
  
  line(210,300,390,300);
  line(300,210,300,390);
  
  //stroke(#C8E510);  The rays of the cross
  stroke(circleStroke[int(random(1,4))]);
  fill(circleFill[int(random(1,3))]); //fill(#30C61A);
  line(237,237,363,363);
  line(237,363,363,237);
  
  line(216,264,381,336);
  line(219,336,381,264);
  
  line(264,381,336,219);
  line(264,216,336,384);
  
  //point
  stroke(#0C5A67);
  fill(#30C61A);
  strokeWeight(30);
  point(126,126);
  point(474,126);
  point(474,474);
  point(126,474);
  
  stroke(#42CAE0);
  strokeWeight(24);
  point(120,120);
  point(480,120);
  point(480,480);
  point(120,480); 
  popMatrix();
}

