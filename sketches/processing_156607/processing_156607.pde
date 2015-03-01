
    int w;
    int h;
    int q;
void setup(){
  size(500,500);
  background(0);
     frameRate(20);
    
}

void draw(){
 background(0);
  noStroke();
//  w=int(random(20,width));
//  h=int(random(0,height));

  for(int i=width;i>0;i-=18)
  {
//    println("i="+i);
//    println("("+mouseX+","+mouseY+")");

    float j=map(i,0,width,0,255);
    
      fill(255-j,255-j,0);
    
    ellipse(mouseX,mouseY,i,i);  
  }

   
}




