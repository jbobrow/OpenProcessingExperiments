
float one;
 
float two;
 
void setup () {
  size (600, 600);
  smooth ();
  rectMode(CENTER); 
  background (255);
 
   
 
}
 
void draw () {
  noStroke ();
 fill(250,10);
  rect (0, 0, 400, 400);
   
   
  stroke (0,random(100,200),0,random(255));
  if (one > 255) one = 0;
  else two ++;
   
  float nX = map (sin(radians(two)), -1, 1, 0, 600);
  one += 5;
     
  bezier (300, 0, nX, 300, 600-nX, 300, 300, 600);
 
  stroke (0, random(100,200), 0,random(255));
  bezier (0, 300, 300, 600-nX, 300, nX, width, 300);
   fill(144,50,80,random(100));
 noStroke();
   ellipse(400,402,20,20);
  ellipse(400,202,20,20);
    ellipse(200,402,20,20);
  ellipse(200,202,20,20);
  fill(8,177,171,random(100));
triangle(0,0,290,0,0,290);
triangle(310,0,600,0,600,290);
triangle(0,310,0,600,290,600);
triangle(310,600,600,600,600,310);  
}
void keyPressed(){
  if(key=='s'){
        saveFrame();
  }
}
