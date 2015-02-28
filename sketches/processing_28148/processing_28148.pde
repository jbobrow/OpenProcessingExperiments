
class Bulle {
   
	PVector position,pposition,vitesse;
	float speed,theta,target;
	float x;
	float y;
	float e;
	float size;
	
	PImage a;
	int type;
	boolean alive = true;   // permet de diférencier la présence de bulleK avant la collision
 
 
 
  Bulle( float x , float y, PImage a,int type) {
		this.a = a;
		this.x = x;
		this.y = y;
		this.e = random(0.5,1.0);
		this.type = type;
		
		speed = SPEED*e;
		theta = random(PI*2);
		target = random(PI*2);
		
		
  } 
   
  
  void mouv(){
  	float dif;
		
		speed = SPEED*e;
		size = INITSIZE*e;
		
		
		// Decide si elle change de direction
		if (random(100) <= 2) this.target = random(PI*2);
		
		
		// colision avec les murs
		if(x-(size/2) <= 0) target = random(PI)+PI+HALF_PI; //droite
		if(y-(size/2) <= 0) target = random(PI); //bas
		if(x+(size/2) >= width) target = random(PI)+PI; //haut
		if(y+(size/2) >= height) target = random(PI)+HALF_PI; //gauche
		
		
	
		
		
		// determine le chemin et aller retour sur elles-même
    dif = target - theta;
    dif = dif  % (PI * 2);
		if (dif > PI) dif = dif- PI * 2;
		else if (dif < -PI) dif = dif + PI * 2;
    this.theta = dif * 0.1 + theta;
    
    // direction un peu plus smooth
    x = x + cos(theta) * speed;
    y = y + sin(theta) * speed;
    x = (x + width) % width;
    y = (y + height) % height;
    
	
		
	}
 
 
	void draw(){
		if(alive) {
			
			if(e>0.2) e -= e*SHRINK;
			size = INITSIZE*e;
			
			// Determine la couleur du contour, bleu pour l'OTAN, rouge et vert pour Kadafi
			if(type==1){
				if(e>you.e) stroke(255, 0, 0);
				else stroke(0, 255, 0);
			}else{
				stroke(0, 0, 255);
			}
			fill(255,0);
			
			image(a,x-(size/2),y-(size/2),size,size);
			ellipse(x,y,size,size);
		}
	}
	
}

