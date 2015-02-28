
PFont font;
float theta = radians(63);
// throws a divide by zero exception if the strings are less than 27 charachters long. 
// Perhaps someone in the future could tweak it to support any string length and any number of lines.  
  String s1 = "Under this tree, we waited for Godot.";
  String s2 = "As days go by, we are still waiting.";
  String s3 = "How long have time pass?";
  String s4 = "Only this tree knows the answer.";
  int llen = s1.length()+s2.length()+s3.length()+s4.length();// total length of strings
  int recomplex = 999; // recursion complexity, 100 low, 999 nice, 9999 very nice, and so forth. 
void setup() {
  size(630, 630, P2D);
  smooth();
  // noLoop();
  frameRate(9);
  background(252);
  font=createFont("Sans",15);
  textFont(font);
}

void draw()
{
  int i=120;
  fill(252,random(9)); // fog color 
  rect(0,0,width,height); // fog layer
  fill(0,10); //text color
  textSize(15);
  text(s1, width/2, i);  // Text wraps within text box
  text(s2, width/2, i+20);  // Text wraps within text box
  text(s3, width/2, i+40);  // Text wraps within text box
  text(s4, width/2, i+60);  // Text wraps within text box  
  fill(0,second()`*255); //map branch opacity to the current second (same as map(second(),0,59,0,255)
  translate(llen,height);
  branch(random(llen)/recomplex);//pick a random number from within the universe of the text
}

void mouseClicked()
{
  redraw();
}

void branch(float len) {
  if (len <5 ) {
    rotate(random(len%0.9));
    strokeWeight(random(len));
    line(0, 0, 0, -height/3);

    pushMatrix();
    translate(0, -height/random(3,5));

    rotate(-theta+(random(2)));
    scale(0.7);
    strokeWeight((s1.length())%(s4.length())); // weight by relationship between line lengths 
    branch((len*s1.length())/10); // recurse by line length and seed length
    popMatrix();

    pushMatrix();
    translate(0, -height/random(3,5));
   // translate(0, -height/(s2.length()%len));
    rotate(-theta+(random(2)));
    scale(0.5);
    strokeWeight((s2.length())%(s3.length()));
    branch((len*s2.length())/10);
    popMatrix();
    
    pushMatrix();
    translate(0, -height/random(4,6));
   // translate(0, -height/(s3.length()));

    rotate(-theta+(random(2)));
    scale(0.7);
    strokeWeight((s3.length())%(s2.length()));
    branch(len*(s3.length()/10));
    popMatrix();
    
    pushMatrix();
    translate(0, -height/random(4,6));
    rotate(-theta+(random(2)));
    scale(0.3);
    strokeWeight((s4.length())%(s1.length()));
    branch(len*(s4.length()/10));
    popMatrix();
  }
}
