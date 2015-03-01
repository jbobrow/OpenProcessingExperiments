
/*This processing script brings the
clash to the favorite comic character with image and sound
*/
//Importing the required sound library
import ddf.minim.*;
float transparency = 0;
int i =second();

//Global variables
color strokeColor = color(0);
int x;
PImage superman;
PImage batman;
Minim minim;
AudioSnippet sman;
AudioSnippet bman;

//setup
void setup(){
  size(900,600);
  colorMode(RGB, 360, 360, 360);
  noFill();
  background(0);
  frameRate(10);
  minim = new Minim(this);
  //Load the music files
  sman = minim.loadSnippet("Superman.mp3");
  bman = minim.loadSnippet("batman.mp3");
  int ycor=10;
  PFont myFont;
  myFont = createFont("Georgia", 20);
  textFont(myFont);
  textAlign(LEFT, CENTER);
  text("Who is your favorite superhero ?", 100, ycor);
  myFont = createFont("Georgia", 15);
  textFont(myFont);
  //Load the page with options
  text("Superman :Press 'a'", 100, ycor+20);
  text("Batman :Press 'b'", 100, ycor+40);
  text("Go back :Press 'backspace'", 100, ycor+60);
  text("Exit :Press 'delete'", 100, ycor+80);

  //Assign the variables with the picture files

  superman = loadImage("SUPERMAN.png");
  batman = loadImage("BATMAN.png");
  draw();

}

//Draw
void draw(){

if ( x == 1)
  {
    superman_pic();
    //The modulo function % is used to alternate between image and symbol
    if((second()-i)%2==0) {
    background(255);
    if (transparency < 255 ){ transparency+=5;}
    tint(255,transparency);
    image(superman,0,0);
    sman.play();
    }
 }
  
  if ( x == 2)
  {    
    batman_pic();
    if((second()-i)%2==0) {
     background(255);
    if (transparency < 255 ){ transparency+=5;}
    tint(255,transparency);
    image(batman,0,0);
    bman.play();
    }
  }
  

  
  
}

void keyReleased(){

  sman.pause();
  bman.pause();
  transparency=0;
 switch(key){

    case BACKSPACE:
    {
      x=100;
    setup();
     break;
    }
     

     
     case DELETE:
     exit();
     break;
     
     case 'a':
     {
  background(360);
     x=1;
     break;
     }
     case 'b':
     {
      background(360);
       x=2;
     break;
     }

 }
 }

//This function creates the symbol for superman
void superman_pic()
{
  noFill();
  background(0);
  stroke(0);
  int x = width/2;
  int y = height/2;
  strokeWeight(2);
  fill(#ff0000);
  beginShape();
  vertex(x-100,y-100);
  vertex(x+100, y-100);
  vertex(x+150, y-50);
  vertex(x, y+100);
  vertex(x-150, y-50);
  endShape(CLOSE);
  fill(#ffff00);
  beginShape();
  vertex(x-100,y-95);
  vertex(x+100, y-95);
  vertex(x+145, y-50);
  vertex(x, y+95);
  vertex(x-145, y-50);
  endShape(CLOSE);
  PFont myFont;
  myFont = createFont("Georgia", 200);
  textFont(myFont);
  fill(#ff0000);
  text("S", x-50, y-40);
  }
  
 //This function creates the batman symbol
  void batman_pic()
  {
  noFill();
  background(0);
  stroke(0);
  int x = width/2;
  int y = height/2;
  strokeWeight(2);
  fill(#ff0000);
  //batman - background
fill(#ffda21);
//ellipse(500,200,1000,400);
ellipse(x,y,x-100,y-100);
//batman - symbol
beginShape();
noStroke();
fill(#0A0A0A);
vertex(x,y-40);
vertex(x-25,y-40);
vertex(x-50,y-100);
vertex(x-50,y+50);
vertex(x,y+100);
//vertex(500,50);
endShape();

beginShape();
noStroke();
fill(#0A0A0A);
vertex(x,y-40);
vertex(x+25,y-40);
vertex(x+50,y-100);
vertex(x+50,y+50);
vertex(x,y+100);
//vertex(500,50);
endShape();
arc(x,y-40,60,20,2.95,6.28);
rect(x-120,y-40,240,90);
arc(x-120,y,100,120,1.57,4.71);
arc(x+120,y,100,120,-1.57,1.57);

// 
fill(#ffda21);
noStroke();
arc(x-93,y-40,250/3,110/3,0,3.92);
arc(x+93,y-40,250/3,110/3,-0.78,3.14);

arc(x-102,y+50,110/3,180/3,3.14,6.30);
arc(x+102,y+50,110/3,180/3,3.14,6.30);

arc(x-70,y+50,110/3,160/3,3.14,6.30);
arc(x+70,y+50,110/3,160/3,3.14,6.30);


}

