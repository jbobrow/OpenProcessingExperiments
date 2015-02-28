
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
 private int count;
 
Minim m;
//3
AudioPlayer acoustic;
AudioPlayer e3a;
AudioPlayer e3b;
AudioPlayer e3c;
AudioPlayer e3d;
AudioPlayer e3e;
AudioPlayer e3f;
AudioPlayer f3a;
AudioPlayer f3b;
AudioPlayer f3c;
AudioPlayer f3d;
AudioPlayer f3e;
AudioPlayer f3f;
AudioPlayer g3a;
AudioPlayer g3b;
AudioPlayer g3c;
AudioPlayer g3d;
AudioPlayer g3e;
AudioPlayer g3f;
AudioPlayer a3a;
AudioPlayer a3b;
AudioPlayer a3c;
AudioPlayer a3d;
AudioPlayer a3e;
AudioPlayer a3f;
AudioPlayer b3a;
AudioPlayer b3b;
AudioPlayer b3c;
AudioPlayer b3d;
AudioPlayer b3e;
AudioPlayer b3f;
AudioPlayer c3a;
AudioPlayer c3b;
AudioPlayer c3c;
AudioPlayer c3d;
AudioPlayer c3e;
AudioPlayer c3f;
AudioPlayer d3a;
AudioPlayer d3b;
AudioPlayer d3c;
AudioPlayer d3d;
AudioPlayer d3e;
AudioPlayer d3f;
 
//4
AudioPlayer e4a;
AudioPlayer e4b;
AudioPlayer e4c;
AudioPlayer e4d;
AudioPlayer e4e;
AudioPlayer e4f;
AudioPlayer f4a;
AudioPlayer f4b;
AudioPlayer f4c;
AudioPlayer f4d;
AudioPlayer f4e;
AudioPlayer f4f;
AudioPlayer g4a;
AudioPlayer g4b;
AudioPlayer g4c;
AudioPlayer g4d;
AudioPlayer g4e;
AudioPlayer g4f;
AudioPlayer a4a;
AudioPlayer a4b;
AudioPlayer a4c;
AudioPlayer a4d;
AudioPlayer a4e;
AudioPlayer a4f;
AudioPlayer b4a;
AudioPlayer b4b;
AudioPlayer b4c;
AudioPlayer b4d;
AudioPlayer b4e;
AudioPlayer b4f;
AudioPlayer c4a;
AudioPlayer c4b;
AudioPlayer c4c;
AudioPlayer c4d;
AudioPlayer c4e;
AudioPlayer c4f;
AudioPlayer d4a;
AudioPlayer d4b;
AudioPlayer d4c;
AudioPlayer d4d;
AudioPlayer d4e;
AudioPlayer d4f;
 
//5
AudioPlayer e5a;
AudioPlayer e5b;
AudioPlayer e5c;
AudioPlayer e5d;
AudioPlayer e5e;
AudioPlayer e5f;
AudioPlayer f5a;
AudioPlayer f5b;
AudioPlayer f5c;
AudioPlayer f5d;
AudioPlayer f5e;
AudioPlayer f5f;
AudioPlayer g5a;
AudioPlayer g5b;
AudioPlayer g5c;
AudioPlayer g5d;
AudioPlayer g5e;
AudioPlayer g5f;
AudioPlayer a5a;
AudioPlayer a5b;
AudioPlayer a5c;
AudioPlayer a5d;
AudioPlayer a5e;
AudioPlayer a5f;
AudioPlayer b5a;
AudioPlayer b5b;
AudioPlayer b5c;
AudioPlayer b5d;
AudioPlayer b5e;
AudioPlayer b5f;
AudioPlayer c5a;
AudioPlayer c5b;
AudioPlayer c5c;
AudioPlayer c5d;
AudioPlayer c5e;
AudioPlayer c5f;
AudioPlayer d5a;
AudioPlayer d5b;
AudioPlayer d5c;
AudioPlayer d5d;
AudioPlayer d5e;
AudioPlayer d5f;
 
//6
AudioPlayer e6a;
AudioPlayer e6b;
AudioPlayer e6c;
AudioPlayer e6d;
AudioPlayer e6e;
AudioPlayer e6f;
AudioPlayer f6a;
AudioPlayer f6b;
AudioPlayer f6c;
AudioPlayer f6d;
AudioPlayer f6e;
AudioPlayer f6f;
AudioPlayer g6a;
AudioPlayer g6b;
AudioPlayer g6c;
AudioPlayer g6d;
AudioPlayer g6e;
AudioPlayer g6f;
AudioPlayer a6a;
AudioPlayer a6b;
AudioPlayer a6c;
AudioPlayer a6d;
AudioPlayer a6e;
AudioPlayer a6f;
AudioPlayer b6a;
AudioPlayer b6b;
AudioPlayer b6c;
AudioPlayer b6d;
AudioPlayer b6e;
AudioPlayer b6f;
AudioPlayer c6a;
AudioPlayer c6b;
AudioPlayer c6c;
AudioPlayer c6d;
AudioPlayer c6e;
AudioPlayer c6f;
AudioPlayer d6a;
AudioPlayer d6b;
AudioPlayer d6c;
AudioPlayer d6d;
AudioPlayer d6e;
AudioPlayer d6f;
 
//7
AudioPlayer e7a;
AudioPlayer e7b;
AudioPlayer e7c;
AudioPlayer e7d;
AudioPlayer e7e;
AudioPlayer e7f;
AudioPlayer f7a;
AudioPlayer f7b;
AudioPlayer f7c;
AudioPlayer f7d;
AudioPlayer f7e;
AudioPlayer f7f;
AudioPlayer g7a;
AudioPlayer g7b;
AudioPlayer g7c;
AudioPlayer g7d;
AudioPlayer g7e;
AudioPlayer g7f;
 
 
 
//boolean zone1 = false;
 
 
PImage bg;
PImage bg2;
PImage bg3;
PImage bg4;
PImage bg5;
PImage bg6;
PImage bg7;
int a;
 
 
 
