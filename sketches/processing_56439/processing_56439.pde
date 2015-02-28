


float ps; //pentagon side length
float ss; //star point distance length

float xpos=width/2; //x of pentagon starting vertex
float ypos=height/2; //y of pentagon starting vertex
float xstar; //x of star point starting vertex
float ystar; //y of star point starting vertex

float xoff = 0.0;
float xincrement = 0.001; 

void setup() {

  size(800, 800);
}

void draw() {
  xoff+=xincrement;
  ps=mouseX;
  xpos=mouseX*(1-xincrement); //turn this on to use mouseX as Xpos
  ypos=mouseY;  //turn this on to use mouseY as Ypos
  //xpos=width/4;
  //ypos=height/4;
  xstar=xpos + ps/2;
  ystar=(ypos-sqrt( sq(ps)-(sq(ps/2))));
  ss=2*ystar;

  beginShape(POLYGON); 
  fill(0);
  stroke(random(0,255),random(0,255),random(0,255));
  strokeWeight(random(0|10|50));
  fill(random(0,255),random(0,255),random(0,255));
  vertex(xpos, ypos); 
  vertex(xstar, ystar);
  vertex((xpos+ps), ypos);

  vertex((xstar+ss+ss*(.308)), (ystar+ss*(.951))); 
  vertex((xpos+ps+ps*(.308)), (ypos+ps*(.951)));
  vertex((xstar+ss+ss*.03), (ystar+5*ss*(.588)));
  // vertex( (xstar+(ps/2)), (ystar+ps*.951+sqrt(   sq(ps)-sq((ps/2)+ps*(.309))  ) ) );
  vertex( (xpos+(ps/2)), (ypos+ps*.951+sqrt(   sq(ps)-sq((ps/2)+ps*(.309))  )  )    );
  vertex((xstar-ss-ss*.03), (ystar+5*ss*(.588)));
  vertex((xpos-ps*(.309)), (ypos+ps*(.951)));
  vertex((xstar-ss-ss*(.308)), (ystar+ss*(.951)));
  endShape(CLOSE);
}


