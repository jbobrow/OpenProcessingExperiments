

void trees(float x, float y, float sizeA){
   for(int i = 0; i < num; i++) {
     ellipse(x,y,sizeA,sizeA);//draw ellipses based on variables set in arrays
     sizeA += walkDistance[i];//use of the distancing within the function
   }
}

