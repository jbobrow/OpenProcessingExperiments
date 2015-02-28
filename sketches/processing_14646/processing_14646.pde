
void setup(){

size(200,200);
background(255);

}

void draw(){
    for( int x=20; x<=180; x += 10 ) {
    for( int y=20; y<=180; y += 10 ) {
    line(x,y,x+(y*0.04),y);
    }
    }
}
