
//PARAMETERIZED FORM: CHAIR
//VIIRJ.COM,2013

Parameter one;
Parameter two;
Parameter three;

void setup() {
  size(1300, 200);
  smooth();
  noLoop();

  //float x, float y, int fillVal, float m
  one = new Parameter(60, 20, 50, 88);
  two = new Parameter( 20,40,32,32);
   three= new Parameter(22,2,2,22);
}



void draw() {
  background(random(0,255),random(0,255),100,100);
  one.run();
  two.run();
  three.run();
}

class Parameter {
  float s, sw,e; 
  int fillVal;


  //constructor
  Parameter ( float x, float y, float fillVal, float m) {
 
    
    s = random(x);
    sw = 2;
    fillVal = x;
    x = 10;
    m = e;
  }

  void run() {
    edit();
    display();
 
  }


  void edit() {  
    scale(0.5); 
    translate(0, height/2);
  }


  void display() {

    for (int i = 0; i<100; i++) { 
      stroke(s);
      strokeWeight(sw);
      fill(fillVal);

      //shape1 
      beginShape();
      vertex(35, i);//75
      vertex(67, i);
      vertex(76, e); //87
      vertex(27, e);
      vertex(35, i);
      endShape();

      //thickness
      rectMode(CORNER);
      rect(36, 34, 5, 41);
      rect(63, 34, 5, 41);


      //backing
      rectMode(CORNERS);
      rect(27, e, 77, 92);
      rect(70, 34, 33, 41);

      //legs
      rect(27, 92, 31, 166);
      rect(75, 92, 71, 166);  

      //backLegs
      rect(35, 147, 40, 92);
      rect(63, 147, 68, 92);
      
         i = i+0;
         i++;
      translate(50, 0);

    }
    }
}



