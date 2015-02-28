
void setup(){
size(500, 500);
noStroke();

}

void draw(){

  background(239, 240, 189);
  fill(#DBDB5D);
for(float f = 100; f < width; f = f *1.1){
for(int p = 100; p < height; p = p + 20){
rect(f, p, 10, 10);
}

}

 for(float l = 1; l < width; l = l * 1.5){
 for(int m = 1; m < height; m = m + 40){
 rect(l, m, 20, 500);
 }
 

 } 
  


}
