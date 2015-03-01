
boolean premut=false;

void setup(){
  size(500, 500);
}

void draw(){
  background(0,0,0);
  println(mouseX + ":" + mouseY);
  fill (255,0,255);
  ellipse (250,250,250,300);
  fill (255,255,255);
  rect (280, 175, 50, 50);
  rect (180, 175, 50, 50);
  arc (250, 290, 150, 50, 0, PI);
  if (premut == true){
    fill (255,0,0);
     arc (300, 290, 30, 100, 0, PI);
  }
  
}

void mousePressed (){
  if (premut == false){
  premut = true;
  }
  else {
   premut = false; 
  }
}




