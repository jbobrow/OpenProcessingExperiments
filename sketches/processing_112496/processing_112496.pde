
void setup() {
 size(600, 300);
 background(#EDEDED);
  rectMode(CENTER);
  rect(150,100,150,40);
  rect(150,200,150,40);
textSize(32);
fill(#9B9691);
text("8       off", 150, 110);
fill(0);

}

void draw() {
  
 if(keyPressed) {
 if (key == '2' || key == '2'){
 fill(#F7A239);
 }
 } else if(key == '8' || key == '8'){
 fill(#9B9691);
 }
 ellipseMode(CENTER);
 ellipse(500, 150, 70, 70);
 textSize(32);
text("2       on", 150, 210); 

 if(keyPressed) {
 if (key == '2' || key == '2'){
 fill(#F7A239);
 }
 } else if(key == '8' || key == '8'){
 fill(#9B9691);
 }
 ellipseMode(CENTER);
 ellipse(500, 150, 70, 70);
 textSize(32);
text("2       on", 150, 210); 
}




