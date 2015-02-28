
Minim minim
int counter;
int Width = 350;
int Height = 250; 
float xMov = 20;
float cdX = Width/2;
float cdY = Height/2;
float hX = 0;
float hY = 0;
int bs = 35;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0; 
void setup() {  //setup function called initially, only once
  size(350, 250);
  background(200, 185, 165);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
}


void hand() {

    translate(Width / 1.15 , Height /20);
    if (mousePressed){
        xMov = mouseX * 1.25;
    }
    rotate(radians(-xMov));
    noStroke();
    fill(185);
    rect(hX, hY, 25, 50, 2);
    fill(165);
    rect(hX, hY, 25, 20, 2);
    fill(255);
    rect(hX, hY, 10, 135, 50);   
    
}
void cd() {
    
    stroke(255);
    fill(30);
    ellipse(cdX, cdY,  180, 180);
    noStroke();
    fill(150, 30, 30)
    ellipse(cdX, cdY,  75, 75);
    fill(225);
    stroke(255);
    strokeWeight(1);
    ellipse(cdX, cdY,  25, 25);
    noFill();
    stroke(255);
    ellipse(cdX, cdY,  80, 80);
    stroke(75);
    strokeWeight(4);
    ellipse(cdX, cdY,  120, 120);
    strokeWeight(7);
    stroke(95);
    ellipse(cdX, cdY,  155, 155);
    strokeWeight(2);
    stroke(200);
    ellipse(cdX, cdY,  80, 80);
    stroke(125);
    ellipse(cdX, cdY,  95, 95);
    stroke(225);
    ellipse(cdX, cdY,  135, 135);
}
void record() {
    stroke(1);
    strokeWeight(1);
    fill(200);
    rect(Width / 20 , Height / 80, 310, 220);
    noStroke();
    fill(255);
    rect(Width / 20 , Height / 1.3, 310, 5);
    fill(50);
    rect(Width / 20 , Height / 1.31, 310, 2);
    fill(50);
    rect(Width / 20 , Height / 1.25, 310, 20);
    fill(225);
    rect(Width / 8 , Height / 1.22, 20, 10);
    rect(Width / 16 , Height / 1.22, 20, 10);
    rect(Width / 1.7 , Height / 1.22, 20, 10);
    rect(Width / 1.9 , Height / 1.22, 20, 10);
    stroke(125);
    strokeWeight(2);
    line(Width / 1.1, Height / 1.22, Width/1.4, Height / 1.22);
    stroke(120);
    line(Width / 1.1, Height / 1.19, Width/1.4, Height / 1.19);
    stroke(110);
    line(Width / 1.1, Height / 1.16, Width/1.4, Height / 1.16);
}
void draw() {  //draw function loops 
  // Record Player Base
  setup();
  record();
  cd();
    //
  // Hand Moveme
  hand();
  if (mouseX > cdX-bs && mouseX < cdX+bs && 

      mouseY > cdY-bs && mouseY < cdY+bs) {
      bover = true;
  }else{ bover= false;
 }
}
  
void mousePressed() {

  if(bover) { 

    locked = true;
    }else {

    locked = false;

  }

  bdifx = mouseX-cdX; 

  bdify = mouseY-cdY; 



}
void mouseDragged() {

  if(locked) {

    cdX = mouseX-bdifx; 

    cdY = mouseY-bdify; 

  }

}



void mouseReleased() {

  locked = false;

}


