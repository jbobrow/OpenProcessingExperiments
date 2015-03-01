
void setup(){
  //canvas 
  size (400,400);
  smooth();
  noLoop();
}

void draw(){
  
  float hue,sat,bri;  //initialize H,S and B variables

  stroke(255); //white stroke
  strokeWeight(0.5); // 0.5px ie 50% opacity
  colorMode(HSB, 360, 100, 100); // set color mode

  for (int i=0; i<=400; i+=40) {
    for (int j=0; j<=400; j+=40) {     
      randomizeColor(); // random color used for each triangle
      triangle (i,j,i,j+40,i+20,j+20);  // left triangle

      randomizeColor(); // random color used for each triangle
      triangle (i,j,i+40,j,i+20,j+20);  // top triangle

      randomizeColor(); // random color used for each triangle
      triangle (i+40,j,i+40,j+40,i+20,j+20); //right traingle

      randomizeColor(); // random color used for each triangle
      triangle (i,j+40,i+40,j+40,i+20,j+20); // bottom triangle

    }
  }
}

void randomizeColor() {
  int rand;
  rand = int(random(1,10.99)); // returns a random number between 1 and 10
  int[] triColor = new int[3]; // initialize array for HSB values

  /* 
  choses predefined colors 1-5 20%,20%,10%,30% and 10% of the time respectively.
  Absense of a break; statement means the next case is run. Hacky, I know.
  */
  switch (rand) {
    case 1: {}
    case 2: {triColor = new int[] {45,42,92};  break;} //color 1
    case 3: {}
    case 4: {triColor = new int[] {9,69,85}; break;} //color 2
    case 5: {triColor = new int[] {351,78,75}; break;} //color 3
    case 6: {} 
    case 7: {} //color 4 
    case 8: {triColor = new int[] {337,57,32}; break;} //color 4
    case 9: {} 
    case 10: {triColor = new int[] {184,31,47}; break;} //color 5
  }

  fill(color(triColor[0],triColor[1],triColor[2])); // set fill color

}


