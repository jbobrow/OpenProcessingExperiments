
float[] origin = new float[] { 0.5, 0.95 };
float[] target = new float[] { 0.3, 0.05 };

float[] point1 = new float[] { 0.2, 0.5 };
float[] handler1 = new float[] { 0.2, 0.2 };
float[] point2 = new float[] { 0.5, 0.5 };
float[] handler2 = new float[] { 0.5, 0.2 };
float[] handler3 = new float[] { 0.5, 0.8 };
float[] point3 = new float[] { 0.8, 0.5 };
float[] handler4 = new float[] { 0.8, 0.8 };

ArrayList allPoints;

boolean mouseP = false;
String selectedShape = "";

void setup() {
size(400,400);

  allPoints = new ArrayList();
  allPoints.add(point1);
  allPoints.add(point2);
  allPoints.add(point3);

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
    } else if ( dist(mx,my,handler3[0],handler3[1]) < 0.01 ) {
      selectedShape = "h3";
    } else if ( dist(mx,my,point3[0],point3[1]) < 0.01 ) {
      selectedShape = "p3";
    } else if ( dist(mx,my,handler4[0],handler4[1]) < 0.01 ) {
      selectedShape = "h4";
    } else if ( dist(mx,my,origin[0],origin[1]) < 0.01 ) {
      selectedShape = "origin";
    } else if ( dist(mx,my,target[0],target[1]) < 0.01 ) {
      selectedShape = "target";
    }
    mouseP = true;
  } else if (!mousePressed) {
    selectedShape = "";
    mouseP = false;
  }
  
  if (!selectedShape.equals("")) {
    if (selectedShape.equals("p1")) { point1[0]=mx; point1[1]=my; }
    else if (selectedShape.equals("p2")) { point2[0]=mx; point2[1]=my; }
    else if (selectedShape.equals("p3")) { point3[0]=mx; point3[1]=my; }
    else if (selectedShape.equals("h1")) { handler1[0]=mx; handler1[1]=my; }
    else if (selectedShape.equals("h2")) { 
      handler2[0]=mx; handler2[1]=my;
      float h2angl = (float) Math.atan2(handler2[1]-point2[1],handler2[0]-point2[0]);
      float h3dist = dist(point2[0],point2[1],handler3[0],handler3[1]);
      handler3[0]=point2[0]+(float) (Math.cos(h2angl+PI)*h3dist); 
      handler3[1]=point2[1]+(float) (Math.sin(h2angl+PI)*h3dist);  
    }
    else if (selectedShape.equals("h3")) { 
      handler3[0]=mx; handler3[1]=my;
      float h3angl = (float) Math.atan2(handler3[1]-point2[1],handler3[0]-point2[0]);
      float h2dist = dist(point2[0],point2[1],handler2[0],handler2[1]);
      handler2[0]=point2[0]+(float) (Math.cos(h3angl+PI)*h2dist); 
      handler2[1]=point2[1]+(float) (Math.sin(h3angl+PI)*h2dist); 
    }
    else if (selectedShape.equals("h4")) { handler4[0]=mx; handler4[1]=my; }
    else if (selectedShape.equals("origin")) { origin[0]=mx; origin[1]=my; }
    else if (selectedShape.equals("target")) { target[0]=mx; target[1]=my; }
  }
  
  stroke(180);
  strokeWeight(1.0);
  line(point1[0]*width, point1[1]*height,handler1[0]*width, handler1[1]*height);
  line(point2[0]*width, point2[1]*height,handler2[0]*width, handler2[1]*height);
  line(point2[0]*width, point2[1]*height,handler3[0]*width, handler3[1]*height);
  line(point3[0]*width, point3[1]*height,handler4[0]*width, handler4[1]*height);
  
  stroke(0,30);
  line(point1[0]*width, point1[1]*height,origin[0]*width, origin[1]*height);
  line(point2[0]*width, point2[1]*height,origin[0]*width, origin[1]*height);
  line(point3[0]*width, point3[1]*height,origin[0]*width, origin[1]*height);
 
  strokeWeight(5.0); 
  stroke(0,0,250);
  point(point1[0]*width, point1[1]*height);
  point(handler1[0]*width, handler1[1]*height);
  stroke(250,0,250);
  point(handler2[0]*width, handler2[1]*height);
  point(point2[0]*width, point2[1]*height);
  point(handler3[0]*width, handler3[1]*height);
  stroke(250,255,0);
  point(point3[0]*width, point3[1]*height);
  point(handler4[0]*width, handler4[1]*height);
  
  stroke(250,0,0);
  point(origin[0]*width, origin[1]*height);
  point(target[0]*width, target[1]*height);
  strokeWeight(1.0); 
  line(origin[0]*width, origin[1]*height,target[0]*width, target[1]*height);
  
  stroke(0.0);
  strokeWeight(1.0);
  beginShape();
  vertex(point1[0]*width, point1[1]*height);
  bezierVertex(handler1[0]*width, handler1[1]*height, handler2[0]*width, handler2[1]*height, point2[0]*width, point2[1]*height);
  bezierVertex(handler3[0]*width, handler3[1]*height, handler4[0]*width, handler4[1]*height, point3[0]*width, point3[1]*height);
  endShape();
  
  ArrayList iums = new ArrayList();
  float[] imu = new float[0];
  int icurve = 1;
  imu = intersectionLineBezier( new float[] { origin[0], origin[1], target[0], target[1] } , new float[] { point1[0], point1[1], handler1[0], handler1[1], handler2[0], handler2[1], point2[0], point2[1], } );
  if (imu.length==0) {
    icurve = 2;  
    imu = intersectionLineBezier( new float[] { origin[0], origin[1], target[0], target[1] } , new float[] { point2[0], point2[1], handler3[0], handler3[1], handler4[0], handler4[1], point3[0], point3[1], } );
  }
  
  if (imu.length>0) {
    for (int i=0; i<imu.length; i++) {
    double mu, mum1,mum13,mu3;
      mu = imu[i];
       mum1 = 1 - mu;
       mum13 = mum1 * mum1 * mum1;
       mu3 = mu * mu * mu;
      float xn = 0;
      float yn = 0;
      if (icurve == 1) {
      xn = (float) ( mum13*point1[0] + 3*mu*mum1*mum1*handler1[0] + 3*mu*mu*mum1*handler2[0] + mu3*point2[0] );
      yn = (float) ( mum13*point1[1] + 3*mu*mum1*mum1*handler1[1] + 3*mu*mu*mum1*handler2[1] + mu3*point2[1] );
      } else if (icurve == 2) {
      xn = (float) ( mum13*point2[0] + 3*mu*mum1*mum1*handler3[0] + 3*mu*mu*mum1*handler4[0] + mu3*point3[0] );
      yn = (float) ( mum13*point2[1] + 3*mu*mum1*mum1*handler3[1] + 3*mu*mu*mum1*handler4[1] + mu3*point3[1] );
      }
      
        stroke(0.0);
        strokeWeight(6);
        point(xn*width, yn*height);
        strokeWeight(1);
        ellipse(xn*width, yn*height, 15, 15);
        
      
  }
  }
  
}


