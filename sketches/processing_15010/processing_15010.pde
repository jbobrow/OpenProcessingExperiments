
   void setup(){
size(200,200);
background(255);  
}

void draw(){
  strokeWeight(1);
for(int x=20; x<180; x=x+3){
for(int y=20; y<180; y=y+3){
point(x,y);
}
}
noStroke();
rect(60,60,80,80);


}
