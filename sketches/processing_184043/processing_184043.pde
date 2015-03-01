
/*
based on http://www.openprocessing.org/sketch/31295#
created by jakkubu @ Kraków 2014
*/

import java.util.List;
import java.util.Arrays;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import de.bezier.guido.*;


// variables describing figure
List<PVector> vertexes;
int[][] triList;



int triNum;
float zoom=1.0;
float e_sum=20.45;
float mx=0, my=2;
float startX=0, startY=0;
int vertexNum;
float range;
float averageRadius;
float gradientPower;

float tX_speed, tY_speed, tZ_speed;
float k_X, k_Y, k_Z;
float tX, tY, tZ;
ColorButton c1Button;
ColorButton c2Button;
ColorButton c3Button;

SimpleButton newShapeButton;
ToggleButton xSpring, ySpring, zSpring;
ColorSlider sliderRed,  sliderBlue,  sliderGreen;
boolean mouseFree = true;
Graph graph;
boolean isJavaScript = true;

// SETUP VARIBLES
// you can change it to change type of random figure
// this function is called before creating new shape
void changeFigureType() {
	// number of vertexes:
	vertexNum = int(random(15, 30));

	// how far points can be from original sphere
	range = random(0,20);
	// 0 - all points are on the same sphere, but placed randomly
	// 40 - shape will have more spikes

	// change how fast gradient will change
	// 1 - it will change smoothly
	// 4 - very rapid
	gradientPower = random(1,5);


	// if you don't want to randomize this value just uncomment the next line and set value
	// gradientPower = 3;
	// println("gradientPower: "+gradientPower);
	tX_speed = random(0, 1);
	tY_speed = random(0, 1);
	tZ_speed = random(0, 1);
	float norm = tX_speed + tY_speed + tZ_speed;
	tX_speed /= 75*norm;
	tY_speed /= 75*norm;
	tZ_speed /= 75*norm;


	k_X = 0;
	k_Y = 0;
	k_Z = 0;

	tX = 0;
	tY = 0;
	tZ = 0;


}
	

public void setup() {

	Interactive.make( this );
	size(1000, 300, P3D);
	// ortho();
	ortho(0, width, 0, height, -10000, 10000);
	int x = 0;
	int y = -10;
	newShapeButton = new SimpleButton( 20 + x, height-30+y, 70, 20, "New Shape" );
	newShapeButton.setEvent("newShape");

	x = 310;
	y = -10;
	c1Button = new ColorButton( width-490 + x, height-70+y, 40, 15);
	c2Button = new ColorButton( width-435 + x, height-70+y, 40, 15);
	c3Button = new ColorButton( width-380 + x, height-70+y, 40, 15);

	sliderRed = 	new ColorSlider ( width-490+ x, height-50+y, 150, 10, "r");
	sliderGreen = 	new ColorSlider ( width-490+ x, height-35+y, 150, 10, "g" );
	sliderBlue = 	new ColorSlider ( width-490+ x, height-20+y, 150, 10, "b");

	x = 290;
	xSpring = new ToggleButton( width-580+ x, height-25+y, 15, 15, "x" );
	ySpring = new ToggleButton( width-555+ x, height-25+y, 15, 15, "y" );
	zSpring = new ToggleButton( width-530+ x, height-25+y, 15, 15, "z" );
	xSpring.setEvent("toggleSpringX");
	zSpring.setEvent("toggleSpringY");
	ySpring.setEvent("toggleSpringZ");

	createNewShape();
	setSlidersColorBtn(c1Button);
	
}

