
void setup() {
  size(500,500);
   background(75);
}
int y = 0;
int x = 0;
void draw() {
  colorMode(HSB,100);
 

if (x < 100){
  smooth();
  ellipse(width/2,height/2,100,100);
   x++; 
   println(x);

}else{
    fill(60,100,100);
  ellipse(width/2,height/2,100,100); 
  x++; 
  println(x);
  }
 
if(x > 150){
rect(y,y,50,50);
y++;
println(y);
}

if(x==600){
  noLoop();
}


}


