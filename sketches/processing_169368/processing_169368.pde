
int r=0;
int g=0
int b=0
int change=10;

void setup(){

size(200,200);
background(255);
noStroke();

}

void draw(){ 

rect(x,y,width,height);
fill(r,g,b);

r=r+10;
g=g+10;
b=b+10;
}
      
