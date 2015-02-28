
Puppet pinocchio;
	   
	   void setup() {
	     size(256,256);
	     background(0);
	     color tempcolor = color(255,0,0);
	     pinocchio = new Puppet(tempcolor);
	   }
	   void draw() {
	     background(0);
	     pinocchio.draw();
	   }
	   class Puppet  {
	     color colore;
	     Puppet(color c_) {
	      colore = c_;	  
	     }
	     void draw () {
	      stroke(255);        
	      strokeWeight(1); 
	      ellipseMode(CORNER);
	      ellipse(72,100,110,130); 
	      stroke(colore);
	      beginShape(TRIANGLES); 
	      vertex(114, 180);
	      vertex(mouseX, mouseY); 
	      vertex(140, 180); 
	      endShape(); 
	      strokeWeight(4);
	      line(96,150,112,150);
	      line(150,150,166,150);
	     }
	   }
	    