int k = 0;
public void draw() {
	tX += tX_speed;
	tY += tY_speed;
	tZ += tZ_speed;

	tX_speed -= tX*k_X;
	tY_speed -= tY*k_Y;
	tZ_speed -= tZ*k_Z;
        
    if (isJavaScript) {
		translate(width/2, -height/2);
    }
	pushMatrix();
        ellipse( 100, 100, 100, 100 ); 
	// setup the space
	background(0);
	text("Springs toggle", width-255, height-50); 
	stroke(255);
	strokeWeight(1);
	// save state of the matrix
	
	// camera();
	translate(width - 150, height/2 - 50, 0);
	// translate(width/2, height/2, 0);
	rotateX(tX);
	rotateY(tY);
	rotateZ(tZ);


	//gives a float between -1 and 1 depending on mouseX 
	float ax= rotationDisplayment(mouseX); 
	//as above, but for mouseY 
	float ay= rotationDisplayment(mouseY);

	if (mousePressed== true && mouseFree) {
		my = ay - startY;
		mx = ax - startX;
	}

	rotateX(my);
	rotateY(mx);

	scale(zoom);
	

	// add black frame around each triangle
	stroke(0);

	// fill each triangle with white color
	fill(125);

	// actual drawing the image
	// lights(); 
	noSmooth();
	beginShape(TRIANGLES);
	for (int[] tri : triList) {
		PVector v1 = vertexes.get(tri[0]);
		PVector v2 = vertexes.get(tri[1]);
		PVector v3 = vertexes.get(tri[2]);

		color c = getColor(v1.x, v1.y);
		fill(c);
		vertex(v1.x, v1.y, v1.z);

		c = getColor(v2.x, v2.y);
		fill(c);
		vertex(v2.x, v2.y, v2.z);
		
		c = getColor(v3.x, v3.y);
		fill(c);
		vertex(v3.x, v3.y, v3.z);
	}
	endShape();
	// return the last saved state of the matrix (this is actually not necessary in this case)
	k++;
	graph.step();
	if (k > 5) {
		k = 0;
		graph.update(vertexes);
	}
	popMatrix();
        pushMatrix();
//        translate(0, height/2);
	graph.display();
	// smooth();
        popMatrix();

	// hacky solution to color buttons in javascript, don't know why it works.
        ellipse( -100, 100, 10, 10 ); 
}

color getColor(float x, float y){
	float x_c1 = -averageRadius;
	float y_c1 = 0;
	float x_c2 = sin(radians(30))*averageRadius;
	float y_c2 = cos(radians(30))*averageRadius;
	float x_c3 = sin(radians(30))*averageRadius;
	float y_c3 = -cos(radians(30))*averageRadius;

	float d1 = pow(sqrt(sq(x_c1-x)+sq(y_c1-y)),gradientPower);
	float d2 = pow(sqrt(sq(x_c2-x)+sq(y_c2-y)),gradientPower);
	float d3 = pow(sqrt(sq(x_c3-x)+sq(y_c3-y)),gradientPower);

	float r = (c1Button.red()*d1 + c2Button.red()*d2 + c3Button.red()*d3)/(d1+d2+d3);
	float g = (c1Button.green()*d1 + c2Button.green()*d2 + c3Button.green()*d3)/(d1+d2+d3);
	float b = (c1Button.blue()*d1 + c2Button.blue()*d2 + c3Button.blue()*d3)/(d1+d2+d3);
	return color(r,g,b);
}

void mousePressed() {
	if (mouseFree) {
		startX = rotationDisplayment(mouseX) - mx; 
		startY = rotationDisplayment(mouseY) - my; 
	}
//   println("mouseX: " + mouseX + "   mouseY:" + mouseY);
//   println("screenX: " + screenX(mouseX, mouseY, 0));  
}

float rotationDisplayment(int mouseCoord) {
	return ((float)mouseCoord-(width/2.0))/(width/2.0)*4; 
}
//**********************************************************************

void createNewShape() {
	// I decided to use Delaunay triangularization for creating triangles from cloud of random points on a sphere - this ensures us that resulting figure makes sense 
	zoom = 1;
	randomizeFigureColors();
	changeFigureType();
	Delaunay d = new Delaunay();
	background(0);
	vertexes = new ArrayList<PVector>();
	float[][] vertexAngles = new float[vertexNum][2];
	// println("vertexes: " + vertexNum);
	// here are created random points. They are laying on sphere. 
	for (int i = 0; i < vertexNum; i++) {
		// we add some small random number to radius in order to avoid computational bugs 
		float r = 90 + random(0.01f);
		float phi = acos(random(-1,1)) - PI/2;
		float theta = radians(random(360));
		vertexAngles[i][0] = phi;
		vertexAngles[i][1] = theta;
		vertexes.add(new PVector(r*cos(phi)*cos(theta), r*sin(phi), r*cos(phi)*sin(theta)));
	}

	// println("start triangularization");
	// here Delaunay triangularization take place 
	d.performTrinagularization(vertexes);
	// println("triangularization finished");

	// after creating list of points we map achieved triangles to saved points so each triangle vertex is saved by reference to each vertex rather than absolute position
	// this enables us quick movement of vertex without changes in triangles lists 
	mapTriangles(d);
	// than we randomize vertexes changing only the radius of each vertex. That way it's sure that resulting figure makes sense. 
	randomizeVertexes(vertexAngles);
	graph = new Graph(vertexNum);
}