void setup()
{
  size(725,560);
  bg = loadImage("background.jpg");
  bg2 = loadImage("background2.jpg");
  bg3 = loadImage("background3.jpg");
  bg4 = loadImage("background4.jpg");
  bg5 = loadImage("background5.jpg");
  bg6 = loadImage("background6.jpg");
  bg7 = loadImage("background7.jpg");
    background(bg);
  
m= new Minim(this);
 
//3
e3a= m.loadFile("e3a.wav");
e3b= m.loadFile("e3b.wav");
e3c= m.loadFile("e3c.wav");
e3d= m.loadFile("e3d.wav");
e3e= m.loadFile("e3e.wav");
e3f= m.loadFile("e3f.wav");
 
f3a= m.loadFile("f3a.wav");
f3b= m.loadFile("f3b.wav");
f3c= m.loadFile("f3c.wav");
f3d= m.loadFile("f3d.wav");
f3e= m.loadFile("f3e.wav");
f3f= m.loadFile("f3f.wav");
 
g3a= m.loadFile("g3a.wav");
g3b= m.loadFile("g3b.wav");
g3c= m.loadFile("g3c.wav");
g3d= m.loadFile("g3d.wav");
g3e= m.loadFile("g3e.wav");
g3f= m.loadFile("g3f.wav");
 
a3a= m.loadFile("a3a.wav");
a3b= m.loadFile("a3b.wav");
a3c= m.loadFile("a3c.wav");
a3d= m.loadFile("a3d.wav");
a3e= m.loadFile("a3e.wav");
a3f= m.loadFile("a3f.wav");
 
 
 
b3a= m.loadFile("b3a.wav");
b3b= m.loadFile("b3b.wav");
b3c= m.loadFile("b3c.wav");
b3d= m.loadFile("b3d.wav");
b3e= m.loadFile("b3e.wav");
b3f= m.loadFile("b3f.wav");
 
c3a= m.loadFile("c3a.wav");
c3b= m.loadFile("c3b.wav");
c3c= m.loadFile("c3c.wav");
c3d= m.loadFile("c3d.wav");
c3e= m.loadFile("c3e.wav");
c3f= m.loadFile("c3f.wav");
 
d3a= m.loadFile("d3a.wav");
d3b= m.loadFile("d3b.wav");
d3c= m.loadFile("d3c.wav");
d3d= m.loadFile("d3d.wav");
d3e= m.loadFile("d3e.wav");
d3f= m.loadFile("d3f.wav");
 
//4
e4a= m.loadFile("e4a.wav");
e4b= m.loadFile("e4b.wav");
e4c= m.loadFile("e4c.wav");
e4d= m.loadFile("e4d.wav");
e4e= m.loadFile("e4e.wav");
e4f= m.loadFile("e4f.wav");
 
f4a= m.loadFile("f4a.wav");
f4b= m.loadFile("f4b.wav");
f4c= m.loadFile("f4c.wav");
f4d= m.loadFile("f4d.wav");
f4e= m.loadFile("f4e.wav");
f4f= m.loadFile("f4f.wav");
 
g4a= m.loadFile("g4a.wav");
g4b= m.loadFile("g4b.wav");
g4c= m.loadFile("g4c.wav");
g4d= m.loadFile("g4d.wav");
g4e= m.loadFile("g4e.wav");
g4f= m.loadFile("g4f.wav");
 
a4a= m.loadFile("a4a.wav");
a4b= m.loadFile("a4b.wav");
a4c= m.loadFile("a4c.wav");
a4d= m.loadFile("a4d.wav");
a4e= m.loadFile("a4e.wav");
a4f= m.loadFile("a4f.wav");
 
 
 
b4a= m.loadFile("b4a.wav");
b4b= m.loadFile("b4b.wav");
b4c= m.loadFile("b4c.wav");
b4d= m.loadFile("b4d.wav");
b4e= m.loadFile("b4e.wav");
b4f= m.loadFile("b4f.wav");
 
c4a= m.loadFile("c4a.wav");
c4b= m.loadFile("c4b.wav");
c4c= m.loadFile("c4c.wav");
c4d= m.loadFile("c4d.wav");
c4e= m.loadFile("c4e.wav");
c4f= m.loadFile("c4f.wav");
 
d4a= m.loadFile("d4a.wav");
d4b= m.loadFile("d4b.wav");
d4c= m.loadFile("d4c.wav");
d4d= m.loadFile("d4d.wav");
d4e= m.loadFile("d4e.wav");
d4f= m.loadFile("d4f.wav");
 
//5
e5a= m.loadFile("e5a.wav");
e5b= m.loadFile("e5b.wav");
e5c= m.loadFile("e5c.wav");
e5d= m.loadFile("e5d.wav");
e5e= m.loadFile("e5e.wav");
e5f= m.loadFile("e5f.wav");
 
f5a= m.loadFile("f5a.wav");
f5b= m.loadFile("f5b.wav");
f5c= m.loadFile("f5c.wav");
f5d= m.loadFile("f5d.wav");
f5e= m.loadFile("f5e.wav");
f5f= m.loadFile("f5f.wav");
 
g5a= m.loadFile("g5a.wav");
g5b= m.loadFile("g5b.wav");
g5c= m.loadFile("g5c.wav");
g5d= m.loadFile("g5d.wav");
g5e= m.loadFile("g5e.wav");
g5f= m.loadFile("g5f.wav");
 
a5a= m.loadFile("a5a.wav");
a5b= m.loadFile("a5b.wav");
a5c= m.loadFile("a5c.wav");
a5d= m.loadFile("a5d.wav");
a5e= m.loadFile("a5e.wav");
a5f= m.loadFile("a5f.wav");
 
 
 
b5a= m.loadFile("b5a.wav");
b5b= m.loadFile("b5b.wav");
b5c= m.loadFile("b5c.wav");
b5d= m.loadFile("b5d.wav");
b5e= m.loadFile("b5e.wav");
b5f= m.loadFile("b5f.wav");
 
c5a= m.loadFile("c5a.wav");
c5b= m.loadFile("c5b.wav");
c5c= m.loadFile("c5c.wav");
c5d= m.loadFile("c5d.wav");
c5e= m.loadFile("c5e.wav");
c5f= m.loadFile("c5f.wav");
 
d5a= m.loadFile("d5a.wav");
d5b= m.loadFile("d5b.wav");
d5c= m.loadFile("d5c.wav");
d5d= m.loadFile("d5d.wav");
d5e= m.loadFile("d5e.wav");
d5f= m.loadFile("d5f.wav");
 
//6
e6a= m.loadFile("e6a.wav");
e6b= m.loadFile("e6b.wav");
e6c= m.loadFile("e6c.wav");
e6d= m.loadFile("e6d.wav");
e6e= m.loadFile("e6e.wav");
e6f= m.loadFile("e6f.wav");
 
f6a= m.loadFile("f6a.wav");
f6b= m.loadFile("f6b.wav");
f6c= m.loadFile("f6c.wav");
f6d= m.loadFile("f6d.wav");
f6e= m.loadFile("f6e.wav");
f6f= m.loadFile("f6f.wav");
 
g6a= m.loadFile("g6a.wav");
g6b= m.loadFile("g6b.wav");
g6c= m.loadFile("g6c.wav");
g6d= m.loadFile("g6d.wav");
g6e= m.loadFile("g6e.wav");
g6f= m.loadFile("g6f.wav");
 
a6a= m.loadFile("a6a.wav");
a6b= m.loadFile("a6b.wav");
a6c= m.loadFile("a6c.wav");
a6d= m.loadFile("a6d.wav");
a6e= m.loadFile("a6e.wav");
a6f= m.loadFile("a6f.wav");
 
 
 
b6a= m.loadFile("b6a.wav");
b6b= m.loadFile("b6b.wav");
b6c= m.loadFile("b6c.wav");
b6d= m.loadFile("b6d.wav");
b6e= m.loadFile("b6e.wav");
b6f= m.loadFile("b6f.wav");
 
c6a= m.loadFile("c6a.wav");
c6b= m.loadFile("c6b.wav");
c6c= m.loadFile("c6c.wav");
c6d= m.loadFile("c6d.wav");
c6e= m.loadFile("c6e.wav");
c6f= m.loadFile("c6f.wav");
 
d6a= m.loadFile("d6a.wav");
d6b= m.loadFile("d6b.wav");
d6c= m.loadFile("d6c.wav");
d6d= m.loadFile("d6d.wav");
d6e= m.loadFile("d6e.wav");
d6f= m.loadFile("d6f.wav");
 
//7
e7a= m.loadFile("e7a.wav");
e7b= m.loadFile("e7b.wav");
e7c= m.loadFile("e7c.wav");
e7d= m.loadFile("e7d.wav");
e7e= m.loadFile("e7e.wav");
e7f= m.loadFile("e7f.wav");
 
f7a= m.loadFile("f7a.wav");
f7b= m.loadFile("f7b.wav");
f7c= m.loadFile("f7c.wav");
f7d= m.loadFile("f7d.wav");
f7e= m.loadFile("f7e.wav");
f7f= m.loadFile("f7f.wav");
 
g7a= m.loadFile("g7a.wav");
g7b= m.loadFile("g7b.wav");
g7c= m.loadFile("g7c.wav");
g7d= m.loadFile("g7d.wav");
g7e= m.loadFile("g7e.wav");
g7f= m.loadFile("g7f.wav");

acoustic= m.loadFile("acoustic.wav");
 
 
//noLoop();
 
}
 
