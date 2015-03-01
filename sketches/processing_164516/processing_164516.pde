
/**
 * Perspective Geleend uit de example library
 * 
 * Move the mouse left and right to change the field of view (fov).
 * Click to modify the aspect ratio. The perspective() function
 * sets a perspective projection applying foreshortening, making 
 * distant objects appear smaller than closer ones. The parameters 
 * define a viewing volume with the shape of truncated pyramid. 
 * Objects near to the front of the volume appear their actual size, 
 * while farther objects appear smaller. This projection simulates 
 * the perspective of the world more accurately than orthographic projection. 
 * The version of perspective without parameters sets the default 
 * perspective and the version with four parameters allows the programmer 
 * to set the area precisely.
 */

boolean doT = true;

float posX = 0;
float posY;
float posZ;
float boxwidth = 100;
float boxlength= 100;
float boxheight = 100;
float distance= 101;

int rowrow =45;
int rows =45;
int buildheightTemp;

float[] buildingheight = new float[(rowrow*rows)*2];
float[] r = new float[(rowrow*rows)*2];
float[] g = new float[(rowrow*rows)*2];
float[] b = new float[(rowrow*rows)*2];

int buildingcount = 0;

void setup() {
  size(1300, 800, P3D);
  noStroke();
  smooth();


  // aan de hand van gegevens van CBS heb ik de absolute waardes omgezet in procenten.
  // de procenten bepalen de voorkomstkans van een van die inkomstengroepen, zijn 33% van de nederlandse huishoudens in groep x, dan is de kans 33% dat die groep
  // gekozen wordt voor de randomizer hieronder.

  for (int i = 0; i <= ( ( (rowrow*rows-1))); i++)
  {
    float randomizer = random(0.000, 1.000);
    if (randomizer < 0.2784770296) {      
      //no income households //Geen inkomen

      buildheightTemp = int(random(50, 60)); 
      buildingheight[i] =buildheightTemp; 
      r[i]=12;
      g[i]=0;
      b[i]=0;
      println(i);
    }
    if (randomizer > 0.2784770296 && randomizer <0.4481592197)
    {
      //Tot 10 000 euro
      println("10k");
      buildheightTemp = int(random(75, 100));
      buildingheight[i] =buildheightTemp; 
      r[i]=133;
      g[i]=12;
      b[i]=12;


      println(i);
    }

    if (randomizer>= 0.4481592197 && randomizer <0.5414568912)
    {
      //10 000 tot 20 000 euro
      println("10-20k");
      buildheightTemp = int(random(100, 150));    
      buildingheight[i] =buildheightTemp; 
      r[i]=216;
      g[i]=34;
      b[i]=9;

      println(i);
    }

    if (randomizer>= 0.5414568912 && randomizer <0.6343612336 )
    {
      //20 000 tot 30 000 euro
      println("20-30k");
      buildheightTemp = int(random(150, 200));    
      buildingheight[i] =buildheightTemp; 
      r[i]=42;
      g[i]=131;
      b[i]=140;

      println(i);
    }

    if (randomizer>= 0.6343612336 && randomizer <0.727265576 )
    {
      //30 000 tot 40 000 euro
      println("30-40k");
      buildheightTemp = int(random(200, 250));    
      buildingheight[i] =buildheightTemp; 

      r[i]=9;
      g[i]=165;
      b[i]=147;
      println(i);
    }
    if (randomizer>= 0.727265576 && randomizer <0.8142699813 )
    {
      //240 000 tot 50 000 euro
      println("40-50k");
      buildheightTemp = int(random(250, 350));    
      buildingheight[i] =buildheightTemp; 
      r[i]=133;
      g[i]=242;
      b[i]=188;
      println(i);
    }

    if (randomizer>= 0.8142699813 )
    {
      //50 000 en boven
      println("50K");
      buildheightTemp = int(random(350, 400));    
      buildingheight[i] =buildheightTemp; 
      r[i]=150;
      g[i]=195;
      b[i]=200;
      println(i);
    }



    // buildingheight=append(x);
    //buildingheight[i] =randomizer; 
    //int x =buildingheight[i];
    // println(buildingheight.length);
    //println(buildingheight[i]);
    //println("test");
  }
}

void draw() {
  fill(255);

  if (mousePressed) {

    doT=true;
  }
  if (doT) {
    //secondairy cam
    /*camera(mouseX+400, mouseY*2, 500, // eyeX, eyeY, eyeZ
     0.0, 0.0, 0.0, // centerX, centerY, centerZ
     0.0, 1.0, 0.0); // upX, upY, upZ
     */
  }
  //lights();
  background(240);
  float cameraY = height;
  float fov = 900/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2);
  float aspect = float(width)/float(height);


  perspective(fov, aspect, 1, cameraZ*5000.0);

  translate((width/2)+400, height, -2500);
  rotateX((-PI/6+mouseY/float(width)* PI)-1500);
  rotateY((PI/3 + mouseX/float(height) * PI));

  //cam end
  translate(0, -20, 0);
  box(2000000, 1, 2000000);  
  translate(0, 20, 0); 
  fill(255, 10);
  strokeWeight(2550);
  stroke(0);
  for (int ii=0; ii<rowrow; ii=ii+1)
  {

    //posZ=ii+10+boxheight;

    for (int i = 0; i < rows-1; i = i+1) {

      //println(buildingcount);
      // alle hoogtes op de X as  


      translate(i+10+boxwidth, 0, 0); //translate(x,y,z) elke keer dat je een nieuwe box wilt tekenen
      stroke(255);
      strokeWeight(1);
      fill(r[(ii*rowrow)+i], g[(ii*rowrow)+i], b[(ii*rowrow)+i]);
      box(boxwidth, buildingheight[(ii*rowrow)+i], boxheight);     



      //buildingcount++;
    }

    translate((-5745)+100, 0, 110);
    //buildingcount++;
  }
  doT=false;
} 

