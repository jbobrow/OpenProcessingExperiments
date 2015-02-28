
float a = 0.0;
float s = 0.0;

void setup(){
  size(700,700);
  //the below thing is the color of the background yo
  background(#7CAEC6);  
}

void draw(){
a = a + 0.04;
  s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s); 
  fill(51);
  rect(0, 0, 50, 50); 
  
  translate(75, 0);
  fill(255);
  scale(s);
  rect(0, 0, 50, 50);       
  
  background(#1AB7A8);
  stroke(1022);
  fill(mouseX+#B71A5B);
  ellipse(mouseX,mouseY,420,410);
  rect(mouseY,mouseX,420,410);
  
  if(mousePressed){
    stroke(2);
    fill(40);
    rect(mouseX,mouseY,20,30);
  }
  else{
    size(700,700);
    stroke(2);
    fill(40);
    ellipse(mouseX+20,mouseY+20,90,200);
  }
}


