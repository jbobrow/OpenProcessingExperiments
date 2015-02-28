
void setup(){
  size(200,200);
}

int x=0;
void draw(){
  
  
  noStroke();
  rectMode(CENTER);

  fill(x+120,x+120,225);
  rect(100,100,x+160,x+160);
  fill(x+90,x+90,225);
  rect(100,100,x+80,x+80);
  fill(x+60,x+60,225);
  rect(100,100,x+40,x+40);
  fill(x+30,x+30,225);
  rect(100,100,x+20,x+20);
  fill(x,x,225);
  rect(100,100,x,x);
  fill(x-30,x-30,225);
  rect(100,100,x-20,x-20);
  fill(x-60,x-60,225);
  rect(100,100,x-40,x-40);
  
  stroke(x-30,x-30,225);
  line(120-x/2,120-x/2,80+x/2,80+x/2);
  line(120-x/2,80+x/2,80+x/2,120-x/2);
  
  x++;

}