void draw()
{
 
  
  //                //
 //   Backgrounds  //
//                //
if (mouseY >= 1 && mouseY <=80 && mouseX >= 1 && mouseX <=725){
  background(bg2);
}
  if (mouseY >= 81 && mouseY <=160 && mouseX >= 1 && mouseX <=725){
  background(bg3);
  }
  if (mouseY >= 161 && mouseY <=240 && mouseX >= 1 && mouseX <=725){
  background(bg4);
  }
  if (mouseY >= 241 && mouseY <=320 && mouseX >= 1 && mouseX <=725){
  background(bg5);
  }
  if (mouseY >= 321 && mouseY <=400 && mouseX >= 1 && mouseX <=725){
  background(bg6);
  }
  if (mouseY >= 401 && mouseY <=480 && mouseX >= 1 && mouseX <=725){
  background(bg7);
}
 
//          //
//   E3    //
//          //

 
//e3f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 1 && mouseX <=25 && !e3f.isPlaying()){
  e3f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 1 && mouseX <=25) && e3f.isPlaying()){
  e3f.pause();
  }
 
 
//e3e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 1 && mouseX <=25 && !e3e.isPlaying()){
  e3e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 1 && mouseX <=25) && e3e.isPlaying()){
  e3e.pause();
  }
 
 
//e3d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 1 && mouseX <=25 && !e3d.isPlaying()){
  e3d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 1 && mouseX <=25) && e3d.isPlaying()){
  e3d.pause();
  }

 
//e3c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 1 && mouseX <=25 && !e3c.isPlaying()){
  e3c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 1 && mouseX <=25) && e3c.isPlaying()){
  e3c.pause();
  } 
 
//e3b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 1 && mouseX <=25 && !e3b.isPlaying()){
  e3b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 1 && mouseX <=25) && e3b.isPlaying()){
  e3b.pause();
  }
 
//e3a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 1 && mouseX <=25 && !e3a.isPlaying()){
  e3a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 1 && mouseX <=25) && e3a.isPlaying()){
  e3a.pause();
  }
 
 
 
//          //
//   f3    //
//          //
 
//f3f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 26 && mouseX <=50 && !f3f.isPlaying()){
  f3f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 26 && mouseX <=50) && f3f.isPlaying()){
  f3f.pause();
  }
 
 
//f3e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 26 && mouseX <=50 && !f3e.isPlaying()){
  f3e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 26&& mouseX <=50) && f3e.isPlaying()){
  f3e.pause();
  }
 
 
//f3d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 26 && mouseX <=50 && !f3d.isPlaying()){
  f3d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 26 && mouseX <=50) && f3d.isPlaying()){
  f3d.pause();
  }
 
 
//f3c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 26 && mouseX <=50 && !f3c.isPlaying()){
  f3c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 26 && mouseX <=50) && f3c.isPlaying()){
  f3c.pause();
  } 
 
//f3b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 26 && mouseX <=50 && !f3b.isPlaying()){
  f3b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 26 && mouseX <=50) && f3b.isPlaying()){
  f3b.pause();
  }
 
//f3a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 26 && mouseX <=50 && !f3a.isPlaying()){
  f3a.loop(0);
     
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 26 && mouseX <=50) && f3a.isPlaying()){
  f3a.pause();
  }
 
 
 
 


//          //
//   g3    //
//          //
 
//g3f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 51 && mouseX <=75 && !g3f.isPlaying()){
  g3f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 51 && mouseX <=75) && g3f.isPlaying()){
  g3f.pause();
  }
 
 
//g3e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 51 && mouseX <=75 && !g3e.isPlaying()){
  g3e.loop(0);     
  
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 51&& mouseX <=75) && g3e.isPlaying()){
  g3e.pause();
  }
 
 
//g3d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 51 && mouseX <=75 && !g3d.isPlaying()){
  g3d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 51 && mouseX <=75) && g3d.isPlaying()){
  g3d.pause();
  }
 
 
//g3c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 51 && mouseX <=75 && !g3c.isPlaying()){
  g3c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 51 && mouseX <=75) && g3c.isPlaying()){
  g3c.pause();
  } 
 
//g3b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 51 && mouseX <=75 && !g3b.isPlaying()){
  g3b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 51 && mouseX <=75) && g3b.isPlaying()){
  g3b.pause();
  }
 
//g3a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 51 && mouseX <=75 && !g3a.isPlaying()){
  g3a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 51 && mouseX <=75) && g3a.isPlaying()){
  g3a.pause();
  }
 
 
 
 


//          //
//   a3    //
//          //
 
//a3f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 76 && mouseX <=100 && !a3f.isPlaying()){
  a3f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 76 && mouseX <=100) && a3f.isPlaying()){
  a3f.pause();
  }
 
 
