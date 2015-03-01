
void setup()
{
  size(600,600);
}

void draw()
{
  //line(300,600,300,400);
    stroke(0);
    strokeWeight(1);

  drawTree(300,600,150,90,7);
}


  
  
void drawTree(float sx, float sy, float r,float d,int num){

  

  float tx=r*cos(radians(d));
  float ty=r*sin(radians(d)); 
  stroke(0);
  strokeWeight(1);
  line(sx,sy,sx-tx,sy-ty);
 
 if(num<6){
     noStroke();
     fill(45,103,6,10);
     ellipse(sx-tx,sy-ty,(num-4)*5,(num-4)*5);
     }
   
   
  if(num>1){
    r/=1.5;
    num--;

     drawTree(sx-tx,sy-ty,r,d+40,num);
     drawTree(sx-tx,sy-ty,r,d-40,num);
     drawTree(sx-tx,sy-ty,r,d,num);
     
     
        
  }
}
    
    
   
   
    
