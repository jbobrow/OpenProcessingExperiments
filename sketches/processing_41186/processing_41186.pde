
void setup(){
  frameRate(5);
  PImage deer;
deer = loadImage("deer.png");


  size(500,500);
  fill (0, 255, 255);
  rect (0, 0, 500, 300);
  
fill(random (70, 85), random (50, 85), 30, 40);
rect (0, 300, 500, 200);



stroke(255);
line(0, 300, 500, 300);
}
void draw(){
  
  
   PImage deer;
deer  = loadImage("deer.png");
   
    deer.resize(mouseY/2, mouseY/2);
  
    image(deer, mouseX, mouseY);
    
    
   
float[] treeXs = new float[300]; //i want 400 of these trees
for(int i = 0; i < 200; i++){
   treeXs[i] = random(0, 230); //i want them to be somewhere random between 0 and 230 (across screen)
}

for(int i = 200; i < treeXs.length; i++){ //for the rest of screen
   treeXs[i] = random(270, 500); //somewhere randomly placed treetrunks
}



for(int i = 0; i < treeXs.length; i++){
  println(treeXs[i]);  //tell me where they are
  stroke(random(100, 130), random(70,90), random(50),150); //draw trunk colors with range of colors

  float treetop =  random(100, 200); //for ellipse height

  strokeWeight(random(1, 2) ); //trunk width
  line(treeXs[i], 470, treeXs[i], treetop); //making actual trunk lines now we know width, color, where
  
  noStroke();
  fill(random(20, 255), random (0, 75), random(0,40)); //treetop color
  ellipse(treeXs[i], treetop, random(50, 60), random(70,120)); //treetop locations and size
  
 
   
  }
  
}

