

int a=0;

PShape module;

void setup(){  
  
  size(500,500,P2D);
  background(0);
  
 module=createShape(); //creating the shape.
 module.beginShape();
 module.fill(0);
 module.stroke(255);
 
 module.vertex(0,15);   //define each vertex clockwise
 module.vertex(-13,22);
 module.vertex(-38,8);
 module.vertex(-38,-22);
 module.vertex(-51,-29);
 module.vertex(-51,-44);
 module.vertex(-26,-29);
 module.vertex(-26,0);
 module.vertex(-13,8);
 module.vertex(0,0);
 module.vertex(0,15);
 module.vertex(-13,22);
 module.vertex(-13,22);
 module.vertex(-13,8);
 
 module.endShape();
  
  
}

void draw(){

  
  
  module.rotate(radians(-60)); // tested in CAD before deciding...
  
  
translate(0,0);
translate(width/2, height/2); //As a rule, dont know the meaning...
scale(3); // Quite usuful to play with the dimentions...
shape(module);


}


