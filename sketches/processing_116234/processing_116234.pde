
int cx = 250;
int cy = 250;
int r = 100;
int fill1 = 50;
int diameter = 10;
int Switch = 0;
void setup(){
  size(500, 500);
  background(255);
  textFont(createFont("Arial", 30));
}
void draw(){
background(255);
fill(50,fill1,100);
 if(fill1 >= 260-diameter/2){
    Switch = 1;
 }
   if(fill1 == diameter/2){
    Switch = 0;
   }
  if (Switch==0){
   fill1++;  
}else{
   fill1--; 
    }

   float t = millis()/1000.0f;
  int x = (int)(cx+r*cos(t));
  int y = (int)(cy+r*sin(t));

  text("1", x, y);
}
 




