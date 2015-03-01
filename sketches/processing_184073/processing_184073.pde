
int counter;

void setup() {  //setup function called initially, only once
  size(600, 300);
  background(255);  //set background white
}
void draw() {  
  for(int x=0; x<600;x=x+20){
drawCross(20,100);
}
}
}
void drawCross(int x,int y){
stroke(200);
nofill();
    ellipse(x,y,20,20);
}

stroke(255);
strokeWeight(3)
fill(245);
stroke(200);//golden
strokeWeight(1);
float r = random(255);

fill(r+70,100,r,80);
triangle(140,60,140,130,60,220);
triangle(140,60,140,130,200,220);
triangle(40,100,240,100,140,130);
triangle(140,130,40,100,200,220);
triangle(140,130,60,220,240,100);
}

