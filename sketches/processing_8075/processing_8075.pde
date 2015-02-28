
float x,y,r,t;

void setup(){

  size(500,500);

}

void draw(){

  background(255);
  for(int i=0 ; i<width; i+=2){
    
    x = i;
  stroke(random(255) , random(255),random(255));
    for(int j =0 ; j<height;j+=2){
       r=2E3/(dist(x=mouseX,y=mouseY,i,j)+1E2);

       point( i+r*cos(t=atan2(j-y,i-x)),j+r*sin(t));
      
    }
  
  }
}


