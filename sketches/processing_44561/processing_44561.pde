
//my own object - hexagon

class Hexagon {
 
  PVector pos; // position (x,y)
  int age; // how long have i been alive?
  int kid;//num of kids
  float rad; // my radius
  
  
  Hexagon parent; // my parent
  
  
  Hexagon(PVector _pos, float _rad, Hexagon _parent){//constructor
     pos = _pos;
     parent = _parent;
     rad = _rad; //make my radius
     age = 0;
     kid = 0;//start number of kids counter at 0.
      
     hexagons.add(this);//add myself to the hexagons list
    
  
  }


void hexagon(float r) {//hexagon function
  beginShape();
  float angle = 0;
  for (int v=0; v<6; v++) {
    vertex(cos(angle)*r, sin(angle)*r);
    angle += (TWO_PI/6.0);
  }
  endShape(CLOSE);
}

void render(){//draw this hexagon
 fill(255,200-age*35);
 pushMatrix();//save the current system 
 translate(pos.x,pos.y);//display haxagon at x,y position
 hexagon(rad);//draw hexagon
 popMatrix();//restore the previous system
 stroke(255);
 strokeWeight(1.0);
 
 if (parent != null)//ignore hexagons have no parents
  line(pos.x,pos.y, parent.pos.x, parent.pos.y );//draw a line between hexagon and parent hexagon
 
 for  (int h=0; h<hexagons.size(); h++){
      Hexagon hexagon = hexagons.get(h);
      if (kid<1){ // if a cell with no children
        fill(120);
        ellipse(pos.x,pos.y,5,5); // draw a circle
      }
    }
 
}

void grow(){
age++;
//pick a spot to grow a new cell
float distance = rad*2.0; //radius distance change


for (int i = 0; i<6; i++){//try to grow 6 times, if do not suit for several conditions below, then give up
  float growAngle = int (random(0,6))*(PI/3);//growth try in angle (0,60,120,180,240,300 or 360)
  
  PVector newpos = new PVector(pos.x + cos(growAngle)* distance, pos.y + sin(growAngle)* distance);

  //  check if that spot is free - check for collisions with all other hexagons

 for (Hexagon checkhexagon : hexagons){ // run through the hexagons list, and check each one
      float checkdist = newpos.dist(checkhexagon.pos);//how far the distance is
      if (checkdist < rad*2) return; // if you get a collision, give up
    }
 // if you can read this, the space is free
  Hexagon newhexagon = new Hexagon(newpos, rad*0.98, this  ); // make a new hexagons

  } 
 }
}
 

