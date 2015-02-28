
PFont ffont;

void setup() {
  frameRate(1);
  size(600, 600);
  
  ffont = loadFont("HelveticaNeue-48.vlw");
  textFont(ffont, 48);
  
  
}

void draw() {
  
  int[] numbers = {second(), minute(), 255, 150, hour()};
  int a = numbers[2];
  int b = numbers[3];
  int s = numbers[0];
  int m = numbers[1];
  int h = numbers[4];
  
//  background(h);
  if (h == 1 || h == 13) {
    background (#F5D3E8); //pink
  }
  
  else if (h == 2 || h == 14) {
    background (#064D1C); //green
  }
  
  else if (h == 3 || h == 15) {
    background (#2C0BB4); //blue
  }
  
  else if (h == 4 || h == 16) {
    background (#B40B66); //fuschia
  }
  
  else if (h == 5 || h == 17) {
    background (#F9FA21); //yellow
  }
  
  else if (h == 6 || h == 18) {
    background (#A81BE0); //purple
  }
  
  else if (h == 7 || h == 19) {
    background (#E0771B); //orange
  }
  
  else if (h == 8 || h == 20) {
    background (#756074); //grape
  }
  
  else if (h == 9 || h == 21) {
    background (#0D8585); //turquoise
  }
  
  else if (h == 10 || h == 22) {
    background (#4DF20C); //lime
  }
  
  else if (h == 11 || h == 23) {
    background (#040C4D); //midnight
  }
  
  else if (h == 12 || h == 00) {
    background (#4D0404); //maroon
  }
  
  
  smooth();
  strokeWeight(1);
  fill(random (a), random (b), random (a));
  ellipse(b-50, s*10, b, s*3);
  
  
  fill(m*2, 255-m*2, 255-m);
  strokeWeight(m*2.5);
  rect(b+150, 200, b+50, b);
  
  if(mousePressed){
   
  fill(255);
  textFont(ffont, 24);
  textAlign(CENTER);
  text(h,90,550);
  text(m,250,550);
  text(s,410,550);
  
  text("h",120,550);
  text("m",280,550);
  text("s",440,550);
  }
  
  
  
  
  
  
  
  
  
 
  
}

