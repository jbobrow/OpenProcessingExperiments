
/**
 * Artist's Statement: 
 * ANGER Management addresses the social issue of people's emotional display and being able to 
 * read the emotions of others. In everyday society, people often mask emotions. What if our clothes,
 * our cars, our walls can broadcast our emotions?
 *
 * Use case 1:
 * An angry person driving on the freeway broadcasts their emotions on their car's body surface.
 * Surrounding drivers can give more space to this car, potentially alleviating a traffic accident.
 *
 * Use case 2:
 * A single person arrives home after a stressful day. She is still feeling flustered from the work day. 
 * The home's walls broadcast a soothing pattern to calm the person's nerves.
 * CONTROLS:
 *    Down Arrow key or '<' or ',' : Signify anger is decreasing, resulting in a slower paced animation.
 *    Up Arrow key or '>' or '.' : Signify anger is increasing, resulting in faster animation.
 *    Moving the mouse towards the right side of the screen: Shifts to a cooler color palette to calm the nerves.
 *    Moving the mouse towards the left side of the screen: Shifts to a warm color palette signifying anger and tension.
 */
 
 // Note that this project is a prototype or visual design concept. In full actualization, the input to the program would
 // be coming from the individual in the form of brain waves or brain spiking activity related to stress and/or
 // relaxation (the device could be like the Emotiv headset and the output could be something like ePaper or 
 // electronic projection).

// global vars

int width, height;
int frm_rate, counter;
float red_factor, green_factor, blue_factor;
Arrow arrow1, arrow2, arrow3, arrow4, arrow5, arrow6, arrow7;
Arrow arrow8, arrow9, arrow10, arrow11, arrow12, arrow13, arrow14, arrow15;
Arrow arrow16, arrow17, arrow18, arrow19, arrow20;
Arrow [] arrows = new Arrow[20];
PImage img;

// setup
  void setup() {
    
    width = 1280;
    height = 600;
    size(1024, 768);
    img = loadImage("errortribune_car.jpg");
    frm_rate = 85;
    frameRate(frm_rate);
    smooth();
    
    counter = 0;
    strokeWeight(0.7);
    arrow1 = new Arrow();  
    arrow2 = new Arrow();
    arrow3 = new Arrow();
    arrow4 = new Arrow();  
    arrow5 = new Arrow();
    arrow6 = new Arrow();
    arrow7 = new Arrow();
    arrow8 = new Arrow();  
    arrow9 = new Arrow();
    arrow10 = new Arrow();
    arrow11 = new Arrow();  
    arrow12 = new Arrow();
    arrow13 = new Arrow();
    arrow14 = new Arrow();
    arrow15 = new Arrow();
    arrow16 = new Arrow();  
    arrow17 = new Arrow();
    arrow18 = new Arrow();
    arrow19 = new Arrow();
    arrow20 = new Arrow();

    arrows[0] = arrow1;
    arrows[1] = arrow2;
    arrows[2] = arrow3;
    arrows[3] = arrow4;
    arrows[4] = arrow5;
    arrows[5] = arrow6;
    arrows[6] = arrow7;
    arrows[7] = arrow8;
    arrows[8] = arrow9;
    arrows[9] = arrow10;
    arrows[10] = arrow11;
    arrows[11] = arrow12;
    arrows[12] = arrow13;
    arrows[13] = arrow14;    
    arrows[14] = arrow15;    
    arrows[15] = arrow16;
    arrows[16] = arrow17;
    arrows[17] = arrow18;
    arrows[18] = arrow19;    
    arrows[19] = arrow20;    
    
    red_factor = 0;
    green_factor = 0;
    blue_factor = 0;
    
  }

