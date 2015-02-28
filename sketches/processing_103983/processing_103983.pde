
/**
 * Draw Helix
 * by Cody Geary
 * 10 July 2013
 *
 * Generates an RNA or DNA helix of specified length and plots it in P3D
 */
 
//import processing.opengl.*

// ***Settings***=
int length_NA = 19; //set the max length, to calculate
int polymer = 2 ;   // (1) RNA,  (2) DNA, (3) LNA
int style = 3 ;     // (1) wireframe, (2) solid, (3) wire with bps through axis, (4) solid axis
int showaxis = 1  ; // (1) axis, (0) no axis
int showatoms = 1 ; // (1) show spheres, (0) no spheres
int persp_mode = 1; // (1) perspective, (0) orthographic projection
int inverter = -1; //this flips the right-handed coordinates into left-handed for displaying

float viewangleX = 0;   // horizontal axis
float viewangleY = 0;   // vertical axis
float viewangleZ = 0;   // in-plane axis
float zoomlevel = 8;
float anglechangeX = .5;  // sets the rotation angle step size, set to 0 for stationary
float anglechangeY = 0; 
float anglechangeZ = 0;

// Initialize Arrays for drawing helices
float[][] phos_one = new float[length_NA+1][3]; // arrays of coordinatess for main-strand phosphates  [atom number], [x,y,z]
float[][] phos_two = new float[length_NA+1][3]; // arrays of coordinatess for anti-parallel strand phosphates  [atom number], [x,y,z]
float[][] centerax = new float[length_NA+1][3]; // [atom number], [x,y,z] data for the central axis 
float radius; float twist; float rise; float tilt; float axis; float helixspace; int len = length_NA;//initialize vars

void setup() {
 size(600, 400, P3D); //set the window size, 3D viewer       
 lights();
 smooth();
 }
 
void draw() {
     
     background(200);  //reset the backgound between frame renders
     noStroke();
  
//     switch(persp_mode) {  //pick perspective or orthographic mode
//      case 1:              //JavaScript OPENGL doesn't support othographic mode
//       perspective();
//        break;
//      case 0:
//        ortho();
//        break;
//    }

     switch(polymer) {   //set the polymer type
     case 1: //RNA
       radius = 8.7; twist = 32.73; rise = 2.81; tilt = -7.452; axis = 139.9; helixspace = 22.0;
       break;    
     case 2: //DNA
       radius = 8.2; twist = 34.3; rise = 3.4; tilt = 0.5; axis = 133.0; helixspace = 19.5;
       break;
     case 3: //LNA
       radius = 11.0; twist = 25.7; rise = 3.8; tilt = -3; axis = 110.0; helixspace = 26.0;
       break;
     }
  
  float helixangle=0;      // sets the initial helix angle
  float aphelixangle=axis; //initialize the antiparallel angle to axis

  for (int i=1; i<len+1; i++) {  //fill in the arrays with data points
    helixangle = i*twist ;       //calculates the angle of the bp
    phos_one[i][0] = i*rise - ((len+1)/2)*rise;                      //x
    phos_one[i][1] = radius*(float)Math.cos(helixangle*DEG_TO_RAD);   //y
    phos_one[i][2] = radius*(float)Math.sin(helixangle*DEG_TO_RAD);   //z
    
    aphelixangle = helixangle + axis; //the antiparallel strand is based on the axis angle
    phos_two[i][0] = i*rise + tilt - ((len+1)/2)*rise;               //x
    phos_two[i][1] = radius*(float)Math.cos(aphelixangle*DEG_TO_RAD); //y
    phos_two[i][2] = radius*(float)Math.sin(aphelixangle*DEG_TO_RAD); //z
    
    centerax[i][0] = i*rise + tilt/2 - ((len+1)/2)*rise;             //x
    centerax[i][1] = 0;                                               //y
    centerax[i][2] = 0;                                               //z
  } 
  
      pushMatrix();  //
         translate(width/2,height/2,0);  //first move to the center of the viewing window
         scale(zoomlevel);                     //next set the render scale for RNA
         rotateX(viewangleX*DEG_TO_RAD);   //horizontal axis 
         rotateY(viewangleY*DEG_TO_RAD);      //vertical axis
         rotateZ(-viewangleZ*DEG_TO_RAD);  //plane axis   
         drawhelix();                    //go and draw the helix  
      popMatrix();
      
      switch(showatoms) {     // decide to show atom spheres
         case 1:
           for (int i=1; i<len+1; i++) {
              pushMatrix();
                translate(width/2,height/2,0);  //translate to the center of the viewing window
                scale(zoomlevel); //set the render scale for RNA
                rotateX(viewangleX*DEG_TO_RAD); //horizontal axis 
                rotateY(viewangleY*DEG_TO_RAD); //vertical axis
                rotateZ(-viewangleZ*DEG_TO_RAD); //plane axis

                translate(phos_one[i][0], phos_one[i][1], phos_one[i][2]*inverter);
                noStroke();
                fill(100,100,200);  //sets sphere color
                sphereDetail(10);    //reduces the sphere resolution, defaul=30
                sphere(1.5);
                translate(phos_two[i][0]-phos_one[i][0], phos_two[i][1]-phos_one[i][1], phos_two[i][2]*inverter-phos_one[i][2]*inverter);
                sphereDetail(10);    //reduces the sphere resolution, defaul=30
                sphere(1.5);
              popMatrix();
           }
           break;
         default: //otherwise don't show atoms
           break;
      }
      
      viewangleX += anglechangeX;  //increment the viewing angle
      viewangleY += anglechangeY;
      viewangleZ += anglechangeZ;
}

