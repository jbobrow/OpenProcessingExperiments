
/*
 * Aileen Park
 * ICAM 101, Spring 2012
 * 
 * Project 4
 *
 * Dandilion
 *
 * My goal was to animate a painting of dandilions my mother made during her
 * college years.
 *
 * Main sketch
 */

// Variables within the main sketch

// Array of colors for the flowers
color[] stemColors = {color(200,255,120), color(150,255,0), color(100, 150, 0), 
                      color(50,150, 0), color(50,100,0)};

// Variables for stems and waves
int stemNum = 15;
int waveNum = 5;
Stem[] stems = new Stem[stemNum];  // Array for stems
Waves[] waves= new Waves[waveNum]; // Array for waves

// Variables for the "whisp"
int num = 50;
float mx[] = new float[num];
float my[] = new float[num];

void setup()
{
  size(1280,800); // For full screen on a 13-inch macbook
  smooth();
  
  noStroke();

  /* Add stems from the Stem class to an array, parameters determine
   * the location, size, and the color of the the stem
   */
   
  stems[0] = new Stem(100, -200, stemColors[(int) random(0,5)]);
  stems[1] = new Stem(350, -200, stemColors[(int) random(0,5)]);
  stems[2] = new Stem(400, -200, stemColors[(int) random(0,5)]);
  stems[3] = new Stem(800, -200, stemColors[(int) random(0,5)]);
  stems[4] = new Stem(1150, -200, stemColors[(int) random(0,5)]);
  stems[5] = new Stem(1050, 60, stemColors[(int) random(0,5)]);
  stems[6] = new Stem(250, 60, stemColors[(int) random(0,5)]);
  stems[7] = new Stem(550, 60, stemColors[(int) random(0,5)]);
  stems[8] = new Stem(900, 60, stemColors[(int) random(0,5)]);
  stems[9] = new Stem(1000, 180, stemColors[(int) random(0,5)]);
  stems[10] = new Stem(200, 180, stemColors[(int) random(0,5)]);
  stems[11] = new Stem(55, 180, stemColors[(int) random(0,5)]);
  stems[12] = new Stem(700, 200, stemColors[(int) random(0,5)]);
  stems[13] = new Stem(475, 200, stemColors[(int) random(0,5)]);
  stems[14] = new Stem(625, 300, stemColors[(int) random(0,5)]);
  
  /* Add waves objects from the Wave class into an array,
   * Parameter determines the longitude location of the wave
   */
  waves[0] = new Waves(-500);
  waves[1] = new Waves(-425);
  waves[2] = new Waves(-205);
  waves[3] = new Waves(95);
  waves[4] = new Waves(150);

} // end setup()

void draw()
{
  // Background color
  background(0,50,150);
  
  // Display stems from the array
  for(int i = 0; i < stemNum; i++) {
    stems[i].display();
  } 
  
  // Display waves from the array
  for(int i = 0; i < waveNum; i++) {
    waves[i].display();
  }
  
  // Whisp that follows the mouse and leaves a diminishing trail
  fill(stemColors[1],150);
    
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i, i);
  }
    
} // end draw()

/*
 * This part of the program doesn't work. What I wanted to do
 * was to change the color of the whisp with a click.
 *
void mouseClicked() {
      fill(stemColors[(int) random(0,5)],150);
}*/