//a3e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 76 && mouseX <=100 && !a3e.isPlaying()){
  a3e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 76&& mouseX <=100) && a3e.isPlaying()){
  a3e.pause();
  }
 
 
//a3d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 76 && mouseX <=100 && !a3d.isPlaying()){
  a3d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 76 && mouseX <=100) && a3d.isPlaying()){
  a3d.pause();
  }
 
 
//a3c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 76 && mouseX <=100 && !a3c.isPlaying()){
  a3c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 76 && mouseX <=100) && a3c.isPlaying()){
  a3c.pause();
  } 
 
//a3b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 76 && mouseX <=100 && !a3b.isPlaying()){
  a3b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 76 && mouseX <=100) && a3b.isPlaying()){
  a3b.pause();
  }
 
//a3a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 76 && mouseX <=100 && !a3a.isPlaying()){
  a3a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 76 && mouseX <=100) && a3a.isPlaying()){
  a3a.pause();
  }
 
 
 
 


//          //
//   b3    //
//          //
 
//b3f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 101 && mouseX <=125 && !b3f.isPlaying()){
  b3f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 101 && mouseX <=125) && b3f.isPlaying()){
  b3f.pause();
  }
 
 
//b3e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 101 && mouseX <=125 && !b3e.isPlaying()){
  b3e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 101&& mouseX <=125) && b3e.isPlaying()){
  b3e.pause();
  }
 
 
//b3d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 101 && mouseX <=125 && !b3d.isPlaying()){
  b3d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 101 && mouseX <=125) && b3d.isPlaying()){
  b3d.pause();
  }
 
 
//b3c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 101 && mouseX <=125 && !b3c.isPlaying()){
  b3c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 101 && mouseX <=125) && b3c.isPlaying()){
  b3c.pause();
  } 
 
//b3b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 101 && mouseX <=125 && !b3b.isPlaying()){
  b3b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 101 && mouseX <=125) && b3b.isPlaying()){
  b3b.pause();
  }
 
//b3a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 101 && mouseX <=125 && !b3a.isPlaying()){
  b3a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 101 && mouseX <=125) && b3a.isPlaying()){
  b3a.pause();
  }
 
 
 
 


//          //
//   c3    //
//          //
 
//c3f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 126 && mouseX <=150 && !c3f.isPlaying()){
  c3f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 126 && mouseX <=150) && c3f.isPlaying()){
  c3f.pause();
  }
 
 
//c3e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 126 && mouseX <=150 && !c3e.isPlaying()){
  c3e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 126&& mouseX <=150) && c3e.isPlaying()){
  c3e.pause();
  }
 
 
//c3d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 126 && mouseX <=150 && !c3d.isPlaying()){
  c3d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 126 && mouseX <=150) && c3d.isPlaying()){
  c3d.pause();
  }
 
 
//c3c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 126 && mouseX <=150 && !c3c.isPlaying()){
  c3c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 126 && mouseX <=150) && c3c.isPlaying()){
  c3c.pause();
  } 
 
//c3b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 126 && mouseX <=150 && !c3b.isPlaying()){
  c3b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 126 && mouseX <=150) && c3b.isPlaying()){
  c3b.pause();
  }
 
//c3a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 126 && mouseX <=150 && !c3a.isPlaying()){
  c3a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 126 && mouseX <=150) && c3a.isPlaying()){
  c3a.pause();
  }
 
 
 
 


//          //
//   d3    //
//          //
 
//d3f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 151 && mouseX <=175 && !d3f.isPlaying()){
  d3f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 151 && mouseX <=175) && d3f.isPlaying()){
  d3f.pause();
  }
 
 
//d3e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 151 && mouseX <=175 && !d3e.isPlaying()){
  d3e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 151&& mouseX <=175) && d3e.isPlaying()){
  d3e.pause();
  }
 
 
//d3d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 151 && mouseX <=175 && !d3d.isPlaying()){
  d3d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 151 && mouseX <=175) && d3d.isPlaying()){
  d3d.pause();
  }
 
 
//d3c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 151 && mouseX <=175 && !d3c.isPlaying()){
  d3c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 151 && mouseX <=175) && d3c.isPlaying()){
  d3c.pause();
  } 
 
//d3b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 151 && mouseX <=175 && !d3b.isPlaying()){
  d3b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 151 && mouseX <=175) && d3b.isPlaying()){
  d3b.pause();
  }
 
//d3a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 151 && mouseX <=175 && !d3a.isPlaying()){
  d3a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 151 && mouseX <=175) && d3a.isPlaying()){
  d3a.pause();
  }
 
 
 
 


//          //
//   e4    //
//          //
 
//e4f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 176 && mouseX <=200 && !e4f.isPlaying()){
  e4f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 176 && mouseX <=200) && e4f.isPlaying()){
  e4f.pause();
  }
 
 
//e4e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 176 && mouseX <=200 && !e4e.isPlaying()){
  e4e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 176&& mouseX <=200) && e4e.isPlaying()){
  e4e.pause();
  }
 
 
//e4d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 176 && mouseX <=200 && !e4d.isPlaying()){
  e4d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 176 && mouseX <=200) && e4d.isPlaying()){
  e4d.pause();
  }
 
 
//e4c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 176 && mouseX <=200 && !e4c.isPlaying()){
  e4c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 176 && mouseX <=200) && e4c.isPlaying()){
  e4c.pause();
  } 
 
//e4b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 176 && mouseX <=200 && !e4b.isPlaying()){
  e4b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 176 && mouseX <=200) && e4b.isPlaying()){
  e4b.pause();
  }
 
//e4a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 176 && mouseX <=200 && !e4a.isPlaying()){
  e4a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 176 && mouseX <=200) && e4a.isPlaying()){
  e4a.pause();
  }
 
 
 
 


//          //
//   f4    //
//          //
 
//f4f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 201 && mouseX <=225 && !f4f.isPlaying()){
  f4f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 201 && mouseX <=225) && f4f.isPlaying()){
  f4f.pause();
  }
 
 
//f4e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 201 && mouseX <=225 && !f4e.isPlaying()){
  f4e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 201&& mouseX <=225) && f4e.isPlaying()){
  f4e.pause();
  }
 
 
//f4d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 201 && mouseX <=225 && !f4d.isPlaying()){
  f4d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 201 && mouseX <=225) && f4d.isPlaying()){
  f4d.pause();
  }
 
 
//f4c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 201 && mouseX <=225 && !f4c.isPlaying()){
  f4c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 201 && mouseX <=225) && f4c.isPlaying()){
  f4c.pause();
  } 
 
//f4b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 201 && mouseX <=225 && !f4b.isPlaying()){
  f4b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 201 && mouseX <=225) && f4b.isPlaying()){
  f4b.pause();
  }
 
