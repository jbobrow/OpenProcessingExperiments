
void setup(){
size(600,600);
smooth();
colorMode(HSB,360,100,100,100);

}


void draw(){
for(int i=0;i<500;i++){
 noFill();
strokeWeight(.4); 


float colorValue = map(i,0,100,0,300);
 stroke(colorValue,100,100,100);
  ellipse(mouseX,mouseY,i*5,i*5);
 
}
}

