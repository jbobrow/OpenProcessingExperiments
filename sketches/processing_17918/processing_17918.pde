
void setup () {
size(250,250);
background(255);
smooth();
noFill();
}

int x = 10; //need to use integers because use with decimals
int i = 20;

void draw (){
  background(255);
  stroke(98,216,202,(random(255))); //certain shade with random opacity
  strokeWeight(1);
  ellipseMode(CENTER);
  ellipse(125,125,250,x); //ellipse drawn with "x" height
  
  stroke(71,139,175,(random(255)));
  strokeWeight(1);
  ellipseMode(CENTER);
  ellipse(125,125,250,i);  //ellipse drawn with "i" height
  
  stroke(98,216,202,(random(255)));
  strokeWeight(1);
  ellipseMode(CENTER);
  ellipse(125,125,250,x/2); //ellipse drawn with 1/2 of "x" height
  
  stroke(71,139,175,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,i/2);  //ellipse drawn wiht 1/2 of "i" height
  
  stroke(98,216,202,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,x*.75);  //ellipse drawn with 75% of "x" height
  
  stroke(71,139,175,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,i*.75); // ellipse drawn with 75% of "i" height
  
  stroke(98,216,202,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,x/4); //ellipse drawn with 1/4 of "x" height
  
  stroke(71,139,175,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,i/4);  //ellipse drawn with 1/4 of "i" height
  
  stroke(98,216,202,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,x*2); //ellipse drawn with 2 times "x" height
  
  stroke(71,139,175,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,i*2); //ellipse drawn with 2 times "i" height
  
  stroke(98,216,202,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,x*1.5); //ellipse drawn with 1.5 times "x" height
  
  stroke(71,139,175,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,i*1.5); //ellipse drawn with 1.5 times "i" height
  
  stroke(98,216,202,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,x*1.75); //ellipse drawn with 1.75 times "x" height
  
  stroke(71,139,175,(random(255)));
  strokeWeight((random(4)));
  ellipseMode(CENTER);
  ellipse(125,125,250,i*1.75); //ellipse drawn with 1.75 times "i" height
  
  if(mousePressed) { //if mouse pressed, x height grows and i height shrinks
    x++;
    i--;
  }
  if(keyPressed){ //if key pressed, x height shrinks and i height grows
    x--;
    i++;
  }
}


