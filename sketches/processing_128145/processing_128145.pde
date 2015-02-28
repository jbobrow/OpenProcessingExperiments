
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=125;
int x = 0;
int d = 0;
void setup()
{
  radius = 20;
  size(600,600);
  background(d,d,d);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
}


 
void draw(){
  x = xpos.size();
  background(d,d,d);
  for (int i = 0 ; i < xpos.size();i++){
    if ((xpos.size())%7==0){
      background(255,255,255);
    }
    
    if (i%2==0){
      if (i<=4){
        fill(155,255,200);
        ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
        xpos.set(i,xpos.get(i)+xvelocity.get(i));
        ypos.set(i,ypos.get(i)+yvelocity.get(i));

      }
      else if (i>4 &&  i < 9){
        fill(255,255,255);
        ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
        xpos.set(i,xpos.get(i)+xvelocity.get(i));
        ypos.set(i,ypos.get(i)+yvelocity.get(i));

      }
      else if (i>=9){
        fill(0,0,255);
        ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
        xpos.set(i,xpos.get(i)+xvelocity.get(i));
        ypos.set(i,ypos.get(i)+yvelocity.get(i));

      }
      
      
     if (xpos.get(i) > width){
    
      xpos.set(i,0);
    }
      if ( xpos.get(i) < 0 ){
        xpos.set(i,width);
      }
      if (ypos.get(i) > width){
        ypos.set(i,0);
      }
      
      if (ypos.get(i) < 0){
        ypos.set(i,height);
      }

    }
    else if(i%2!=0){
      if (i<=4){
        fill(155,255,200);
        rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
        xpos.set(i,xpos.get(i)+xvelocity.get(i));
        ypos.set(i,ypos.get(i)+yvelocity.get(i));

      }
      else if (i>4 &&  i < 9){
        fill(255,255,255);
        rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
        xpos.set(i,xpos.get(i)+xvelocity.get(i));
        ypos.set(i,ypos.get(i)+yvelocity.get(i));

      }
      else if (i>=9){
        fill(0,0,255);
        rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
        xpos.set(i,xpos.get(i)+xvelocity.get(i));
        ypos.set(i,ypos.get(i)+yvelocity.get(i));

      }
      
     
      if (xpos.get(i) > width){
    
      xpos.set(i,0);
    }
      if ( xpos.get(i) < 0 ){
        xpos.set(i,width);
      }
      if (ypos.get(i) > width){
        ypos.set(i,0);
      }
      
      if (ypos.get(i) < 0){
        ypos.set(i,height);
      }
    }
      if (i>=1 && i<15){
        stroke(255,255,255);
        line(xpos.get(i),ypos.get(i),xpos.get(i-1),ypos.get(i-1));
      }
  }
  
  
  
}

void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(int(random(-5,5)));
  yvelocity.add(int(random(-5,5)));
}

void keyPressed(){
  if (key == BACKSPACE){
    xvelocity.remove(xvelocity.size()-1);
    yvelocity.remove(yvelocity.size()-1);
    xpos.remove(xpos.size()-1);
    ypos.remove(ypos.size()-1);
  }
  
  
}

