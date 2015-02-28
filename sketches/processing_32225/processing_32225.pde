
int goodbye = 50;
int hello = 0;

int y = 0;

void setup () {
  size (500,500);
  noFill ();
  background (255);
  frameRate (5);
  
  fill(5,103,180,30);
  stroke (245,250,23);
  strokeWeight (1);
  
}

void draw (){
  
 while (goodbye < 250){
    line (hello, y,goodbye,goodbye);
  goodbye = goodbye + 200;
 
   }   
   
   
  hello = hello + 100;
 goodbye = 0; 
 
 if (hello > 500){
   y = y + 100;
   hello = 0;
}

}

