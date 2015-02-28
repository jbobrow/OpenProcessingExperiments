
float r=1;

void setup(){
size(500,500);

}

void draw(){
 background(0);

  
   cone(100,100,3);
   cone(250,100,6);
   cone(400,100,5);
   
   cone(100,300,2);
   cone(250,300,4);
   cone(400,300,1);
   
   rotate(r);
}


void cone( float a, float b, float c){

  translate(a,b);
  rotate(r+c);  
  triangle(0,0,50,100,100,50);
  resetMatrix();
   r+=PI/500;
}
