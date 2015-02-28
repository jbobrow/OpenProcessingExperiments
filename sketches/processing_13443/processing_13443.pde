
void setup(){
size(640,480);
smooth();
}

void draw(){
  background(214,250,210);
  
  stroke(200,0,0);
  strokeWeight(2);
  fill(160,135,177);
  quad(499,423,283,146,69,63,264,21);
  println("x:" + mouseX + "y" + mouseY);
  
  ellipse(56,46,55,12);
  
  line(30,20,613,10);
  stroke(126);
  line(134,27,518,448);
  stroke(255);
  line(42,209,556,209);
  line(120,279,480,279);
  
  stroke(0);
  strokeWeight(10);
  line(577,48,577,378);
  
  strokeWeight(5);
  ellipse(177,243,12,12);
  
  

 
  
}

