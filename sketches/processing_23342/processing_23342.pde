
float angle = random(0.0,40.0);
float noob = random(0,6);

void setup(){
 size(screen.width,screen.height);
 smooth();
 background(255,255,255);
 //saveFrame("file.jpg");
}


void draw(){
 //draw only if mouse is pressed
 if (mousePressed == true) {

 //draw on mouse
 translate(mouseX, mouseY);

 rotate(angle);
 float w = random(0, 175);
 triangle(w,99,110,25,0,-30);
 //ellipse(0,0,-30,-60);

 //draws with (random) color
 fill(random(30,150),random(0,90),random(175,255),random(150,255));
 strokeWeight(noob);
 //fill(random(255),random(255));
 angle += 0.4;

 //strokeWeight(.001);
 }

}

//blur
void keyPressed(){
 
if (key=='s');{
saveImage();
}
  if(key == 'i'){
 filter(INVERT);
 }
 if(key == 'b'){
 filter(BLUR, 2);
 }
 if(key == 'g'){
 filter(GRAY);
 }
 
 if(key == 'e'){
 filter(ERODE);
 }

}



