
int brush=1;
int pointillize = 30;
int anzahl = 10;


void setup(){
 background(0,0,0);
 noCursor();
 size(1000, 400);
 smooth();
 
}
  

  
void draw(){
  
  float c = 255;
  
  noFill();
  fill (255,255,255,120);
  noFill();
  stroke(255,255,255,120);
  ellipse (mouseX, mouseY, 10,10);

  //////colors///////////
  
   if(keyPressed){
   if (key == CODED) {
    if (keyCode == KeyEvent.VK_F1)
    background(c);
    }
   }
  
   if(keyPressed){
   if (key == CODED) {
    if (keyCode == KeyEvent.VK_F2)
    background(c);
    }
   }
   
   
    if(keyPressed){
   if (key == CODED) {
    if (keyCode == KeyEvent.VK_F1)
    background(0,0,0);
    }
   }
/////////Brushes/////////
 
  if(mousePressed){
    if(brush == 1){
  //  background(0,0,0);
   
    strokeWeight(random(0.5,1.5));
    stroke(255,255,255);
    fill(0, 0, 0,0);
    ellipse(mouseX, mouseY, mouseX, mouseY);
    ellipse(mouseX, mouseY, mouseY, mouseX);
    fill(0, 0, 0);
    noFill();
    ellipse(mouseX, mouseY, random(75,250), random(75,250));
    ellipse(mouseX, mouseY, random(5,100), random(5,100));
    
  }
 
      
    if(brush == 2){
    strokeWeight(random(0.5,1.5));
    stroke(255);
    fill(random(1,255),random(1,100));
    rect(mouseX, mouseY, mouseX+100    , mouseY+100);
    //ellipse(width-mouseX, height-mouseY, mouseX-r2, mouseX-r2);
  }
  
   
    if(brush == 3){
       
  int rand = int(random(-100-100));
  
  noStroke();
  
  ///RANDOM2//////
  int x = int(random(width))*rand;
  int y = int(random(height))*rand;
  
  
  int x2 = int(random(width));
  int y2 = int(random(height));
  
  
  int loc = x2 + y2*width;
  
  ///// RGB /////
  loadPixels();
  float r = red(pixels[loc]);
  float g = green(pixels[loc]);
  float b = blue(pixels[loc]);

  tint(255,anzahl);

  ////////// Shape 1 ////////
  fill(r,g,b,0);
  rect(y,y+3,pointillize,pointillize); 
  ellipse(x,y,pointillize,pointillize);
  stroke (255,255,255);
  line (x,y,0,0);
  line (x,y,0,height);
  stroke (255,255,255);
  line (x,y,width,0);
  line (x,y,width,height);

 
  beginShape();
  fill (r,g,b,30);
  vertex(x, y);
  vertex(0, height);
  vertex(width, height);
  endShape(CLOSE);
  
   beginShape();
  fill (r,g,b,10);
  vertex(x, y);
  vertex(0, 0);
  vertex(width, 0);
  endShape(CLOSE);

   beginShape();
  vertex(x, y);
  vertex(0, 0);
  vertex(0, height);
  endShape(CLOSE);
  
   beginShape();
  vertex(x, y);
  vertex(width, 0);
  vertex(width, height);
  endShape(CLOSE);
}
  
 
         
 
   
   
  
  }
   
   
 
////////////KEYS//////////// 
  if(keyPressed){
 
  if (key == '1') {
  brush = 1 ;
       }
 
  if (key == '2') {
  brush = 2 ;
       }
   
  if (key == '3') {
  brush = 3 ;
       }
   

 
 
  }
}


