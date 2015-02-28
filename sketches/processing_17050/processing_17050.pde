
public static class ExtendedShapes {

	public static void Polygon (
			PApplet parent,
			float x, float y,
			float width, float height, 
			int faces, float rotation) {
		if (faces > 2) {
			parent.beginShape();
			float tx1 = 0, ty1 = 0;
			for (int i = 0; i<faces; i++) {
				double a = ((Math.PI * 2) / (double) faces) * (double) i;
				a += rotation;
				float tx = x + (float) (width * Math.cos(a));
				float ty = y + (float) (height * Math.sin(a));
				parent.vertex(tx, ty);
				if (i == 0) { tx1 = tx; ty1 = ty; }
				if (i==faces-1) { parent.vertex(tx1, ty1); }
			}
			parent.endShape();
		} else {
			System.err.print("impossible to draw a shape with less than 2 faces");
		}
	}
	
	public static void Polygon (
			PApplet parent,
			float x, float y,
			float width, float height, 
			int faces, float rotation,
			float random) {
		if (faces > 2) {
			parent.beginShape();
			float tx1 = 0, ty1 = 0;
			// random value will be diffused upon the angles
			float r[] = new float[faces];
			float t = 0;
			for (int i=0; i<faces; i++) { r[i] = (float) Math.random(); t += r[i]; }
			// verifying that random is between 0 & 2PI
			if (random < 0) { random *= -1; }
			if (random > Math.PI) { random = random % (float) Math.PI; }
			double c = (Math.PI * 2) - random;
			double a = rotation;
			for (int i = 0; i<faces; i++) {
				a += (c / (float) faces) + ((r[i]/t)*random);
				float tx = x + (float) (width * Math.cos(a));
				float ty = y + (float) (height * Math.sin(a));
				parent.vertex(tx, ty);
				if (i == 0) { tx1 = tx; ty1 = ty; }
				if (i == faces-1) { parent.vertex(tx1, ty1); }
			}
			parent.endShape();
		} else {
			System.err.print("impossible to draw a shape with less than 2 faces");
		}
	}
	
	public static void CornerPolygon (
			PApplet parent,
			float x, float y,
			float width, float height, 
			int faces, float rotation,
			float cornerPercentage) {
		if (faces > 2) {
			parent.beginShape();
			if (cornerPercentage < 0) { cornerPercentage *= -1; }
			if (cornerPercentage > 0.49) { cornerPercentage = 0.49f; }
			float ratio = cornerPercentage;
			float [][] pts = new float[faces+1][2];
			for (int i = 0; i<faces; i++) {
				double a = ((Math.PI * 2) / (double) faces) * (double) i;
				a += rotation;
				pts[i][0] = (float) (width * Math.cos(a));
				pts[i][1] = (float) (height * Math.sin(a));
				if (i==faces-1) {
					pts[i+1][0] = pts[0][0];
					pts[i+1][1] = pts[0][1];
				} 
			}
			for (int i = 0; i<faces+1; i++) {
				// 2 points per passage
				float[] cp = pts[i];
				float[] pp;
				float[] np;
				if (i==0) { pp = pts[faces-1]; } else { pp = pts[i-1]; }
				if (i<faces) { np = pts[i+1]; } else { np = pts[faces-1]; }
				parent.vertex(x + (cp[0] - ((cp[0]-pp[0])*ratio)), y + (cp[1] - ((cp[1]-pp[1])*ratio)));
				if (i<faces) { parent.vertex(x + (cp[0] + ((np[0]-cp[0])*ratio)), y + (cp[1] + ((np[1]-cp[1])*ratio))); }
			}
			parent.endShape();
		} else {
			System.err.print("impossible to draw a shape with less than 2 faces");
		}
	}
	
	public static void RoundedPolygon (
			PApplet parent,
			float x, float y,
			float width, float height, 
			int faces, float rotation,
			float roundedPercentage) {
		if (faces > 2) {
			if (roundedPercentage < 0) { roundedPercentage *= -1; }
			if (roundedPercentage > 0.49) { roundedPercentage = 0.49f; }
			float ratio = roundedPercentage;
			float [][] pts = new float[faces+1][2];
			for (int i = 0; i<faces; i++) {
				double a = ((Math.PI * 2) / (double) faces) * (double) i;
				a += rotation;
				pts[i][0] = (float) (width * Math.cos(a));
				pts[i][1] = (float) (height * Math.sin(a));
				if (i==faces-1) {
					pts[i+1][0] = pts[0][0];
					pts[i+1][1] = pts[0][1];
				} 
			}
			parent.beginShape();
			for (int i = 0; i<faces+1; i++) {
				// 2 points per passage
				float[] cp = pts[i];
				float[] pp;
				float[] np;
				if (i==0) { pp = pts[faces-1]; } else { pp = pts[i-1]; }
				if (i<faces) { np = pts[i+1]; } else { np = pts[faces-1]; }
				parent.vertex(x + (cp[0] - ((cp[0]-pp[0])*ratio)), y + (cp[1] - ((cp[1]-pp[1])*ratio)));
				if (i<faces) { 
					parent.bezierVertex(
							x + (cp[0] - ((cp[0]-pp[0])*ratio*0.33f)), 
							y + (cp[1] - ((cp[1]-pp[1])*ratio*0.33f)),
							x + (cp[0] + ((np[0]-cp[0])*ratio*0.33f)), 
							y + (cp[1] + ((np[1]-cp[1])*ratio*0.33f)),
							x + (cp[0] + ((np[0]-cp[0])*ratio)), 
							y + (cp[1] + ((np[1]-cp[1])*ratio))
					);
				}
			}
			parent.endShape();
		} else {
			System.err.print("impossible to draw a shape with less than 2 faces");
		}
	}
	
