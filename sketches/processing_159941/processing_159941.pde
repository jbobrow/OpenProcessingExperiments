
float x = 0;
float y = 0;
 
void setup() {
  size(600,600);
  background(66, 131, 52);
  smooth();
}
 
void draw(){
  smooth();
  noStroke();
  fill(255,188,198);
   
  int diameter = 40;
 for (int x=25; x<600; x+=50) {
    for (int y=25; y<600; y+=50) {
  
     
  ellipse(x,y,diameter+40,diameter);
 }
}
 
 fill(13,13,12);
     
    int diameter1= 10;
 for (int x=25; x<600; x+=50) {
    for (int y=5; y<600; y+=20) {
  
     
  ellipse(x,y,diameter1+40,diameter1);
    }}
     
    fill(247, 247,15);
    for (int x=25; x<600; x+=50) {
    for (int y=10; y<600; y+=20) {
  
 
  ellipse(x,y,diameter1+40,diameter1);
 } }
  
 fill(250, 76, 82);
 for (int x=10; x<600; x+=10) {
 for (int y=20; y<600; y+=20) {
   
   ellipse(x,y,diameter1, diameter1);
 }}
  
}



