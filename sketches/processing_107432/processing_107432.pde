
void setup () {
  size(640,360);
  stroke(255,100);
   
}
 
void draw () {
  background(0,0,0);
  for(int jalea=0; jalea<640; jalea++){
  line(jalea*3,120,jalea*3,240);
  }
}
