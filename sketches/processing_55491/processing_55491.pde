
import controlP5.*;

ControlP5 controlP5;

public int w = 340;
public float shapeRatio = 1.2f; // h / w
public float topRatio = 0.2f; // topHeight / h
public float bottomRatio = 0.2f; // bottomHeight / h
public float vTopRatio = 0.5f; // curveHeight / topHeight
public float hTopRatio = 0.75f; // curveWidth / curveHeight
public int shadowColorRatio=1;  // color of shadow
public int shadowLineRatio=1; // number of lines of shadow

int x = 50, y = 50; // Offset
float h, topHeight, vTopHeight, hTopWidth, bottomHeight;
int startColor = 180;
int numSteps = 4;

float scaleNumber=(float) 1.1;
int notches;

void setup() {
  size(1000, 800);
  smooth();

  controlP5 = new ControlP5(this);
  
  Slider sldWidth = controlP5.addSlider("w", 200, 800, 350, 600, 50, 100, 10);
  Label lblWidth = sldWidth.captionLabel();
  lblWidth.setColor(0);
  lblWidth.set("width");
  
  Slider sldShapeRatio = controlP5.addSlider("shapeRatio", 1.0f, 3.0f, 1.6f, 600, 80, 100, 10);
  Label lblShapeRatio = sldShapeRatio.captionLabel();
  lblShapeRatio.setColor(0);
  lblShapeRatio.set("shape ratio (h / w)");
  
  Slider sldTopRatio = controlP5.addSlider("topRatio", 0.0f, 1.0f, 0.2f, 600, 110, 100, 10);
  Label lblTopRatio = sldTopRatio.captionLabel();
  lblTopRatio.setColor(0);
  lblTopRatio.set("top ratio (topHeight / h)");
  
  Slider sldBottomRatio = controlP5.addSlider("bottomRatio", 0.0f, 1.0f, 0.2f, 600, 140, 100, 10);
  Label lblBottomRatio = sldBottomRatio.captionLabel();
  lblBottomRatio.setColor(0);
  lblBottomRatio.set("bottom ratio (bottomHeight / h)");
  
  Slider sldVTopRatio = controlP5.addSlider("vTopRatio", 0.0f, 1.0f, 0.5f, 600, 170, 100, 10);
  Label lblVTopRatio = sldVTopRatio.captionLabel();
  lblVTopRatio.setColor(0);
  lblVTopRatio.set("vertical top ratio (curveHeight / topHeight)");
  
  Slider sldHTopRatio = controlP5.addSlider("hTopRatio", 0.0f, 1.0f, 0.75f, 600, 200, 100, 10);
  Label lblHTopRatio = sldHTopRatio.captionLabel();
  lblHTopRatio.setColor(0);
  lblHTopRatio.set("horizontal top ratio (curveWidth / curveHeight)");
  
  Slider sldShadowRatio = controlP5.addSlider("shadowColorRatio", 0, 255, 180, 600, 230, 100, 10);
	  Label lblShadowRatio = sldShadowRatio.captionLabel();
	  lblShadowRatio.setColor(0);
	  lblShadowRatio.set("color shadow ratio (color of shadwo/ decrease)");
	  
	  Slider sldShadowLineRatio = controlP5.addSlider("shadowLineRatio", 1, 10, 4, 600, 260, 100, 10);
	  Label lblShadowLineRatio = sldShadowLineRatio.captionLabel();
	  lblShadowLineRatio.setColor(0);
	  lblShadowLineRatio.set("lines of shadow ratio (size of shadow)");

addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
		    public void mouseWheelMoved(java.awt.event.MouseWheelEvent e) { 
		    	  
		    	   notches = e.getWheelRotation(); 
		    //	  if(notches!=0)
		    	   scaleNumber=scaleNumber+(float)notches/10;
		    	   if (scaleNumber==0)
		    		   scaleNumber=1;
		    	   println(scaleNumber); 
		    	   
		    } 
		  });
}

void computeParams() {
  h = w * shapeRatio;
  topHeight = h * topRatio;
  vTopHeight = topHeight * vTopRatio;
  hTopWidth = vTopHeight * hTopRatio;
  bottomHeight = h * bottomRatio;
  
   startColor=shadowColorRatio;
   numSteps = shadowLineRatio;
}

void draw() {
  
  pushMatrix();
  scale(scaleNumber);
  
  computeParams();
  
  background(255);
  noStroke();
  rectMode(CENTER);

  drawOneDirection(1);
  drawOneDirection(-1);
  drawShape(color(25, 121, 175), color(185, 239, 252), 0, 0);

  drawDownDirection();
  drawBottom(color(185, 239, 252), 0);
  
  popMatrix();
}

void drawOneDirection(int rightShadow) {
  
  int endColor = 240;
   
  int step = (endColor - startColor) / numSteps;

  for (int i = 0; i < numSteps; i++) {
    color c = color((numSteps - i) * step + startColor);
    drawShape(c, c, rightShadow, numSteps - i);
  }
}

void drawDownDirection() {
   
  int endColor = 240;
   
  int step = (endColor - startColor) / numSteps;

  for (int i = 0; i < numSteps; i++) {
    color c = color((numSteps - i) * step + startColor);
    drawBottom(c, numSteps - i);
  }
}

void redPoint(float x, float y) {
  int oldColor = g.fillColor;
  fill(255,0,0);
  ellipse(x,y,3,3);  
  fill(oldColor);
}

void drawShape(color topColor, color bottomColor, int rightShadow, int idx) {
  pushMatrix();
  
  translate(rightShadow * idx, idx);
  fill(topColor);
  
  arc(x + hTopWidth, y + vTopHeight, hTopWidth * 2, vTopHeight * 2, PI, PI * 1.5f);
  arc(x + w - hTopWidth, y + vTopHeight, hTopWidth * 2, vTopHeight * 2, PI * 1.5f, PI * 2.0f);
  
  beginShape();
  vertex(floor(x + hTopWidth), floor(y));
  vertex(ceil(x + w - hTopWidth), floor(y));
  vertex(ceil(x + w - hTopWidth), ceil(y + vTopHeight));
  vertex(floor(x + hTopWidth), ceil(y + vTopHeight));
  endShape(CLOSE);
  
  beginShape();
  vertex(floor(x), floor(y + vTopHeight));
  vertex(ceil(x + w), floor(y + vTopHeight));
  vertex(ceil(x + w), ceil(y + topHeight));
  vertex(floor(x), ceil(y + topHeight));
  endShape(CLOSE);
  
  fill(bottomColor);
  
  beginShape();
  vertex(floor(x), floor(y + topHeight));
  vertex(ceil(x + w), floor(y + topHeight));
  vertex(ceil(x + w), ceil(y + h - bottomHeight));
  vertex(floor(x), ceil(y + h - bottomHeight));
  endShape(CLOSE);
  
  popMatrix();
}

void drawBottom(color bottomColor, int idx) {
  pushMatrix();
  
  translate(0, idx);
  fill(bottomColor);

  arc(x + w / 2, y + h - bottomHeight, w + idx * 2, bottomHeight * 2, 0, PI);
  
  popMatrix();
}

		 

