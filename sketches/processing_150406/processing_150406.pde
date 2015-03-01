

//original line and chimney - Alex Pantuck
//Animation with smoke and stuff - Ysidro
// Interaction click on the pipe - David
//Sound, factory - August
//Finale - Ben F
// BTW - Move your mouse over the pipe and make noise, see what happens
boolean go;
float pollution = 255;
import ddf.minim.*;
PImage fog;

Minim minim;
Minim minim5;
AudioPlayer player;
AudioPlayer player2;
AudioInput in;

Smoke[] smog= new Smoke[50];

void setup() {


  size(600, 400);
  for (int i=0; i<smog.length; i++) {
    smog[i] = new Smoke();
    minim5 = new Minim(this);
    in = minim5.getLineIn();
  }

}

void draw() {
drawInputFeed();
checkInput();
  background(pollution);



  //player = minim.loadFile("Factory.mp3");

 // player2 = minim.loadFile("Woosh.wav");

 // player.play();

 
  //if (mouseX<=125&&mouseY>=100&&mouseX>=75&&mouseY<=200) {
 
      
      if (go == true) {

        for (int i=0; i<smog.length; i++) {
         smog[i].move();
        smog[i].display();

          
          
        
          
          if(smog[i].y < 0){
          go = false;
         
          
          }
        
      }
    }
 
  

//}
  factory(); //build factory and road
 // println(mouseX+", "+mouseY);
      if( pollution <= 0) {
        PImage fog = loadImage("fog.jpg");


    background(fog);
  
 tint(255,127); 
  image(fog,0,0);
      }
}
void checkInput() {

 
 in = minim5.getLineIn();


}
void drawInputFeed() {
 for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    float leftIn = in.left.get(i)*50;
    float rightIn = in.right.get(i)*50;

   // line( i, 50 + leftIn, i+1, 50 + in.left.get(i+1)*50 );
   // line( i, 150 + rightIn, i+1, 150 + in.right.get(i+1)*50 );
     if ( leftIn > 20) {
   pollution = pollution - 1;
   go = true;
     }
  }
}
void factory() {
  fill(0);
  stroke(0);
  rect(0, 300, width, height);//road
  stroke(255);
  fill(#D8770F);//brick color
  rect(50, 200, 500, 110);//factory
  for (int i=50; i<575; i++) {//"bricks"
    if (i%25==0) {
      line(i, 205, i, 310);//makes the vertical lines
    }
    if (i%10==0 && i>199 && i<311) {//horozontal lines
      line(50, i, 550, i);
    }
  }
  noStroke();
  rect(75, 100, 50, 100);//chimney
  stroke(255);
  for (int i=0; i<5; i++) {
    triangle(125+(i*80), 150, 125+(i*80), 200, 200+(i*80), 200);
  }
}

class Smoke {
  float x;
  float y;

  Smoke() {
    x=100;
    y=150;
  }

  void move() {
    if (y<75) {
      x+=random(-5, 5);
    }
    y-=random(5);
    if (y<= -50) {
      x=100;
      y=150;
    }
  }

  void display() {
    noStroke();
    fill(#504C49, 150+int(random(-10, 50)));
    ellipse(x, y, 50, 50);
  }
}



