
PFont coffee;
String tea = "M2M";
 
void setup(){
  size(250,250);
  background(255);
  coffee = createFont("Zapfino",50);
}
 
  
void draw(){
  fill(0,90); 
  stroke(255,90);
  strokeWeight (40);
  textFont(coffee, 50);
  fill(random(255),10);
  text(tea, mouseX, mouseY);
   
}


