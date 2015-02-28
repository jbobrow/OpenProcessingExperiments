
/**
 * DOTS 
 * by Seth Rosen. 
 * 
 

 DEATH FUNCTION include terrain + temp + age?
 BETTER Evolution  crossover etc
  
 PROGRAM EXECTUTION
 setup()->Setup variables
 seed() ->initial state for food, terrain, cells
 draw()->update temperature, food, cells states 
 CELLS
 decrement Food and Water
 do Action based on STATE
 kill if death conditions are met
Default STATE is "move"
 STATE is determined if GOAL is reached
 GOAL is set by getgoaltemp()
 getgoaltemp runs getgoal() which calculated a goal based on Cell's current needs
 getgoaltemp then runs fin() which locates the nearest point that satisfys the goal
 getgoaltemp the runs setdest() which sets the Cell's destination to the goals location
 if the goal is not found then the Cell's GOAL is set to lost and it will move in a random direction or towards it's perfered terrain
 the cell will continue to move in the direction of it's destination until the cells location matches the goal location then the move() function will determine what STATE to set
 Some Calculations/functions will be called based on the state(eat,drink,sex,etc)  then a new goal will be set (getgoaltemp() ). 
 

TODO
improve UI
  switch java buttons to javascript web interface
  add sliders with min and max
  add preset examples
  switch global variable names to CAPS and use an Array to manage them in the front end
  add click on dot to view genes
  add population count
  display info in a better format
  Increase Screen Size / Zoom

Add Terrain features
  ability to change terrain vars in front end
  more organic terrain generation
  more terrain influence on Dots

Expand GA
  more variables
  more interesting mutations
  mutation rate based on gene similarity
  more efficient mutation algorithm
Better Logging
Clean Up Code
   comments
   var names
   efficiency
   
More natural initial conditions

*/

//Genetic Algoritm
public int ga_on =1;
public int crossover_type = 1;
public int size_mutations = 1;
public float sm_multiplier = 2000;

//gene mutators
public float view_mut =1;  // mult by +/- 1
public float maxf_mut =1;   // mult by +/- .5
public float maxw_mut =1;   // mult by +/- .5
public float sexpf_mut =1;  // mult by +/- 0 - .1
public float sexpw_mut =1;  // mult by +/- .1
public float lifeexp_mut =1;   // mult by +/- 1
public float ta_mut =1;     // mult by +/- 0 - .1
public float max_ta_mut =.5;
public float sexpf_mut_max =1;
public float sexpf_mut_min =.3;
public float sexpw_mut_max =1;
public float sexpw_mut_min =.3;

//GLOBAL VARS
  int log_count=0;
  int log_num=10000000;
  
//FOOD
public float density=1/.5;

 //set up log vars
 
//BUTTONS
      PFont fontA;
boolean locked = false;
RectButton rect1, rect2, rect3, rect4, rect5;  //5 buttons for reset and dispay modes

//TEMP
int pixelSize=2, selected=1;
PGraphics pg1, pg2, pg3, pg4;  // 1=temp 2=terrain 3=food 4=danger
public int tempspeed=300;

//TERRAIN  

color water, plain, mountain, desert, forest,male,female;
color black = color(0, 0, 0);
//color NULL = pg2.pixels[100*width+100];
// set lower for smoother animation, higher for faster simulation
int runs_per_loop = 10000;

public int startcells = 3000;

public int maxcells = 20000;
Cell[] cells = new Cell[maxcells];
ArrayList ALcells = new ArrayList();

void setup()
{
  size(200, 220);
  width=200;
  height=200; //leave room for buttons

  colorMode(RGB);

  
  //Set up Buttons
  color highlight = color(255, 255, 0);
  rect1 = new RectButton(0, height, width/5, color(255, 0, 0), highlight,char(88));
  // Define and create rectangle button
  highlight = color(0); 
  rect2 = new RectButton(width/5, height, width/5, 100, highlight,char(49));
  rect3 = new RectButton((width/5)*2, height, width/5, 100, highlight,char(50));
  rect4 = new RectButton((width/5)*3, height, width/5, 100, highlight,char(51));
  rect5 = new RectButton((width/5)*4, height, width/5, 100, highlight,char(52)); 
     fontA = loadFont("CourierNew36.vlw");
      textFont(fontA, 15);
    textAlign(CENTER);
  
  frameRate(24);
  clearscr();


  //Set up Cells
  male= color(0,140,100);
  female=color(255,25,200);


  //Set up Terrain
  water = color(0, 0, 128);
  plain = color(124, 252, 0);
  mountain = color(112, 128, 144);
  desert = color(180, 135, 52);
  forest = color(0, 111, 0);

  //Set up TEMP
  pg1 = createGraphics(width, height, P2D);
  pg2 = createGraphics(width, height, P2D);
  pg3 = createGraphics(width, height, P2D);
  pg4 = createGraphics(width, height, P2D);
  noSmooth();

  //numcells = 0;
  seed();

}

