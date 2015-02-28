
// author: thomas diewald
// date: 07.09.2011

float my_array1[] = new float[200];
float my_array2[] = new float[200];

float val = 0;
void setup() {
  size(400, 400);


  for (int i = 0; i < my_array1.length; i++) {
    val+= .01;
    my_array1[i] = map( noise(val), 0, 1, 0, height);
    my_array2[i] =my_array1[i];
  }
  smooth();
  frameRate(60);
}



void draw(){
  noStroke();
  fill(255, 25);
  rect(0, 0, width, height);
  
  val+= map(mouseX, 0, width, .001, 0.05);
  float nval = noise(val);
  float new_y = map(nval, 0, 1, 0, width);

  shiftAndAdd(my_array1, new_y);

  shiftAndAdd(my_array2, mouseX);
    
  float x1, y1, x2, y2, radius, stroke_col;
  strokeWeight(3);
  noFill();
  int offset = 10;
  for(int i = 0; i < my_array1.length; i++){
    x1 = map(i, 0, my_array1.length, 0, width-offset);
    y1 = my_array1[i];
    radius = map(i, 0, my_array1.length, 5, 50);
    y1 -= width/2;
    y1 *= (i+width/2)/(float)my_array1.length;
    y1 += width/2;
    //stroke_col = map(i, 0, my_array1.length, 50, 255);
    //stroke(255-stroke_col);
    stroke(0);
    ellipse(y1, x1, radius,radius/2);

    x1 = map(i, 0, my_array2.length, 0, width-offset);
    y1 = my_array2[i];
    y1 -= width/2;
    y1 *= (i+width/2)/(float)my_array1.length;
    y1 += width/2;
    //radius = map(i, 0, my_array2.length, 10, 50);
    stroke_col = map(i, 0, my_array1.length, 0, 80);
    stroke(stroke_col , mousePressed?stroke_col:0, mousePressed?stroke_col:0);
    ellipse(y1, x1, radius, radius/2);

  }
  println(frameRate);
}


// shift all the values to the left, and set the new value at the end
void shiftAndAdd(float a[], float val){
  int a_length = a.length;
  System.arraycopy(a, 1, a, 0, a_length-1);
  a[a_length-1] = val;
}



