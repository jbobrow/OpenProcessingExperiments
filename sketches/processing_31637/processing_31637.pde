
void setup(){

size (500,500);
smooth ();
background(0);
strokeWeight(2);
for (int y=0; y<=500; y+=20){
for (int x=0; x<=500; x+=20){
  stroke (x,y,255,30);
  line(500,0,x+20,y+20);
}
}

}
void draw(){

}
                