//f4a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 201 && mouseX <=225 && !f4a.isPlaying()){
  f4a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 201 && mouseX <=225) && f4a.isPlaying()){
  f4a.pause();
  }
 
 
 
 


//          //
//   g4    //
//          //
 
//g4f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 226 && mouseX <=250 && !g4f.isPlaying()){
  g4f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 226 && mouseX <=250) && g4f.isPlaying()){
  g4f.pause();
  }
 
 
//g4e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 226 && mouseX <=250 && !g4e.isPlaying()){
  g4e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 226&& mouseX <=250) && g4e.isPlaying()){
  g4e.pause();
  }
 
 
//g4d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 226 && mouseX <=250 && !g4d.isPlaying()){
  g4d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 226 && mouseX <=250) && g4d.isPlaying()){
  g4d.pause();
  }
 
 
//g4c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 226 && mouseX <=250 && !g4c.isPlaying()){
  g4c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 226 && mouseX <=250) && g4c.isPlaying()){
  g4c.pause();
  } 
 
//g4b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 226 && mouseX <=250 && !g4b.isPlaying()){
  g4b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 226 && mouseX <=250) && g4b.isPlaying()){
  g4b.pause();
  }
 
//g4a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 226 && mouseX <=250 && !g4a.isPlaying()){
  g4a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 226 && mouseX <=250) && g4a.isPlaying()){
  g4a.pause();
  }
 
 
 
 


//          //
//   a4    //
//          //
 
//a4f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 251 && mouseX <=275 && !a4f.isPlaying()){
  a4f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 251 && mouseX <=275) && a4f.isPlaying()){
  a4f.pause();
  }
 
 
//a4e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 251 && mouseX <=275 && !a4e.isPlaying()){
  a4e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 251&& mouseX <=275) && a4e.isPlaying()){
  a4e.pause();
  }
 
 
//a4d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 251 && mouseX <=275 && !a4d.isPlaying()){
  a4d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 251 && mouseX <=275) && a4d.isPlaying()){
  a4d.pause();
  }
 
 
//a4c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 251 && mouseX <=275 && !a4c.isPlaying()){
  a4c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 251 && mouseX <=275) && a4c.isPlaying()){
  a4c.pause();
  } 
 
//a4b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 251 && mouseX <=275 && !a4b.isPlaying()){
  a4b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 251 && mouseX <=275) && a4b.isPlaying()){
  a4b.pause();
  }
 
//a4a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 251 && mouseX <=275 && !a4a.isPlaying()){
  a4a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 251 && mouseX <=275) && a4a.isPlaying()){
  a4a.pause();
  }
 
 
 
 


//          //
//   b4    //
//          //
 
//b4f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 276 && mouseX <=300 && !b4f.isPlaying()){
  b4f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 276 && mouseX <=300) && b4f.isPlaying()){
  b4f.pause();
  }
 
 
//b4e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 276 && mouseX <=300 && !b4e.isPlaying()){
  b4e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 276&& mouseX <=300) && b4e.isPlaying()){
  b4e.pause();
  }
 
 
//b4d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 276 && mouseX <=300 && !b4d.isPlaying()){
  b4d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 276 && mouseX <=300) && b4d.isPlaying()){
  b4d.pause();
  }
 
 
//b4c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 276 && mouseX <=300 && !b4c.isPlaying()){
  b4c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 276 && mouseX <=300) && b4c.isPlaying()){
  b4c.pause();
  } 
 
//b4b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 276 && mouseX <=300 && !b4b.isPlaying()){
  b4b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 276 && mouseX <=300) && b4b.isPlaying()){
  b4b.pause();
  }
 
//b4a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 276 && mouseX <=300 && !b4a.isPlaying()){
  b4a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 276 && mouseX <=300) && b4a.isPlaying()){
  b4a.pause();
  }
 
 
 
 


//          //
//   c4    //
//          //
 
//c4f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 301 && mouseX <=325 && !c4f.isPlaying()){
  c4f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 301 && mouseX <=325) && c4f.isPlaying()){
  c4f.pause();
  }
 
 
//c4e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 301 && mouseX <=325 && !c4e.isPlaying()){
  c4e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 301&& mouseX <=325) && c4e.isPlaying()){
  c4e.pause();
  }
 
 
//c4d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 301 && mouseX <=325 && !c4d.isPlaying()){
  c4d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 301 && mouseX <=325) && c4d.isPlaying()){
  c4d.pause();
  }
 
 
//c4c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 301 && mouseX <=325 && !c4c.isPlaying()){
  c4c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 301 && mouseX <=325) && c4c.isPlaying()){
  c4c.pause();
  } 
 
//c4b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 301 && mouseX <=325 && !c4b.isPlaying()){
  c4b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 301 && mouseX <=325) && c4b.isPlaying()){
  c4b.pause();
  }
 
//c4a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 301 && mouseX <=325 && !c4a.isPlaying()){
  c4a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 301 && mouseX <=325) && c4a.isPlaying()){
  c4a.pause();
  }
 
 
 
 


//          //
//   d4    //
//          //
 
//d4f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 326 && mouseX <=350 && !d4f.isPlaying()){
  d4f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 326 && mouseX <=350) && d4f.isPlaying()){
  d4f.pause();
  }
 
 
//d4e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 326 && mouseX <=350 && !d4e.isPlaying()){
  d4e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 326&& mouseX <=350) && d4e.isPlaying()){
  d4e.pause();
  }
 
 
//d4d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 326 && mouseX <=350 && !d4d.isPlaying()){
  d4d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 326 && mouseX <=350) && d4d.isPlaying()){
  d4d.pause();
  }
 
 
//d4c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 326 && mouseX <=350 && !d4c.isPlaying()){
  d4c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 326 && mouseX <=350) && d4c.isPlaying()){
  d4c.pause();
  } 
 
//d4b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 326 && mouseX <=350 && !d4b.isPlaying()){
  d4b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 326 && mouseX <=350) && d4b.isPlaying()){
  d4b.pause();
  }
 
//d4a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 326 && mouseX <=350 && !d4a.isPlaying()){
  d4a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 326 && mouseX <=350) && d4a.isPlaying()){
  d4a.pause();
  }
 
 
 
 


//          //
//   e5    //
//          //
 
//e5f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 351 && mouseX <=375 && !e5f.isPlaying()){
  e5f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 351 && mouseX <=375) && e5f.isPlaying()){
  e5f.pause();
  }
 
 
//e5e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 351 && mouseX <=375 && !e5e.isPlaying()){
  e5e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 351&& mouseX <=375) && e5e.isPlaying()){
  e5e.pause();
  }
 
 
//e5d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 351 && mouseX <=375 && !e5d.isPlaying()){
  e5d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 351 && mouseX <=375) && e5d.isPlaying()){
  e5d.pause();
  }
 
 