float toggleSpring(float k) {
	if (k == 0) {
		k = 1/(3 * pow(10, random(2, 5)));
	} else {
		k = 0;
	}
	tX = tX % (2*PI);
	tY = tY % (2*PI);
	tZ = tZ % (2*PI);
	return k;
}

void mapTriangles(Delaunay d) {
	// map triangles to vertexes
	triNum = d.triangles.size();
	// println("triangles: " + triNum);
	triList = new int[triNum][3];
	// for each triangle search for each vertex in vertex list and save reference to this vertex
	for (int i = 0; i < triNum; ++i) {
		PVector v1 = d.triangles.get(i).v1;
		PVector v2 = d.triangles.get(i).v2;
		PVector v3 = d.triangles.get(i).v3;
		for (int n = 0; n < vertexNum; ++n) {
				if (v1==vertexes.get(n)) {
		       // println("success: tri=" + i + " ver:" + n );
		       triList[i][0] = n;
		   }else if (v2==vertexes.get(n)) {
		       // println("success: tri=" + i + " ver:" + n );
		       triList[i][1] = n;
		   }else if (v3==vertexes.get(n)) {
		       // println("success: tri=" + i + " ver:" + n );
		       triList[i][2] = n;
		   }
		}
	}
}

void randomizeVertexes(float[][] vertexAngles) {
	// println("range: " + range);
	float sumRadius = 0;
	for (int i = 0; i < vertexNum; ++i) {
		// for each vertex we don't change it's angles only the radius is changing
		float phi = vertexAngles[i][0];
		float theta = vertexAngles[i][1];
		// the range variable sets the range for whole figure so it will be more like sphere or hedgehog 
		float r = random(70,70+range);
		vertexes.add(i, new PVector(r*cos(phi)*cos(theta), r*sin(phi), r*cos(phi)*sin(theta)));
		sumRadius +=r;
	}
	averageRadius = sumRadius/vertexNum;
}

void randomizeFigureColors() {
	color c1 = color((random(0,255)), (random(0,255)), (random(0,255)));
	color c2 = color((random(0,255)), (random(0,255)), (random(0,255)));
	color c3 = color((random(0,255)), (random(0,255)), (random(0,255)));
	c1Button.setCol(c1);
	c2Button.setCol(c2);
	c3Button.setCol(c3);
}


void keyPressed() {
  if (key == 'c' || key == 'C') {
    createNewShape();
  } 
}


void mouseWheel(MouseEvent event) {
	// for zooming the figure
	float e = event.getCount();

	e_sum+=e;
	if (e_sum>100){
		e_sum=100;
	};
	if (e_sum<0){
		e_sum=0;
	}
	zoom = map(e_sum, 0, 100, 0.1, 4.5);
}


import java.util.concurrent.*;

public class Delaunay {

    List<PVector> vertices;     
    ArrayList<Tetrahedron> tetras;   

    public List<Line> edges;

    public List<Line> surfaceEdges;
    public List<Triangle> triangles;


    public Delaunay() {
        vertices = new ArrayList<PVector>();
        tetras = new ArrayList<Tetrahedron>();
        edges = new ArrayList<Line>();
        surfaceEdges = new ArrayList<Line>();
        triangles = new ArrayList<Triangle>();
    }