void drawhelix()
{      
      noFill();
      beginShape(LINES);
      stroke(0);
      strokeWeight(3);
      for (int i=1; i<len; i++) {
         vertex(phos_one[i][0], phos_one[i][1], phos_one[i][2]*inverter);    //draw main backbone strand
         vertex(phos_one[i+1][0], phos_one[i+1][1], phos_one[i+1][2]*inverter); 
         vertex(phos_two[i][0], phos_two[i][1], phos_two[i][2]*inverter);    //draw antiparallel strand
         vertex(phos_two[i+1][0], phos_two[i+1][1], phos_two[i+1][2]*inverter);
       }
      endShape();
     
      switch(showaxis) {   
        case 1:           // decide if the axis is to be shown
          noFill();
          beginShape();
            for (int i=1; i<len+1; i++) {
               vertex(centerax[i][0], centerax[i][1], centerax[i][2]*inverter); //draw axis
            }
          endShape();
          break;
        default:
          break;
      }

      switch(style) {
       case 1:  //draw wireframe
         beginShape(LINES);
         for (int i=1; i<len+1; i++) {
            stroke(0);
            strokeWeight(2);
            vertex(phos_one[i][0], phos_one[i][1], phos_one[i][2]*inverter); //draw base pairs
            vertex(phos_two[i][0], phos_two[i][1], phos_two[i][2]*inverter);
          }
         endShape();
         break;
       case 2:  //draw solid style, and base pairs
         for (int i=1; i<len; i++) {
           beginShape(TRIANGLE_FAN);
           fill(10,10,200,50);  //set the solid color and alpha
           noStroke();
           vertex(phos_one[i][0], phos_one[i][1], phos_one[i][2]*inverter); //draw solid regions
           vertex(phos_two[i][0], phos_two[i][1], phos_two[i][2]*inverter);
           vertex(phos_two[i+1][0], phos_two[i+1][1], phos_two[i+1][2]*inverter);
           vertex(phos_one[i+1][0], phos_one[i+1][1], phos_one[i+1][2]*inverter);
           vertex(phos_one[i][0], phos_one[i][1], phos_one[i][2]*inverter);
           endShape(CLOSE);
         }
         beginShape(LINES);
         for (int i=1; i<len+1; i++) {
            stroke(0);
            strokeWeight(2);
            vertex(phos_one[i][0], phos_one[i][1], phos_one[i][2]*inverter); //draw base pairs 
            vertex(phos_two[i][0], phos_two[i][1], phos_two[i][2]*inverter);
          }
         endShape();
           break;
       case 3:  //draw wireframe through axis style
         beginShape(LINES);
              for (int i=1; i<len+1; i++) {
                stroke(2);
                vertex(phos_one[i][0], phos_one[i][1], phos_one[i][2]*inverter); //draw base pairs through the center axis
                vertex(centerax[i][0], centerax[i][1], centerax[i][2]*inverter);
                vertex(centerax[i][0], centerax[i][1], centerax[i][2]*inverter);
                vertex(phos_two[i][0], phos_two[i][1], phos_two[i][2]*inverter);
              }
         endShape(); 
         break;
       case 4:  //draw solid axis style
         for (int i=1; i<len; i++) {
            beginShape(TRIANGLE_FAN);
            fill(10,10,200,50);
            noStroke();
            vertex(phos_one[i][0], phos_one[i][1], phos_one[i][2]*inverter);
            vertex(centerax[i][0], centerax[i][1], centerax[i][2]*inverter);
            vertex(centerax[i+1][0], centerax[i+1][1], centerax[i+1][2]*inverter); 
            vertex(phos_one[i+1][0], phos_one[i+1][1], phos_one[i+1][2]*inverter);   
            vertex(phos_one[i][0], phos_one[i][1], phos_one[i][2]*inverter);
            endShape(CLOSE);
         }
         for (int i=1; i<len; i++) {
            beginShape(TRIANGLE_FAN);
            fill(10,10,200,50);
            noStroke();
            vertex(phos_two[i][0], phos_two[i][1], phos_two[i][2]*inverter);
            vertex(centerax[i][0], centerax[i][1], centerax[i][2]*inverter);
            vertex(centerax[i+1][0], centerax[i+1][1], centerax[i+1][2]*inverter); 
            vertex(phos_two[i+1][0], phos_two[i+1][1], phos_two[i+1][2]*inverter);   
            vertex(phos_two[i][0], phos_two[i][1], phos_two[i][2]*inverter);
            endShape(CLOSE);
         }  
         beginShape(LINES);
           for (int i=1; i<len+1; i++) {
             stroke(2);
             vertex(phos_one[i][0], phos_one[i][1], phos_one[i][2]*inverter); //draw base pairs through the center axis
             vertex(centerax[i][0], centerax[i][1], centerax[i][2]*inverter);
             vertex(centerax[i][0], centerax[i][1], centerax[i][2]*inverter);
             vertex(phos_two[i][0], phos_two[i][1], phos_two[i][2]*inverter);
           }
        endShape(); 
        break;
       
      }
}



