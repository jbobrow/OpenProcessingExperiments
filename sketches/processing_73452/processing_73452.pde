
int screenW = 500;
int size = 5;
int scale =0;

float distance = 0.0;
float randomness = 0.0;

 
void setup() {
  size(500, 500);
  background(0,50);
  noFill();
}
 
void draw() {
   
  if(mousePressed) background(0); // clear image
   //stroke (50, 100);
   stroke (255,100);

  int i = 0;
  int x = 0;
  int y = 0;

  while(x < screenW)
  {
 x = 10 + i * 30;
 y = 10 + i * 30;

        distance = abs(mouseX - x); 
        distance = distance / screenW; 
        distance = 1.0 - distance; 
       
        distance =  distance * distance * distance * distance * distance  * distance * distance * distance;
        
         randomness = random(10.) - 1.0;
        x += distance * randomness;
        randomness = random(10.) - 1.0;
        y += distance * randomness;
         
        rect(x, y, size, size);
        i++; // increment counter
       size=size+1;
        if (size>500){
          size=size*-1;}
  }
   
}