    public void performTrinagularization(List<PVector> seq) {

        tetras.clear();
        edges.clear();

        
        
        PVector vMax = new PVector(-999, -999, -999);
        PVector vMin = new PVector( 999,  999,  999);
        for(PVector v : seq) {
            if (vMax.x < v.x) vMax.x = v.x;
            if (vMax.y < v.y) vMax.y = v.y;
            if (vMax.z < v.z) vMax.z = v.z;
            if (vMin.x > v.x) vMin.x = v.x;
            if (vMin.y > v.y) vMin.y = v.y;
            if (vMin.z > v.z) vMin.z = v.z;
        }

        PVector center = new PVector();     
        center.x = 0.5f * (vMax.x - vMin.x);
        center.y = 0.5f * (vMax.y - vMin.y);
        center.z = 0.5f * (vMax.z - vMin.z);
        float r = -1;                       
        for(PVector v : seq) {
            if (r < PVector.dist(center, v)) r = PVector.dist(center, v);
        }
        r += 0.1f;                          

        
        PVector v1 = new PVector();
        v1.x = center.x;
        v1.y = center.y + 3.0f*r;
        v1.z = center.z;

        PVector v2 = new PVector();
        v2.x = center.x - 2.0f*(float)Math.sqrt(2)*r;
        v2.y = center.y - r;
        v2.z = center.z;

        PVector v3 = new PVector();
        v3.x = center.x + (float)Math.sqrt(2)*r;
        v3.y = center.y - r;
        v3.z = center.z + (float)Math.sqrt(6)*r;

        PVector v4 = new PVector();
        v4.x = center.x + (float)Math.sqrt(2)*r;
        v4.y = center.y - r;
        v4.z = center.z - (float)Math.sqrt(6)*r;

        PVector[] outer = {v1, v2, v3, v4};
        tetras.add(new Tetrahedron(v1, v2, v3, v4));

        
        ArrayList<Tetrahedron> tmpTList = new ArrayList<Tetrahedron>();
        ArrayList<Tetrahedron> newTList = new ArrayList<Tetrahedron>();
        ArrayList<Tetrahedron> removeTList = new ArrayList<Tetrahedron>();
        for(PVector v : seq) {
            tmpTList.clear();
            newTList.clear();
            removeTList.clear();
            for (Tetrahedron t : tetras) {
                if((t.o != null) && (t.r > PVector.dist(v, t.o))) {
                    tmpTList.add(t);
                }
            }

            for (Tetrahedron t1 : tmpTList) {
                
                tetras.remove(t1);

                v1 = t1.vertices[0];
                v2 = t1.vertices[1];
                v3 = t1.vertices[2];
                v4 = t1.vertices[3];
                newTList.add(new Tetrahedron(v1, v2, v3, v));
                newTList.add(new Tetrahedron(v1, v2, v4, v));
                newTList.add(new Tetrahedron(v1, v3, v4, v));
                newTList.add(new Tetrahedron(v2, v3, v4, v));
            }

            boolean[] isRedundancy = new boolean[newTList.size()];
            for (int i = 0; i < isRedundancy.length; i++) isRedundancy[i] = false;
            for (int i = 0; i < newTList.size()-1; i++) {
                for (int j = i+1; j < newTList.size(); j++) {
                    if(newTList.get(i).equals(newTList.get(j))) {
                        isRedundancy[i] = isRedundancy[j] = true;
                    }
                }
            }
            for (int i = 0; i < isRedundancy.length; i++) {
                if (!isRedundancy[i]) {
                    tetras.add(newTList.get(i));
                }

            }
            
        }

        
        boolean isOuter = false;
        ArrayList<Tetrahedron> tetrasClone = new ArrayList<Tetrahedron>(tetras);
        for (Tetrahedron t4 : tetrasClone) {
            isOuter = false;
            for (PVector p1 : t4.vertices) {
                for (PVector p2 : outer) {
                    if (p1.x == p2.x && p1.y == p2.y && p1.z == p2.z) {
                        isOuter = true;
                    }
                }
            }
            if (isOuter) {
                tetras.remove(t4);
            }
        }

        triangles.clear();
        boolean isSame = false;
        for (Tetrahedron t : tetras) {
            for (Line l1 : t.getLines()) {
                isSame = false;
                for (Line l2 : edges) {
                    if (l2.equals(l1)) {
                        isSame = true;
                        break;
                    }
                }
                if (!isSame) {
                    edges.add(l1);
                }
            }
        }

        
        
       
        ArrayList<Triangle> triList = new ArrayList<Triangle>();
        for (Tetrahedron t : tetras) {
            v1 = t.vertices[0];
            v2 = t.vertices[1];
            v3 = t.vertices[2];
            v4 = t.vertices[3];

            Triangle tri1 = new Triangle(v1, v2, v3);
            Triangle tri2 = new Triangle(v1, v3, v4);
            Triangle tri3 = new Triangle(v1, v4, v2);
            Triangle tri4 = new Triangle(v4, v3, v2);

            PVector n;
            
            n = tri1.getNormal();
            if(n.dot(v1) > n.dot(v4)) tri1.turnBack();

            n = tri2.getNormal();
            if(n.dot(v1) > n.dot(v2)) tri2.turnBack();

            n = tri3.getNormal();
            if(n.dot(v1) > n.dot(v3)) tri3.turnBack();

            n = tri4.getNormal();
            if(n.dot(v2) > n.dot(v1)) tri4.turnBack();

            triList.add(tri1);
            triList.add(tri2);
            triList.add(tri3);
            triList.add(tri4);
        }
        boolean[] isSameTriangle = new boolean[triList.size()];
        for(int i = 0; i < triList.size()-1; i++) {
            for(int j = i+1; j < triList.size(); j++) {
                    
                if (triList.get(i).equals(triList.get(j))) isSameTriangle[i] = isSameTriangle[j] = true;
            }
        }
        for(int i = 0; i < isSameTriangle.length; i++) {
            if (!isSameTriangle[i]) triangles.add(triList.get(i));
        }

        surfaceEdges.clear();
        ArrayList<Line> surfaceEdgeList = new ArrayList<Line>();
        for(Triangle tri : triangles) {
            for (Line l : tri.getLines()) {
                surfaceEdgeList.add(l);
            }
            // surfaceEdgeList.addAll(Arrays.asList(tri.getLines()));
        }
        boolean[] isRedundancy = new boolean[surfaceEdgeList.size()];
        for(int i = 0; i < surfaceEdgeList.size()-1; i++) {
            for (int j = i+1; j < surfaceEdgeList.size(); j++) {
                if (surfaceEdgeList.get(i).equals(surfaceEdgeList.get(j))) isRedundancy[j] = true;
            }
        }

        for (int i = 0; i < isRedundancy.length; i++) {
            if (!isRedundancy[i]) surfaceEdges.add(surfaceEdgeList.get(i));
        }
        
    }
}

