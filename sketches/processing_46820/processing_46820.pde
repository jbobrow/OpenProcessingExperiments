
void setup (){
size (500, 500);
smooth();
frameRate(5);



}

void draw (){

    int radius=60;
  

  for (int i=radius/2; i<width; i=i+radius+radius/4) {
  for (int j=radius/2; j<height; j=j+radius+radius/2){
  form1 (i,j,radius); 


  
}}


}

void form1 (int x, int y, int s){

float r = random (1, 3);

fill(0,50);
stroke(0);
ellipse (x,y,s,s);
fill(255);
ellipse(x,y,s/r,s/r);
if (s/r > s-2) {
  fill(0);
  ellipse(x,y,s/3,s/3);

  stroke(255);

  line(x,y,mouseX,mouseY);  
  }
}







  


