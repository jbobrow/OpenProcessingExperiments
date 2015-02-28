

void draw(){
  for (int i=0; i<width; i++)
    for(int j=0; j<height; j++)
     rect((i>>j)+random(10), random(i)*j, j>>i, (i>>j)*.5);
 if (mousePressed)noLoop();
}


