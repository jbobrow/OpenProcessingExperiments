
PImage img0; 
PImage img1;

void setup(){
  size(400,400);
  img0 = loadImage("1.png");
  img1 = loadImage("a.png");
  smooth();
  noCursor();
  stroke(50);
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw(){
  image(img0, 0, 0, 400, 400);

  translate(mouseX, mouseY);
  rotate( mousePressed?-HALF_PI:0 );
  image(img1, 0, 0, 85, 120);
  
  if (mouseX > 0 && mouseX < 400 && mouseY > 0 && mouseY < 150){
    if (mousePressed == true){  
      strokeWeight(3);
      stroke(100, 255, 100, 200);
      fill(100, 255, 100, 50);
      triangle(-179, -50, -179, 0, -160, -25);
      triangle(-181, -50, -181, 0, -200, -25);
    
      triangle(-179, 0, -179, 50, -160, 25);
      triangle(-181, 0, -181, 50, -200, 25);;

      line(-180, 0, -220, 0);
      stroke(150, 100, 50);
      fill(150, 100, 50, 50);
      rotate( mousePressed?+HALF_PI:0);
      arc(0, 245, 50, 50, -PI, 0); 
    }
  }
}






