
import org.gwoptics.graphics.graph2D.Graph2D;
import org.gwoptics.graphics.graph2D.LabelPos;
import org.gwoptics.graphics.graph2D.traces.Line2DTrace;
import org.gwoptics.graphics.graph2D.traces.ILine2DEquation;

Graph2D g;

int yMin = 0;
int yMax = 3;
int xMin = 0;
int xMax = 9;
int n = 18;
float interval = xMax/(n+0.0);
int count = 0;
float XSCALE = (400+0.0)/xMax;
float YSCALE = (200+0.0)/yMax;
int area = 18;
float sum = 0;

public class eq implements ILine2DEquation{
  public double computePoint(double x,int pos) {
    return Math.sqrt(x);
  }    
}

void setup(){
  size(500,270);
  g = new Graph2D(this, 400, 200, false); 
  
  g.setYAxisMin(yMin);
  g.setYAxisMax(yMax);
  g.setXAxisMin(xMin);
  g.setXAxisMax(xMax);
  g.setXAxisLabel("X-Axis");
  g.setYAxisLabel("Y-Axis");
  g.setXAxisTickSpacing(1);
  g.setYAxisTickSpacing(1);
  g.position.x = 70;
  g.position.y = 20;
  Line2DTrace trace = new Line2DTrace(new eq());
  trace.setTraceColour(10,10,100);
  g.addTrace(trace);
}

void draw(){
  background(255);
  g.draw();
  frameRate(n/6);
  text("y = sqrt(x)", 200, 80);
  sum = 0;
  noFill();
  stroke(0);
  interval = xMax/(n+0.0);
  if(count <= n){
    for(int i = 0; i < count; i++){
      pushMatrix();
      translate(70 + XSCALE*i*interval, 220);
      rect(0, 0, XSCALE*interval, YSCALE * new Float(0 - new eq().computePoint(i*interval, 0)));
      sum += interval*new eq().computePoint(i*interval, 0);
      popMatrix();
    }
  }
  if(count > n){
    for(int i = 0; i < n; i++){
      pushMatrix();
      translate(70 + XSCALE*i*interval, 220);
      rect(0, 0, XSCALE*interval, YSCALE * new Float(0 - new eq().computePoint(i*interval, 0)));
      sum += interval*new eq().computePoint(i*interval, 0);
      popMatrix();
    }
  }
  if(count > n+n/6)
    count = 0;
  count++;
  text("Area = " + area + ", Riemann Sum = " + nf(sum, 1, 2) + ", N = " + n, 10, 265);
}

void keyPressed() {
  if (keyCode == UP) {
    n++;
  }
  if(keyCode == DOWN && n > 1) {
    n--;
  }
}


