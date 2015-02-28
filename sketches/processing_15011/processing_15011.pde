
void setup(){
size(200,200);
background(255);  
}

void draw(){
  strokeWeight(1);
for(int x=10; x<190; x=x+1){
point(x,x);
point(200-x,x);
}

}
