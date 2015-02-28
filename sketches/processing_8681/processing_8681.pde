
float[] point1 = new float[] { 0.2, 0.8 };
float[] handler1 = new float[] { 0.2, 0.2 };
float[] point2 = new float[] { 0.8, 0.8 };
float[] handler2 = new float[] { 0.8, 0.2 };

boolean mouseP = false;
String selectedShape = "";

void setup() {
size(400,400);
}

void draw() {

  background(255);
  noFill();
  
  float mx = (float)mouseX/(float)width;
  float my = (float)mouseY/(float)height;
  
  if (selectedShape.equals("")&&(mousePressed)&&!mouseP) {
    if ( dist(mx,my,point1[0],point1[1]) < 0.01 ) {
      selectedShape = "p1";
    } else if ( dist(mx,my,point2[0],point2[1]) < 0.01 ) {
      selectedShape = "p2";
    } else if ( dist(mx,my,handler1[0],handler1[1]) < 0.01 ) {
      selectedShape = "h1";
    } else if ( dist(mx,my,handler2[0],handler2[1]) < 0.01 ) {
      selectedShape = "h2";
    }
    mouseP = true;
  } else if (!mousePressed) {
    selectedShape = "";
    mouseP = false;
  }
  
  if (!selectedShape.equals("")) {
    if (selectedShape.equals("p1")) { point1[0]=mx; point1[1]=my; }
    else if (selectedShape.equals("p2")) { point2[0]=mx; point2[1]=my; }
    else if (selectedShape.equals("h1")) { handler1[0]=mx; handler1[1]=my; }
    else if (selectedShape.equals("h2")) { handler2[0]=mx; handler2[1]=my; }
  }
  
  stroke(180);
  strokeWeight(1.0);
  line(point1[0]*width, point1[1]*height,handler1[0]*width, handler1[1]*height);
  line(point2[0]*width, point2[1]*height,handler2[0]*width, handler2[1]*height);
 
  strokeWeight(10.0); 
  stroke(0,0,250);
  point(point1[0]*width, point1[1]*height);
  point(handler1[0]*width, handler1[1]*height);
  stroke(250,0,250);
  point(handler2[0]*width, handler2[1]*height);
  point(point2[0]*width, point2[1]*height);
  
  stroke(0.0);
  strokeWeight(1.0);
  beginShape();
  vertex(point1[0]*width, point1[1]*height);
  bezierVertex(handler1[0]*width, handler1[1]*height, handler2[0]*width, handler2[1]*height, point2[0]*width, point2[1]*height);
  endShape();
  
  float[] nps = curveSmoothing(point1[0],point1[1],handler1[0],handler1[1],point2[0],point2[1],handler2[0],handler2[1],0.8F,"points");
  float[] inter = segmentsIntersection(point1[0],point1[1],handler1[0],handler1[1],point2[0],point2[1],handler2[0],handler2[1]);
  if (nps==null) {
      stroke(255,0,0);
      strokeWeight(1.0);
      line(point1[0]*width,point1[1]*height,point2[0]*width,point2[1]*height);
  } else {
      stroke(0,255,0);
      strokeWeight(5.0);
      point(inter[0]*width, inter[1]*height);
      stroke(0,0,250);
      point(nps[0]*width, nps[1]*height);
      stroke(250,0,250);
      point(nps[2]*width, nps[3]*height);
      stroke(0,250,0,150);
      strokeWeight(4.0);
      beginShape();
      vertex(point1[0]*width, point1[1]*height);
      bezierVertex(nps[0]*width, nps[1]*height, nps[2]*width, nps[3]*height, point2[0]*width, point2[1]*height);
      endShape();
  }
  
}



        public static float[] curveSmoothing(
			float point1x, float point1y, float handler1x, float handler1y,
			float point2x, float point2y, float handler2x, float handler2y,
                        float strength,
			String returnType /*distance, points*/
		) {
		float[] out = null;
		float[] intersection = 	segmentsIntersection(point1x,point1y,handler1x,handler1y,point2x,point2y,handler2x,handler2y);
		if (
			( Math.abs(PApplet.dist(handler1x,handler1y,handler2x,handler2y))>Math.abs(PApplet.dist(point1x,point1y,point2x,point2y)*strength) ) &&
			( intersection[2] == 1 )		
			) {
			float pdist = PApplet.dist(point1x,point1y,point2x,point2y)*strength;
			float hdist = PApplet.dist(handler1x,handler1y,handler2x,handler2y);
			float tokeep1 = PApplet.dist(handler1x,handler1y,intersection[0],intersection[1])*(pdist/hdist);
			float tokeep2 = PApplet.dist(handler2x,handler2y,intersection[0],intersection[1])*(pdist/hdist);
			float ndist1 = PApplet.dist(point1x,point1y,intersection[0],intersection[1])+tokeep1;
			float ndist2 = PApplet.dist(point2x,point2y,intersection[0],intersection[1])+tokeep2;
			if (returnType.equals("distance")) {
				out = new float[] { ndist1, ndist2 };
			} else if (returnType.equals("points")) {
				out = new float[] {0,0,0,0};
				float cangl = (float) Math.atan2( handler1y - point1y, handler1x - point1x );
				//new position of handler1
				out[0] = point1x + (float) (Math.cos(cangl))*ndist1;
				out[1] = point1y + (float) (Math.sin(cangl))*ndist1;
				//new position of handler 2
				cangl = (float) Math.atan2( handler2y - point2y, handler2x - point2x );
				out[2] = point2x + (float) (Math.cos(cangl))*ndist2;
				out[3] = point2y + (float) (Math.sin(cangl))*ndist2;
			} else {
				System.err.println("curveSmoothing, returnType:"+returnType+" unknown");
			}
		}
		return out;
	}
	
	public static float[] segmentsIntersection(
				float line1x1, float line1y1,
				float line1x2, float line1y2, 
				float line2x1, float line2y1,
				float line2x2, float line2y2) 
	{

		float[] out = new float[] { 0, 0, 0 };

			float[] l1 = computeLine(line1x1, line1y1, line1x2,line1y2);
			float[] l2 = computeLine(line2x1, line2y1, line2x2,line2y2);
			out[1] = (l1[0] * ((l2[1] - l1[1]) / (l1[0] - l2[0]))) + l1[1];
			out[0] = (out[1] - l1[1]) / l1[0];
			if (
				Float.isNaN(out[0]) || 
				Float.isNaN(out[1]) || 
				Float.isInfinite(out[0]) || 
				Float.isInfinite(out[1]) || 
				(out[0] == 0 && out[1] == 0)
				) {
				//if 2 points have the same position
				if ((line1x1 == line2x1)&& (line1y1 == line2y1)) {
					out[0] = line1x1;
					out[1] = line1y1;
				} else if ((line2x1 == line1x2)&& (line2y1 == line1y2)) {
					out[0] = line1x2;
					out[1] = line1y2;
				} else if ((line1x2 == line2x2)&& (line1y2 == line2y2)) {
					out[0] = line1x2;
					out[1] = line1y2;
				} else if ((line1x1 == line2x2)&& (line1y1 == line2y2)) {
					out[0] = line1x1;
					out[1] = line1y1;
				} else {
					out[0] = line1x1+ ((line1x2 - line1x1) * 0.5F);
					out[1] = line2y2+ ((line2y1 - line2y2) * 0.5F);
					out[2] = -1;
				}
			}
		//is out belongs to both lines?
		// < 0.00001 allows calculation errors...
		if (
			( 
			( PApplet.dist(out[0], out[1], line1x1, line1y1) + PApplet.dist(out[0], out[1], line1x2, line1y2) - PApplet.dist(line1x1, line1y1, line1x2, line1y2) ) < 0.00001
			) && (
			( PApplet.dist(out[0], out[1], line2x1, line2y1) + PApplet.dist(out[0], out[1], line2x2, line2y2) - PApplet.dist(line2x1, line2y1, line2x2, line2y2) ) < 0.00001
			) && ( out[2] != -1 )
		) { out[2] = 1; }
		if  ( out[2] == -1 ) { out[2] = 0; }

		return out;
	}
	
	public static float[] computeLine(float x1, float y1, float x2, float y2) {
		float[] out = new float[2];
		out[0] = (y1 - y2) / (x1 - x2);
		out[1] = y1 - (out[0] * x1);
		return out;
	}

