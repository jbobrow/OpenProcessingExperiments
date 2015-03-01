
void draw(){ 
crosses();
}

void crosses(){
for(int x = 10; x <= 80; x += 20) {
for(int y = 10; y < 100; y += 20){

curve(0,y,x,y,width, y);

}}}
