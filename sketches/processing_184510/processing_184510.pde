
//ASSIGNMENT WEEK 1
//RECTANGLE WITH COLOR


int x = 0;
int y = 0;

void setup() {
  size(500, 500);
  background(0);

}

void draw() {
fill(0,255,100);
rect(x,y,50,50);
x = x+1;
x = x%500;

    if(x<=250){
    y = y+1;
    }else{
    y = y-1;
    }
 y = y%500;
}
