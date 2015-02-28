
float w;
float h;
float c;
float d; 
//float opacity;

void setup () {
  w = width/2;
  h = height/2;
  
  c = random(1,255);
  
  //opacity = ((mouseX-pmouseX)+(pmouseY-pmouseY))*10;
  size(600,400);
  background(255,30);
  smooth();
  strokeWeight(1);
  stroke(c,c);
  translate(w,h);
  scale (h*1.4);
  
}

void draw() {
  
  line(0,0,mouseX,mouseY);
 


  


 
}

