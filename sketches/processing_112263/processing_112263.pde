
/*
Jeff Guo  IxD Term 3 
Interactive Prototyping 3
Sep-26-2013
jeff880412@gmail.com
*/
size(500,500);


for (float i=1; i<width; i = i*1.1) {
  strokeWeight(4);
  
  for(float j = 1; j < height; j= j *1.1){
point( 250+i, 250+j);  
point( 250-i, 250+j);
point( 250+i, 250-j);
point( 250-i, 250-j);

}
}



