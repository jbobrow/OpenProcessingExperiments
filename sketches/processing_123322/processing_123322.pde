
//Import 'Minim' library
import ddf.minim.*;

//Global Variables
int NumberOfPoints = 5;
int radius;
float trans;
boolean expand = false;
boolean noteMap = false;
float starRadius = 2;
float circleRadius = 10;
float circleAlpha = 255;
PImage nightsky;

Minim minim;
AudioPlayer tone;
AudioPlayer D1;
AudioPlayer E2;
AudioPlayer Fs3;
AudioPlayer G4;
AudioPlayer A5;
AudioPlayer B6;
AudioPlayer Cs7;
AudioPlayer D8;
AudioPlayer E9;
AudioPlayer song;

//Setup
void setup(){
  size(800, 600);
  nightsky = loadImage("nightsky2.png");
  nightsky.resize(width, height);
  colorMode(HSB, width, 3*height, 100);
  background(nightsky);
  
  minim = new Minim(this);
  D1 = minim.loadFile("D1.mp3");
  E2 = minim.loadFile("E2.mp3");
  Fs3 = minim.loadFile("Fs3.mp3");
  G4 = minim.loadFile("G4.mp3");
  A5 = minim.loadFile("A5.mp3");
  B6 = minim.loadFile("B6.mp3");
  Cs7 = minim.loadFile("Cs7.mp3");
  D8 = minim.loadFile("D8.mp3");
  E9 = minim.loadFile("E9.mp3");
  song = minim.loadFile("guitarlul.mp3");
}


