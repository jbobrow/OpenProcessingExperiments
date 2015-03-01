
void setup(){
size(1000,1000);
background(0,0,0);
colorMode(HSB);
}
void draw(){
  
for(int i=600; i>0; i=i-25) {
  
 println(i);
 fill(i/2.5,255,255,mouseY);
 stroke(195,100,218,mouseX);
float del=mouseX/2;
 ellipse(width/2,height/2,(del*i),i);
}
}

 