//e5c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 351 && mouseX <=375 && !e5c.isPlaying()){
  e5c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 351 && mouseX <=375) && e5c.isPlaying()){
  e5c.pause();
  } 
 
//e5b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 351 && mouseX <=375 && !e5b.isPlaying()){
  e5b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 351 && mouseX <=375) && e5b.isPlaying()){
  e5b.pause();
  }
 
//e5a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 351 && mouseX <=375 && !e5a.isPlaying()){
  e5a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 351 && mouseX <=375) && e5a.isPlaying()){
  e5a.pause();
  }
 
 
//          //
//   f5    //
//          //
 
//f5f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 376 && mouseX <=400 && !f5f.isPlaying()){
  f5f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 376 && mouseX <=400) && f5f.isPlaying()){
  f5f.pause();
  }
 
 
//f5e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 376 && mouseX <=400 && !f5e.isPlaying()){
  f5e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 376&& mouseX <=400) && f5e.isPlaying()){
  f5e.pause();
  }
 
 
//f5d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 376 && mouseX <=400 && !f5d.isPlaying()){
  f5d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 376 && mouseX <=400) && f5d.isPlaying()){
  f5d.pause();
  }
 
 
//f5c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 376 && mouseX <=400 && !f5c.isPlaying()){
  f5c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 376 && mouseX <=400) && f5c.isPlaying()){
  f5c.pause();
  } 
 
//f5b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 376 && mouseX <=400 && !f5b.isPlaying()){
  f5b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 376 && mouseX <=400) && f5b.isPlaying()){
  f5b.pause();
  }
 
//f5a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 376 && mouseX <=400 && !f5a.isPlaying()){
  f5a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 376 && mouseX <=400) && f5a.isPlaying()){
  f5a.pause();
  }
 
 
 
 


//          //
//   g5    //
//          //
 
//g5f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 401 && mouseX <=425 && !g5f.isPlaying()){
  g5f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 401 && mouseX <=425) && g5f.isPlaying()){
  g5f.pause();
  }
 
 
//g5e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 401 && mouseX <=425 && !g5e.isPlaying()){
  g5e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 401&& mouseX <=425) && g5e.isPlaying()){
  g5e.pause();
  }
 
 
//g5d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 401 && mouseX <=425 && !g5d.isPlaying()){
  g5d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 401 && mouseX <=425) && g5d.isPlaying()){
  g5d.pause();
  }
 
 
//g5c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 401 && mouseX <=425 && !g5c.isPlaying()){
  g5c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 401 && mouseX <=425) && g5c.isPlaying()){
  g5c.pause();
  } 
 
//g5b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 401 && mouseX <=425 && !g5b.isPlaying()){
  g5b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 401 && mouseX <=425) && g5b.isPlaying()){
  g5b.pause();
  }
 
//g5a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 401 && mouseX <=425 && !g5a.isPlaying()){
  g5a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 401 && mouseX <=425) && g5a.isPlaying()){
  g5a.pause();
  }
 
 
 
 


 
 



//          //
//   a5    //
//          //
 
//a5f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 426 && mouseX <=450 && !a5f.isPlaying()){
  a5f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 426 && mouseX <=450) && a5f.isPlaying()){
  a5f.pause();
  }
 
 
//a5e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 426 && mouseX <=450 && !a5e.isPlaying()){
  a5e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 426&& mouseX <=450) && a5e.isPlaying()){
  a5e.pause();
  }
 
 
//a5d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 426 && mouseX <=450 && !a5d.isPlaying()){
  a5d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 426 && mouseX <=450) && a5d.isPlaying()){
  a5d.pause();
  }
 
 
//a5c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 426 && mouseX <=450 && !a5c.isPlaying()){
  a5c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 426 && mouseX <=450) && a5c.isPlaying()){
  a5c.pause();
  } 
 
//a5b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 426 && mouseX <=450 && !a5b.isPlaying()){
  a5b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 426 && mouseX <=450) && a5b.isPlaying()){
  a5b.pause();
  }
 
//a5a
if (mouseY >= 426 && mouseY <=480 && mouseX >= 426 && mouseX <=450 && !a5a.isPlaying()){
  a5a.loop(0);
}
if (!(mouseY >= 426 && mouseY <=480 && mouseX >= 426 && mouseX <=450) && a5a.isPlaying()){
  a5a.pause();
  }
 
 
 
 


 
 


 




//          //
//   b5    //
//          //
 
//b5f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 451 && mouseX <=475 && !b5f.isPlaying()){
  b5f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 451 && mouseX <=475) && b5f.isPlaying()){
  b5f.pause();
  }
 
 
//b5e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 451 && mouseX <=475 && !b5e.isPlaying()){
  b5e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 451&& mouseX <=475) && b5e.isPlaying()){
  b5e.pause();
  }
 
 
//b5d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 451 && mouseX <=475 && !b5d.isPlaying()){
  b5d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 451 && mouseX <=475) && b5d.isPlaying()){
  b5d.pause();
  }
 
 
//b5c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 451 && mouseX <=475 && !b5c.isPlaying()){
  b5c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 451 && mouseX <=475) && b5c.isPlaying()){
  b5c.pause();
  } 
 
//b5b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 451 && mouseX <=475 && !b5b.isPlaying()){
  b5b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 451 && mouseX <=475) && b5b.isPlaying()){
  b5b.pause();
  }
 
//b5a
if (mouseY >= 451 && mouseY <=480 && mouseX >= 451 && mouseX <=475 && !b5a.isPlaying()){
  b5a.loop(0);
}
if (!(mouseY >= 451 && mouseY <=480 && mouseX >= 451 && mouseX <=475) && b5a.isPlaying()){
  b5a.pause();
  }
 
 
 
 


 
 


 




//          //
//   c5    //
//          //
 
//c5f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 476 && mouseX <=500 && !c5f.isPlaying()){
  c5f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 476 && mouseX <=500) && c5f.isPlaying()){
  c5f.pause();
  }
 
 
//c5e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 476 && mouseX <=500 && !c5e.isPlaying()){
  c5e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 476&& mouseX <=500) && c5e.isPlaying()){
  c5e.pause();
  }
 
 
//c5d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 476 && mouseX <=500 && !c5d.isPlaying()){
  c5d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 476 && mouseX <=500) && c5d.isPlaying()){
  c5d.pause();
  }
 
 
//c5c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 476 && mouseX <=500 && !c5c.isPlaying()){
  c5c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 476 && mouseX <=500) && c5c.isPlaying()){
  c5c.pause();
  } 
 
//c5b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 476 && mouseX <=500 && !c5b.isPlaying()){
  c5b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 476 && mouseX <=500) && c5b.isPlaying()){
  c5b.pause();
  }
 
