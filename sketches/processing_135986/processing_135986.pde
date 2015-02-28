
float x = 1;
float y = width;
 
void setup() {
  size (400,400);
}
 
void draw () {
background (0);
   
  x=x+1;
  y= y+1;
float a = min(x, y);
float b = max(x, y); 
  textSize(x);
  text("Hi",a,b); 

if (b> width){

y =10;
x=0;
textSize (100);
  text("bye",width/3, height/2);
  

}

}


