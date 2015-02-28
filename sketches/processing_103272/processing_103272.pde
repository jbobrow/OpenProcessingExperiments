
//Gil Gerstel
//July 8th 2013
//key pressing
//// References: Sample code from Digital Media Academy

void setup() {
  size (200, 200);
}

void draw() {
  background(168, 234, 233); // why is this in draw()?

  if (keyPressed == true) {
    if (key=='g'){
    fill(100,0,0) ;
  ellipse(100,40,30,30) ;
}
if (key =='a' || key == 'b') {
fill(20,50,200) ;
ellipse( 100,40,30,50) ;
}
    fill(13, 185, 14);
    textSize(20);
    text("Key Pressed!", 40, 100);
 textSize(50); 
 text(key, 90, 150); //display the key value at position (90, 150)
}
}
