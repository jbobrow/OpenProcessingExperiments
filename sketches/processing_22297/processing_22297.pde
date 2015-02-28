
void setup(){
  
  size(500,500);
  background(250,150,0);
}  

void draw(){
  
  noStroke();
  
  fill(250,150,0,20);
  rect(0,0,500,500);
  
  stroke(0,100);
  line(mouseX,mouseY,mouseX-50,mouseY-50);
  
  noStroke();
  

  
  fill(255,255,0);
  ellipse(mouseX-50,mouseY-50,(mouseX/random(200)),mouseY/random(200));
  
  fill(255,0,0,random(150));
  ellipse(mouseX-50,mouseY-50,(mouseX/random(200)),mouseY/random(200));
  

  
  

}

                
                                
