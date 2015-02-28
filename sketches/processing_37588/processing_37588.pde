
PFont fontA;
PFont fontTitle;

void setup(){
  size(476, 695); 
  background(#33B2F0);
  
  fontA = loadFont("Calibri-12.vlw");
  fontTitle = loadFont("Tahoma-32.vlw");
  
}

void draw(){
  fill(162,0,255);
  ellipse(220,550,15,15); //HvA
  
  //Add persons to show their distance from the HvA
  person(200,480,"Alessio");
  person(200,340,"Bart");
  person(400,340,"Jesse");
  person(220,620,"Ester");
  person(250,620,"Henry");
  person(170,400,"Roben");
  person(200,550,"Niels");
  person(230,530,"Sean");
  
  textFont(fontTitle);
  fill(0);
  text("Global distance from the HvA to home, of students in this class.",10,30, 450, 700);
}


//Function to draw a dot in the middle of the coordinate
//and draw a line from the HvA point to the point where
//that person lives.
//Also shows the name of the person.
void person(int xP,int yP,String name){ 
  textFont(fontA);
  fill(255); 
  text(name, (xP+5), (yP+5));
  line(220,550,(xP-5),(yP-5));
  
  fill(255,0,0);
  ellipse((xP-5),(yP-5),10,10);
  
}

