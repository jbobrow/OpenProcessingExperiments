
//my own object - hexagon

class Hexagon {
 
  PVector pos; // position (x,y)
  int age; // how long have i been alive?
  int kid;//kids
  float rad; // my radius
  int maxAge = 30;//set max age
  
  Hexagon parent; // my parent
  
  
  Hexagon(PVector _pos, float _rad, Hexagon _parent){//constructor
     pos = _pos;
     parent = _parent;
     rad = _rad; //make my radius
     age = 0;//start age at 0
     kid = 0;//start number of kids counter at 0.
      
     hexagons.add(this);//add myself to the hexagons list
    
  
  }


void hexagon(float r) {//Hexagon
  beginShape();
  float angle = 0;
  for (int v=0; v<6; v++) {
    vertex(cos(angle)*r, sin(angle)*r);
    angle += (TWO_PI/6.0);
  }
  endShape(CLOSE);
}

void render(){//draw this hexagon
 fill(235 -(age*15),0,0,255-(age*25));//change fill colour and satuation by age account
 pushMatrix();//save the current system 
 translate(pos.x,pos.y);//display haxagon at x,y position
 hexagon(rad);//draw hexagon
 popMatrix();//restore the previous system
 stroke(255);
 strokeWeight(1.0);
 
 if (parent != null){//ignore there are no parents
    
  line(pos.x,pos.y, parent.pos.x, parent.pos.y );//draw lines between hexagons and parent hexagons
 }
 
}

void grow(){//grow haxagons
age++;
//pick a spot to grow a new cell
float angle = TWO_PI/12 + int (random(0,6))*(TWO_PI/4);//angle change

float distance = rad*2.0; //radius distance change
//decide position for growth hexagons
PVector newpos = new PVector(pos.x + cos(angle)*(rad + distance), pos.y + sin(angle)*(rad + distance));

 
 //  check if that spot is free - check for collisions with all other hexagons

 for (Hexagon checkhexagon : hexagons){ // run through the hexagons list, and check each one
      float checkdist = newpos.dist(checkhexagon.pos);//how far the distance is
      if (checkdist <= rad*2) return; // if you get a collision, give up
    }
   
    // if you can read this, the space is free
    Hexagon newhexagon = new Hexagon(newpos, rad*0.95, this  ); // make a new hexagon

   }
}

