
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int radius;
int c=125;
int x = 0;

void setup()
{
  rectMode(CENTER);
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
}
 
void draw(){
  x = xpos.size();
  background(0);
  for (int i = 0 ; i < xpos.size();i++){
    if ((xpos.size())%7==0){
      background(255,255,255);
    }
    
    if (i%2==0){
      if (i<=4){
        fill(155,255,200);
        ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
      }
      else if (i>4 &&  i < 9){
        fill(255,255,255);
        ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
      }
      else if (i>=9 && i<= 14){
        fill(0,0,255);
        ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
      }
      
      else if( i> 15){
        xpos.removeAll(xpos);
        ypos.removeAll(ypos);
      }
    }
    else if(i%2!=0){
      if (i<=4){
        fill(155,255,200);
        rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
      }
      else if (i>4 &&  i < 9){
        fill(255,255,255);
        rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
      }
      else if (i>=9 && i<= 14){
        fill(0,0,255);
        rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
      }
      
      else if( i> 15){
        xpos.removeAll(xpos);
        ypos.removeAll(ypos);
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
  println(xpos.size());
}

 

