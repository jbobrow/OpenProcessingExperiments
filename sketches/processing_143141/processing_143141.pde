
void setup(){
    size(500, 500);
    colorMode(HSB,360);
    strokeWeight(1);
    background(0);
}
 
void draw(){
    background(0);
    //center
    translate(width/2, height/2);
     
    //points
    int px = 0; int py = 0;
    int x = 0; int y = 0;
     
    int a = mouseY / 4; //out circle
    int b = 3; //inner circle
    int h = mouseX / 4; //distance
     
    for(i=0; i<720; i++){
    //for(i=0; radians(i)<360; i++){
        int t = radians(i); //theta
         
        //math ->
        //http://mathworld.wolfram.com/Hypotrochoid.html
        //http://mathworld.wolfram.com/Spirograph.html
        x = (a - b) * cos(t) + h * cos((a/b -1)*t);
        y = (a - b) * sin(t) - h * sin((a/b -1)*t);
         
        //no draw the first line
        if(px != 0 && px != 0){
            stroke(i,720,720);
            line(px,py,x,y);   
        }
         
        px = x; py = y;
    }
     
    //noLoop();
}

