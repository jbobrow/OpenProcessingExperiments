

int x = 65;
int y = 50;

int z = 0;//for dragon fill

void draw() {
  background(0);
  fill(z);
  smooth();
  strokeWeight(2);

//start of dragon
fill(z,0,0);  
triangle(x-10,y,x-10,y+20,x-60,y+20);//tail
triangle(x,y-40,x+5,y-25,x-5,y-25);//spikeone
triangle(x-20,y-35,x-5,y-25,x-15,y-15);//spiketwo
triangle(x-35,y-20,x-15,y-15,x-20,y-5);//spikethree
triangle(x-20,y-5,x-45,y,x-20,y+5);//spikefour

fill(z);
ellipse(x,y,50,50);//head

fill(z,0,0);
ellipse(x+5,y+5,10,10);//nose
fill(z);
ellipse(x,y-5,10,20);//lefteye
ellipse(x+10,y-5,10,20);//righteye

point(x,y-5);
point(x+10,y-5);
triangle(x,y+20,x+10,y+20,x+5,y+13);
//end of dragon
}
void mouseClicked() {
  if(z == 0) {
    z = 255;
  } else {
    z = 0;
  }
}

