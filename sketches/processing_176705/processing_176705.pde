
/* @pjs preload="datagraph.png"; */

PImage datagraph ; 
int[] data;


void setup() {
  size(419, 402);
  
  datagraph = loadImage ("datagraph.png") ; 
  // Load text file as a string
  String[] stuff = loadStrings("data.txt");
  // Convert string into an array of integers using ',' as a delimiter
  data = int(split(stuff[0],','));
 // noLoop() ; 
}

void draw() {
  background(255) ; 
  image (datagraph, 0, 0, width, height);
  stroke(250);
  println(data.length) ;
 
  for (int i = 0; i < data.length; i++) {
    println(i) ; 
    fill(data[i]*20);
//    rect(i*20,0,20,data[i]);
 rect(30+i*50, height-data[i]*19, 40, data[i]*19) ; 
  }
}


