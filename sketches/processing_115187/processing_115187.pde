
import ddf.minim.*;
int a;
int b;
int c;
int d;
int e;
int f;
int g;
int h;
int i;


Minim minim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
AudioPlayer player9;

void setup(){
  
size(400,400);
background(0);
minim = new Minim(this);
   player1 = minim.loadFile("0386.mp3");
    player2 = minim.loadFile("0628.mp3");
     player3 = minim.loadFile("0648.mp3");
      player4 = minim.loadFile("0723.mp3");
 player5 = minim.loadFile("0725.mp3");
 player6 = minim.loadFile("0735.mp3");
 player7 = minim.loadFile("0738.mp3"); 
  player8 = minim.loadFile("0739.mp3");
 player9 = minim.loadFile("0453.mp3"); 
 
a= color(#AFAEAD);
b = color(#AFAEAD);
c  = color(#AFAEAD);
d = color(#AFAEAD);
e = color(#AFAEAD);
f = color(#AFAEAD);
g = color(#AFAEAD);
h = color(#AFAEAD);
i  = color(#AFAEAD);
} 



void draw(){
  
 
  rectMode(CENTER);
  
 
fill(a);
     rect(100,100,75,75);
fill(b);
     rect(200,100,75,75);
fill(c);
     rect(300,100,75,75);
fill(d);
     rect(100,200,75,75);
fill(e);
     rect(200,200,75,75);
fill(f);
     rect(300,200,75,75);
fill(g);
     rect(100,300,75,75);
fill(h);
     rect(200,300,75,75);
fill(i);
     rect(300,300,75,75);
      
if(mousePressed == true){
    if(mouseX < 175 && mouseX > 25 && mouseY < 175 && mouseY> 25){
      
        a = color(#0749F7);
   rect(100,100,75,75);
   b = color(#AFAEAD);
c  = color(#AFAEAD);
d = color(#AFAEAD);
e = color(#AFAEAD);
f = color(#AFAEAD);
g = color(#AFAEAD);
h = color(#AFAEAD);
i  = color(#AFAEAD);
       
                  player1.play();
                
    }
  
else if(mouseX < 275 && mouseX > 125 && mouseY < 175 && mouseY> 25){
       b = color(#0749F7);
   a = color(#AFAEAD);
     c= color(#AFAEAD);
     d = color(#AFAEAD);
e = color(#AFAEAD);
f = color(#AFAEAD);
g = color(#AFAEAD);
h = color(#AFAEAD);
i  = color(#AFAEAD);
       
                  player2.play();
                
    }
    
    else if(mouseX < 375 && mouseX > 225 && mouseY < 175 && mouseY> 25){
       c = color(#0749F7);
   a = color(#AFAEAD);
     b= color(#AFAEAD);
     d = color(#AFAEAD);
e = color(#AFAEAD);
f = color(#AFAEAD);
g = color(#AFAEAD);
h = color(#AFAEAD);
i  = color(#AFAEAD);
       
                  player3.play();
                  
    }
    
    else if(mouseX < 175 && mouseX > 25 && mouseY < 275 && mouseY> 125){
       d = color(#0749F7);
   a = color(#AFAEAD);
     c= color(#AFAEAD);
     e = color(#AFAEAD);
b = color(#AFAEAD);
f = color(#AFAEAD);
g = color(#AFAEAD);
h = color(#AFAEAD);
i  = color(#AFAEAD);
       
                  player4.play();
    }
                  
                  else if(mouseX < 275 && mouseX > 125 && mouseY < 275 && mouseY> 125){
       e = color(#0749F7);
   a = color(#AFAEAD);
     c= color(#AFAEAD);
     d = color(#AFAEAD);
b = color(#AFAEAD);
f = color(#AFAEAD);
g = color(#AFAEAD);
h = color(#AFAEAD);
i  = color(#AFAEAD);
       
                  player5.play();
                
                
    }
    
     else if(mouseX < 375 && mouseX > 225 && mouseY < 275 && mouseY> 125){
       f = color(#0749F7);
   a = color(#AFAEAD);
     b= color(#AFAEAD);
     d = color(#AFAEAD);
e = color(#AFAEAD);
c = color(#AFAEAD);
g = color(#AFAEAD);
h = color(#AFAEAD);
i  = color(#AFAEAD);
       
                  player6.play();
                
    }
    
      else if(mouseX < 175 && mouseX > 25 && mouseY < 275 && mouseY> 325){
       g = color(#0749F7);
   a = color(#AFAEAD);
     b= color(#AFAEAD);
     d = color(#AFAEAD);
e = color(#AFAEAD);
f = color(#AFAEAD);
i = color(#AFAEAD);
h = color(#AFAEAD);
c  = color(#AFAEAD);
       
                  player7.play();
                
    }
    
      else if(mouseX < 275 && mouseX > 125 && mouseY < 275 && mouseY> 325){
       h = color(#0749F7);
   a = color(#AFAEAD);
     b= color(#AFAEAD);
     d = color(#AFAEAD);
e = color(#AFAEAD);
f = color(#AFAEAD);
g = color(#AFAEAD);
i = color(#AFAEAD);
c  = color(#AFAEAD);
       
                  player8.play();
                
    }
    
     else if(mouseX < 375 && mouseX > 225 && mouseY < 275 && mouseY> 325){
       i = color(#0749F7);
   a = color(#AFAEAD);
     b= color(#AFAEAD);
     d = color(#AFAEAD);
e = color(#AFAEAD);
f = color(#AFAEAD);
g = color(#AFAEAD);
h = color(#AFAEAD);
c  = color(#AFAEAD);
       
                  player9.play();
                
    }
}
}


