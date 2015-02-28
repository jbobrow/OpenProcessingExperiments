

void setup(){
  size(400,400);
  colorMode(HSB);
}
void draw(){
for(int i=0;i<40;i=i+1){
  for(int j=0;j<40;j=j+1){
    
   fill(j+164,255,230);
    rect(i*10,j*10,8,8);
    stroke(i+180,255,230);
    strokeWeight(2);
  line (mouseX, mouseY, pmouseX, mouseY-100);

}
}
}
