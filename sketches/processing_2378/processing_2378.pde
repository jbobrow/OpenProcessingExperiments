
import java.util.ArrayList;
import java.util.Iterator;

import processing.core.PApplet;






 static float diffMin = 0.1f;
 static float pas = 0.1f;
 static float limiteZ = 200f;
 static int FOND = 0;
 static int COULEUR = 255;

	// gestion de la rotation
 float xR, yR;
 boolean horsZone;
 float mouseXP;
 float mouseYP;


 ArrayList points = new ArrayList();



 void draw() {
		//
	background(FOND);
		

		//
	translate(width / 2, height / 2, -100);

	if (!horsZone && mousePressed) {			
		xR = yR = 0;
	
		mouseXP = mouseX;
		mouseYP = mouseY;
		
		Iterator iterator = points.iterator();
		while (iterator.hasNext()) {
			anamorpheRandom((Point3HC) iterator.next());
		}

	} else {
			
		rotateY(xR);
		rotateZ(yR);
			
		xR += (((mouseX-mouseXP) / 100.00) - xR) * .05;
		yR += (((mouseY-mouseYP) / 100.00) - yR) * .05;
			
	}

	noStroke();
	if(horsZone)
		fill(255,0,0);
	else
		fill(255);
		// On dessine le premier rectangle 0-1-2
	beginShape(TRIANGLE_STRIP);
		Iterator iterator0 = points.iterator();
	while (iterator0.hasNext()) {
		Point3HC point3HC = (Point3HC) iterator0.next();
//			stroke(255);
//			fill(255 - limiteZ + point3HC.getZ());
		vertex(point3HC.getX(), point3HC.getY(), point3HC.getZ());
	}
	endShape();

	// on maj les XScreen et YScreen de chaque point
	
	horsZone = false;
	Iterator iterator = points.iterator();
	while (iterator.hasNext()) {
		Point3HC point = (Point3HC) iterator.next();
		point.setXScreen(screenX(point.getX(), point.getY(), point.getZ()));
		point.setYScreen(screenY(point.getX(), point.getY(), point.getZ()));
		
		if(point.getXScreen() < 0 || point.getXScreen() > width 
				 || point.getYScreen() < 0 || point.getYScreen() > height)
			horsZone = true;
	}		
	
}


public void setup() {
	size(800, 600, P3D);
		// Le fond
	background(FOND);
		// Init de la liste
	for (int i = -6; i < 6; i++) {
		if (i % 2 == 0)
			points.add(new Point3HC(10 * i, 75, 0));
		else
			points.add(new Point3HC(10 * i, -75, 0));
	}

		// init rotation
	xR = 0f;
	yR = 0f;
				
	mouseXP = mouseX;
	mouseYP = mouseY;
		

	// noStroke();
	stroke(255);
	fill(COULEUR);
	frameRate(40);


}

	
	/**
	 * Cette fonction détermine si la rotation est nulle
	 * @return
	 */
 boolean estEnMouvement(){
	return false;
 }

	/**
	 * On passe les coordonnées d'un point : On transforme son z de manière
	 * aléatoire. On ajuste le x et y du point afin qu'ils matchent les anciens
	 * screenX et screenY
	 * 
	 * @param xCourant
	 * @param yCourant
	 * @param zCourant
	 * @return
	 */
public void anamorpheRandom(Point3HC point) {

		// // On garde les screenX et Y avant de changer le z
		// float x;
		// float y;
		// x = screenX(point.getX(), point.getY(), point.getZ());
		// y = screenY(point.getX(), point.getY(), point.getZ());

		// On maj le z
		float tempZ = (float) random(0,1) * limiteZ;
		if (random(0,1) > 0.5)
			tempZ = -tempZ;
		point.setZ(tempZ);

		// test
		point.setX(0);
		point.setY(0);

		// On cherche le nouvelX
		int compteur = 0;
		while (abs(screenX(point.getX(), point.getY(), point.getZ())
				- point.getXScreen()) > diffMin) {
			if (screenX(point.getX(), point.getY(), point.getZ()) > point
					.getXScreen())
				point.setX(point.getX() - pas);
			else
				point.setX(point.getX() + pas);
			compteur++;
		}
		// On cherche le nouvelY
		while (abs(screenY(point.getX(), point.getY(), point.getZ())
				- point.getYScreen()) > diffMin) {
			// System.out.println("yop");
			if (screenY(point.getX(), point.getY(), point.getZ()) > point
					.getYScreen())
				point.setY(point.getY() - pas);
			else
				point.setY(point.getY() + pas);
			compteur++;
		}

	}



public class Point3HC {
	
	private float x;
	
	private float y;
	
	private float z;
	
	private float xScreen;
	
	private float yScreen;
	
	public Point3HC(float x, float y, float z) {
		super();
		this.x = x;
		this.y = y;
		this.z = z;
	}
	
	public void maj(){
		
	}

	public float getX() {
		return x;
	}

	public void setX(float x) {
		this.x = x;
	}

	public float getY() {
		return y;
	}

	public void setY(float y) {
		this.y = y;
	}

	public float getZ() {
		return z;
	}

	public void setZ(float z) {
		this.z = z;
	}

	public float getXScreen() {
		return xScreen;
	}

	public void setXScreen(float screen) {
		xScreen = screen;
	}

	public float getYScreen() {
		return yScreen;
	}

	public void setYScreen(float screen) {
		yScreen = screen;
	}	

}

