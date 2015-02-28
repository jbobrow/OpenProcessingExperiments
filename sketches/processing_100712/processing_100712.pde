
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/83881*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

import controlP5.*;

float ATT_FORCE = 15.0;
ArrayList p;
int TAIL_LENGTH = 133;
float FRICTION =  0.006;
float FOLLOW_SPEED = 30.0;

int C_TRAIL_LENGTH = 3000;
//float sx, sy;
float dIM = 2.0, gravCon = 1.0;
float totalMass = 0;


PVector center, scenter;
//ArrayList centrail;
float zoom = 1.0;
//float ratio = 1.0;
//float l, r, t, b;

//Field field;
PImage bck;

ControlP5 cp5;
Textlabel dimLabel;
Slider gravityCtr;

int rightMar, leftMar, topMar, bottomMar;
int numParts;
int hitType;
boolean fIXEDmASS;


void setup() {
  size(600, 600);

  bck = loadImage("bck.png");

  center = new PVector(0, 0);
  scenter = new PVector(0, 0);
  //  centrail = new ArrayList();
  p = new ArrayList();

  //field = new Field();

  for (int i = 0 ; i < 3;i++){
      Particle addend = new Particle(random(width) - width/2, random(height) - height/2);
      center.x += addend.mass * addend.pos.x;
      center.y += addend.mass * addend.pos.y;
      p.add( addend );
      totalMass += addend.mass;
  }
  center.mult( 1 / totalMass );

  rightMar = width - 20;
  leftMar = 20;
  bottomMar = height - 20;
  topMar  = 20;

  hitType = 1;
  fIXEDmASS = false;
  
  setupControls();
}


