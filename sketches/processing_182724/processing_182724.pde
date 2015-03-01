
// -- Load Audio Player -- //
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioInput input;

int lineW  = 70; //Major Key Width
int line2W = 40; //Minor Key Width
int line2X = (lineW/2) + (line2W/2) - 5; // X Position Minor Keys
color c = color(0,150,255); //Rollover Major Keys
color c2 = color(255,150,0); //Rollover Minor Keys

void setup (){
size(560, 400); //Set Canvas Size
}

void draw(){
  // -- Major Keys -- //
  fill(255); //Fill White
  stroke(0); //Outline Black
  rect (0,       0, lineW, height); //C Key
  rect (lineW,   0, lineW, height); //D Key
  rect (lineW*2, 0, lineW, height); //E Key
  rect (lineW*3, 0, lineW, height); //F Key
  rect (lineW*4, 0, lineW, height); //G Key
  rect (lineW*5, 0, lineW, height); //A Key
  rect (lineW*6, 0, lineW, height); //B Key
  rect (lineW*7, 0, lineW, height); //C2Key

  // -- Major Key Rollovers -- //
  //Rollover fill C Key
  if (mouseX >= 0   && mouseX <= 0 + lineW &&
      mouseY >= 200 && mouseY <= 400){
      fill (c);
      rect (0, 0, lineW, height);
      }
  //Rollover fill D Key
  if (mouseX >= lineW && mouseX <= lineW + lineW &&
      mouseY >= 200   && mouseY <= 400){
      fill (c);
      rect (lineW, 0, lineW, height);
      }
  //Rollover fill E Key
  if (mouseX >= lineW*2 && mouseX <= lineW + lineW*2 &&
      mouseY >= 200     && mouseY <= 400){
      fill (c);
      rect (lineW*2, 0, lineW, height);
      }
  //Rollover fill F Key
  if (mouseX >= lineW*3 && mouseX <= lineW + lineW*3 &&
      mouseY >= 200     && mouseY <= 400){
      fill (c);
      rect (lineW*3, 0, lineW, height);
      }
  //Rollover fill G Key
  if (mouseX >= lineW*4 && mouseX <= lineW + lineW*4 &&
      mouseY >= 200     && mouseY <= 400){
      fill (c);
      rect (lineW*4, 0, lineW, height);
      }
  //Rollover fill A Key
  if (mouseX >= lineW*5 && mouseX <= lineW + lineW*5 &&
      mouseY >= 200     && mouseY <= 400){
      fill (c);
      rect (lineW*5, 0, lineW, height);
      }
  //Rollover fill B Key
  if (mouseX >= lineW*6 && mouseX <= lineW + lineW*6 &&
      mouseY >= 200     && mouseY <= 400){
      fill (c);
      rect (lineW*6, 0, lineW, height);
      }
    //Rollover fill C2 Key
  if (mouseX >= lineW*7 && mouseX <= lineW + lineW*7 &&
      mouseY >= 200     && mouseY <= 400){
      fill (c);
      rect (lineW*7, 0, lineW, height);
      }    
      
  // -- Minor Keys -- //
  fill (0); //Fill Black
  stroke(0); //Outline Black
  rect (line2X,        0, line2W, height/2); //C# Key
  rect (line2X*2 +20,  0, line2W, height/2); //D# Key
  rect (line2X*4 +60,  0, line2W, height/2); //F# Key
  rect (line2X*5 +80,  0, line2W, height/2); //G# Key
  rect (line2X*6 +100, 0, line2W, height/2); //A# Key
  
  // -- Minor Key Rollovers -- //
  //Rollover fill C# Key
  if (mouseX >= line2X && mouseX <= line2X + line2W &&
      mouseY >= 0      && mouseY <= 200){
      fill (c2);
      rect (line2X, 0, line2W, height/2);
      }
  //Rollover fill D# Key
  if (mouseX >= line2X*2 +20 && mouseX <= line2X + line2W*2 +30 &&
      mouseY >= 0            && mouseY <= 200){
      fill (c2);
      rect (line2X*2 +20, 0, line2W, height/2);
      }
  //Rollover fill F# Key
  if (mouseX >= line2X*4 +60 && mouseX <= line2X + line2W*4 +90 &&
      mouseY >= 0            && mouseY <= 200){
      fill (c2);
      rect (line2X*4 +60,  0, line2W, height/2);
      }
  //Rollover fill G# Key
  if (mouseX >= line2X*5 +80 && mouseX <= line2X + line2W*5 +120 &&
      mouseY >= 0            && mouseY <= 200){
      fill (c2);
      rect (line2X*5 +80,  0, line2W, height/2);
      }
  //Rollover fill A# Key
  if (mouseX >= line2X*6 +100 && mouseX <= line2X + line2W*5 +190 &&
      mouseY >= 0             && mouseY <= 200){
      fill (c2);
      rect (line2X*6 +100,  0, line2W, height/2);
      }
} //Close Draw Function
  
  void mouseClicked(){
  // -- Play Major Keys -- //
  //Play C Key
  if (mouseX >= 0   && mouseX <= 0 + lineW &&
      mouseY >= 200 && mouseY <= 400){
      minim = new Minim(this);
      player = minim.loadFile("01 - C.wav");
      player.play();
      input = minim.getLineIn();
      }
  //Play D Key
  if (mouseX >= lineW && mouseX <= lineW + lineW &&
      mouseY >= 200     && mouseY <= 400){
      minim = new Minim(this);
      player = minim.loadFile("02 - D.wav");
      player.play();
      input = minim.getLineIn();
      }
  //Play E Key
  if (mouseX >= lineW*2 && mouseX <= lineW + lineW*2 &&
      mouseY >= 200     && mouseY <= 400){
      minim = new Minim(this);
      player = minim.loadFile("03 - E.wav");
      player.play();
      input = minim.getLineIn();
      }
  //Play F Key
  if (mouseX >= lineW*3 && mouseX <= lineW + lineW*3 &&
      mouseY >= 200     && mouseY <= 400){
      minim = new Minim(this);
      player = minim.loadFile("04 - F.wav");
      player.play();
      input = minim.getLineIn();
      }
  //Play G Key
  if (mouseX >= lineW*4 && mouseX <= lineW + lineW*4 &&
      mouseY >= 200     && mouseY <= 400){
      minim = new Minim(this);
      player = minim.loadFile("05 - G.wav");
      player.play();
      input = minim.getLineIn();
      }
  //Play A Key
  if (mouseX >= lineW*5 && mouseX <= lineW + lineW*5 &&
      mouseY >= 200     && mouseY <= 400){
      minim = new Minim(this);
      player = minim.loadFile("06 - A.wav");
      player.play();
      input = minim.getLineIn();
      }
  //Play B Key
  if (mouseX >= lineW*6 && mouseX <= lineW + lineW*6 &&
      mouseY >= 200     && mouseY <= 400){
      minim = new Minim(this);
      player = minim.loadFile("07 - B.wav");
      player.play();
      input = minim.getLineIn();
      }
  if (mouseX >= lineW*7 && mouseX <= lineW + lineW*7 &&
      mouseY >= 200     && mouseY <= 400){
      minim = new Minim(this);
      player = minim.loadFile("08 - C2.wav");
      player.play();
      input = minim.getLineIn();
      }
      
  // -- Play Minor Keys -- //
  //Play C# Key
  if (mouseX >= line2X && mouseX <= line2X + line2W &&
      mouseY >= 0      && mouseY <= 200){
      minim = new Minim(this);
      player = minim.loadFile("01.1 - C#.wav");
      player.play();
      input = minim.getLineIn();
      }
  //Play D# Key
  if (mouseX >= line2X*2 +20 && mouseX <= line2X + line2W*2 +30 &&
      mouseY >= 0            && mouseY <= 200){
      minim = new Minim(this);
      player = minim.loadFile("02.1 - D#.wav");
      player.play();
      input = minim.getLineIn();
      }
  //Play F# Key
  if (mouseX >= line2X*4 +60 && mouseX <= line2X + line2W*4 +90 &&
      mouseY >= 0            && mouseY <= 200){
      minim = new Minim(this);
      player = minim.loadFile("04.1 - F#.wav");
      player.play();
      input = minim.getLineIn();
      }
  //Play G# Key
  if (mouseX >= line2X*5 +80 && mouseX <= line2X + line2W*5 +120 &&
      mouseY >= 0            && mouseY <= 200){
      minim = new Minim(this);
      player = minim.loadFile("05.1 - G#.wav");
      player.play();
      input = minim.getLineIn();
       }
  //Play A# Key
  if (mouseX >= line2X*6 +100 && mouseX <= line2X + line2W*5 +190 &&
      mouseY >= 0              && mouseY <= 200){
      minim = new Minim(this);
      player = minim.loadFile("06.1 - A#.wav");
      player.play();
      input = minim.getLineIn();
      }
} //Close Mouse Clicked Function