//--------------------_GUI_--------------------------

void buttonEvent(String event) {
	if (event == "newShape") {
		createNewShape();
    } else if (event == "toggleSpringX") {
        k_X = toggleSpring(k_X);
        println("k_X: "+k_X);
        println("tX: "+tX);
        println("tX_speed: "+tX_speed);
    } else if (event == "toggleSpringY") {
        k_Y = toggleSpring(k_Y);
	} else if (event == "toggleSpringZ") {
        k_Z = toggleSpring(k_Z);
    }
}

public class SimpleButton {
    float x, y, width, height;
    boolean on;
    String button_text;
    String event = "none";
    
    SimpleButton ( float xx, float yy, float w, float h, String txt)
    {
        x = xx; y = yy; width = w; height = h;
        button_text = txt;
        
        Interactive.add( this ); // register it with the manager
    }
    
    // called by manager
    
    void mousePressed () 
    {
        buttonEvent(event);
    }

    void setEvent(String newEvent) {
        event = newEvent;
    }

    void mouseEntered (){
        mouseFree = false;
    }

    void mouseExited () {
        mouseFree = true;
    }


    void draw () 
    {
//        fill( 100 );
        stroke(255);
        noFill();
        rect(x, y, width, height);
        fill( 255 );
        textAlign(CENTER, CENTER);
        if (isJavaScript) {
            text(button_text, x + width/2 + 2, y + height/2 - 2); 
        } else {
            text(button_text, x + width/2, y + height/2 - 2); 
        }
    }
}
public class ToggleButton {
    float x, y, width, height;
    boolean on;
    String button_text;
    String event = "none";
    
    ToggleButton ( float xx, float yy, float w, float h, String txt)
    {
        x = xx; y = yy; width = w; height = h;
        button_text = txt;
        
        Interactive.add( this ); // register it with the manager
    }
    
    // called by manager
    
    void mousePressed () {
        on = !on;
        buttonEvent(event);
    }

    void setEvent(String newEvent) {
        event = newEvent;
    }

    void mouseEntered (){
        mouseFree = false;
    }

    void mouseExited () {
        mouseFree = true;
    }


    void draw () 
    {
//        fill( 100 );
        stroke(255);
        noFill();
        if (on) {
            fill(125);
        }
        rect(x, y, width, height);
        fill( 255 );
        textAlign(CENTER, CENTER);
        if (isJavaScript) {
            text(button_text, x + width/2 + 2, y + height/2 - 2); 
        } else {
            text(button_text, x + width/2, y + height/2 - 2); 
        }
    }
}

public class ColorButton {
    float x, y, width, height;
    String event = "none";
    color c;
    
    ColorButton ( float xx, float yy, float w, float h)
    {
        x = xx; y = yy; width = w; height = h;
        c = color((random(0,255)), (random(0,255)), (random(0,255)));
        Interactive.add( this ); // register it with the manager
    }
    
    // called by manager
    
    void mousePressed () 
    {
        setSlidersColorBtn(this);
    }