//public static 


        public float[] intersectionLineBezier( float[] lp, float[] cp ) {
          float[] li = computeLine(lp[0], lp[1], lp[2], lp[3]);
          double a = (double) ( -(li[0]*cp[0])+(3*li[0]*cp[2])-(3*li[0]*cp[4])+(li[0]*cp[6])+cp[1]-(3*cp[3])+(3*cp[5])-cp[7] );
          double b = (double) ( (3*li[0]*cp[0])-(6*li[0]*cp[2])+(3*li[0]*cp[4])-(3*cp[1])+(6*cp[3])-(3*cp[5]) );
          double c = (double) ( -(3*li[0]*cp[0])+(3*li[0]*cp[2])+(3*cp[1])-(3*cp[3]) );
          double d = (double) ( (li[0]*cp[0])-cp[1]+li[1] );
          return thirdDegree(a,b,c,d);
        }


        public static float[] thirdDegree( double a, double b, double c, double d ) {
		
		float[] out;
		
		double gDelta, x, y, z, im, re, u, v, p, q, m, n, theta, k;
		x=-1;
                y=-1;
                z=-1;

		System.out.println("\nl'equation a resoudre est : " + a + "x^3+" + b + "x^2+" + c + "x+" + d + "=0\n");

		p = (c / a) - (Math.pow(b, 2.0) / (3 * Math.pow(a, 2.0)));
		q = ((2 * Math.pow(b, 3.0)) / (27 * Math.pow(a, 3.0)))
				- ((b * c) / (3 * Math.pow(a, 2.0))) + (d / a);
		gDelta = 4 * Math.pow(p, 3.0) + 27 * Math.pow(q, 2.0);
		m = ((-q) / 2) + (0.5) * Math.sqrt(gDelta / 27);
		n = ((-q) / 2) - (0.5) * Math.sqrt(gDelta / 27);
		u = Math.pow(Math.abs(m), 1.0 / 3);
		v = Math.pow(Math.abs(n), 1.0 / 3);

		if (gDelta > 0) {
			if (m < 0)
				u = -u;
			if (n < 0)
				v = -v;
			x = u + v;
			x += (-b) / (3 * a);
			re = (-x) / 2;
			im = (Math.sqrt(3) / 2) * (u - v);
			re += (-b) / (3 * a);
			System.out.println("1 racine reelle:\n x = " + x + "");
			System.out.println("2 racines complexes:\n" + " y = " + re + "-" + im + "i , z = " + re + "+" + im + "i");
		}

		else if (gDelta == 0) {
			if (b == 0 & c == 0 && d == 0)
				System.out.println("1 racine reelle de multiplicite 3:\n x = y = z = 0 ");
			else {
				x = (3 * q) / p;
				x += (-b) / (3 * a);
				y = (-3 * q) / (2 * p);
				y += (-b) / (3 * a);
				System.out.println("1 racine reelle simple:\n x = " + x + "");
				System.out.println("1 racine reelle double:\n y = z = " + y + "");
			}
		} else {
			k = (3 * q) / ((2 * p) * Math.sqrt((-p) / 3));
			theta = Math.acos(k);
			x = 2 * Math.sqrt((-p) / 3) * Math.cos(theta / 3);
			y = 2 * Math.sqrt((-p) / 3)
					* Math.cos((theta + 2 * Math.PI) / 3);
			z = 2 * Math.sqrt((-p) / 3)
					* Math.cos((theta + 4 * Math.PI) / 3);
			if (x > -1E-6 && x < 1E-6)
				x = 0.0;
			if (y > -1E-6 && y < 1E-6)
				y = 0.0;
			if (z > -1E-6 && z < 1E-6)
				z = 0.0;
			x += (-b) / (3 * a);
			y += (-b) / (3 * a);
			z += (-b) / (3 * a);
			System.out.println("3 racines reelles:\n x = " + x + " , y = " + y + " , z = " + z + "");
		}
                
                ArrayList results = new ArrayList();
                
                
            if ( x >= 0 && x <= 1 ) { results.add((float) x); }  
            if ( y >= 0 && y <= 1 ) { results.add((float) y); }  
              if ( z >= 0 && z <= 1 ) { results.add((float) z); }
              
                out = new float[results.size()];
                for(int i=0; i<results.size(); i++) { out[i] = Float.parseFloat(results.get(i).toString()); }

		return out;
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

