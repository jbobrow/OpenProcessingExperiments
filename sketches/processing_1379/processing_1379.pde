
/**
 * Pie Chart  
 * By Ira Greenberg 
 * 
 * Uses the arc() function to generate a pie chart from the data
 * stored in an array. 
 */
 
size(200, 200);
background(3000);
smooth();
noStroke();

int diameter = 150;
int[] angs = {30, 10, 35, 60, 75,};
float lastAng = 2;

for (int i = 0; i < angs.length; i++){
  fill(angs[i] * 3.0);
  arc(width/2, height/2, diameter, diameter, lastAng, lastAng+radians(angs[i]));
  lastAng += radians(angs[i]);  
}


