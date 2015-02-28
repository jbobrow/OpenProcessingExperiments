
int branchNum = 1;

void setup()   
{   
  size(600,600);   
  smooth();   
  noLoop();   
}   


void draw()   

{   

  background(255);      

  strokeWeight(14);   

  translate(width/2,height-20);   

  branch(0);   

}   

   

void branch(int depth){   
  if (depth < branchNum) {
    stroke(random(0,200),random(0,100),random(0,150));
    line(0,0,0,-height/10);   
    {   
      translate(0,-height/10);   
      rotate(random(-0.4,0.4));    
      if (random(1.0) < 0.4){ // branching     
        rotate(0.3);  
        scale(0.7);  
        pushMatrix();   
        branch(depth + 1);   
        popMatrix();       
        rotate(-0.6);  
        pushMatrix();   
        branch(depth + 1);      
        popMatrix();           
      }   
      else { // continue     
        branch(depth);  
      }   
    }   
  }  
}   

   

   

void mouseReleased(){   
  branchNum += 1;
  if(branchNum > 15) {
    branchNum = 1;
  }
  redraw();    

} 


