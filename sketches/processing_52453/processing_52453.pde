
void setup (){
size(600,600);
background(255, 23, 233);
noCursor();
smooth();
}

void draw()
  {
    fill(255, 23, 233, 50);
    rect(0,0,width,height);
  for(int i = 0 ; i < width; i++)
  //rect (i*10, i*30, 10, 10);
  
  {
   fill(342, 134, 22);
   rect(mouseX,mouseY,30,30);
   translate(300,300);
   for (int j=1; j<360;j++){
     line(mouseX,mouseY, 20,20);
     strokeWeight (.05);
     rotate(radians(2));
  }
  }
} 


