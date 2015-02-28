


int num = 20; //bike number

//arrays
float[] x = new float[num]; // x
float[] y = new float[num]; // y
float[] speed = new float[num]; // bike speed


void setup() {
  size(300,300);
 
  smooth();

  // seeding
  for (int i=0; i < num;i++) {
    x[i] = random(width);
    y[i] = i*(height/num);
    speed[i] = random(1,10);


  }
}

void draw() {
  background(#CBAF52);
  
  for (int i=0; i < num; i++) {
    
    //bike goes here
    bike(x[i], y[i]);
    

    // variable update
    x[i] = x[i] + speed[i];
   
  if (x[i] > width + 10) {
     x[i] = -10;
     
  }
    }
    
  }
  
















void bike(float p, float w){  //bike graphic
  pushMatrix();
  translate(p,w);
  strokeWeight(2);
  noFill();
  ellipse(-7,0,7,7);
  ellipse(7,0,7,7);
  line(-7,0,2,-5);
  line(-2,-5,2,-5);
  line(2,-5,7,-0);
  popMatrix();
  }

//bikebikebikebikebikebikebikebikebikebikebikebike

