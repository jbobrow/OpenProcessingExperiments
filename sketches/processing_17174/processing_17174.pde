
int counter;
int pNum =16;
public boolean constant = false;
public color [] pop = new color[pNum];
public int inc = 0;
public int [] popx = new int[pNum];
public int [] popy = new int[pNum];

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 

  loopx();
}


void loopx(){


  popx[inc]=mouseX;
 popy[inc]=mouseY;
 

  
  if (!constant)if (inc<pop.length-1)inc++;
 
  if (constant) inc++;
 
  if (inc >pop.length-1)inc=0;
   
 
  if (pmouseX==mouseX && !constant)
  {
    inc=0;
  }
  fill(255,0,0,111);
 ellipse(popx[inc],popy[inc],20,20);
 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
   
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
                
    
