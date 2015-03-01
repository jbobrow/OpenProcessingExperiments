
void setup() {
  size(600, 600);
  strokeCap(PROJECT);
  smooth();
}
 
void draw() {

      font = loadFont("Impact");
      textFont(font, 8 + mouseX/10);
      background(163, 237, 195);
       
      float trans = mouseY/5;
 
      translate(width/2, height/2);
      //we'll make 12 copies of a rotated array of lines using variable k
      for(float k = 0; k < 360; k += 5){
          //first, we'll need to ready the transformation matrix for data to be loaded into it
          pushMatrix();                   
          //then, we make things rotate according to the mouseX position /3
          rotate(radians(mouseX/3));     
          //but furthermore, create copies of it for every value 'k'
          rotate(radians(k));             
          //we use this loop to create a spread of lines to rotate and clone
          for(float i = 0; i < 100; i += 2){
              fill(random(121,219), random(121,203), random(188,219));
              text("Willhelm", 50 + trans, 50 + trans);
          }
          //to finish up, we pop the matrix, finalizing our translations
          popMatrix();
      }
}
