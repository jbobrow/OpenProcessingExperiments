
int a= 80;
int b= 80;
int c= 80;
 
void setup(){
size(400,400);
background(0);
smooth();
noStroke();
}
void draw(){
for (int y = 0; y <=height; y += 40){
   
  for (int x = 0; x <= width; x +=40) {
     
    if (mousePressed){
     a=0;
     b=0;
     c=0;
     fill(a, b, c);
  rect(x, y, 20, 120);
   }
   else{
   a=255;
     b=140;
     c=40;
   
  fill(a, b, c);
  rect(x, y, 20, 20);
  }
  }
  }
    
   
  fill(50,70,12,70);
  rect (0,0, 380,380);
}
                


