
s/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/44558*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* 
 * Example using PDF to output complex 3D geometry for print.
 * Press "s" to save a PDF.
 *
 */
 
import processing.pdf.*;

// System data
boolean dosave=false;

ArrayList<Hexagon> hexagons = new ArrayList <Hexagon>();
//list of all the living hexagons

int maxhexagons = 5000;
// varialbes max number of hexagons

void setup(){//set up
  size (980,600,P2D);
 //   size (1920,1080,P2D);
  Hexagon firstHexagon = new Hexagon (new PVector(width/2,height/2),5,null); //make start hexagon
  background(255);
  stroke(255);
  smooth();
}

void draw(){//draw
  background (255);//redraw background
  for (int h=0; h<hexagons.size(); h++){
    Hexagon hexagon = hexagons.get(h);//get each hexagon from the arraylist
    hexagon.render(); // draw the hexagon
    if (hexagons.size() < maxhexagons) //if the max number of hexagons been reached
    hexagon.grow(); // don't grow if we have reached maxcells
  }
 // Saves each frame as line-000000.png, line-000001.png, etc.
//saveFrame("honeycomb2-######.png");
 
 if(dosave) {
    // set up PGraphicsPDF for use with beginRaw()
    PGraphicsPDF pdf = (PGraphicsPDF)beginRaw(PDF, "pdf_hex_out-######.pdf"); 

    // set default Illustrator stroke styles and paint background rect.
    pdf.strokeJoin(MITER);
    pdf.strokeCap(SQUARE);
    pdf.fill(0);
    pdf.noStroke();
    pdf.rect(0,0, width,height);
  }
  
  if(dosave) {
    endRaw();
    dosave=false;
  }
 
}

void mouseReleased(){
    background(255);//redraw background
    hexagons.clear();//delete all hexagons
    Hexagon firstHexagon = new Hexagon(new PVector (mouseX,mouseY),20,null);//make new hexagon on mouse position
     
  }
  
  void keyPressed() {
  if (key == 's') { 
    dosave=true;
  }
}
  

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
 fill(202 -(age*5),0,136,0+(age*20));//change fill colour by age counter
 pushMatrix();//save the current system 
 translate(pos.x,pos.y);//display haxagon at x,y position
 hexagon(rad);//draw hexagon
 popMatrix();//restore the previous system
 stroke(255);
 strokeWeight(age*0.02);
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


