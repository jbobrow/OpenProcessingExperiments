
float r=1;


void setup(){
size(500,500);

}

void draw(){
 background(0);

   cone(60,100,3,60,100);
   cone(200,100,6,200,100);
   cone(340,100,5,340,100);
   cone(60,300,2,60,300);
   cone(200,300,4,200,300);
   cone(340,300,1,340,300);

   
   rotate(r);
}


void cone( float a, float b, float c, float x, float y){
  
  translate(a,b);
  
  if(mouseX>x && mouseY>y && mouseX<x+80 && mouseY<y+80){
  rotate(r+c);  
  }
  
  triangle(0,0,50,100,100,50);
  resetMatrix();
   r+=PI/500;

}
