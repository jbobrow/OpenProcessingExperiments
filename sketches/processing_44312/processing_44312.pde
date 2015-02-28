
int a= 255;
int b= 140;
int c= 40;

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
     fill(a, b, c,70);
  ellipse(x, y, 40, 40);
   } 
   else{
   a=255;
     b=140;
     c=40;
  
  fill(a, b, c,70);
  ellipse(x, y, 40, 40);
  }
  }
  }
   
  
  fill(255,10,10,125);
  rect (220,180, 80,80);
}
                
                