    color getColor() {
        return c;
    }

    void setCol(color newColor) {
        c = newColor;
    }
    
    void setRed(float newRed) {
        float g = this.green();
        float b = this.blue();
        c = color(newRed,g,b);
    }
    
    void setGreen(float newGreen) {
        float r = this.red();
        float b = this.blue();
        c = color(r, newGreen,b);
    }
    
    void setBlue(float newBlue) {
        float r = this.red();
        float g = this.green();
        c = color(r,g,newBlue);
    }
    
    
    float green() {
        return c >> 8 & 0xFF;
    }

    float red() {
        return c >> 16 & 0xFF;
    }

    float blue() {
        return c & 0xFF;
    }

    void mouseEntered (){
        mouseFree = false;
    }

    void mouseExited () {
        mouseFree = true;
    }



    void draw () {
        fill( c );
        noStroke();
//        fill(color(204, 102, 0));
        rect(x, y, width, height);
        
    }
}


public class ColorSlider {
    color c;
    ColorButton colorBtn;
    String col;
    float x, y, width, height;
    float valueX = 0, value;
    boolean on;
    
    ColorSlider ( float xx, float yy, float ww, float hh, String _color ) {
        this.x = xx; 
        this.y = yy; 
        this.width = ww; 
        this.height = hh;
        
        this.valueX = x;
        Interactive.add( this );

        col = _color;
        if (_color == "r") {
            c = color(255,0,0);
        } else if (_color == "g") {
            c = color(0,255,0);
        } else if (_color == "b") {
            c = color(0,0,255);
        }
    
    }

    public void setColorButton(ColorButton _colorBtn) {
        colorBtn = _colorBtn;
        if (col == "r") {
            valueX = colorBtn.red();
            // println("red: " + colorBtn.red());
        } else if (col == "g") {
            valueX = colorBtn.green();
            // println("green: " + colorBtn.green());
        } else if (col == "b") {
            valueX = colorBtn.blue();
            // println("blue: " + colorBtn.blue());
        }
        valueX = (valueX/255)* (width-height) + x;
    }

    public void mouseEntered () {
        mouseFree = false;
    }

    public void mouseExited () {
        mouseFree = true;
    }
    
    public void mouseDragged ( float mx, float my ) {
        mouseFree = false;
        valueX = mx - height/2;
        
        if ( valueX < x ) valueX = x;
        if ( valueX > x+width-height ) valueX = x+width-height;
        
        value = map( valueX, x, x+width-2*height, 0, 1 );
        
        // Interactive.send( this, "valueChanged", value );
        if (col == "r") {
            colorBtn.setRed(value*255);
        } else if (col == "g") {
            colorBtn.setGreen(value*255);
        } else if (col == "b") {
            colorBtn.setBlue(value*255);
        }

    }
    
    public void draw () {
        
        noStroke();
        // hacky solution to color sliders in javascript
        fill(c);
        rect( valueX, y, height, height );
        fill( colorBtn.getColor() );
        rect( x, y, width, height );
        
        stroke(0);
        fill(c);
        rect( valueX, y, height, height );
    }
}


void setSlidersColorBtn(ColorButton _colorBtn) {
    sliderRed.setColorButton(_colorBtn);
    sliderGreen.setColorButton(_colorBtn);
    sliderBlue.setColorButton(_colorBtn);
}
public class Graph  {
    ArrayList<GraphLine> lines = new ArrayList<GraphLine>();
    int vertexNum;
    

    public Graph (int vertexNum) {
        this.vertexNum = vertexNum;
        for (int i = 0; i < vertexNum; ++i) {
            lines.add(new GraphLine(i));
        }
    }

    void update(List<PVector> vertexes) {
        for (GraphLine l : lines) {
            l.newPoint(vertexes);
        }
    }

    void display() {
        if (isJavaScript) {
            for (GraphLine l : lines) {
                l.displayJS();
            }
        } else {
            for (GraphLine l : lines) {
                l.display();
            }
        }
        stroke(0);
    }

    void step() {
        for (GraphLine l : lines) {
            l.step();
        }
    }

}

public class GraphLine  {
    ArrayList<GraphPoint> points = new ArrayList<GraphPoint>();
    ArrayList<GraphLineSegment> segments = new ArrayList<GraphLineSegment>();
    GraphPoint lastPoint;
    int index;
    PVector vertex;
    GraphLineSegment tmpSegment = null;
    GraphPoint tmpPoint;


