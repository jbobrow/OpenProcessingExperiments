
void setup(){size(200,200);
background(255);
}

void draw(){
int x = 0;

while (x<width) {
  
  int y = 0;
while(y<height) {

 y+=2;
 fill(random(255));
rect(x,y,2,2);


}
x+=2;
}
}               
