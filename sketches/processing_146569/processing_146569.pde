
void setup (){
  size (500,500);
  smooth();
}
void draw(){

  
  if (mousePressed) {
  
  if (mouseX<250) {
    
  fill(mouseX);

  } else {

    fill(250-(mouseX-250)); 

  }
    ellipse(mouseX,mouseY,50,50);
  }

}

void keyPressed() {
  int m = month();
  int d = day();
  int h = hour();
  int i = minute();
  int s = second();
   // println(m+"."+d+"."+h+"."+i+"."+s);

save(m+"."+d+"."+h+"."+i+"."+s+".jpg");

 if (mousePressed) {
   
 }else{
text("Saved.",20,20);

 }
}
