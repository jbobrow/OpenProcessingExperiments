
//Twk by myself
//Random colors and mousePressed results in a oase
color c1,c2,c3; // FÃ¼llfarbe, Linienfarbe, Hintergrundfarbe
 
void setup() {  
  size(400,400);
  strokeWeight(4); 
  colorMode(HSB, 360,100,100);
  defineColors();
  background(c2);
}
 
void draw() {
  defineColors();
  fill(c1);
  stroke(c3);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
}
   
void defineColors() {
  
   //c1 = color(204,155,81);
   //c2 = color(235,194,101);
   //c3 = color(255,211,35); 
   
   c2 = color(42,57,92); //92
   
   //If MousePressed Oase
   if(mousePressed){
     c1 = color(181,72,random(65,85)); //80
     c3 = color(158,53,random(75,800)); //100
   }else{
     c1 = color(36,60,random(75,95)); //80
     c2 = color(42,57,92); //92
     c3 = color(48,86,random(95,100)); //100
   }
}
