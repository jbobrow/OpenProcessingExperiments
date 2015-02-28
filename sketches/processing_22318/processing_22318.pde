
//naming the image variable.
PImage g;  

//image sizing and selection 
void setup(){ 
  size(400,267); 
  smooth();
  g = loadImage("green.jpg"); 
  image (g,0,0);  
//setting the freame rate for the entire sketch.  
  frameRate(2);
//loop statement.   
   for(int a=0;a<50;a+=10){
   float b=random(500);
   float c=random(1000);
   stroke(52,57,27);
//choosing colour.
   fill(52,57,27,20);
//line positioning.
   line(153,100,c,b);
  }
    }
    
 void draw (){
//loop statement.
   for(int a=0;a<50;a+=10){   
   float b=random(500);
   float c=random(1000);
//choosing colour.
   stroke(52,57,37);
   fill(52,57,37,0);
//line positioning.
   line(153,100,c,b-100);}
} 

//setting the interaction to clear the lines and return to the original image. 
void keyPressed() {
  if (key == 'r') {
//original image. 
    image (g,0,0);
    {    
}
}
}

