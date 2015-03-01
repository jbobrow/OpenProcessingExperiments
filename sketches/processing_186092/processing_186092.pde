
void setup() {
  size(960, 580);
  stroke (#FFFFFF);
}
void draw() {
background(#050005);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  //bottom right
  if (mouseX > width/2) 
  if (mouseY > height/2){
      textSize(20);
// Date and Time
String one = "Time:" + hour() + ":" + minute () + ":" + second();
text(one, 640, 435);

String two = "Date:" + day() + "/" + month () + "/" + year();
text(two, 635 , 460);
  }

  //top left
  if (mouseX < width/2) 
    if (mouseY < height/2){
      background(0.0);
    line(width/2, 0, width/2, height);
    line(0, height/2, width, height/2);
// Expanding square
    float r1 = map(mouseX, 10, width/2, 10, height/2);

    fill(r1);
    rect(120, 0, r1, r1);
  }

  //top right
  if (mouseX > width/2) 
    if (mouseY < height/2){

      // fast polygon  
      fill(#FFFFFF);
    pushMatrix();
    translate(729, 145 );
    rotate(frameCount / 20.0);
    beginShape();
    vertex(42, 1); 
    vertex(85, 32);
    vertex(69, 81);
    vertex(16, 81);
    vertex(0, 32);
    vertex(42, 1);
    endShape();
    popMatrix();

    // slow polygon
    stroke(#FFFFFF);
    fill(#030000);
    pushMatrix();
    translate(729, 145);
    rotate(frameCount / -80.0);
    beginShape();
    vertex(42, 1); 
    vertex(85, 32);
    vertex(69, 81);
    vertex(16, 81);
    vertex(0, 32);
    vertex(42, 1);
    endShape();
    popMatrix();

    //med speed polygon
    fill (#C1B9B9);
    pushMatrix();
    translate(729, 145);
    rotate(frameCount / -20.0);
    beginShape();
    vertex(42, 1); 
    vertex(85, 32);
    vertex(69, 81);
    vertex(16, 81);
    vertex(0, 32);
    vertex(42, 1);
    endShape();
    popMatrix();
  }

  //bottom left

  if (mouseX < width/2){
    if (mouseY > height/2) 
rect(random(480),435,5, 5);  }
  
}


    

