
// This Sketch Code creates a two-d plant charcter
int p = 50;
int w = 255;
int b = 0;
int h = 145;
int g = 595;
int m = 80 ;

//The Size of the sketch and background color
void setup(){
  size(600,600);
  //background(w,w,w);
}
// enlarges hat
void draw() {
  background(w,w,w);
if(mousePressed == true){
    h = h - 1;
  }
// grows grass
if(keyPressed == true){
  g = g - 1;
}
// for some odd reason shrinks grass only within Wayne vvv
else {
  g = g + 1;
if(g >= height){
  g = height;
  }
}
// mouth shrinks an grows
if(m < 130){
  m  = m + 1;
}
if(m >= 130){
  m = - m - 1;
}


//else if (keyPressed == true){
//    h = h++;
//}
 

    
  stroke(0,0,0);
  strokeWeight(1);
  //Body and fill(picks random colors)
  fill(50,130,20);
  ellipse(300,300,200,250);
  
  //Mouth and fill(black)
  fill(b,b,b);
  ellipse(300,320,m,50);
  
  //Eyes and fill(white)
  fill(255,255,255);
  ellipse(277,250,40,60);
  ellipse(317,250,40,60);
  
  //Pupils and fill(random)
  fill(random(p),random(p), random(p), random(p));
  ellipse(277,258,30,35);
  ellipse(317,258,30,35);
  
  //pot and fill(brown)
  fill(160,82,45);
  quad(200,395,400,395,360,550,240,550);
  noFill();
  
  //Hat and fill (black)
  rectMode(CORNERS);  
  fill(0,0,0);
  rect(245,165,355,h);
  rectMode(CORNER);
  rect(200,180,200,20);
  noFill();
  
  //Stripe and fill(red)
  fill(0,0,205);
  rect(245,165,110,15);
  noFill();
  
  //Draw Grass
  for (int x = 0; x<= width; x += 10){
    strokeWeight(5);
    stroke(0,128,0);
    line(x,height,x,g);
    noStroke();
  }
  
}