    public GraphLine (int index) {
        this.index = index;
    }

    void display() {
        if (segments.size() > 0) {
            for (GraphLineSegment s : segments) {
                s.display();
            }
           if (tmpSegment != null) {
             tmpSegment.display();
           }
        }
    }

    void displayJS() {
        if (segments.size() > 0) {
            for (GraphLineSegment s : segments) {
                s.displayJS();
            }
           if (tmpSegment != null) {
             tmpSegment.displayJS();
           }
        }
    }

    void newPoint(List<PVector> vertexes) {
        vertex = vertexes.get(index);
        int c = getColor(vertex.x, vertex.y);
        float xx = screenX(vertex.x, vertex.y, vertex.z);
        float yy = screenY(vertex.x, vertex.y, vertex.z);
        GraphPoint p = new GraphPoint(xx, yy, c);
        points.add(p);
        if (points.size()>1) {
            segments.add(new GraphLineSegment(lastPoint, p));
        }
        lastPoint = p;
        if (segments.size() > 250) {
            segments.remove(0);
            points.remove(0);
        }
    }

    void step() {
        for (GraphPoint p : points) {
            p.step();
        }
       if (segments.size() > 0) {
         float xx = screenX(vertex.x, vertex.y, vertex.z);
         float yy = screenY(vertex.x, vertex.y, vertex.z);
         tmpPoint = new GraphPoint(xx, yy, color(0));
         tmpSegment = new GraphLineSegment(lastPoint, tmpPoint);
       }
    }

}

public class GraphLineSegment  {
    GraphPoint p1, p2;

    public GraphLineSegment (GraphPoint p1, GraphPoint p2) {
        this.p1 = p1;
        this.p2 = p2;
    }

    void display() {
        stroke(p1.c);
        // strokeWeight(2);
        line(p1.xx, p1.yy, -100, p2.xx, p2.yy, -100);
    }

    void displayJS() {
        stroke(p1.c);
        // strokeWeight(2);
        line(p1.xx, p1.yy + height, -100, p2.xx, p2.yy + height, -100);
    }

}

public class GraphPoint  {
    int c;
    float xx, yy, zz;

    public GraphPoint (float xx, float yy, int c) {
        this.c = c;
        this.xx = xx;
        this.yy = yy;
    }

    void step() {
        xx--;
    }

    void display() {
        fill(c);
        noStroke();
        ellipse(xx, yy, 2, 2);
    }

}
class Line {
    public PVector start, end;
    public Line(PVector start, PVector end) {
        this.start = start;
        this.end = end;
    }

    
    public void reverse() {
        PVector tmp = this.start;
        this.start = this.end;
        this.end = tmp;
    }

    
    public boolean equals(Line l) {
        if ((this.start == l.start && this.end == l.end)
                || (this.start == l.end && this.end == l.start))
            return true;
        return false;
    }
}
class Tetrahedron {
    
    PVector[] vertices;
    PVector o;      
    float   r;      

    public Tetrahedron(PVector[] v) {
        this.vertices = v;
        getCenterCircumcircle();
    }

    public Tetrahedron(PVector v1, PVector v2, PVector v3, PVector v4) {
        this.vertices = new PVector[4];
        vertices[0] = v1;
        vertices[1] = v2;
        vertices[2] = v3;
        vertices[3] = v4;
        getCenterCircumcircle();
    }

    public boolean equals(Tetrahedron t) {
        int count = 0;
        for (PVector p1 : this.vertices) {
            for (PVector p2 : t.vertices) {
                if (p1.x == p2.x && p1.y == p2.y && p1.z == p2.z) {
                    count++;
                }
            }
        }
        if (count == 4) return true;
        return false;
    }

