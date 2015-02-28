


int numballs = 5;
int xpos[] = new int[numballs];
int ypos[] = new int[numballs];


int mouseclickcounter;

float r[] = new float[numballs];
float g[] = new float[numballs];
float b[] = new float[numballs];

void setup(){
  
  mouseclickcounter = 0;
  size(300, 300);
  
  for(int i =0; i< numballs; i++){
   xpos[i]= mouseX;
   xpos[i]= mouseY;
   r[i]= random(255); 
   g[i]= random(255);
   b[i]= random(255);
 
  }
}

  void mouseClicked(){
  xpos[mouseclickcounter % numballs] = mouseX;
  ypos[mouseclickcounter % numballs] = mouseY;
  
  mouseclickcounter ++;
  }


void draw(){
  background(255, 255, 255);
  smooth();
  
  for (int i = 0 ; i < numballs && i< mouseclickcounter ; i++){
  fill(r[i], b[i], g[i]);
  ellipse(xpos[i], ypos[i], 20 ,20);

  }
}




