
//Optical Lexicography - Elisa Michelet Gorbis

import processing.pdf.*;

PShape yar;
float yarScale;
float r;

int theColor = 0;
color[] colors = { 
color(32, 142, 121, 20), color(141, 165, 62, 20), color(241, 201, 37, 20), color(175, 32, 62, 20)
};

boolean looking = false;

void setup() {
  background(255);
  noStroke();
  size (1024, 768);
  smooth();
  
}

void draw() {
  
  if (mousePressed) {
    noStroke();
    fill( colors[theColor] );
    ellipse(mouseX, mouseY, 500, 500);
    pushMatrix();
    translate(mouseX, mouseY);
    popMatrix();
  }


  if (keyPressed == true) {

    if (key == 'a') {
      yar = loadShape("a.svg");
    } 
    else if (key == 'b') {
      yar = loadShape("b.svg");
    }
    if (key == 'c') {
      yar = loadShape("c.svg");
    } 
    else if (key == 'd') {
      yar = loadShape("d.svg");
    }
    if (key == 'e') {
      yar = loadShape("e.svg");
    } 
    else if (key == 'f') {
      yar = loadShape("f.svg");
    }
    if (key == 'g') {
      yar = loadShape("g.svg");
    } 
    else if (key == 'h') {
      yar = loadShape("h.svg");
    }  
    if (key == 'i') {
      yar = loadShape("i.svg");
    } 
    else if (key == 'j') {
      yar = loadShape("j.svg");
    }
    if (key == 'k') {
      yar = loadShape("k.svg");
    } 
    else if (key == 'l') {
      yar = loadShape("l.svg");
    }
    if (key == 'm') {
      yar = loadShape("m.svg");
    }
    if (key == 'n') {
      yar = loadShape("n.svg");
    } 
    else if (key == 'o') {
      yar = loadShape("o.svg");
    }
    if (key == 'p') {
      yar = loadShape("p.svg");
    } 
    else if (key == 'q') {
      yar = loadShape("q.svg");
    }
    if (key == 'r') {
      yar = loadShape("r.svg");
    } 
    else if (key == 's') {
      yar = loadShape("s.svg");
    }
    if (key == 't') {
      yar = loadShape("t.svg");
    } 
    else if (key == 'u') {
      yar = loadShape("u.svg");
    }  
    if (key == 'v') {
      yar = loadShape("v.svg");
    } 
    else if (key == 'w') {
      yar = loadShape("w.svg");
    }
    if (key == 'x') {
      yar = loadShape("x.svg");
    } 
    else if (key == 'y') {
      yar = loadShape("y.svg");
    }
    if (key == 'z') {
      yar = loadShape("z.svg");
    }
    looking = true;
    yarScale = random(8, 24);
    r = random(0.0, TWO_PI);
  }



  if (looking == false || yar == null) {
    return;
  }

  loadPixels();
  int randomX = (int)random(0, width);
  int randomY = (int)random(0, height);

  boolean taken = false;
  for (int x=randomX; x < width && x < randomX+yar.width*yarScale; x = x+1) {
    for (int y=randomY; y < height && y < randomY+yar.height*yarScale; y = y+1) {
      if (pixels[y*width+x] != color(255, 255, 255, 255)) {
        taken = true;
        break;
      }
    }
  }

  if (taken == false) {
    pushMatrix();
    translate(randomX, randomY);
    rotate(r);
    scale(yarScale);
    //println(r);
    shape(yar, 0, 0);
    popMatrix();
    looking = false;
    println("putting it at "+randomX+" "+randomY+" "+yarScale);
  }
  
    else {  
   if (yarScale > 10) {
   yarScale = yarScale - 35;
   println(yarScale);
   }
   }
}


   
void keyPressed () {
  
  if ( key==CODED ) {
    if ( keyCode == UP ) {
    }
    if ( keyCode == DOWN ) {
    }
    if ( keyCode == LEFT ) { 
      theColor=(theColor+1)%4;
    }
    if ( keyCode == RIGHT ) { 
      theColor=(theColor+3)%4;
    }
  }

    if (key == '1') beginRecord(PDF, "Line-###.pdf");
    if (key =='2') endRecord();
}


