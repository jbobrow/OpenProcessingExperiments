
// Written by Torbjoern Haugen 17. april 2010
// inspired by the source example from 
// "Artificial Intellgence A Systems Approach
// by M. Tim Jones.
// http://www.amazon.com/Artificial-Intelligence-Approach-Computer-Engineering/dp/0977858235


/* bugs: 
-movment of individual ants isnt animated right. can either use current&next, req. mod to chooseNextCity
-sometimes hangs in while(1) loop, cant find new city with p>rnd
*/ 

import controlP5.*;

ControlP5 controlP5;

int num_cities;
int num_ants;

class City
{
  float x,y;
}
int edgeLen = 200; // max edge length when creating city graph.

class Ant
{
  int current_city;
  int next_city;
  int tabu[];
  int tour_index;
  int tour[];
  double tour_length;

  Ant(){
    tabu = new int[num_cities];
    tour = new int[num_cities];
  }
}

// ACO-equation variables
// keep alpha,beta and rho within [0,1]
float alpha_value = 1.0; // higher value -> more scouting behaviour
float beta_value = 1.0; // higher value -> higher importance of distance cost
float rho = 0.9; // decay rate
float qval = 500; // amount of pherom to spread on tour.

City cities[];
Ant ants[];
float precomp_distance[][]; // edge length, store distances between cities
float pherom[][]; // pherom levels on each edge
float base_pherom; // minimum pherom level

double best_tour; // length of best tour found
int best_index = -1; // index of ants[] with best tour
int best_tour_history[]; // save ant tour history here

int iterations; // no of iterations used on ACO

float iterationTimer = 0; // remember time
float iterationTimeLength = 0.05; // how fast to iterate in seconds
int grabbedNode = -1;

void initACO()
{
  iterations = 0;
  num_cities = 20;
  num_ants = 20;

  best_tour = 100000.0;
  base_pherom = 1.0 / num_cities;

  cities = new City[num_cities];
  ants = new Ant[num_ants];
  for(int i=0; i < num_ants; i++){
     ants[i] = new Ant();
  }
  
  precomp_distance = new float[num_cities][num_cities];
  pherom = new float[num_cities][num_cities];  
  best_tour_history = new int[num_cities];
  
  initCities();
  initAnts();
}

void setup()
{
  size(400,400);
  frameRate(35);
  controlP5 = new ControlP5(this);
  // addSlider(java.lang.String theName, float theMin, float theMax, 
  //float theDefaultValue, int theX, int theY, int theW, int theH) 
  controlP5.addSlider("alphaValue",0,1,.95,
                      5,20*1,100,15).setId(1);
                      
  controlP5.addSlider("betaValue",0,1,.8,
                      5,20*2,100,15).setId(2);                          

  controlP5.addSlider("rhoValue",0,1,.9,
                      5,20*3,100,15).setId(3);

  controlP5.addSlider("iterationIntervalPause",0.01,0.5,0.4,
                      5,20*4,100,15).setId(4);                      
  initACO();
  PFont myfont;
  myfont = loadFont("Tahoma-12.vlw");
  textFont(myfont, 12); 
}

void draw()
{
  background(127,127,127);
  
  float time = (float) millis() / 1000.0;
  if(time > iterationTimer)
  {
    for(int i=0; i<num_cities; i++)
      if( moveAnts() == 0) // are all ants finished moving?
      {
          evaporatePheromoneTrails();
          intensifyPheromoneTrails();
          findBestTour();
          initAnts(); // reset ant position and tour
      }
    iterations+=num_cities;
    iterationTimer = time + iterationTimeLength;   
  }

  if(best_index >= 0) // found a good tour?
  {
    drawBestTour();
  }
  
  // draw city nodes
  strokeWeight(1.0);
  fill(255,255,255);
  for(int i=0; i < num_cities; i++)
  {
    rect( cities[i].x-5, cities[i].y-5, 10, 10);
  }
   
  //float t = 1-(iterationTimer-time)/iterationTimeLength;
  if( iterationTimeLength > 0.001 )
  {
    //drawMovingAnts(t);
  }
  
  colorMode(RGB, 256,256,256);
  
  text("iterations: "+iterations+", best tour: "+nf( (float)best_tour,5,1),5,15);
  //text("t: "+t,15,15*3);
  //text("alpha: "+nf( alpha_value, 1,2),15,15*4);
  //text("beta: "+nf( beta_value, 1,2),15,15*5);
  //text("rho: "+nf( rho, 1,2),15,15*6);
  text("spacebar = reset, mouse = move nodes",50,height-5);
  //delay(16);
}