void seed()
{
  //Terrain
  pg2.beginDraw();
  pg2.loadPixels();
  for(int q=0; q<(width*height); q++){
    pg2.pixels[q] = black;
  }

  // Add terrain at random places
  for (int i = 0; i < 300; i++)
  {
    int cX = int(random(width));
    int cY = int(random(height));
    int c;
    float r = random(1);
    if (r < 0.24) c = plain;
    else if (r < 0.48) c = forest;
    else if (r < 0.60) c = desert;
    else if (r < 0.70) c = mountain;
    else c = water;
    //pg2.pixels[100*width+100]=desert;
    if ( pg2.pixels[cY*width+cX] ==black)
    {
      if(c==forest||c==desert){
        spread_blob(cX, cY, c,600);

      }
      if(c==mountain||c==water){
        int d = int(random(10,100));  
        spread_line(cX, cY, c,d);
        spread_blob(cX, cY, c,5*d);      
      }
      else
        pg2.pixels[cY*width+cX]=plain;
      //cells[numcells] = new Cell(cX, cY);
      //numcells++;
    }
  }
  // fill remaining with plain
  for (int x = 0; x < width; x++)
  {
    int cX = x; 
    for (int y = 0; y < height; y++)
    {
      int cY = y;
      int c;
      if(pg2.pixels[cY*width+cX]==black){
        pg2.pixels[cY*width+cX]=plain;
      }


    }
  }
  pg2.updatePixels();
  pg2.endDraw();

  //FOOOD
  colorMode(HSB);
  pg3.beginDraw();
  pg3.loadPixels();

  for(int q=0; q<(pg3.width*(pg3.height)); q++){
    if(q==q+floor(random(100*density))){
      pg3.pixels[q] = color(33,255,255-floor(random(255)) ); 
    }
    else{
      pg3.pixels[q] = color(0,0,0); 
    }
  }

  pg3.updatePixels();
  pg3.endDraw();
  colorMode(RGB);


  //Cells

  ALcells.clear();
  pg4.beginDraw();
  pg4.loadPixels();
  for(int q=0; q<(pg4.width*pg4.height); q++){
    pg4.pixels[q] = black;
  }
  for (int i = 0; i < startcells; i++)
  {
    int cX = int(random(pg4.width));
    int cY = int(random(pg4.height));
    int c;
    float r = random(1);
    if (r < 0.5) c = male;
    else c = female;

    if (pg4.pixels[cX+cY*pg4.width] ==black && in_bounds(cX,cY,pg4.width-1,pg4.height-1))
    {
      pg4.pixels[cX+cY*pg4.width]=c;
      ALcells.add(new Cell(cX, cY,c));
      //temp_cells[numcells] = new Cell(cX, cY,c);
      //numcells++;
    } 
    pg4.updatePixels();
    pg4.endDraw();
  }
  ALcells.toArray(cells);
  /*Cell[] cells = new Cell[numcells];
   
   for (int j = 0; j < numcells; j++)
   {
   cells[j]=temp_cells[j];
   
   }
   */
  image(pg2,0,0,width,height);

}

