
void setup (){
  size(300,300);
background(255,255,255);
line(100,150,200,150);
}

int x=0;
int t=0;
void draw(){
  if(x<=150){
    background(255,255,255);
    stroke(0,0,0);
    strokeWeight(3);
    line(100,165,190,140);
    line(100,165,100,300);
    stroke(230,129,39);
    strokeWeight(4);
    fill(230,168,73);
    ellipseMode(CENTER);
    ellipse(x,x,30,30);
    x+=3;
  }
  else{
    if(x<=285){
       background(255,255,255);
    stroke(0,0,0);
    strokeWeight(3);
    line(100,165,200,165);
    line(100,165,100,300);
    stroke(230,129,39);
    strokeWeight(4);
    fill(230,168,73);
    ellipseMode(CENTER);
    ellipse(x,300-x,30,30);
    x+=3;
    }
    else{
      if(x<=420){
           background(255,255,255);
    stroke(0,0,0);
    strokeWeight(3);
    line(100,165,200,165);
    line(100,165,100,300);
    stroke(230,129,39);
    strokeWeight(4);
    fill(230,168,73);
    ellipseMode(CENTER);
    ellipse(570-x,x-270,30,30);
    x+=3;
  }
  else{
    if(x<=570){
      background(255,255,255);
    stroke(0,0,0);
    strokeWeight(3);
    line(100,165,170,240);
    line(100,165,100,300);
    stroke(230,129,39);
    strokeWeight(4);
    fill(230,168,73);
    ellipseMode(CENTER);
    ellipse(x-270,x-270,30,30);
    x+=5;
    }
    else{
      if(x<=840){
        background(255,255,255);
    stroke(0,0,0);
    strokeWeight(3);
     line(100,165,170,240);
     line(100,165,100,300);
    stroke(230,129,39);
    strokeWeight(4);
    fill(230,168,73);
    ellipseMode(CENTER);
    ellipse(855-x,855-x,30,30);
    x+=5;
      }
      else{
        x=0;
        x++;
      }
    }
  }
    }
  }
      
}




