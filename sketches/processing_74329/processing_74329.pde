
void setup(){
  
  size(500, 500);
  background(200);
  smooth();
  
  fill(60);
  rect(0,0,500,300);
  
  line(0, 300, 500, 300);
  
  fill(0);
  rect(10,0,10,450);
  rect(480,0,10,450);
  
  rect(30,-10,10,450);
  rect(460,-10,10,450);
  
  line(200, 300, 100, 500);
  line(300, 300, 400, 500);
  noStroke();
}

void draw(){

  if(mousePressed && mouseY > 250){
    //stroke(0);
    fill(0, 10);
  } else if (mouseY < 250){
    //noStroke();
    noFill();
  }

rect (mouseX, mouseY, 30, 50);
ellipse (mouseX +15, mouseY -20, 20, 30);
ellipse (mouseX +15, mouseY +40, 20, 80);
ellipse (mouseX +15, mouseY +40, 60, 10);


rect (mouseX +50, mouseY +50, 30, 50);
ellipse (mouseX +65, mouseY +30, 20, 30);
ellipse (mouseX +65, mouseY +90, 20, 80);
ellipse (mouseX +65, mouseY +90, 50, 15);

}
