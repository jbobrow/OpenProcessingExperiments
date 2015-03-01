
/*---------------------------------------
Another For test
Created 5 February 2015
by Catherine Lee

-----------------------------------------*/

size(500,500);
background(0);

//triangles made with diagonal lines
for (int i = 0; i < 505; i = i+10) {
  for (int j = 0; j < 505; j = j+10){
    stroke(200,j/3,0);
    triangle(i,j+2, i+1,j, j+10,i+2);
  }
}

//main center "circle"
for(int a = 0; a < 250; a = a+10){
  fill(255,20);
  ellipse(250,250,a,a);
}

//overlay circle that gives grid-like thing
for(int k = 0; k < 550; k = k+20){
  for(int l = 0; l < 550; l = l+20){
    stroke(0,10);
   noFill(); 
    ellipse(250,250,k,l);
  }

}

