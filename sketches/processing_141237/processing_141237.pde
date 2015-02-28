
float r = 1; 
float g = 1; 
float b = 1; 
float strokeColor = 0;
float change = 5;
//float strokeColor= random(0, 255); 
void setup() {
  size(500, 500);
  smooth();
  strokeWeight(0); //playing around with different stroke weights makes really interesting
  //changes
}
void draw() {
  stroke(r, g, b);
  r = noise (0, 100);
  b = noise (100, 150);
  g = noise (0, 100);
  //background(r,g,b); //the random colors became too //intense so I commented this part out
  for (int i = 0; i < 500; i+=5) {
    line(0, i + change, width * 2/3, height * 2/3); 
    line(i + change, 0, width * 2/3, height * 2/3); 
    line(500, i, width/2, height * 5/6);
    line(i, 500, width*5/6, height/2);
  }
  stroke(255);
  for (int u = 0; u < 500; u+=1) {
    line(u + change, 0, width * 2/3, height * 2/3); 
    line(0, u + change, width * 2/3, height * 2/3); 
    line(u, 500, width/2, height * 5/6);
    line(500, u, width*5/6, height/2);
  } 
  }
  /*stroke(0);
   //for (int c = 10; c < 500; c+=15) {
   //line(0, 0, pmouseX , pmouseY + change); //line(0,c + change, width, height ); //line(c, 500, width, height);
   //line(500, c, width, height);
   //line(i, i, i, 500);
   //line(500, i, i, i);
   //strokeColor = strokeColor + change; constrain(r, 0, 255); constrain(g, 0, 255);
   constrain(b, 0, 255);
   //}
   */
  /*this part is for playing with the mouseX
   & mouseY functions, I will explore more later */




