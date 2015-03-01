
void setup() {
  size (600,600);
 
  background(10,10,100);
 
}

void draw() {
      
  background(0);
      
//_________________________________________________________ Background Image Test
  noFill();
    PImage Eye;
 Eye = loadImage("Dude pointing.png");
      image(Eye,25,425);
//_________________________________________________________
  
  fill (150,150,150);
  noStroke();
  text("Walk here...",300,435);
  rect (0,500,width+width,400);
  drawStickman(mouseX,mouseY);
  

}

void drawStickman (int x,int y) { 
  fill(255);  //STICKMAN
  stroke(255);
  ellipse (x,y,50,50);
  line (x,y+25,x,y+100);
  line (x,y+100,x+25,y+125);
  line (x,y+100,x-25,y+125);
  line (x-50,y+50,x+50,y+50);
  if (mousePressed) {
    fill (random(255),0,0);
    noStroke();
    ellipse (x-10,y-10,10,10);
    ellipse (x+10,y-10,10,10);
    ellipse (x,y+10,20,15);
    
}
if (x > width/2) { //SCARY FACE WHEN YOU GO PAST MID-SCREEN
  background (200,0,0);
  fill (255);
  ellipse (x,y,height,width);
  fill(random(255),0,0);
   ellipse (x-100,y-100,100,100);
    ellipse (x+100,y-100,100,100);
    ellipse (x,y+100,150,100);

}loop();
}

