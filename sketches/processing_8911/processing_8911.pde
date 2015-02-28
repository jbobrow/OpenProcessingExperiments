
float R; 
PImage b;
int s= 1;
int speed= 1;
int value = 0;


 
void setup(){ 
size(400,400); 
background(255,50,200); 
//noCursor();
smooth();

 
} 
 
void draw() { 
  
background(200,50,50); 

R=random(400);



  if (mousePressed == true) {
    fill(0, 200, 30);
  } else {
    fill(100, 20, 255);
  }





{
for(int a=0; a<400; a=a+200)
for(int b=0; b<400; b=a+1){
      ellipse(R, a, 40, 40);
      ellipse(R, a, 30, 30);
      ellipse(R, a, 20, 20);
      ellipse(R, a, 10, 10);
  a= a+50;
  b= b+50;
}}

//for(int a=0; a<400; a=a+5) {
  //ellipse(R, a, 20, a);

}