public void alphaValue(float theValue) {
  alpha_value = theValue;
}
public void betaValue(float theValue) {
  beta_value = theValue;
}
public void rhoValue(float theValue) {
  rho = theValue;
}
public void iterationIntervalPause(float theValue) {
  iterationTimeLength = theValue;
}

void mouseDragged()
{
  if(grabbedNode > -1) // move node
  {
    cities[grabbedNode].x = mouseX;
    cities[grabbedNode].y = mouseY;
  }
}

void mousePressed() // mousePressed is called on an event! it isnt polled!
{
  if (mouseButton == LEFT && grabbedNode == -1) // not moving node, look for closest to mouse
  {
    float mindist = 10*10; // distance^2. look for node within radius.
    for(int i=0; i<num_cities; i++){
      float dx = abs(mouseX - cities[i].x);
      float dy = abs(mouseY - cities[i].y);
      float distance = dx*dx + dy*dy;
      if(distance < mindist){
        mindist = distance;
        grabbedNode = i;
      }
    }
  }

}

void mouseReleased()
{
  if(grabbedNode > -1)
  {
    cities[grabbedNode].x = mouseX;
    cities[grabbedNode].y = mouseY;
    grabbedNode = -1;
    
    
    best_index = -1;
    best_tour = 1e6;
    iterations = 0;
    resetPherom();
    computeCityDistances();
  }
}

void keyPressed()
{
  if (key == ' ') initACO();
}

void drawBestTour()
{
  int startCity = best_tour_history[0];
  int nextCity = 0;
  for(int i=0; i < num_cities; i++)
  {
    nextCity = best_tour_history[i];
    strokeWeight( pherom[startCity][nextCity] );
    stroke( color(0,0,0) );
    line( cities[startCity].x, cities[startCity].y, 
    cities[nextCity].x, cities[nextCity].y );
    startCity = nextCity;
  }
  
  // close loop
  startCity = best_tour_history[0];
  nextCity = best_tour_history[num_cities-1];
  strokeWeight( pherom[startCity][nextCity] );
  line( cities[startCity].x, cities[startCity].y, 
  cities[nextCity].x, cities[nextCity].y );
}

void drawMovingAnts(float t)
{
    colorMode(HSB, num_ants, 1.0, 1.0);
    ellipseMode(CENTER);
    int j = int( 19.0*t );
    float jsmooth = iterationTimeLength/(19.0*t);
    for(int i=0; i < num_ants; i++){
      //for(int j=0; j<num_cities; j++){
         //Ant a = ants[i];
        int now = ants[i].tour[ j ];
        int next = ants[i].tour[ (j+1)%num_cities ];
        
        float xpos = lerp( cities[now].x, cities[next].x, jsmooth );
        float ypos = lerp( cities[now].y, cities[next].y, jsmooth );
        fill( i,1.0,1.0 );
        ellipse(xpos, ypos,4,4);
      //}

    }
}

void initCities()
{
  // randomly place cities on the map
  float angIncrement = (TWO_PI) / float(num_cities);
  float ang = 0.0;
  for(int i=0; i < num_cities; i++)
  {
    cities[i] = new City();
    cities[i].x = width/2-edgeLen/2 + ( (1.0+cos(ang))/2.0*edgeLen ) + random(5,10);
    cities[i].y = height/2-edgeLen/2 + ( (1.0+sin(ang))/2.0*edgeLen ) + random(5,10);
    ang += angIncrement;
    
    if(random(0.0, 1.0) < 0.2)
    {
      cities[i].x = width/2-edgeLen/2 +(int)random(0,edgeLen);
      cities[i].y =  height/2+(int)random(0,edgeLen);
    }
    
  }
  cities[0].x = 300;
  cities[0].y = 100;
  
  resetPherom();

  // precompute the distances between cities
  computeCityDistances();
}

void computeCityDistances()
{
  for(int from=0; from < num_cities; from++){
    for(int to=0; to < num_cities; to++){
      float dx = abs( cities[from].x - cities[to].x );
      float dy = abs( cities[from].y - cities[to].y );
      float distance = sqrt( (dx*dx) + (dy*dy) );
      precomp_distance[from][to] = distance;
      precomp_distance[to][from] = distance;
    }
  }
}