void draw()
{
  


  //TEMPURATUE 
  float  xc = 25;
  colorMode(HSB);
  // Enable this to control the speed of animation regardless of CPU power

  int timeDisplacement = millis()/tempspeed;

  // This runs plasma as fast as your computer can handle
  //int timeDisplacement = frameCount;

  // No need to do this math for every pixel
  float calculation1 = sin( radians(timeDisplacement * 0.61655617));
  float calculation2 = sin( radians(timeDisplacement * -3.6352262));

  // Output into a buffered image for reuse
  pg1.beginDraw();
  pg1.loadPixels();

  // Plasma algorithm
  for (int x = 0; x < pg1.width; x++, xc += pixelSize)
  {
    float  yc    = 25;
    float s1 = 128 + 128 * sin(radians(xc) * calculation1 );

    for (int y = 0; y < pg1.height; y++, yc += pixelSize)
    {
      float s2 = 128 + 128 * sin(radians(yc) * calculation2 );
      float s3 = 128 + 128 * sin(radians((xc + yc + timeDisplacement * 5) / 2));  
      float s  = (s1+ s2 + s3) / 3;
      pg1.pixels[x+y*pg1.width] = color(s, 255 - s / 2.0, 255);
    }
  }   
  pg1.updatePixels();
  pg1.endDraw();
  colorMode(RGB);
  // display the results
  //w[1] = pg1.loadPixels()

  //END TEMP


  //FOOOD
  colorMode(HSB);
  pg3.beginDraw();
  pg3.loadPixels();


  for (int y = 0; y < pg3.height; y++) {
    for (int x = 0; x < pg3.width; x++) {
      if( pg3.pixels[y*pg3.height+x] != color(0,0,0)){
        int dx=x+int(random(3))-1;
        int dy=y+int(random(3))-1;

        if( in_bounds(dx,dy,pg3.width-1,pg3.height-1)){
          float r1 = brightness(pg3.pixels[y*pg3.height+x])/255;     //cur food amnt
          float r2 = norm_dist(hue(pg1.pixels[dy*pg1.height+dx]));   //temp rate
          float r3 = terrain_rate(pg2.pixels[dy*pg2.height+dx]);    //terrain rate
          colorMode(HSB);
          //println(pg2.pixels[dy*pg2.height+dx]);
          float r = (r1/3+r2*2+2*r3)/3;    // spread rate   
          // println(r2);
          if(r>random(1) && pg3.pixels[dy*pg3.height+dx] == color(0,0,0)){

            pg3.pixels[dy*pg3.height+dx] = color(34,255,r2*2);  // spread rate
          }
          if( in_bounds(x,y,pg3.width,pg3.height)){
            pg3.pixels[y*pg3.height+x] = color(33,255, brightness(pg3.pixels[y*pg3.height+x])+r2*5+6*r3-2);  //growth rate
          }
        }

      }
    }
  }
  /*
 for (int q = 0; q < pg3.width*pg3.height; q++) {
   pg3.pixels[q] = color(33,255, 0 ); //color(255*.14,255*.97,255-floor(random(255)) ); 
   }
   */
  pg3.updatePixels();
  pg3.endDraw();
  colorMode(RGB);

  //Cells
  pg4.beginDraw();
  pg4.loadPixels();

  
  /*
  // Run cells in random order
   for (int i = 0; i < runs_per_loop; i++) {
   int selected = min((int)random(numcells), numcells - 1);
   //cells[selected].run();
   }*/

  for (int x = 0; x <ALcells.size() ; x++)
  {

    cells[x].F=cells[x].F-.02;
    cells[x].W=cells[x].W-.002;  
    cells[x].life-=1;
    if(cells[x].state=="move" || cells[x].state=="lost" ){   

      cells[x].move();
      if(random(1)>.8){
        cells[x].getgoaltemp();
      }

    }
    else if(cells[x].state=="eat"){   
      if(cells[x].F<cells[x].maxF){
        pg3.beginDraw();
        pg3.loadPixels();
        cells[x].F=cells[x].F+(brightness(pg3.pixels[cells[x].y*pg3.height+cells[x].x])/255);
        pg3.pixels[cells[x].y*pg3.height+cells[x].x] = color(0,0,0);
        pg3.updatePixels();
        pg3.endDraw();

        cells[x].getgoaltemp();
        cells[x].state="move";
      }      
      // print("2");
    }
    else if(cells[x].state=="drink"){   
      if(cells[x].W<cells[x].maxW){
        cells[x].W=1;
        //pg3.pixels[cells[x].y*pg3.height+cells[x].x] = color(0,0,0);

        cells[x].getgoaltemp();
        cells[x].state="move";
      }
      //  print("3");
    }
    else if(cells[x].state=="sex"){   
      cells[x].F=cells[x].F-cells[x].Fs;
      cells[x].W=cells[x].W-cells[x].Ws;
      cells[x].getgoaltemp();
      cells[x].state="move";
    }
    else if(cells[x].state=="dead"){   
      //print("dead");
    }
    else{
      print("????");
    }
    //DEATH
    if(cells[x].state!="dead"){
      if(cells[x].danger()){
       cells[x].die(x);
      }      
    }
 
}   
  pg4.updatePixels();
  pg4.endDraw();

  switch(selected){
  case 1:
    image(pg1,0,0,width,height);
    rect2.curr();
    break;
  case 2:
    image(pg2,0,0,width,height);
    rect3.curr();
    break;
  case 3:
    image(pg3,0,0,width,height);
    rect4.curr();
    break;
  case 4:
    image(pg4,0,0,width,height);
    rect5.curr();
    break;
  }



  //BUTTONS
  update(mouseX, mouseY);  
  rect1.display();
  rect2.display();
  rect3.display();
  rect4.display();
  rect5.display();
}

void clearscr()
{
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      set(x, y, color(0));
    }
  }
}

void update(int x, int y)
{
  if(locked == false) {
    rect1.update();
    rect2.update();
    rect3.update();
    rect4.update();
    rect5.update();
  } 
  else {
    locked = false;
  }

  if(mousePressed) {
    if(rect1.pressed()) {
      setup();
    } 
    else if(rect2.pressed()) {
      selected=1;
      //image(pg1,0,0,width,height);
    }
    else if(rect3.pressed()) {
      selected=2;
      //image(pg2,0,0,width,height);
    }
    else if(rect4.pressed()) {
      selected=3;      
      //image(pg3,0,0,width,height);
    }
    else if(rect5.pressed()) {
      selected=4;      
      //image(pg4,0,0,width,height);
    }
  }
}

void keyPressed() {
  if (key == 'p' || key == 'R') {
    noLoop();    
  }
  if (key == 'r' || key == 'R') {
    loop();    
  } 
  if (key == '1') {
    selected=1;    
  }
    if (key == '2') {
    selected=2;    
  }
    if (key == '3') {
    selected=3;    
  }
    if (key == '4') {
    selected=4;    
  }
    if (key == 'x' || key=='X') {
     setup();  
  }
}
 








