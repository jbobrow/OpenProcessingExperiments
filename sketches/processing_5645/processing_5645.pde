
//sketch by _ks
//another random thing
int val = 2;
int j = 300;

void setup (){
 size (700,400); 
 
 frameRate(20);  
}

void draw (){
  //Base Grid
  for (int i = 0; i <= width; i += val){
    float alp = random(50,60);
    fill(200, alp);

            float r = random (0,50);
        beginShape();
          vertex(i,j);
          vertex(i+r,j-r);
          vertex(i-(2*r),j+(r-j));  
          //vertex(i*r-r, j+r);     
        endShape(CLOSE);         
  } 

}





