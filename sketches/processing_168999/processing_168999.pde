
float culr;
float Pculr;
float moveZ;

float score;
float Fscore;

int fix =100;
int factor =1;

boolean state = true;
int counter;

float shiftX = 0;
float shiftY = 0;

float Sx;
float Sy;

void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB);
  frameRate(30);

}

void draw() { 

  background(0);

   
    for (int x = 0; x < width; x = x + 25) {
      for (int y = 0; y < height; y = y + 25) {
        
        noStroke();
        
        //if (state == true) {
        //Alternates b/w continuous and discontinuous patterns based on the state
       // result = condition ? expression1 : expression2
       // ((state == true) ? 1.0 : 1 )
       
        
        culr = noise(x/(((state == true) ? 1.0 : 1 )*fix*factor)+ shiftX, y/(((state == true) ? 1.0 : 1 ) *fix*factor)+ shiftY, moveZ)*360; // note the "1", multiplying by all 'ints' keeps the value of (1 *fix*factor) an int,
        // thus producting discontinuos pattern of colors                                    
        fill(culr, 360, 360);

        roundedRect(x+2.5, y+2.5, 20, 20, 10, 10);
      }
    }

//  Pculr = noise(Sx/(1*fix*factor)+ shiftX, Sy/(1 *fix*factor)+ shiftY, moveZ)*360;
//  fill(Pculr,255,255);
  //strokeWeight(3);
//  stroke(0);
//  roundedRect(Sx+2.5, Sy+2.5, 20, 20, 10, 10);
//  print(Sx);
//  print("~~");
//  println(Sy);
  
//  print("::");
//  println(score);

//score+= abs(Pculr - culr);

  moveZ+=0.01; // increments the Z input of noise so that the pattern changes
  
//  print(nf(score,7,2));
//  print("~~~");
//  println(millis());
  
//  if ((millis()/1000)>10){
//    background(0);
//    fill(255);
//    Fscore = score;
//    println(Fscore);
//    noLoop();
//  }
  
  
}


void roundedRect(float x, float y, float w, float h, float rx, float ry) { //Code adapted from "cefnhoile", heres the link: https://forum.processing.org/topic/rounded-rectangle . 
  smooth();
  beginShape();
  vertex(x, y+ry); //top of left side 
  bezierVertex(x, y, x, y, x+rx, y); //top left corner

  vertex(x+w-rx, y); //right of top side 
  bezierVertex(x+w, y, x+w, y, x+w, y+ry); //top right corner

  vertex(x+w, y+h-ry); //bottom of right side
  bezierVertex(x+w, y+h, x+w, y+h, x+w-rx, y+h); //bottom right corner

  vertex(x+rx, y+h); //left of bottom side
  bezierVertex(x, y+h, x, y+h, x, y+h-ry); //bottom left corner

  endShape(CLOSE);
} 


void mousePressed() { // changes the 'factor' and 'fix' vars using the bottom right rect , 
  // bottom left rect, and rects of those two as buttons

  if (mousePressed && mouseX>=480 && mouseY>=460 && mouseY<480 above="above" bottom="bottom" font="font" rect="rect" right="right">
    fix *=10;
  }
  if (mousePressed && mouseX>=480 && mouseY>=480 && fix !=1) { //bottom right
    fix /=10;
  }

  if (mousePressed && mouseX<=20 && mouseY>=460 && mouseY<480 above="above" bottom="bottom" font="font" left="left" nbsp="nbsp" rect="rect">
    factor +=1;
  }
  if (mousePressed && mouseX<=20 && mouseY>=480 && factor !=1) { //bottom left
    factor -=1;
  }
}

void keyPressed() {
  if (key == ' ') {
    counter++;
  }

  if (counter%2 ==0) { //everytime the spacebar is pressed the states 
    //alternate b/w continuous and "blocky" color 
    state = true;
  } 
  else {
    state = false;
  }

}
