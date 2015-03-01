
   
final int numLines = 15;
 
void setup(){
    size(400, 400);
    noFill();
    strokeWeight(6);
    colorMode(RGB,1);
}
 
void draw(){
    background(0);
 
    for(int i = 0; i < numLines; i++)
    {
        float j = abs(sin(frameCount/20.0f + (i/numLines * PI)) * TWO_PI);
        stroke((i/(float)numLines), 1, 1);
        arc(width/2, height/2, i*14, i*14, -j/2,  j/2);
    }
}
