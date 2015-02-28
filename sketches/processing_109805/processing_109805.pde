
//Lissajous Curve in Processing

float a = 3;
float b = 4;

void setup(){

    background(0);
    size(600,400);
    //stroke(255);
    noStroke();
    strokeWeight(1);
    //noLoop();
    
}//end of setup

void draw(){
    background(0);
    for(int t = 0; t < 360; t+= 0.1){
        float x = 300 * sin(radians(a * t + 90));
        float y = 200 * sin(radians(b * t));
        fill(x , mouseX, t);
        ellipse(x + width/2 , y + height/2 , 2 , 2);
        //a += 1;
        //b += 1
        //println(x);
    }
    a += 1;
    b += 1;

}//end of draw
