
<html>
<script src="processing.js"></script>
   <script type="text/processing" data-processing-target="processing-canvas">


void setup(){
   size(800,800);
   background(200);
   stroke(25,138,55);
 
   //color c1=color(146,224,247);
   //color c2=color(255,255,255);

   //setGradient(0,800,800,c1,c2, y AXIS);

   drawTree(width/2, height, 200, 90);
   //drawTree(300,300,9,90);
} //ends setup()

void drawTree(float x0, float y0, float len, float angle){
  if(len > 2){
        float x1=x0+cos(radians(angle))*len;
        float y1=y0-sin(radians(angle))*len;

        line(x0,y0,x1,y1);

        drawTree(x1,y1,len*0.75, angle+30);
        drawTree(x1,y1,len*0.66, angle-50);

  }
}//end of drawTree()

void setGradient(int x,int y, float w, float h, color c1, color c2, int axis){
}


</script>
<canvas id="processing-canvas"></canvas>
</html>
