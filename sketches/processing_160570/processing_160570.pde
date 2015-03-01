

  
<script src="processing.js"></script>
<script type="text/processing" data-processing-target="mycanvas">
void setup()
{
size(1000,1000);
background(75,100,45);
noStroke();
text("AWESOME",50,65);
rectMode(CENTER);
rect(300,300,400,400);
triangle(200,200,200,300,300,300);

fill(200,15,100);




}

void draw(){  
int circleSize = 30;
int circleXpos = mouseX;
int circleYpos = mouseY;
ellipse(circleXpos,circleYpos,circleSize,circleSize);
frameRate(4);



}
</script>
<canvas id="mycanvas"></canvas>