    public Line[] getLines() {
        PVector v1 = vertices[0];
        PVector v2 = vertices[1];
        PVector v3 = vertices[2];
        PVector v4 = vertices[3];

        Line[] lines = new Line[6];

        lines[0] = new Line(v1, v2);
        lines[1] = new Line(v1, v3);
        lines[2] = new Line(v1, v4);
        lines[3] = new Line(v2, v3);
        lines[4] = new Line(v2, v4);
        lines[5] = new Line(v3, v4);
        return lines;
    }

    
    private void getCenterCircumcircle() {
        PVector v1 = vertices[0];
        PVector v2 = vertices[1];
        PVector v3 = vertices[2];
        PVector v4 = vertices[3];

        double[][] A = {
            {v2.x - v1.x, v2.y-v1.y, v2.z-v1.z},
            {v3.x - v1.x, v3.y-v1.y, v3.z-v1.z},
            {v4.x - v1.x, v4.y-v1.y, v4.z-v1.z}
        };
        double[] b = {
            0.5 * (v2.x*v2.x - v1.x*v1.x + v2.y*v2.y - v1.y*v1.y + v2.z*v2.z - v1.z*v1.z),
            0.5 * (v3.x*v3.x - v1.x*v1.x + v3.y*v3.y - v1.y*v1.y + v3.z*v3.z - v1.z*v1.z),
            0.5 * (v4.x*v4.x - v1.x*v1.x + v4.y*v4.y - v1.y*v1.y + v4.z*v4.z - v1.z*v1.z)
        };
        double[] x = new double[3];
        if (gauss(A, b, x) == 0) {
            o = null;
            r = -1;
        } else {
            o = new PVector((float)x[0], (float)x[1], (float)x[2]);
            r = PVector.dist(o, v1);
        }
    }

    /** LU分解による方程式の解法 **/
    private double lu(double[][] a, int[] ip) {
        int n = a.length;
        double[] weight = new double[n];

        for(int k = 0; k < n; k++) {
            ip[k] = k;
            double u = 0;
            for(int j = 0; j < n; j++) {
                double t = Math.abs(a[k][j]);
                if (t > u) u = t;
            }
            if (u == 0) return 0;
            weight[k] = 1/u;
        }
        double det = 1;
        for(int k = 0; k < n; k++) {
            double u = -1;
            int m = 0;
            for(int i = k; i < n; i++) {
                int ii = ip[i];
                double t = Math.abs(a[ii][k]) * weight[ii];
                if(t>u) { u = t; m = i; }
            }
            int ik = ip[m];
            if (m != k) {
                ip[m] = ip[k]; ip[k] = ik;
                det = -det;
            }
            u = a[ik][k]; det *= u;
            if (u == 0) return 0;
            for (int i = k+1; i < n; i++) {
                int ii = ip[i]; double t = (a[ii][k] /= u);
                for(int j = k+1; j < n; j++) a[ii][j] -= t * a[ik][j];
            }
        }
        return det;
    }
    private void solve(double[][] a, double[] b, int[] ip, double[] x) {
        int n = a.length;
        for(int i = 0; i < n; i++) {
            int ii = ip[i]; double t = b[ii];
            for (int j = 0; j < i; j++) t -= a[ii][j] * x[j];
            x[i] = t;
        }
        for (int i = n-1; i >= 0; i--) {
            double t = x[i]; int ii = ip[i];
            for(int j = i+1; j < n; j++) t -= a[ii][j] * x[j];
            x[i] = t / a[ii][i];
        }
    }
    private double gauss(double[][] a, double[] b, double[] x) {
        int n = a.length;
        int[] ip = new int[n];
        double det = lu(a, ip);

        if(det != 0) { solve(a, b, ip, x);}
        return det;
    }
}

class Triangle {
    private PVector v1, v2, v3;
    public PVector[] points;
    public Triangle(PVector v1, PVector v2, PVector v3) {
        this.v1 = v1;
        this.v2 = v2;
        this.v3 = v3;
        this.points = new PVector[3];
        this.points[0] = v1;
        this.points[1] = v2;
        this.points[2] = v3;
    }

    
    
    public PVector getNormal() {
        PVector edge1 = new PVector(v2.x-v1.x, v2.y-v1.y, v2.z-v1.z);
        PVector edge2 = new PVector(v3.x-v1.x, v3.y-v1.y, v3.z-v1.z);

        
        PVector normal = edge1.cross(edge2);
        normal.normalize();
        return normal;
    }

    
    public void turnBack() {
        PVector tmp = this.v3;
        this.v3 = this.v1;
        this.v1 = tmp;
    }

    
    public Line[] getLines() {
        Line[] l = {
            new Line(v1, v2),
            new Line(v2, v3),
            new Line(v3, v1)
        };
        return l;
    }

    
    public boolean equals(Triangle t) {
        PVector[] points1 = this.points;
        PVector[] points2 = t.points;

        int cnt = 0;
        for(int i = 0; i < 3; i++) {
            for(int j = 0; j < 3; j++) {
                if (points1[i] == points2[j])
                    cnt++;
            }
        }
        if (cnt == 3) return true;
        else return false;

    }
}



