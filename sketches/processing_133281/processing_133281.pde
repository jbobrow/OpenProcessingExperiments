
float counter;

void setup() {


  //lets draw
  size(600, 200);
  background(255);
  
 
}
//for (int x = 0; x< width; x++) {
//  line(x,0,x,random(height));
//}

// Lower values of noise looks better
// The lower value the more smooth it will look

//for (int x=0; x<width; x++) {
//line(x,0,x,noise(float(x)/100)*height);
//}
void draw() {
  background(255);
  fill(0);
    textSize(50);
    textMode(CENTER);
  text("Waveform", width/2-120,height/2+20);
  counter++;
  stroke(255, 0, 0);
  for (int x=0; x<width; x++) {
    float myPerlin = noise(float(x)/100, counter/100);
    // map(myPerlin,0,1,0,200) The last two numbers define the interval on the y-axes
    float myY = map(myPerlin, 0, 1, 0, height/2);
    line(x, 0, x, myY);
  }
  
  stroke(255,0,0);
  //translate(width/2,height/2);
  rotate(PI);
  translate(-width,-height);
  for (int x=0; x<width; x++) {
    float myPerlin = noise(float(x)/100, counter/100);
    // map(myPerlin,0,1,0,200) The last two numbers define the interval on the y-axes
    float myY = map(myPerlin, 0, 1, 0, height/2);
    line(width-x, 0, width-x, myY);
 
  }
}

