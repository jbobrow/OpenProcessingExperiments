
void setup(){
size(200,200);
noLoop();
}

void draw(){
for(int x=100; x<=200; x=x+10) {
for(int y=100; y<=200; y=y+10) {
line(random(x),0,random(y),200);
    }
   }
 }    
