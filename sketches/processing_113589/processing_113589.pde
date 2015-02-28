
void setup(){
  size(500,500);
  background(0);
  
}



void draw(){
  
  if(mouseX< 200){
    fill(254,255,0);
  }else if (mouseX>250 && mouseX<500){
  fill(0);
  }
  
  else{
    fill(255);

  }
noStroke();
triangle(100,197,166,303,32,303);
triangle(298,197,365,303,231,303);



/*2*/

  if(mouseY< 200){
    fill(255);
  }else if (mouseY>250 && mouseY<250){
 color topColor = color(250,130,40);
  color buttomColor = color(0);
 
  beginShape(TRIANGLE);
    fill(topColor);
      vertex(0, 0);
    fill(topColor);
      vertex(width, 0);
    fill(topColor);
      vertex(width, height);
    fill(buttomColor);
      vertex(0, height);
  endShape(CLOSE);
}  
  
  else{
    fill(random(255),random(255),random(255));

  }
noStroke();
triangle(134,197,268,197,201,303);
triangle(332,197,468,197,400,304);


}


