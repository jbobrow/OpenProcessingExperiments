
PImage a; 
PImage b; 
PImage c; 
PImage d; 
import ddf.minim.*;

Minim minim; 
AudioPlayer player1; 
AudioPlayer player2; 
AudioPlayer player3; 
AudioPlayer player4;

void setup() { 
  a = loadImage ("a.jpg"); 
  b = loadImage ("b.jpg"); 
  c = loadImage ("c.jpg"); 
  d = loadImage ("d.jpg");

  size(400, 400); 
  minim = new Minim(this); 
  player1 = minim.loadFile("Row, Row, Row Your Boat - Nursery Rhymes.mp3"); 
  player2 = minim.loadFile("Nursery Rhymes - Humpty Dumpty.mp3"); 
  player3 = minim.loadFile("Mary had a little Lamb - With Lyrics.mp3"); 
  player4 = minim.loadFile("Hey Diddle Diddle - Nursery Rhymes (Lullabies for babies).mp3");
}

void draw() { 
  image(a, 0, 0, a.width/2, a.height/2); 
  image(b, 200, 0, b. width, b.height); 
  image(d, 180, 200, d.width/4, d.height/4); 
  image(c, 0, 200, c.width, c.height);

  if (mousePressed == true) { 
    if (mouseX < width/2 && mouseY <height/2) { 
      rect(0, 0, width/2, height/2); 
      player2.pause(); 
      player3.pause(); 
      player4.pause(); 
      player1.play();
    } 
    else { 
      if (mouseX >width/2 && mouseY < height/2) { 
        rect(width/2, 0, width/2, height/2); 
        player1.pause(); 
        player3.pause(); 
        player4.pause(); 
        player2.play();
      }

      else { 
        if (mouseX <width/2 && mouseY >height/2) { 
          rect(0, height/2, width/2, height/2); 
          player1.pause(); 
          player2.pause(); 
          player4.pause(); 
          player3.play();
        } 
        else { 
          if (mouseX>width/2 && mouseY> height/2) rect(width/2, height/2, width/2, height/2); 
          player1.pause(); 
          player3.pause(); 
          player2.pause(); 
          player4.play();
        }
      }
    }
  }
}



