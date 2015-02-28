


void setup(){
for(int z=2; z<=20;z+=2){
size (500,500);
smooth ();

background(0);
strokeWeight(z);

for (int y=0; y<=500; y+=10){
for (int x=0; x<=500; x+=20){
  stroke (x,y,255);
  line(x,y,x+10,y-10);
}
}
}
 
for(int y=0; y<=500; y+=20){
for(int x=0; x<=500; x+=30){
  stroke(y,x,255);
  line(x,y,x+10,y+10);
}
}
}
void draw(){

endRecord();
}
                
                
