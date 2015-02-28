
void setup(){
  size(400,400);
  smooth();
  frameRate(30);
}

void draw(){
  //drawing the character
  background(255);
  rectMode(CENTER);
  rect(width/2,height/2+50,100,200);
  ellipse(width/2,height/2-100,100,100); 
  ellipse(width/2+25,height/2-115,10,10);
  ellipse(width/2-25,height/2-115,10,10);
  line(250,150,290,220);
  line(150,150,mouseX,mouseY);
  ellipse(width/2,height/2-75,30,10);
  
  // If user clicks, the character disappears
   if (mousePressed){
   rect(100,100,1000,1000);
  }
//Mouse position for reference
  print("X:"); println(mouseX); print("Y:"); println(mouseY);
}
