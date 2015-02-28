
void setup() {
size(1000,400);
 background(255);
  smooth();
  noLoop();
}

void draw() {
  noStroke();  
  fill(0,50);
  rect(mouseX,0,width,height);
  strokeWeight(10);
  translate(random(width), height);
  scale(random(0.25,1));
  branch(0);
}

void branch(int depth) {
 if (depth<8) {
  if (depth<4)
   {
     stroke(#45055F);
  }
  else if (depth<10){
    stroke(#340348,70);
   }
   else {
    stroke(#290239,50);
   }

   line (0,10,0,-height/3);
    pushMatrix();
  {

   translate(0,-height/5);
  rotate(random(-PI/4,PI/4));
 scale(random(0.5,0.6));
  branch(depth+int(random(1,2)));
    }
   popMatrix();
   pushMatrix();
     {
       translate(0,-height/3);
      rotate(random(-PI/4,PI/4));
   scale(random(0.6,0.75));
    branch(depth+int(random(1,1)));
   }
    popMatrix();
   pushMatrix();

     {
   translate(0,-height/3);
    rotate(random(-PI/4,PI/4));
   scale(random(0.6,0.7));
   branch(depth+int(random(1,1)));
  }
   popMatrix();
   pushMatrix();
  {
     translate(0,-height/3);
   rotate(random(-PI/4,PI/4));
    scale(random(0.55,0.65));
   branch(depth+int(random(1,3)));
  }
  popMatrix();
  }
}


void mouseClicked()
{
  redraw();
}

