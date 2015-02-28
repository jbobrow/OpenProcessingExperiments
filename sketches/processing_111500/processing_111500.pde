
int x,y,w,h;

void setup(){
 size(800,600); 
 
}

void draw(){
 background(255);
 fill(0);
 rect (x,y,w,h);
 y = 0;
 w = width/2;
 h = height;

// && : AND 
// || : OR
 if ((mouseX < width/2) || (mousePressed)){
 x = 0;
 }else{
 x = width/2;
 }
}