void draw() {
    //  GravCon = gravCtrValue / 10;
    
  background(bck);

  //optional force field (undone)
  // field.draw();



  scenter.x += (center.x-scenter.x) / FOLLOW_SPEED;
  scenter.y += (center.y-scenter.y) / FOLLOW_SPEED;

  pushMatrix();

  translate(-scenter.x+width/2, -scenter.y+height/2);




  noFill();
  stroke(#ff1100);



  // for (int i = 1 ; i < centrail.size();i++) {
  //   PVector tmp1 = (PVector)centrail.get(i-1);
  //   PVector tmp2 = (PVector)centrail.get(i);

  //   //strokeWeight(map(i, 0, centrail.size(), 1, 5));
  //   stroke(#ff1100, map(i, 0, centrail.size(), 5, 90));
  //   line(tmp1.x, tmp1.y, tmp2.x, tmp2.y);
  // }

  // strokeWeight(1);
  fill(#ff1100);
  //ellipse((l+sx/2.0), (t+sy/2.0), 10, 10);
  ellipse(center.x, center.y, 5, 5);

  noFill();


  // l = t = 10000.0;
  // r = b = -10000.0;

  /*
  if (p.size()>2) {
   
   //zoom += ((1.0/ratio)-zoom)/ 100.0;
   zoom = ratio;
   scale(1.0/ratio+1.0);
   }
   */

  for (int i = 0 ; i < p.size();i++) {
    Particle tmp = (Particle)p.get(i);
    tmp.updateAcc();
  }

  for (int i = 0 ; i < p.size();i++) {
    Particle tmp = (Particle)p.get(i);
    tmp.move();
  }

  for (int i = 0 ; i < p.size() - 1; i++) {
      Particle tmp1 = (Particle)p.get(i);
      for ( int j = i + 1; j < p.size(); j++ ){
	  Particle tmp2 = (Particle)p.get(j);
	  if ( 2 * tmp1.pos.dist( tmp2.pos ) <= tmp1.R + tmp2.R ){
	      switch ( hitType ) {
		  case 1: 
		      tmp1.bounce( tmp2 );
		      break;
		  case 2:
		      tmp1.smoosh( tmp2 );
		      break;}
	  }}}

  for (int i = 0 ; i < p.size();i++) {
    Particle tmp = (Particle)p.get(i);
    tmp.drawTail();
  }

  for (int i = 0 ; i < p.size();i++) {
    Particle tmp = (Particle)p.get(i);
    tmp.draw();

  }

  // sx = (r-l);
  // sy = (b-t);

  // if (sx > width || sy > height) {
  //   ratio = ((width/sx+1.0) / (height/sy+1.0))/2.0;//(1.0+norm(sx,0,width))/(width+0.0);
  // }

  noFill();
  //stroke(#ffcc00);
  //rect(l, t, sx, sy);





  // centrail.add(new PVector((center.x), (center.y)));

  // if (centrail.size()>C_TRAIL_LENGTH)
  //   centrail.remove(0); 



  popMatrix();
}

void mousePressed() {
    if ( leftMar < mouseX && mouseX < rightMar &&
	 topMar < mouseY && mouseY < bottomMar ){
	if (mouseButton==LEFT) {
	    p.add(new Particle());
	    //println("p.size() = " + p.size() );
	    resetCenter();
	}
	else {
	    if (p.size()>=1) {
		p.remove(p.size()-1);
		resetCenter();
	    }
	}}
}

void resetCenter() {
    center = new PVector(0,0);
    totalMass = 0;
    for ( int i = 0; i < p.size(); i++ ) {
	Particle tmp = (Particle)p.get(i);
	center.x += tmp.pos.x * tmp.mass;
	center.y += tmp.pos.y * tmp.mass;
	totalMass += tmp.mass;
    }
    if ( totalMass > 0 ){
    center.mult( 1 / totalMass );
    }
}

class Particle {
    ArrayList tail;
    PVector pos, acc, vel;
    float R, mass;
    int id;

    void setMass(){
	mass = pow( R, dIM ) / 100;
    }

    void setR( float r ){
	R = r;
	setMass();}
    
    void setVel( PVector v ){
	vel = v;}

    Particle() {
	pos = new PVector(mouseX+scenter.x-width/2, mouseY+scenter.y-height/2); 
	initialize();
    }

    Particle(float _x, float _y) {
	pos = new PVector(_x, _y);
	initialize();
    }

    void initialize() {
	id = numParts++;
	if ( fIXEDmASS ){
	    R = 6;}
	else {R = random(12) + 4;}
	setMass();
	acc = new PVector(0, 0);
	//rpos = new PVector(0, 0); 
	vel = new PVector(mouseX-pmouseX, mouseY-pmouseY);
	tail = new ArrayList();
    }

    void updateAcc() {
	acc = new PVector(0,0);

	for (int i = 0 ; i < p.size();i++) {
	    if (i!=p.indexOf(this)) {
		Particle other = (Particle)p.get(i);
		float d = dist(pos.x, pos.y, other.pos.x, other.pos.y);
		PVector dir = new PVector(other.pos.x-pos.x, other.pos.y-pos.y);
		dir.normalize();
		dir.mult(ATT_FORCE * other.mass / pow(d, gravCon));


		acc.add(dir);
	    }
	}
    }

    void move() {
	PVector oldpos = new PVector(pos.x, pos.y);
	pos.add(vel);
	vel.add(acc);
	vel.mult(1.0/(FRICTION+1.0));

	center.x += (pos.x - oldpos.x) * mass / totalMass;
	center.y += (pos.y - oldpos.y) * mass / totalMass;

	tail.add(new PVector(pos.x, pos.y));

	if (tail.size()>TAIL_LENGTH)
	    tail.remove(0);


	//	getDimm();
    }

    // void deflect() {
    //   PVector dd = new PVector(sx, sy);
    //   dd.mult(0.0001);
    //   acc.sub(dd);
    // }

    // void getDimm() {
    //   l = min(pos.x, l);
    //   r = max(pos.x, r);
    //   t = min(pos.y, t);
    //   b = max(pos.y, b);
    // }  


    void draw() {


	fill(0);
	noStroke();

	ellipse(pos.x, pos.y, R, R);
	//rpos = new PVector(screenX(pos.x, pos.y), screenY(pos.x, pos.y));
	//println( "pos = ( " + pos.x + ", " + pos.y + " )" );
    }

    void drawTail() {
	noFill();
	beginShape();
	for (int i = 0 ; i < tail.size();i++) {
	    PVector tmp = (PVector)tail.get(i);
	    // strokeWeight(map(i, 0, tail.size(), 1, r/2.0));
	    stroke(0, map(i, 0, tail.size(), 0, 255));
	    vertex(tmp.x, tmp.y);
	}
	endShape();
    }

    void bounce( Particle other ){
	PVector distV = PVector.sub( this.pos, other.pos );
	PVector imp = new PVector( distV.x, distV.y );
	imp.normalize();
	float thisSpeed = imp.dot( this.vel );
	float otherSpeed = imp.dot( other.vel );
	float massSum = this.mass + other.mass;
	float otherAlpha = ( 2 * other.mass ) / massSum;
	//float thisAlpha =  1 - otherAlpha;
	float otherBeta = 2 - otherAlpha;
	//float thisBeta = otherAlpha - 1;
	float thisDelSpeed = otherAlpha * ( otherSpeed - thisSpeed );
	float otherDelSpeed = otherBeta * ( thisSpeed - otherSpeed );
	PVector thisDelVel = PVector.mult( imp, thisDelSpeed );
	PVector otherDelVel = PVector.mult( imp, otherDelSpeed );
	this.vel.add( thisDelVel );
	other.vel.add( otherDelVel );
	float delPos = ( this.R + other.R - distV.mag() ) / 2;
	this.pos.add( PVector.mult( imp, delPos ) );
	other.pos.add( PVector.mult( imp, -delPos ) );	      
   }

    void smoosh(  Particle other ){
	float massSum = this.mass + other.mass;
	PVector momThis = PVector.mult( this.vel, this.mass );
	PVector momOther = PVector.mult( other.vel, other.mass );
	PVector momNew = PVector.add( momThis, momOther );
	PVector velNew = PVector.mult( momNew, 1 / massSum );
        PVector posNew = PVector.mult( PVector.add( PVector.mult( this.pos, this.mass ), 
						  PVector.mult( other.pos, other.mass )),
				     1 / massSum );
	float newR = pow( massSum * 100, 1 / dIM );
	Particle newPart = new Particle( posNew.x, posNew.y );
	newPart.setR( newR );
	newPart.setVel( velNew );
	removePartID( other.id );
	removePartID( this.id );
	p.add( newPart );
}
}

    int findPart( int idnum ){
	for ( int i = 0; i < p.size(); i++ ){
	    if ( ((Particle)p.get(i)).id == idnum ){
		return( i );}
	}
	return( -1 );
}
     
    void removePartID( int idnum ){
	int ind = findPart( idnum );
	p.remove( ind );}
/**
 * ControlP5 Slider. Horizontal and vertical sliders, 
 * with and without tick marks and snap-to-tick behavior.
 * by andreas schlegel, 2010
 */

/**
* ControlP5 Slider
*
* Horizontal and vertical sliders, 
* With and without tick marks and snap-to-tick behavior.
*
* find a list of public methods available for the Slider Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/



void setupControls() {
    cp5 = new ControlP5(this);

    dimLabel = cp5.addTextlabel( "dimText" )
	.setText( nf( gravCon, 1, 1 ))
	.setPosition( rightMar, topMar + 180 )
	.setSize( 20, 20)
	.setColorValue(0);

    cp5.addSlider("dimCtrValue")
	.setPosition( rightMar, topMar - 20 )
	.setSize(20,200)
	.setRange( 20, 30 )
	.setNumberOfTickMarks(11)
	.setValue( 20 );

    cp5.addToggle( "bounceToggle" )
	.setPosition( 0, 0 )
	.setSize( 20, 20 );

    cp5.addToggle( "fixedMassToggle" )
	.setPosition( 0, bottomMar )
	.setSize( 20, 20 );
}


void dimCtrValue( int n ){
    dIM = ( (float) n / 10.0 );
    gravCon = dIM - 1;

    for (int i = 0; i < p.size(); i++ ){
	((Particle)p.get(i)).setMass();}
    resetCenter();
    //println( "graveCon = " +  nf( gravCon, 1, 1 ) );
    dimLabel.setText( nf( dIM, 1, 1 ) );
}

void bounceToggle(){
    hitType = 3 - hitType;}

void fixedMassToggle(){
    fIXEDmASS = ! fIXEDmASS;}


