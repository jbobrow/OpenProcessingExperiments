
int largh =380;
int alt=10;


void setup() {
  size(400,400);
  smooth();
  background(200);
  strokeWeight(3);
}

void draw() {
  line(0,20,largh,20);
  line(largh,alt,largh, 0);


if (mousePressed){
  background(200);
  largh= largh-10;
  alt=alt+10;
  
  if (largh < 10) {
    largh=380;
   }

  
  if (alt > 400) {
    alt=10;
   }


}

}
  

