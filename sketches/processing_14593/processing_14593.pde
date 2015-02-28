
float theta;   
float angle = random(30,90);
int limit_me = 100;
boolean branchy;
int inc = 0;
float ozeData [];
float minOze, maxOze;
float r;

void setup() {
  size(600, 600);
  smooth();
  frameRate(10);
  colorMode(HSB,100);
  
  String[] ozone = loadStrings("ozone_data.txt");
  ozeData = float(split(ozone[0], ','));
  
  minOze = getMinValue(ozeData);
  maxOze = getMaxValue(ozeData);
  
  textSize(50);
  textAlign( RIGHT, BOTTOM );
}

void draw() {
  background(0);
  stroke(255,80);
  strokeWeight(3);
  float a = 360;
  float dat;
  r = round(random(0,10));
  
  theta = radians(a);
  translate(width/2,height/2);
  // Start the recursive branching
  
  int am = 3;
  for( int i = 0; i < am; i++ ){
    float direction = i*theta / am;

      dat = map(ozeData[inc],minOze,maxOze,50,150);
      branch( dat, direction );
      println(dat);
      fill(100,100);
      text(ozeData[inc], 300, 300);
    
  }
  inc++;
  if( inc >= ozeData.length ) inc = 0;
}

void branch(float h, float direc) {
  // Each branch will be 3/4 the previous branch size
  h *= 0.75;
     
  if (h > 30) {

    for (int i = 0; i < 3; i ++) {
      pushMatrix();    // Save the current state of transformation 
      float rot = random( -10, 10 );
      rotate( rot );   // Rotate by theta
      stroke(r,100,100,30);
      line(0, 0, 0, -h);  // Draw the branch
      translate(0, -h); // Move to the end of the branch
      branch(h, direc);  
      popMatrix();     //Reset matrix
    }
  }
}

float getMinValue(float [] fromArray) {
  float minValue=minValue = fromArray[0];
  
  for (int i = 0; i < fromArray.length; i++) {
    if(fromArray[i] < minValue) minValue = fromArray[i];
  }
  return minValue;
}

float getMaxValue(float [] fromArray) {
  float maxValue=maxValue = fromArray[0];
  
  for (int i = 0; i < fromArray.length; i++) {
    if(fromArray[i] > maxValue) maxValue = fromArray[i];
  }
  return maxValue;
  
}

