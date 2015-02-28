
void setup() {
  size(400,400);
  
rectMode(CENTER);
background(0);
}

    //in void draw erfolgt kompletter zeichenprozess
void draw () {
  fill(255);
 ellipse(width/2,height/2,mouseX,mouseY);
 
 if(mousePressed){
  fill(0);
   ellipse(width/2,height/2,mouseX,mouseY);
 }

}
  
