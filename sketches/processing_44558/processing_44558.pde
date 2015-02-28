
//my own object - hexagon

class Hexagon {
 
  PVector pos; // position (x,y)
  int age; // age counter
  Hexagon parent; // my parent
  float rad; // my radius
  
  Hexagon(PVector _pos, float _rad, Hexagon _parent){//constructor---for position, radius and parent hexagon
     pos = _pos;
     rad = _rad; //make my radius
     age = 0;//start age at 0
     hexagons.add(this);//add myself to the hexagons list
     parent = _parent;
  
  }


void hexagon(float r) {//draw hexagon
  beginShape();
  float angle = 0;
  for (int v=0; v<6; v++) {
    vertex(cos(angle)*r, sin(angle)*r);
    angle += (TWO_PI/6.0);
  }
  endShape(CLOSE);
}

void render(){//draw this hexagon
 fill(255 -(age*5),205,0,170);//change fill colour by age counter
 pushMatrix();//save the current system 
 translate(pos.x,pos.y);//display haxagon at x,y position
 hexagon(rad);//draw hexagon
 popMatrix();//restore the previous system
 stroke(0);
 strokeWeight(age*0.05);
 //if (parent != null) line(pos.x,pos.y, parent.pos.x, parent.pos.y );
 
}

void grow(){//grow function
age++;

//pick a spot to grow a new cell
float angle = TWO_PI/12 + int (random(6))*(TWO_PI/6);//angle change
float distance = rad*2.02; //radius distance change
PVector newpos = new PVector(pos.x + (cos(angle)*distance), pos.y + (sin(angle)*distance));//decide a position for growth hexagon
 
 //  check if that spot is free - check for collisions with all other hexagons

 for (Hexagon checkhexagon : hexagons){ // run through the hexagons list, and check each one
      float checkdist = newpos.dist(checkhexagon.pos);//how far the distance is
      if (checkdist < rad*2) return; // if you get a collision, give up
    }
   
    // if you can read this, the space is free
    Hexagon newhexagon = new Hexagon(newpos, rad*0.98, this  ); // make a new hexagon

   }
}

