


void setup(){
size(455,455);
background(0);
frameRate(1);

}
void draw(){

  
  float s = map(second(),0,59,0,455);

  smooth();
 stroke(255);
  strokeWeight(2);
  line (s,0,s,455);
noStroke();
fill(0,20);
rect(0,0,width,height);
fill(100,10);

for(int x=35;x<width;x=x+35){
  for(int y=35;y<height;y=y+35){
  float r = random(50);
  stroke(0.50);
  strokeWeight(0.5);
  ellipse(x,y,r,r);
  

  
    
  }
}

fill(180,60);
for(int x=35;x<width;x=x+35){
  for(int y=35;y<height;y=y+35){
  float r = random(30);
  
  ellipse(x,y,r,r);
  }
}

fill(220,70);
for(int x=35;x<width;x=x+35){
  for(int y=35;y<height;y=y+35){
  float r = random(65);
 
  ellipse(x,y,r,r);
  
  }
  
  }
  
  
  




fill(255);


/*PFont font;
font=loadFont("HighTowerText-Italic-60.vlw");
textFont (font);
textSize(70);

textAlign(CENTER, BOTTOM);
text("let's", 400, 190); 
textAlign(CENTER, CENTER);
text("go", 400, 200);
textAlign(CENTER, TOP);
text("shine",400, 250); 
*/



}

