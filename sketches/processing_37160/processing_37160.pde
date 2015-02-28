
float spacing;

void setup(){
  size(500,500);
  // spacing set to 25 to resemble given picture
  spacing = 25;
  smooth();
}

void draw(){
  background(255);
  fill(0);
  
  for(int i = 1; i < 10; i++){
    for(int j = 1; j < 10; j++){
      // Map the color to set the shade
      float shade = map(j, 1, 10, 255, 0);
      fill(shade);
      
      // Here the distance between top left corners of triangles
      // is 1.5 * spacing (if the distance between triangles was
      // supposed to be 1.5 * spacing, this could be changed to
      // 2.5 * spacing)
      translate(i * spacing * 1.5, j * spacing * 1.5);
      
      triangle(-(.5*spacing), 0, .5*spacing, 0, 0, spacing);
      
      translate(-(i * spacing * 1.5), -(j * spacing * 1.5));
    }
  }
}
