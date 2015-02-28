
void setup(){
size (500,500);
background (255);
noStroke();
  fill(0);
 rect(10,10, (width-20)/2, height-20);
   fill(200);
  rect(width/2,10, (width-20)/2, height-20);
smooth ();
}

void draw(){

 
    noStroke();
 
  if (mousePressed && (mouseButton == LEFT)){
  stroke(200);
  strokeWeight (10);
  }
if (mousePressed && (mouseButton == RIGHT)){
  stroke(0);
  strokeWeight (10);
}

   

 line(mouseX, mouseY, pmouseX, pmouseY);

}






