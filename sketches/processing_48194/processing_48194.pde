
void setup(){size(200,200);
background(255);
}

void draw(){
int x = 0;
int y = 0;
while (x<width) {
  
  
while(y<height) {

 y+=10;
 fill(random(255));
rect(x,y,10,10);


}
x+=10;
}
}

                
                
