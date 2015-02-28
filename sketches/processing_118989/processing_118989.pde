
float r=255;
float g=105;
float b=180;

void setup(){
  // setup only run once
  size(800,650);
  smooth();
  
}

void draw(){
  
  background(176,  226,  255);
  smooth();
  
  //sun
  noStroke();
  fill(255, 255, 153);
  ellipse(90, 50, 65, 65);
  
 //waves
 // all lines of waves
  // j < 25 for 25 waves
  for (int j=0; j < 25; j+= 1) {
  
    // one line of waves
    for (int i=0; i < 900; i+= 40){
      stroke(255,255-j*10);
      noFill();
      strokeWeight(4);
      strokeCap(ROUND);
      line(i,200 + (j*20),i+20,215 + (j*20));
      line(i-20, 215 + (j*20),i,200 + (j*20));
    }
    
  //whale
  //body
  //fill(193,205,193);
  smooth();
  fill(r,g,b);
  
  //flashing
  if(mouseY > 150){
   r=r+2;
} else {
  r=r-4;
 
if (r>255){
  r=255;
} else if (r<0){
r=150;
}
}
  
  
  //blue/pink
  if(mouseX > width/3){
   r=r+2;
} else {
  r=r-4;
 
if (r>255){
  r=255;
} else if (r<0){
r=0;
}

}
  noStroke();
  beginShape();
  vertex( mouseX+271 , mouseY+31 );
        bezierVertex( mouseX+304 , mouseY+81 , mouseX+245 , mouseY+141 , mouseX+213 , mouseY+147);
        bezierVertex( mouseX+213 , mouseY+147 , mouseX+182 , mouseY+158 , mouseX+140 , mouseY+147);
        bezierVertex( mouseX+116 , mouseY+141 , mouseX+99 , mouseY+133 , mouseX+88 , mouseY+119);
        bezierVertex( mouseX+67 , mouseY+93 , mouseX+67 , mouseY+74 , mouseX+67 , mouseY+48);
        bezierVertex( mouseX+39 , mouseY+55 , mouseX+18 , mouseY+43 , mouseX , mouseY+21);
        bezierVertex( mouseX+25 , mouseY+31 , mouseX+31 , mouseY+7 , mouseX+56 , mouseY+5);
        bezierVertex( mouseX+65 , mouseY+5 , mouseX+70 , mouseY+7 , mouseX+74 , mouseY+18);
        bezierVertex( mouseX+74 , mouseY+8 , mouseX+85 , mouseY+1 , mouseX+98 , mouseY+1);
        bezierVertex( mouseX+111 , mouseY-1 , mouseX+121 , mouseY+13 , mouseX+145 , mouseY+2);
        bezierVertex( mouseX+133 , mouseY+37 , mouseX+98 , mouseY+48 , mouseX+86 , mouseY+48);
        bezierVertex( mouseX+78 , mouseY+73 , mouseX+98 , mouseY+88 , mouseX+111 , mouseY+88);
        bezierVertex( mouseX+134 , mouseY+88 , mouseX+152 , mouseY+48 , mouseX+169 , mouseY+31);
        bezierVertex( mouseX+169 , mouseY+31 , mouseX+217 , mouseY-24 , mouseX+271 , mouseY+31);
        endShape(CLOSE);
        
   //mouth     
   beginShape();
   noFill();
   strokeWeight(3);
   stroke(0);
   strokeCap(ROUND);
    vertex( mouseX+263 , mouseY+107 );
        bezierVertex(mouseX+ 233 , mouseY+119 , mouseX+211 , mouseY+108 , mouseX+210 , mouseY+100);
    endShape();
    
    //eye
    fill(0);
    noStroke();
    ellipse(mouseX+225, mouseY+50, 15, 20);  
  
}

  
 //bubbles
  if (mouseY > 350){
   noStroke();
   fill(0, 197, 204);
   ellipse(mouseX+230, mouseY-60, 15, 15);
   ellipse(mouseX+260, mouseY-40, 10, 10);
   ellipse(mouseX+275, mouseY-110, 20, 20);
   ellipse(mouseX+230, mouseY-70, 12, 12);
   ellipse(mouseX+245, mouseY-30, 15, 15);
   // do this if it's true
 }
  }
