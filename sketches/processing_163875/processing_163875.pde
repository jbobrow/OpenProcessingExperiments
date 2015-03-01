
//sets size and background color
void setup(){
  size(650,200);
  background(20);  
}

void draw(){
  int print = 0;
  int x = 100;
  int y = 100;
  int width = 100;
  int height = 100;

//prints a row of four ellipses
  while(print<=3){
        
        //determines the fill and stroke weight of the ellipses
        if(print>1){    
          noFill();
          strokeWeight(5);
          stroke(mouseY,mouseX,197);
        }
        else{
          noStroke();
          fill(mouseX,mouseY,197);
        }
  
        ellipse(x,y,width,height);
        x=x+150;
        print++;
  }  
}


