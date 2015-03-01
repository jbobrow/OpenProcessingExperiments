
//import processing.serial.*;
//Serial myPort;
float ardu=0; 
float slider=0; 
float sliderr = 15;
int val=11; 
float rectY = 60; 
void setup() {
  size (600, 300);
//  myPort = new Serial(this, "COM3", 9600);
//  delay (2000);
} 
void draw() {  
  background(133); 
  strokeCap(SQUARE);  
  strokeWeight(1);
  stroke (50, 30);
  fill (200, 220, 240);  
  rect (10, 100, 520, 40, 3); 
  for (int i =0;i<6;i++) { 
    fill (40, 50, 60, 50-i); 
    rect (10, 100, 520, 25+2*i, 3);
  }   
  fill (0);
  rect (13, 103, 515, 33, 3);
  strokeWeight(18);
  stroke (255, 169);
  line (13, 119, 527, 119);  
  fill(255);
  for (int i =0;i<6;i++) {
    val =  0+50*i; 
    fill(0);
    text(val, 6+100*i, 70); 
    fill(255);
    text(val, 7+100*i, 70);  
    strokeWeight(1);
    stroke(255);  
    line (15+100*i, 70, 15+100*i, 88 );
  }   
  for (int t =0;t<26;t++) {
    line (15+20*t, 80, 15+20*t, 88 );
  }
  for (int t =0;t<256;t++) {
    line (15+2*t, 86, 15+2*t, 88 );
  }  
  strokeWeight(1);
  stroke (50, 30);
  fill (200, 220, 240);  
  rect (540, 100, 45, 39, 3); 
  for (int i =0;i<6;i++) { 
    fill (40, 50, 60, 50-i); 
    rect (540, 100, 45, 22+2*i, 3);
  } 
  fill (0);
  rect (542, 103, 42, 33, 3);
  strokeWeight(18);
  stroke (255, 169);
  line (13, 119, 527, 119);
  update(mouseX, mouseY); 
  strokeWeight(10);
  stroke(255, 0, 0); 
  line (sliderr, 95, sliderr, 145);  
  stroke(160, 0, 0, 80);
  line (sliderr-5, 102, sliderr-5, 150); 
  strokeWeight(2);
  stroke(233, 233, 230, 150);
  line (sliderr+3, 94, sliderr+3, 143);
}
void update(int x, int y) {
  if ( (overRect(slider-120, rectY, 440, 120))&& mousePressed ) {
    slider  = mouseX-0; 
    if (sliderr <  slider-1  ) {  
      if (mouseX/sliderr<1.1 ) {
        sliderr =  sliderr+ 1;
      } 
      else { 
        sliderr =  sliderr+ 6;
      }
    }      
    if (sliderr >  slider+1  ) {  
      if (sliderr/mouseX<1.3 ) {
        sliderr =  sliderr- 1;
      } 
      else { 
        sliderr =  sliderr- 6;
      }
    }     
    if (slider  <  15) {
      sliderr  = 15;
    }
    if (slider  >  530) {
      sliderr  = 530;
    } 
    ardu = map(sliderr, 15, 530, 0, 255);
  }
  fill(255, 100, 100, 205); 
  int xx =0; 
  if (ardu>100) {
    xx =-7;
  }
  if (ardu<10) {
    xx =7;
  }
  text((int)ardu, xx+560, 125);
  //println ((int)ardu);
 // myPort.write ((int)ardu +";"); //send to arduino
}
boolean overRect(float x, float y, float width, float height) {
  if (mouseX >= x && mouseX <= x+width &&
    mouseY >= y  && mouseY <= y+height) {
    return true;
  }
  else {
    return false;
  }
}
