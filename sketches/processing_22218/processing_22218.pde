
PImage img;

void setup(){
  size(768, 432);
  img = loadImage("background2.png");
  image(img,0,0);
}

void draw(){
}

void mouseClicked(){
int x= mouseX+((int)random(3));
int y= mouseY+((int)random(3));
    strokeWeight(1);
  stroke(#D81A1A);
  fill(#D81A1A,random(70));
  
//in the event of y = mouseY
  if (y==mouseY){
      line(0,y,width,y);
  copy(0,(y-30), width,30, 0,(y+1), width,30);{
    noStroke();
    rect(0,(y+1), width,30);
      }
    y=0;
    }else{
    x=mouseX;
    }

//in the event of x = mouseX
  if (x==mouseX){
      line(x,0,x,height);
      copy((x-30),0, 30,height, (x+1),0, 30,height);{
    noStroke();
    rect((x+1),0, 30,height);
      }
    x=0;
    }
    

  
}


