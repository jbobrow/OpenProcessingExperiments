
// make circles with a location loc
PVector[] loc;
// circles have radius rad
float[] rad;
// there are num number of circles
int num = 512;
// circles appear to be magnified by multiplication factor rate
float rate = 1.05;
void setup(){
  size(800,600);
  // initialize circle data arrays
  loc = new PVector[num];
  rad = new float[num];
  // this is the original method to make the circles
  // this generates start up ocilations
  for(int i=0;i<num;i++){
    // make some circles with no apparent size or location
    loc[i] = new PVector();
    rad[i] = 0;
  }
  for(int i=0;i<num;i++){
    // generate some new circles
    getCircle(i);
  }
//  // this is the new method to load already generated circles
//  // this prevents start up ocilations
//  // load the data file
//  String[] data = loadStrings("data.txt");
//  for(int i=0;i<num;i++){
//    // split each row into columns
//    String[] row = split(data[i],"\t");
//    // first two columns are location x and y
//    loc[i] = new PVector(float(row[0]),float(row[1]));
//    // third column is radius
//    rad[i] = float(row[2]);
//  }
  // make white circles with smooth edges
  stroke(255);
  smooth();
//  noFill();
}
void draw(){
  // the rate of magnification is user controlled
  rate = (1-1f*mouseY/height)*0.1+1;
  background(0);
  for(int i=0;i<num;i++){
    // draw the circle
    ellipse(width/2+loc[i].x,height/2+loc[i].y,2*rad[i],2*rad[i]);
    // find the circles location and rotate it at a user defined speed
    float angle = atan2(loc[i].y,loc[i].x)+(mouseX-width/2)*PI/10000;
    // find the circles location and expand it at the magnification rate
    float distance = mag(loc[i].y,loc[i].x)*rate;
    // recombine the location from polar to cartesian coordinates
    loc[i] = new PVector(distance*cos(angle),distance*sin(angle));
    // expand the circle size by the magnification rate
    rad[i]*=rate;
    // if the circle has grown to be not visible on the screen
    if(loc[i].mag()-rad[i]>mag(width/2,height/2)){
      // reset the circle to be a new one
      getCircle(i);
    }
  }
}
//boolean test = true;
//if(test){
//test=false;
//  println("test");
//}
void getCircle(int i){
  // this method makes a new circle that does not overlap any other circle
  // only make 10000 attempts, else give up
  int attempt = 0;
  // stop makeing attempts when a good circle is found
  boolean solution = false;
  while(attempt<10000&&solution==false){
    attempt++;
    // make a circle so small it isnt visible
    float newRad = random(0,0.2);
//    // generate circles of uniform probability density over the entire screen
//    float distance = sqrt(random(0,1))*width/2;
    // generate a circle very close to the center of the screen
    float distance = random(0,0.4);
    // do not make a circle that envelops the center of the screen
    // because it would expand to envelop the entire screen
    if(distance>newRad){
      // make a circle with uniform probability density over angular coordinate
      float angle = random(0,TWO_PI);
      // combine the location from polar to cartesian coordinates
      PVector newLoc = new PVector(distance*cos(angle),distance*sin(angle));
      // test to see if the new circle is on top of any of the existing ones
      boolean intersection = false;
      for(int j=0;j<num;j++){
        // if the circle being tested is its self don't do the test
        if(i!=j){
          // find the relative location of two circles
          PVector delta = PVector.sub(newLoc,loc[j]);
          // if the magnitude of their relative location is less than
          // the sum of their radiuses
          if(delta.mag()<newRad+rad[j]){
            // then they are overlaping
            intersection = true;
          }
        }
      }
      // if the new circle is not overlaping with any of the old ones
      if(intersection==false){
        // stop making attempts
        solution = true;
        // set the circle to the new circle params
        loc[i] = newLoc.get();
        rad[i] = newRad;
      }
    }
  }
  // if no solution is found tell me
  if(solution==false){
    println("no solution "+i);
  }
}
//void keyPressed(){
//  // method for generating a data file
//  // this prevents ociliations in the startup of the program
//  if(key==' '){
//    String[] data = new String[num];
//    for(int i=0;i<num;i++){
//      // each circle records its location and radius
//      data[i] = nf(loc[i].x,1,3)+"\t"+nf(loc[i].y,1,3)+"\t"+nf(rad[i],1,3);
//    }
//    saveStrings("data.txt",data);
//  }
//}

