
void setup(){
  size(640,480);
  strokeWeight(.5);
  smooth();
}

void draw(){
  background(255);

/*  for(int j=50;i <height-50; j= j+20){
 
  for(int i=50; i<width-50;i=i+20){
  line(i,j,i+10,j+10);
  line(i,j10,i+10,j);
  }

 for (int i=0; i<width; i= i+10){
  line(0,i,width-10,height-10);
  */
  
  for(int i =50; i<width -50; i= i+20){
   for(int j =50; j<height -50; j= j+20){
   fill(i/3,j/3,20,20);
   ellipse(i,j,40,40);

   }
  
}
}