//c5a
if (mouseY >= 476 && mouseY <=480 && mouseX >= 476 && mouseX <=500 && !c5a.isPlaying()){
  c5a.loop(0);
}
if (!(mouseY >= 476 && mouseY <=480 && mouseX >= 476 && mouseX <=500) && c5a.isPlaying()){
  c5a.pause();
  }
 
 
 
 


 
 


 




//          //
//   d5    //
//          //
 
//d5f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 501 && mouseX <=525 && !d5f.isPlaying()){
  d5f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 501 && mouseX <=525) && d5f.isPlaying()){
  d5f.pause();
  }
 
 
//d5e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 501 && mouseX <=525 && !d5e.isPlaying()){
  d5e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 501&& mouseX <=525) && d5e.isPlaying()){
  d5e.pause();
  }
 
 
//d5d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 501 && mouseX <=525 && !d5d.isPlaying()){
  d5d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 501 && mouseX <=525) && d5d.isPlaying()){
  d5d.pause();
  }
 
 
//d5c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 501 && mouseX <=525 && !d5c.isPlaying()){
  d5c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 501 && mouseX <=525) && d5c.isPlaying()){
  d5c.pause();
  } 
 
//d5b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 501 && mouseX <=525 && !d5b.isPlaying()){
  d5b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 501 && mouseX <=525) && d5b.isPlaying()){
  d5b.pause();
  }
 
//d5a
if (mouseY >= 401 && mouseY <=480 && mouseX >= 501 && mouseX <=525 && !d5a.isPlaying()){
  d5a.loop(0);
}
if (!(mouseY >= 401 && mouseY <=480 && mouseX >= 501 && mouseX <=525) && d5a.isPlaying()){
  d5a.pause();
  }
 
 
 
 


 
 


 




//          //
//   e6    //
//          //
 
//e6f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 526 && mouseX <=550 && !e6f.isPlaying()){
  e6f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 526 && mouseX <=550) && e6f.isPlaying()){
  e6f.pause();
  }
 
 
//e6e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 526 && mouseX <=550 && !e6e.isPlaying()){
  e6e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 526&& mouseX <=550) && e6e.isPlaying()){
  e6e.pause();
  }
 
 
//e6d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 526 && mouseX <=550 && !e6d.isPlaying()){
  e6d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 526 && mouseX <=550) && e6d.isPlaying()){
  e6d.pause();
  }
 
 
//e6c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 526 && mouseX <=550 && !e6c.isPlaying()){
  e6c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 526 && mouseX <=550) && e6c.isPlaying()){
  e6c.pause();
  } 
 
//e6b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 526 && mouseX <=550 && !e6b.isPlaying()){
  e6b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 526 && mouseX <=550) && e6b.isPlaying()){
  e6b.pause();
  }
 
//e6a
if (mouseY >= 400 && mouseY <=480 && mouseX >= 526 && mouseX <=550 && !e6a.isPlaying()){
  e6a.loop(0);
}
if (!(mouseY >= 400 && mouseY <=480 && mouseX >= 526 && mouseX <=550) && e6a.isPlaying()){
  e6a.pause();
  }
 
 
 
 


 
 


 




//          //
//   f6    //
//          //
 
//f6f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 551 && mouseX <=575 && !f6f.isPlaying()){
  f6f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 551 && mouseX <=575) && f6f.isPlaying()){
  f6f.pause();
  }
 
 
//f6e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 551 && mouseX <=575 && !f6e.isPlaying()){
  f6e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 551&& mouseX <=575) && f6e.isPlaying()){
  f6e.pause();
  }
 
 
//f6d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 551 && mouseX <=575 && !f6d.isPlaying()){
  f6d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 551 && mouseX <=575) && f6d.isPlaying()){
  f6d.pause();
  }
 
 
//f6c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 551 && mouseX <=575 && !f6c.isPlaying()){
  f6c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 551 && mouseX <=575) && f6c.isPlaying()){
  f6c.pause();
  } 
 
//f6b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 551 && mouseX <=575 && !f6b.isPlaying()){
  f6b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 551 && mouseX <=575) && f6b.isPlaying()){
  f6b.pause();
  }
 
//f6a
if (mouseY >= 400 && mouseY <=480 && mouseX >= 551 && mouseX <=575 && !f6a.isPlaying()){
  f6a.loop(0);
}
if (!(mouseY >= 400 && mouseY <=480 && mouseX >= 551 && mouseX <=575) && f6a.isPlaying()){
  f6a.pause();
  }
 
 
 
 


 
 


 



 


 




//          //
//   g6    //
//          //
 
//g6f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 576 && mouseX <=600 && !g6f.isPlaying()){
  g6f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 576 && mouseX <=600) && g6f.isPlaying()){
  g6f.pause();
  }
 
 
//g6e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 576 && mouseX <=600 && !g6e.isPlaying()){
  g6e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 576&& mouseX <=600) && g6e.isPlaying()){
  g6e.pause();
  }
 
 
//g6d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 576 && mouseX <=600 && !g6d.isPlaying()){
  g6d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 576 && mouseX <=600) && g6d.isPlaying()){
  g6d.pause();
  }
 
 
//g6c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 576 && mouseX <=600 && !g6c.isPlaying()){
  g6c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 576 && mouseX <=600) && g6c.isPlaying()){
  g6c.pause();
  } 
 
//g6b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 576 && mouseX <=600 && !g6b.isPlaying()){
  g6b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 576 && mouseX <=600) && g6b.isPlaying()){
  g6b.pause();
  }
 
//g6a
if (mouseY >= 400 && mouseY <=480 && mouseX >= 576 && mouseX <=600 && !g6a.isPlaying()){
  g6a.loop(0);
}
if (!(mouseY >= 400 && mouseY <=480 && mouseX >= 576 && mouseX <=600) && g6a.isPlaying()){
  g6a.pause();
  }
 
 
 
 


 
 


 



 


 




//          //
//   a6    //
//          //
 
//a6f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 601 && mouseX <=625 && !a6f.isPlaying()){
  a6f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 601 && mouseX <=625) && a6f.isPlaying()){
  a6f.pause();
  }
 
 
//a6e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 601 && mouseX <=625 && !a6e.isPlaying()){
  a6e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 601&& mouseX <=625) && a6e.isPlaying()){
  a6e.pause();
  }
 
 
//a6d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 601 && mouseX <=625 && !a6d.isPlaying()){
  a6d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 601 && mouseX <=625) && a6d.isPlaying()){
  a6d.pause();
  }
 
 
//a6c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 601 && mouseX <=625 && !a6c.isPlaying()){
  a6c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 601 && mouseX <=625) && a6c.isPlaying()){
  a6c.pause();
  } 
 
//a6b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 601 && mouseX <=625 && !a6b.isPlaying()){
  a6b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 601 && mouseX <=625) && a6b.isPlaying()){
  a6b.pause();
  }
 
