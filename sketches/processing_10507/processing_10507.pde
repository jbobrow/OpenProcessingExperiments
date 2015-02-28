
//Variables del programa

//Variables del primer quadrat
float step1=1; //Número d'increment
float ampl1 = 75; //Amplada del quadrat
float alc1 = 75; //Alçada del quadrat
float angle_rot1 = 0; //Angle de rotació del quadrat
float ang_rot_ant1 = 0; //Angle de rotació del quadrat esborrador
float step1_ang = 0; //Increment de l'angle
float step1_ant = 0; //Increment de l'angle del quadrat esborrador

//Colors del primer quadrat
float color1 = 0;
float color2 = 0;
float color3 = 255;

//Variables del segon quadrat
float step2=1;  //Número d'increment
float ampl2 = 5; //Amplada del quadrat
float alc2 = 5; //Alçada del quadrat
float angle_rot2 = 0; //Angle de rotació del quadrat
float ang_rot_ant2 = 0; //Angle de rotació del quadrat esborrador
float step2_ang = 0; //Increment de l'angle
float step2_ant = 0; //Increment de l'angle del quadrat esborrador

//Colors del segon quadrat
float color4 = 0;
float color5 = 255;
float color6 = 0;


void setup() {
  size(400, 400); 
  smooth();
  background(0,0,0); //Fons de color negre
  frameRate(30);
 
 }

void draw() 
{
  //Dibuix del primer quadrat esborrador
  pushMatrix(); //Obrim transformació
  rectMode(CENTER); //Dibuixem el quadrat en relació al seu centre
  translate(200,200); //Traslladem el quadrat al centre de la finestra
  rotate(radians(angle_rot1 + ang_rot_ant1)); //Rotem el quadrat amb els paràmetres corresponents
  stroke(0,0,0); 
  strokeWeight(6);
  noFill();
  rect(0,0,ampl1+step1_ant,alc1+step1_ant); //Dibuixem el quadrat amb els paràmetres corresponents
  popMatrix();//Tanquem transformació
  
  //Dibuix del primer quadrat després d'esborrar l'anterior, ja que si no, queden traces anteriors
  pushMatrix();
  rectMode(CENTER);
  translate(200,200);
  rotate(radians(angle_rot1 + step1_ang));
  stroke(color1, color2, color3);
  strokeWeight(3);
  noFill();
  rect(0,0,ampl1 + step1,alc1 + step1);
  popMatrix();
  
  //Actualitzem el quadrat
  ang_rot_ant1 = step1_ang;
  step1_ang = step1_ang + 1;
  step1_ant = step1;
  step1 = step1 + 1;
  
  //Si el quadrat es més gran que la pantalla, es reinicia i borra l'últim quadrat
  if(ampl1 + step1 > 400 | alc1 + step1 > 400) {
    
      pushMatrix();
      rectMode(CENTER);
      translate(200,200);
      rotate(radians(angle_rot1 + ang_rot_ant1));
      stroke(0,0,0);
      strokeWeight(6);
      noFill();
      rect(0,0,ampl1+step1_ant,alc1+step1_ant);
      popMatrix();
      
      color1 = random(155,255);
      color2 = random(155,255);
      color3 = random(155,255);
      
      
      ang_rot_ant1 = 0;
      step1_ang = 0;
      step1_ant = 0;
      step1 = 0;
  }
  
  //Dibuix exactament igual però del quadrat més petit
  pushMatrix();
  rectMode(CENTER);
  translate(200,200);
  rotate(radians(-1*(angle_rot2 + ang_rot_ant2)));
  stroke(0,0,0);
  strokeWeight(6);
  noFill();
  rect(0,0,ampl2+step2_ant,alc2+step2_ant);
  popMatrix();
  
  pushMatrix();
  rectMode(CENTER);
  translate(200,200);
  rotate(radians(-1*(angle_rot2 + step2_ang)));
  stroke(color4, color5, color6);
  strokeWeight(3);
  noFill(); 
  rect(0,0,ampl2 + step2,alc2 + step2);
  popMatrix();
  
  
  ang_rot_ant2 = step2_ang;
  step2_ang = step2_ang + 1;
  step2_ant = step2;
  step2 = step2 + 1;
  
  if(ampl2 + step2 > 400 | alc2 + step2 > 400) {
    
      pushMatrix();
      rectMode(CENTER);
      translate(200,200);
      rotate(radians(-1*(angle_rot2 + ang_rot_ant2)));
      stroke(0,0,0);
      strokeWeight(6);
      noFill();
      rect(0,0,ampl2+step2_ant,alc2+step2_ant);
      popMatrix();
      
      color4 = random(155,255);
      color5 = random(155,255);
      color6 = random(155,255);
      
      
      ang_rot_ant2 = 0;
      step2_ang = 0;
      step2_ant = 0;
      step2 = 0;
  }
}

