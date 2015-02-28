
int circ_x=20;
int circ_y=20;
int move_amount=10;
void setup() {
  size(600,600);
  
}

void draw(){
}

void mouseDragged() {
  fill(random(256),random(256),random(256));


//void mouseReleased() {
//  background(255,255,255);
//}
}
void keyPressed(){
  if(key=='a'){
   rect(mouseX, mouseY, 40,40);
  }
  else if (key=='d'){
  ellipse(mouseX,mouseY,40,40);
  }
  else if (key=='s'){
  ellipse(mouseX,mouseY,10,10);
  }
   else if (key=='f'){
  ellipse(mouseX,mouseY,100,100);
  } 
  else if (key=='g'){
  PImage b;
  b = loadImage("odb.jpg");
  image(b, mouseX,mouseY);
  }
}


