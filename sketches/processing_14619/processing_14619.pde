
Particle[] particles;

void setup() {
  size( 1000, 500);
  smooth();

  //Load text file as an array of String
  String [] data = loadStrings ("HZ,DB2.txt");
  particles = new Particle [data.length];
  for (int i= 0; i< particles.length; i++){
 float[] values= float (split (data[i],","));
 particles[i]=new Particle(values[0],values [1]);
}
}
void draw() {

 background(255);
  //display and oscillate the particles
  for ( int i = 0;i<particles.length ; i++) {
     particles [i].display();
    particles [i].oscillate();
  }
}