void resetPherom()
{
  for(int from=0; from < num_cities; from++){
    for(int to=0; to < num_cities; to++){
      pherom[from][to] = base_pherom;
      pherom[to][from] = base_pherom;
    }
  }
}

void findBestTour()
{
  for(int i=0; i < num_ants; i++){
    if( ants[i].tour_length < best_tour){
      best_tour = ants[i].tour_length;
      best_index = i;
      
      for(int j=0; j < num_cities; j++) // remember tour
      {
        best_tour_history[j] = ants[i].tour[j];
      }
    }
  }
}

void initAnts()
{
  int city = 0;
  // place ants throughout the cities (evenly if possible)
  for(int i=0; i< num_ants; i++){
    
    for(int j=0; j< num_cities; j++){
      ants[i].tabu[j] = 0;
      ants[i].tour[j] = 0;
    }
    // place this ant in a city, and reflect it in the tabu
    ants[i].current_city = city; //(int)random(0,num_cities);//city;
    //ants[i].next_city = city; // will be set on choosenext
    city++;
    city %= num_cities;
    ants[i].tabu[ ants[i].current_city ] = 1;

    // update the tour, and current tour length given the current path
    ants[i].tour[0] = ants[i].current_city;
    ants[i].tour_index = 1;
    ants[i].tour_length = 0.0;
  }
}

void chooseNextCity(Ant ant)
{
  
  double d = 0.0;
  double p = 0.0;
  
  int from = ant.current_city;
  
  //
  int to=0;
  for(to=0; to < num_cities; to++){  
    if( ant.tabu[to] == 0){ // if city not yet visited
      d += pow(pherom[from][to], (float)alpha_value) *
        pow( (1.0/precomp_distance[from][to]), (float)beta_value );
    }
  }

  // Probabilistically select the next city
  to = 0;
  int stuck = 0;
  while(true){
    if( ant.tabu[to] == 0){ // if city not yet visited
    // equation 14.1
    p = pow(pherom[from][to], (float)alpha_value) *
                  pow( (1.0/precomp_distance[from][to]), (float)beta_value ) / d;
    if( random(0.0, 1.0) <= p ) break; // roll dice and see if we choose to go to city
    }
    to++;
    to %= num_cities;
    // shouldnt need this:
    stuck++;
    if(stuck > 200) break;
  }

  // we have our new destination, update for new city
  ant.next_city = to;
  ant.tabu[ant.next_city] = 1; // mark as visited
  ant.tour[ant.tour_index] = ant.next_city; // update tour log 
  ant.tour_index++;
  ant.tour_length += precomp_distance[ant.current_city][ant.next_city];

  // visited all cities, add distance from start to end.
  if(ant.tour_index == num_cities){
    ant.tour_length +=
      precomp_distance[ ant.tour[num_cities-1] ]  [ant.tour[0] ];
  }
  ant.current_city = ant.next_city; //!!!
}

int moveAnts()
{
  int moved = 0;
  for(int i=0; i < num_ants; i++){
    if( ants[i].tour_index < num_cities ){
      chooseNextCity( ants[i] );
      moved++;
    }
  }
  return moved; // if we couldnt move, we have visited all. We need to re-init. Return 0
}

void evaporatePheromoneTrails()
{
  for(int from = 0; from < num_cities; from++){
    for(int to=0; to < num_cities; to++){
      // equation 14.4
      pherom[from][to] *= (1.0 - rho);
      if(pherom[from][to] < 0.0){
        pherom[from][to] = base_pherom;
      }
    }
  }
}
void intensifyPheromoneTrails()
{
  for(int i=0; i < num_ants; i++){
    for(int city = 0; city < num_cities; city++){
      int from = ants[i].tour[city];
      int to = ants[i].tour[ ((city+1) % num_cities) ];

      // eq 14.2 / 14.3
      pherom[from][to] += (qval/ants[i].tour_length) * rho;
      pherom[to][from] = pherom[from][to];  
    }
  }
}


void drawArrowHead(float sx, float sy, float ex, float ey, float len)
{
   //line(sx,sy,ex,ey);
   float angle = atan2(ey-sy,ex-sx);
   float ofs=PI*1.2;
   
   line(ex, ey, ex+cos(angle+ofs)*len, ey+sin(angle+ofs)*len);
   line(ex,ey,ex+cos(angle-ofs)*len, ey+sin(angle-ofs)*len);
}


