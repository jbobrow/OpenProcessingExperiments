
int counter;

void setup() {  //setup function called initially, only once
  frameRate(10);
  size(500, 250);
  background(255);  //set background white
  strokeWeight(1); 
}

void draw() {
  background(255);  //set background white
  stroke(random(0,255), random(0,255),random(0,255));
  Wave(0, height/2, width, height/2,500,random(10,100));
}

class Wave
{
    Wave(int startX, int startY, int endX, int endY, int segments, int amplitudePercent)
    {
        int chainLength = endX-startX;
        println(chainLength);
        int segmentLength = chainLength/segments;
        println(segmentLength);
        int lastEnd = startY;
        int offset = height/2*(amplitudePercent/100);
        for(int i = 0;i<segments;i++)
        {
            int randomEnd = startY+random(-offset ,offset);
            line(startX + (segmentLength *i),lastEnd, startX + (segmentLength *(i+1)), randomEnd);
            lastEnd = randomEnd;
        }
    }
}
