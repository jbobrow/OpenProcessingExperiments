
int n = 0;
void setup(){
    size(320, 480);
    background(0);
    stroke(255);
    //smooth();
    
}
 
void trifract(float x, float y, float l, int level, boolean inv){
    //line(x, y, x, y+l);
    //line(x, y, x+l*sqrt(3)/2, y-l/2);
    //line(x, y, x-l*sqrt(3)/2, y-l/2);
    
    fill(int(random(2))*255);
    pushMatrix();
    if(inv) {
      rotate(radians(180));
    }
    triangle(x, y+l,x+l*sqrt(3)/2, y-l/2,x-l*sqrt(3)/2, y-l/2);
    popMatrix();
    
    
    
    if (level>1){
        l*=.5;
        level= level-1;
        trifract(x, y+l, l, level, inv);
        trifract(x+l*sqrt(3)/2, y-l/2, l, level, inv);
        trifract(x-l*sqrt(3)/2, y-l/2, l, level, inv);
    }    
}
     
void draw(){
    fill(0);
    rect(0,0,width, height);
    translate(width/2,height/2);
    rotate(radians(n++));
    trifract(0, 0, 160,int(random(2,5)), false);
    trifract(0, 0, 80,int(random(2,5)), true);
    trifract(0, 0, 40,int(random(2,5)), false);
}
