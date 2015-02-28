
//this program draw a grid of triangles

//next two lines are for the look of our output window
background(0); //color of background
size(500,600); // size of window
smooth();
noLoop();
// we set a veriable for the spacing of the triangle 
// without replacing by hand all instances
int iSize=20;
int jSize=20; // spacing of triangle

boolean flip=true;

//generate a grid with the spacing we specified .
for(int j=0;j<width;j+=jSize){
  for(int i=0;i<height;i+=iSize){
    if(flip){
      triangle(j,i,   j+jSize,i+iSize,   j,i+iSize*2);
      triangle(j+jSize,i+iSize,  j+jSize,i+iSize*3,   j,i+iSize*2);
    }
    else{
      triangle(j,i+iSize,  j+jSize,i,  j+jSize,i+iSize*2);
      triangle(j,i+iSize, j+jSize,i+iSize*2,   j,i+iSize*3);
    }
     println(flip);
     i+=iSize;
  }
  
 flip= !flip;
}







