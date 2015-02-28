
float [] x = new float [3000];//number of pacmen
void setup() {
  size (1500, 950);//size of frame
  smooth();
  noStroke();

  for (int i=0; i<x.length;i++) {
    x[i] = random(-1500, width);//width=where they start
  }
}
void draw() {
  background(0);
  fill(random(0,255),random(0,255),random(0,255)); //change color of pacmen all the same 
  //fill(255, 236, 5); // original yellow pacman
  for (int i=0; i<x.length;i++) {//loop or formula
    x[i]+=3;//speed
    float y= i*0.4; //y value
    fill(random(0,255),random(0,255),random(0,255)); //makes them all different
    arc(x[i], y, 12, 12, 0.52, 5.76);// 12 = size
    if (x[i]>width){ // infinite loop (where they start)
      x[i]=random(-1500, width);// has to be same as above
    }
 }
}