//a6a
if (mouseY >= 400 && mouseY <=480 && mouseX >= 601 && mouseX <=625 && !a6a.isPlaying()){
  a6a.loop(0);
}
if (!(mouseY >= 400 && mouseY <=480 && mouseX >= 601 && mouseX <=625) && a6a.isPlaying()){
  a6a.pause();
  }
 
 
 
 


 
 


 
 




//          //
//   b6    //
//          //
 
//b6f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 626 && mouseX <=650 && !b6f.isPlaying()){
  b6f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 626 && mouseX <=650) && b6f.isPlaying()){
  b6f.pause();
  }
 
 
//b6e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 626 && mouseX <=650 && !b6e.isPlaying()){
  b6e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 626&& mouseX <=650) && b6e.isPlaying()){
  b6e.pause();
  }
 
 
//b6d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 626 && mouseX <=650 && !b6d.isPlaying()){
  b6d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 626 && mouseX <=650) && b6d.isPlaying()){
  b6d.pause();
  }
 
 
//b6c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 626 && mouseX <=650 && !b6c.isPlaying()){
  b6c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 626 && mouseX <=650) && b6c.isPlaying()){
  b6c.pause();
  } 
 
//b6b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 626 && mouseX <=650 && !b6b.isPlaying()){
  b6b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 626 && mouseX <=650) && b6b.isPlaying()){
  b6b.pause();
  }
 
//b6a
if (mouseY >= 400 && mouseY <=480 && mouseX >= 626 && mouseX <=650 && !b6a.isPlaying()){
  b6a.loop(0);
}
if (!(mouseY >= 400 && mouseY <=480 && mouseX >= 626 && mouseX <=650) && b6a.isPlaying()){
  b6a.pause();
  }
 
 
 
 


 
 


 



 


 




//          //
//   c6    //
//          //
 
//c6f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 651 && mouseX <=675 && !c6f.isPlaying()){
  c6f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 651 && mouseX <=675) && c6f.isPlaying()){
  c6f.pause();
  }
 
 
//c6e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 651 && mouseX <=675 && !c6e.isPlaying()){
  c6e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 651&& mouseX <=675) && c6e.isPlaying()){
  c6e.pause();
  }
 
 
//c6d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 651 && mouseX <=675 && !c6d.isPlaying()){
  c6d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 651 && mouseX <=675) && c6d.isPlaying()){
  c6d.pause();
  }
 
 
//c6c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 651 && mouseX <=675 && !c6c.isPlaying()){
  c6c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 651 && mouseX <=675) && c6c.isPlaying()){
  c6c.pause();
  } 
 
//c6b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 651 && mouseX <=675 && !c6b.isPlaying()){
  c6b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 651 && mouseX <=675) && c6b.isPlaying()){
  c6b.pause();
  }
 
//c6a
if (mouseY >= 400 && mouseY <=480 && mouseX >= 651 && mouseX <=675 && !c6a.isPlaying()){
  c6a.loop(0);
}
if (!(mouseY >= 400 && mouseY <=480 && mouseX >= 651 && mouseX <=675) && c6a.isPlaying()){
  c6a.pause();
  }
 
 
 
 


 
 


 



 


 




//          //
//   d6    //
//          //
 
//d6f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 676 && mouseX <=700 && !d6f.isPlaying()){
  d6f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 676 && mouseX <=700) && d6f.isPlaying()){
  d6f.pause();
  }
 
 
//d6e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 676 && mouseX <=700 && !d6e.isPlaying()){
  d6e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 676&& mouseX <=700) && d6e.isPlaying()){
  d6e.pause();
  }
 
 
//d6d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 676 && mouseX <=700 && !d6d.isPlaying()){
  d6d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 676 && mouseX <=700) && d6d.isPlaying()){
  d6d.pause();
  }
 
 
//d6c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 676 && mouseX <=700 && !d6c.isPlaying()){
  d6c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 676 && mouseX <=700) && d6c.isPlaying()){
  d6c.pause();
  } 
 
//d6b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 676 && mouseX <=700 && !d6b.isPlaying()){
  d6b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 676 && mouseX <=700) && d6b.isPlaying()){
  d6b.pause();
  }
 
//d6a
if (mouseY >= 400 && mouseY <=480 && mouseX >= 676 && mouseX <=700 && !d6a.isPlaying()){
  d6a.loop(0);
}
if (!(mouseY >= 400 && mouseY <=480 && mouseX >= 676 && mouseX <=700) && d6a.isPlaying()){
  d6a.pause();
  }
 
 
 
 


 
 


 



 


 




//          //
//   e7    //
//          //
 
//e7f
if (mouseY >= 1 && mouseY <=80 && mouseX >= 701 && mouseX <=725 && !e7f.isPlaying()){
  e7f.loop(0);
}
if (!(mouseY >= 1 && mouseY <=80 && mouseX >= 701 && mouseX <=725) && e7f.isPlaying()){
  e7f.pause();
  }
 
 
//e7e
if (mouseY >= 81 && mouseY <=160 && mouseX >= 701 && mouseX <=725 && !e7e.isPlaying()){
  e7e.loop(0);
}
if (!(mouseY >= 81 && mouseY <=160 && mouseX >= 701&& mouseX <=725) && e7e.isPlaying()){
  e7e.pause();
  }
 
 
//e7d
if (mouseY >= 161 && mouseY <=240 && mouseX >= 701 && mouseX <=725 && !e7d.isPlaying()){
  e7d.loop(0);
}
if (!(mouseY >= 161 && mouseY <=240 && mouseX >= 701 && mouseX <=725) && e7d.isPlaying()){
  e7d.pause();
  }
 
 
//e7c
if (mouseY >= 241 && mouseY <=320 && mouseX >= 701 && mouseX <=725 && !e7c.isPlaying()){
  e7c.loop(0);
}
if (!(mouseY >= 241 && mouseY <=320 && mouseX >= 701 && mouseX <=725) && e7c.isPlaying()){
  e7c.pause();
  } 
 
//e7b
if (mouseY >= 321 && mouseY <=400 && mouseX >= 701 && mouseX <=725 && !e7b.isPlaying()){
  e7b.loop(0);
}
 if (!(mouseY >= 321 && mouseY <=400 && mouseX >= 701 && mouseX <=725) && e7b.isPlaying()){
  e7b.pause();
  }
 
//e7a
if (mouseY >= 400 && mouseY <=480 && mouseX >= 701 && mouseX <=725 && !e7a.isPlaying()){
  e7a.loop(0);
}
if (!(mouseY >= 400 && mouseY <=480 && mouseX >= 701 && mouseX <=725) && e7a.isPlaying()){
  e7a.pause();
  }
 
 
 
 



 



 





 


 
 
}