	public static void Star (
			PApplet parent,
			float x, float y,
			float ext_width, float ext_height,
			float int_width, float int_height,
			int pin, 
			float ext_rotation, float int_rotation) {
		if (pin > 2) {
			parent.beginShape();
			float ltx1 = 0, lty1 = 0;
			for (int i = 0; i<pin; i++) {
				double a = ((Math.PI * 2) / (double) pin) * (double) i;
				a += ext_rotation;
				double a2 = a + ((Math.PI) / (double) pin);
				a2 += int_rotation;
				float tx1 = x + (float) (ext_width * Math.cos(a));
				float ty1 = y + (float) (ext_height * Math.sin(a));				
				float tx2 = x + (float) (int_width * Math.cos(a2));
				float ty2 = y + (float) (int_height * Math.sin(a2));
				parent.vertex(tx1, ty1);
				parent.vertex(tx2, ty2);
				if (i == 0) { ltx1 = tx1; lty1 = ty1; }
				if (i==pin-1) { parent.vertex(ltx1, lty1); }
			}
			parent.endShape();
		} else {
			System.err.print("impossible to draw a star with less than 2 pins");
		}
	}

	public static void RoundedStar (
			PApplet parent,
			float x, float y,
			float ext_width, float ext_height,
			float int_width, float int_height,
			int pin, 
			float ext_rotation, float int_rotation,
			float roundedPercentage) {
		if (pin > 2) {
			if (roundedPercentage < 0) { roundedPercentage *= -1; }
			if (roundedPercentage > 0.49) { roundedPercentage = 0.49f; }
			float ratio = roundedPercentage;
			float[][] pts = new float[(pin+1)*2][2];
			for (int i = 0; i<pin; i++) {
				double a = ((Math.PI * 2) / (double) pin) * (double) i;
				a += ext_rotation;
				double a2 = a + ((Math.PI) / (double) pin);
				a2 += int_rotation;
				float tx1 = (float) (ext_width * Math.cos(a));
				float ty1 = (float) (ext_height * Math.sin(a));				
				float tx2 = (float) (int_width * Math.cos(a2));
				float ty2 = (float) (int_height * Math.sin(a2));
				pts[i*2][0] = tx1;
				pts[i*2][1] = ty1;
				pts[(i*2)+1][0] = tx2;
				pts[(i*2)+1][1] = ty2;
				if (i == pin-1) {
					pts[(i+1)*2][0] = pts[0][0];
					pts[(i+1)*2][1] = pts[0][1];
					pts[(i+1)*2 +1][0] = pts[1][0];
					pts[(i+1)*2 +1][1] = pts[1][1];
				}
			}
			parent.beginShape();
			for (int i = 0; i<pts.length; i++) {
				// 2 points per passage
				float[] cp = pts[i];
				float[] pp;
				float[] np;
				if (i==0) { pp = pts[pts.length-1]; } else { pp = pts[i-1]; }
				if (i<pts.length-1) { np = pts[i+1]; } else { np = pts[pts.length-1]; }
				if (i<pts.length-1) { 
					parent.vertex(x + (cp[0] - ((cp[0]-pp[0])*ratio)), y + (cp[1] - ((cp[1]-pp[1])*ratio)));
					if (i>0) {
						parent.bezierVertex(
								x + (cp[0] - ((cp[0]-pp[0])*ratio*0.33f)), 
								y + (cp[1] - ((cp[1]-pp[1])*ratio*0.33f)),
								x + (cp[0] + ((np[0]-cp[0])*ratio*0.33f)), 
								y + (cp[1] + ((np[1]-cp[1])*ratio*0.33f)),
								x + (cp[0] + ((np[0]-cp[0])*ratio)), 
								y + (cp[1] + ((np[1]-cp[1])*ratio))
						);
					}
				}
			}
			parent.endShape();
		} else {
			System.err.print("impossible to draw a star with less than 2 pins");
		}
	}

}

