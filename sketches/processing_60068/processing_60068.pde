
void setup() {
size(100,100);
smooth();
 
 
background(255);

}
 
void draw() {
background(255);
fill(0);
 
if(mousePressed){  
  rect(43,40,10,10);
  rect(37,50,10,10);
  rect(43,60,10,10);
  rect(37,70,10,10);
  rect(43,80,10,10);
  rect(37,90,10,10);
}else{
rect(40,40,10,60); }
 
}
