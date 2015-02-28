
//set top of nose
int x = 145;
int y = 125;
float r =(random(0-255));

void setup() {
  //size of world
  size(300,300);
  //aliasing?
}

void draw() {
  //draw the background
  background(150);
  
    //draw paden shirt
  beginShape();
  vertex(x-10,y+52);
  vertex(x-18,y+58);
  vertex(x-15,y+60);
  vertex(x-35,y+85);
  vertex(x-34,y+100);
  vertex(x-36,301);
  vertex(x+54,301);
  vertex(x+55,y+165);
  vertex(x+51,y+72);
  vertex(x+24,y+53);
  vertex(x+26,y+50);
  vertex(x+15,y+48);
  endShape();
 
  
  //draw paden head
  //lines? colour?
  beginShape();
   vertex(x+5,y+60);
   vertex(x-10,y+52);
   vertex(x-10,y+32);
   vertex(x-28,y+27);
   vertex(x-40,y-35);
   vertex(x+25,y-45);
   vertex(x+29,y+26);
   vertex(x+11,y+32);
   vertex(x+15,y+48);
   vertex(x+5,y+60);
   endShape();
   
  //draw paden hair
  beginShape();
   vertex(x-25,y-35);
   vertex(x-45,y-5);
   vertex(x-48,y-13);
   vertex(x-54,y-6);
   vertex(x-55,y-32);
   vertex(x-45,y-40);
   vertex(x-35,y-40);
   vertex(x-41,y-46);
   vertex(x-31,y-48);
   vertex(x-24,y-60);
   vertex(x-14,y-66);
   vertex(x-15,y-54);
   vertex(x-6,y-59);
   vertex(x-5,y-54);
   vertex(x+24,y-49);
   vertex(x+43,y-38);
   vertex(x+39,y-33);
   vertex(x+44,y-21);
   vertex(x+29,y-24);
   vertex(x+31,y-20);
   vertex(x+11,y-30);
   vertex(x+16,y-20);
   vertex(x-8,y-33);
   vertex(x-3,y-23);
   vertex(x-25,y-35);
   endShape();
   
  //draw paden eyeframes
   beginShape();
   vertex(x-12,y+1);
   vertex(x-26,y+5);
   vertex(x-30,y-13);
   vertex(x-14,y-16);
   vertex(x-12,y+1);
   endShape();
   
     beginShape();
     vertex(x+3,y-1);
     vertex(x,y-16);
     vertex(x+16,y-18);
     vertex(x+17,y-1);
     vertex(x+3,y-1);
     endShape();
      line(x-13,y-8,x+2,y-10);
   
  //draw paden brow
  line(x-26,y-21,x-21,y-23);
  
  //draw paden nose
  triangle(x-2,y+1,x+1,y+11,x-8,y+10);
  
  //draw paden cheeks
  ellipse(x+14,y+14,3,3);
  ellipse(x-17,y+19,3,3);
  
  //draw paden mouth
  if(mousePressed) {
   line(x-9,y+23,x-6,y+21);
   line(x-6,y+21,x-1,y+22);
  }
  
  else {
   line(x-6,y+22,x-1,y+18.5);
   line(x-1,y+18.5,x+6,y+19);
  }
  

  //conditional if mouse in one of three areas on screen eyes move variously
  stroke(3);
  if (mousePressed) {
  point(x-23,y);
 point(x+10,y-4);
} else if (mouseX < 2*width/3) {
  point(x-23,y-6);
 point(x+10,y-11);
} else if (mouseX < width/3) {
 point(x-26,y-7);
 point(x+5,y-11);
} else {
 point(x-16,y-7);
 point(x+14,y-12);
}
  //draw paden eyedots
}

