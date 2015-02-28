
PImage img;


int dotSize = 3;
 

void setup() {
  size(640, 480);
  smooth();
  background(0);
 img = loadImage("sample1.jpg");



  noStroke();
}

void draw() {
  

  
  background(0);
  translate(0,0);

  noFill();
  stroke(255);

  for (int i = 0; i<width; i+=3) {
    for (int j = 0; j<height; j+=1) {

      float val = saturation(img.get(i*dotSize, j*dotSize))/400*0.3;
      
      infrared(i*dotSize, j*dotSize,val,img.get(i*dotSize, j*dotSize));


    }
  }
  
  
  
  for (int m = 0; m<width; m+= 60) {
     stroke(3); 
      morrocan(m,0);


   
  }
  

}

 

void infrared(int x, int y, float val, color c) {
 
  pushMatrix();
  fill(c/200,0,100*c);
  translate(x, y);

  scale(0.2,0.01+val);
  line(20,0,20,20);
  line(40,0,40,20);
  line(20,20,60,100);
  line(40,20,0,100);
  line(55,0,55,30);
  line(55,30,40,60);
  noStroke();
  fill(c*mouseX,0,50,100);
//  fill(200*c,0,0);
  ellipse(45,20,45,45);
  fill(c*200,0,0);
  ellipse(45,20,20,20);
  line(40,60,40,130);
  line(40,130,60,160);
  line(60,160,40,190);
  line(40,190,40,230);

  popMatrix();
  
 
} 

void morrocan(int x, int y) {
  
  pushMatrix();
  stroke(255);
  strokeWeight(2);
  translate(x, y);
  line(20,0,20,20);
  line(40,0,40,20);
  line(20,20,60,100);
  line(40,20,0,100);
  line(55,0,55,30);
  line(55,30,40,60);
  line(40,60,40,130);
  line(40,130,60,160);
  line(60,160,40,190);
  line(40,190,40,230);
  popMatrix();
  
}



