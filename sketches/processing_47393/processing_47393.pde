
PImage room;

void setup(){
  size(900,650);
  room = loadImage("bedroom1.png");

}

void draw(){
  println(mouseX);
if (mouseX > width/2){
  fill(77,186,255);
  rect(200,100,300,300);
  fill(252,255,0);
  noStroke();
  smooth();
  ellipse(300,190,75,75);
               image(room,0,0);

  }else{
   fill(28,34,82); 
   rect(200,100,300,300);
  fill(255,255,255);
  noStroke();
  smooth();
  ellipse(300,190,75,75);  
             image(room,0,0);

}
}