//Overlay to show positions of notes
void Map(boolean notemap){
     if (noteMap == true){
      stroke(#333333);
      fill(#454545);
      
      line(0, height/6, width, height/6);
      line(0, 2*height/6, width, 2*height/6);
      line(0, 3*height/6, width, 3*height/6);
      line(0, 3*height/4, width, 3*height/4);
      line(width/3, 0, width/3, height/2);
      line(2*width/3, 0, 2*width/3, height/2);
      line(width/4, height/2, width/4, height);
      line(2*width/4, height/2, 2*width/4, height);
      line(3*width/4, height/2, 3*width/4, height);
      
      textAlign(LEFT);
      textSize(width/50);
      text("Chords:", 1, width/50);
      text("Scale:", 1, height/2+width/50);
      text("D", 3, height/6-3);
      text("F#", 3, 2*height/6-3);
      text("B", 3, 3*height/6-3);
      text("G", width/3+3, height/6-3);
      text("B", width/3+3, 2*height/6-3);
      text("d'", width/3+3, 3*height/6-3);
      text("A", 2*width/3+3, height/6-3);
      text("C#", 2*width/3+3, 2*height/6-3);
      text("e'", 2*width/3+3, 3*height/6-3);
      text("D", 3, 3*height/4-3);
      text("E", width/4+3, 3*height/4-3);
      text("F#", 2*width/4+3, 3*height/4-3);
      text("G", 3*width/4+3, 3*height/4-3);
      text("A", 3, height-3);
      text("B", width/4+3, height-3);
      text("C#", 2*width/4+3, height-3);
      text("d'", 3*width/4+3, height-3);
      
      textAlign(CENTER);
      text("1 (Tonic)", width/6, width/50);
      text("4 (Sub-Dominant)", 3*width/6, width/50);
      text("5 (Dominant)", 5*width/6, width/50); 
      }
      
      else if (noteMap == false){
      stroke(#000000);
      fill(#000000);
      
      line(0, height/6, width, height/6);
      line(0, 2*height/6, width, 2*height/6);
      line(0, 3*height/6, width, 3*height/6);
      line(0, 3*height/4, width, 3*height/4);
      line(width/3, 0, width/3, height/2);
      line(2*width/3, 0, 2*width/3, height/2);
      line(width/4, height/2, width/4, height);
      line(2*width/4, height/2, 2*width/4, height);
      line(3*width/4, height/2, 3*width/4, height);
      
      textAlign(LEFT);
      textSize(width/50);
      text("Chords:", 1, width/50);
      text("Scale:", 1, height/2+width/50);
      text("D", 3, height/6-3);
      text("F#", 3, 2*height/6-3);
      text("B", 3, 3*height/6-3);
      text("G", width/3+3, height/6-3);
      text("B", width/3+3, 2*height/6-3);
      text("d'", width/3+3, 3*height/6-3);
      text("A", 2*width/3+3, height/6-3);
      text("C#", 2*width/3+3, 2*height/6-3);
      text("e'", 2*width/3+3, 3*height/6-3);
      text("D", 3, 3*height/4-3);
      text("E", width/4+3, 3*height/4-3);
      text("F#", 2*width/4+3, 3*height/4-3);
      text("G", 3*width/4+3, 3*height/4-3);
      text("A", 3, height-3);
      text("B", width/4+3, height-3);
      text("C#", 2*width/4+3, height-3);
      text("d'", 3*width/4+3, height-3);
      
      textAlign(CENTER);
      text("1 (Tonic)", width/6, width/50);
      text("4 (Sub-Dominant)", 3*width/6, width/50);
      text("5 (Dominant)", 5*width/6, width/50);
      }
}

//Draw
void draw(){
   if (mousePressed){
      expand = true;
        
       pushMatrix();
       translate(mouseX, mouseY);
       rotate(random(2*PI));
       stroke(mouseX, mouseY, 100, circleAlpha);
       noFill();
      
       radius = constrain(radius, 3, 300);
       float angle = TWO_PI/(2*NumberOfPoints);
      
       //stars  
       if (NumberOfPoints >=3){        
         beginShape();
         for(int i=0; i<=(2*NumberOfPoints); i++){
          float x = 0 + cos(angle*i) * (starRadius-((i+2)%2)*(starRadius/2)); 
          float y = 0 + sin(angle*i) * (starRadius-((i+2)%2)*(starRadius/2));
          vertex(x,y); 
         }
         endShape();
       }
       
       //circles
       else {
          ellipse(0, 0, circleRadius, circleRadius);
       }     
       
       if (expand){
         starRadius+=10;
         circleRadius+=20;
         circleAlpha-=30;
       }
       popMatrix(); 
     
     //Chord grid
      if (mouseY < height/6){
        if (mouseX < width/3){
          tone = D1;
        }
        if (mouseX >= width/3 && mouseX < 2*width/3){
          tone = G4;
        }
       if (mouseX >= 2*width/3){
          tone = A5;
        }
      }
        
      if (mouseY >= height/6 && mouseY < 2*height/6){        
        if (mouseX < width/3){
          tone = Fs3;
        }
        if (mouseX >= width/3 && mouseX < 2*width/3){
          tone = B6;
        }
       if (mouseX >= 2*width/3){
          tone = Cs7;
        }
      }

      if (mouseY >= 2*height/6 && mouseY < 3*height/6){      
        if (mouseX < width/3){
          tone = A5;
        }
        if (mouseX >= width/3 && mouseX < 2*width/3){
          tone = D8;
        }
       if (mouseX >= 2*width/3){
          tone = E9;
        }
      }
      
      //Scale grid 
      if (mouseY >= 3*height/6 && mouseY < 3*height/4){
        if (mouseX < width/4){
          tone = D1;
        }
        if (mouseX >= width/4 && mouseX < 2*width/4){
          tone = E2;
        }
       if (mouseX >= 2*width/4 && mouseX < 3*width/4){
          tone = Fs3;
        }
       if (mouseX >= 3*width/4){
          tone = G4;
        }
      }
      
      if (mouseY >= 3*height/4){
        if (mouseX < width/4){
          tone = A5;
        }
        if (mouseX >= width/4 && mouseX < 2*width/4){
          tone = B6;
        }
       if (mouseX >= 2*width/4 && mouseX < 3*width/4){
          tone = Cs7;
        }
       if (mouseX >= 3*width/4){
          tone = D8;
        }
      }
      
     tone.rewind();
     tone.setGain(-15);
     tone.play();
   }  
}


void mouseReleased(){
    expand = false;
    starRadius =2;
    circleRadius = 10;
    circleAlpha = 255;
  }
  
void keyPressed(){
  //Music control
  if ((key == 'p' || key == 'P')  && !song.isPlaying()) song.play();
  if(key == ' ' && song.isPlaying()) song.pause();
  if((key == 'r' || key == 'R')) song.rewind();
  
  //Note map toggle
  if (key == 'm'){
    noteMap = !noteMap;
    Map(noteMap);
  }
  
  // Clear screen and save keys 
  if (key == DELETE || key == BACKSPACE) background(nightsky);
  if (key == 's' || key == 'S') saveFrame("screenshot.png"); 
  
  //Change number of points on stars
  switch(key){
    case '3':
      NumberOfPoints = 3;
     break;
    case '4':
      NumberOfPoints = 4;
     break;
    case '5':
      NumberOfPoints = 5;
     break;
    case '6':
      NumberOfPoints = 6;
     break; 
    case '7':
      NumberOfPoints = 7;
     break; 
    case '8':
      NumberOfPoints = 8;
     break;
   case '9':
      NumberOfPoints = 9;
     break;
    case '0':
      NumberOfPoints = 0;
     break;  
  }
}

