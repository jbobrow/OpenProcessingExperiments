

float nesto=random(0.0,5.5);
float rand=random(100);
void setup(){
  size (700,500);

  background(random(250),random(250),random(250));


}

void draw(){


  for(int deg=0; deg<25*random(10) ;deg+=15){
    float angle =radians(deg);
    float x=width/2+(cos(angle)*nesto);
    float y=height/2+(sin(angle)*nesto);
    noFill();
    stroke(y,x);
    ellipse(y,x,rand,rand);

    stroke(x,y);
    strokeWeight(random(5));
    ellipse(x,y,rand,rand);
    nesto=nesto+0.9;
    rand=nesto+rand/random(10);
    if(x>=width-nesto/rand||x<=2){

      rand*=-1;
    }
    if(y>=height-nesto/rand||y<=2){
      nesto*=-1;
    }
  }
}



