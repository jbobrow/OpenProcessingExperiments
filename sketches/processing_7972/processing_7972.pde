
//Cell[] cell = new Cell[](); 
ArrayList cells = new ArrayList();


void setup() 
{
  size(640, 480);
  for(int n=0; n<140;n++){
    cells.add(new Cell());
  }

}

void draw() { 
  background(234);
  
  stroke(#67b706);
  //noLoop();
  if(mouseX<width/2){
    if(cells.size()>1){
      if(random(0,320)>mouseX){
        cells.remove((int)random(cells.size()-1));
      }
    }
  }else{
    if(cells.size()<350){
      if(random(321,640)<mouseX){
        cells.add(new Cell());
      }
    }
  }


  for(int n=0;n<cells.size();n++){
    ((Cell)cells.get(n)).drawCell();
    ((Cell)cells.get(n)).updateCell(n);
  }



} 

class Cell { 
  float ypos, xpos, newXpos, newYpos;
  ; 
  private float angle = random(PI*2);
  float r = 10;

  public Cell () {
    
    boolean go=true;
    boolean touching = false;
    while(go){
       ypos = random(0+r,height-r); 
       xpos = random(0+r,width-r); 
       touching=false;
       for(int n=0;n<cells.size();n++){
           if(((Cell)cells.get(n)).touching(xpos,ypos)){
             touching = true;
            }
             
       }
       if(touching==false){
         go=false;
       }
      
    }
    
   
  }
  void drawCell(){
    fill(#a8e63d);
    ellipse(xpos,ypos,2*r,2*r);
    fill(#abf355);
    ellipse(xpos,ypos,r,r);
  } 

  boolean touching(float newXpos, float newYpos){
    if(dist(xpos,ypos,newXpos,newYpos)<2*r){
      return true;
    }
    else{
      return false;
    } 
  }

  void updateCell(int sel){
    boolean touching=false;
    angle+=random(-0.3,0.3);
    newXpos= xpos +(0.3*cos(angle));
    newYpos= ypos+(0.3*sin(angle));

    for(int n=0;n<cells.size();n++){
      if(n!=sel){
        if(((Cell)cells.get(n)).touching(newXpos,newYpos)){
          touching = true;
        }
      }
    }
    if(touching==false){
      xpos=newXpos;
     ypos=newYpos; 
    }else{
      touching=false;
    }

    if(xpos<r){
      xpos=r;
    }else if (xpos>width-r){
      xpos=width-r;
    }
    if(ypos<r){
      ypos=r;
    }else if(ypos>height-r){
      ypos=height-r;
    }



  }

}