// drawing
  void draw() {
    background(51);
    image(img,0,0);
    frameRate(frm_rate);
    for (int i=0; i<20; i++) {
       //activateArrow(i); 
       arrows[i].display();
       arrows[i].animate(); 
    }
    
    if (mouseX > width/5*3) { // when mouse is to the right side, palette changes to cool colors
       blue_factor = 102;
       green_factor = 75;
       red_factor = -102;
    } else if (mouseX < width/5*2) { // when mouse is to the left side, palette reverts to warm colors
       blue_factor = 0;
       green_factor = 0;
       red_factor = 0;
    }
    
  } //end draw
  
  void keyPressed() {
    
    if (keyCode == UP || key == '.' || key == '>') { // key set to escalate anger display
      frm_rate += 10;
    } else if (keyCode == DOWN || key == ',' || key == '<') { // key set to de-escalate anger display
      if (frm_rate > 1) {
        frm_rate -= 5;      
      }
    } 
  } 
  
  class Arrow {
  
    //vars      
    PVector v1, v2, v3, v4, velocity;
    int point_x, point_y, counter;
    int vel_x, vel_y;
    
    //constructor
    Arrow() {

      point_x = 85;
      point_y = height/2;
          
      // define the arrow heads (points)    
      v1 = new PVector(point_x, point_y);
      v2 = new PVector(point_x - 4, point_y);
      v3 = new PVector(point_x - 8, point_y);
      v4 = new PVector(point_x - 15, point_y);
      
      // create random velocities for arrows
      vel_x = int( random(2,15));
      vel_y = int( random(-5,5));
      
      velocity = new PVector(vel_x, vel_y);
    } //end constructor
    
    void display() {
      stroke(255 + red_factor, 0 + green_factor, 102 + blue_factor);
      strokeWeight(1.5);
      line(v1.x, v1.y, v1.x - 30, v1.y - 10); // arrow 1, left side
      line(v1.x, v1.y, v1.x - 30, v1.y + 10); // arrow 1, right side
  
      stroke(255 + red_factor, 102 + green_factor, 0 + blue_factor);
      strokeWeight(1.5);
      line(v2.x, v2.y, v2.x - 37, v2.y - 12); // arrow 2, left side
      line(v2.x, v2.y, v2.x - 37, v2.y + 12); // arrow 2, right side
      
      stroke(204 + red_factor, 102 + green_factor, 51 + blue_factor);
      strokeWeight(2);
      line(v3.x, v3.y, v3.x - 47, v3.y - 13); // arrow 3, left side
      line(v3.x, v3.y, v3.x - 47, v3.y + 13); // arrow 3, right side
            
      stroke(153 + red_factor, 51 + green_factor, 0 + blue_factor);
      strokeWeight(3);
      line(v4.x, v4.y, v4.x - 55, v4.y - 15); // arrow 4, left side
      line(v4.x, v4.y, v4.x - 55, v4.y + 15); // arrow 4, right side          
    } //end display()
    
    void animate() {

      v1.add(velocity);
      v2.add(velocity);
      v3.add(velocity);
      v4.add(velocity);        
      
      //cause the arrows to bounce off the walls
      if ((v1.x > width*3/4)|| ((v4.x - 55) < 0)){
        velocity.x = velocity.x * (-1);        
      }
      if ((v1.y > height)||(v4.y - 15 < 100) || (v1.y < 100) || (v4.y + 15 > height)) {
        velocity.y = velocity.y * (-1);                 
      }
    } //end animate()
    
  } //end Arrow class
  
  void activateArrow(int counter) {
     println("counter: " + counter);
     arrows[counter].display();
     arrows[counter].animate(); 
     //while (counter+1 <= arrows.length) {
       //counter++;     
     //}
  }
  
  /*
  Resources
      Background Image of car:
         ErrorTribune, CC by-SA 2.0
         http://www.flickr.com/photos/errortribune/3425486311/sizes/l/
      Color chart: http://html-color-codes.com/rgb.html
      Classes (object oriented programming in Processing): http://www.learningprocessing.com/examples/chapter-8/example-8-2/
      Vectors: http://processing.org/tutorials/pvector/
          http://processing.org/reference/PVector.html
      Tan Le's TED Talk: A headset that reads your brainwaves
          http://www.ted.com/talks/tan_le_a_headset_that_reads_your_brainwaves
      
  */


