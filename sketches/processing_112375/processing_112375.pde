
void setup(){
  size(400,400);
  background(255);
}
void draw(){
  background(255);
  //noStroke();
  fill(203,193,193);
  stroke(255,0,0,150);
  strokeWeight(1);
  rect(width/8,50,100,100);
  if(mousePressed == true){
    fill(255,0,0);
  }else{
  fill(250,15,60,10);
  }
  stroke(250,0,0);
  strokeWeight(1);
  rect(mouseX-100, mouseY-100,mouseX-mouseX+200,mouseY-mouseY+200);
  line(50,50,mouseX-100,mouseY-100);
  strokeWeight(1);
  line(150,50,mouseX+100,mouseY-100);
  strokeWeight(1);
  line(50,150,mouseX-100,mouseY+100);
  strokeWeight(1);
  line(150,150,mouseX+100,mouseY+100);
  strokeWeight(1);
  println(mouseX + " " +mouseY);
}


