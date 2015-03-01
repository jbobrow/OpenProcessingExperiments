
/*    Pierre MARZIN 07/2014
 *
 *    Trying to mimic Driessens & Verstappen e-volver
 *    Each pixel agent have properties. Agents will collect informations from neighbouring pixels,
 *    then will modify the pixel they're on according to what they collected and thier properties (genes).
 *    Each agent will modify the pixel it's on, combining the neighbors colors to its own color properties;
 *    When each agent is moved, its movement is driven by attractive/repulsive forces from the other agents,
 *    a proportion of random. These factors influence is set by global properties, so you get a different style 
 *    of texture every time you run the sketch. Each agent has a specific attirance for hue, saturation and brightness,
 *    which will also influence its deplacement...
 */

ArrayList <Agent>agents=new ArrayList<Agent>();//population of pixel agents
int nbeAgents;
//next properties will be recalculated when you refresh the web page, they are shared by all the agents
int huerangewidth=random(0, 180);//how varied will be the hues
int huecenter=random(360);//center hue value
float attractratio=random(10, 200);//how much will agents attraction impact on the result
float randomratio=random(3, 10);//how much random impact on the result
float pixwidth=random(.5, 3);//how far agent will move at each step
float amplitude=random(10, 60);//how much color will vary from the collected values

void setup() {
  size(300, 300);
  stroke(255);
  fill(0);
  colorMode(HSB, 360, 255, 255);//we'll deal with hsb values
  background(0, 0, 128);
  frameRate(200);
  randomSeed(second());//insure randomness
  nbeAgents=30;// 0 agents will fill the area quickly enough
  for (int i=0; i<nbeAgents; i++) {
    agents.add(new Agent(i, int(1+random(width-2)), int(1+random(height)-2)));// all we pass to the agent's constructor is index and location
  }
  loadPixels();//we'll work with scene's pixels
}
void draw() {
  //each agent is run, we cycle 100 times through agents before rendering
  for (int n=0; n<100; n++) {
    for (int i=0; i<nbeAgents; i++) {
      agents.get(i).run();
    }
    updatePixels();//at each cycle, pixels are updated
  }
}
class Agent {
  int index;//index of the agent in the agents list
  float x, y;//coordinates
  int sph=1;//sign of the hue cycle
  int sps=1;//sign of the saturation cycle
  int spb=1;//sign of the brightness cycle
  int amplitudecolmax;//base for randomization of the color displacement (current pixel will become average of its neighbors + this displacement)
  float huemod, satmod, brimod;//hue, saturation and brightness displacements will be different
  float drifthue, driftsat, driftbri;//how much agent is driven to the max hue, or max saturation or max brightness neighbor
  float lhue, hhue, lsat, hsat, lbri, hbri;//low/high values are the bounds of our color cycles
  float attract;//each agent is more or less attracted by its fellow agents. This individual factor is weighted by the global attraction influence...   
  float dx=0;//agent step displacement
  float dy=0;
  float mind, maxd;//min and max values of displacement (used for mapping it)
  float randompart;//like for attraction, global attraction influence modulates individual random influence
  //  float speeddiv=random(5, 20);//not used, each agent could have a native spee component
  //  float speedx=random(-1, 1)/speeddiv;
  //  float speedy=random(-1, 1)/speeddiv;
  int pixloc;//index of the pixel the agent is on (current pixel)
  int temppixloc;//neighbor pixel index
  int temppix;//value of the neighbor pixel
  float tempbri, temphue, tempsat;//brightness, saturation and hue of each neighbors
  float cumhue, cumsat, cumbri;//sums of the neighbors' color components
  float nhue, nsat, nbri;//components of the new color applied to the current pixel

  Agent(int index, int x, int y) {
    this.index=index;
    this.x=x;
    this.y=y;
    attract=random(-1, 1);//every local properties are randomized, som using global properties as random base
    randompart=random(randomratio*30, randomratio*60);
    amplitudecolmax=int(random(amplitude));
    huemod=random(-amplitudecolmax, amplitudecolmax);
    satmod=random(-amplitudecolmax/2, amplitudecolmax/2);
    brimod=random(-amplitudecolmax/2, amplitudecolmax/2);
    drifthue=random(-1, 1);
    driftsat=random(-1, 1);
    driftbri=random(-1, 1);
    lhue=random((huecenter+huerangewidth), huecenter);//here I fix low/high values for the color components cycles
    hhue=random(huecenter, huecenter+huerangewidth);
    lsat=random(0, 180);
    hsat=random(180, 255);
    lbri=random(0, 180);
    hbri=random(180, 255);
    pixloc=int(y)*width+int(x);
    //println(x+" "+y+" "+huemod+" "+satmod+" "+brimod);
  }
  void run() {//run is the main function: it calls the other ones...
    collect();
    transformPixel();
    move();
  }
  void collect() {// here we collect the informations about the current pixel's neighbors and calculate agent displacement
    cumhue=0;//reset values
    cumsat=0;
    cumbri=0;
    dx=dy=0;
    for (int i=0; i<nbeAgents; i++) {//calculating the weighted average of the other agents'attraction, modulated by global attractratio
      if (i!=index) {// but for current agent!
        Agent a=agents.get(i);
        float angle=atan2(a.y-y, a.x-x);
        float distance=dist(x, y, a.x, a.y);
        dx+=a.attract*sin(angle)*distance/attractratio;
        dy+=a.attract*cos(angle)*distance/attractratio;
      }
    }
    for (int i=-1; i<2; i++) {//here we summ and average the neighbors'color components
      for (int j=-1; j<2; j++) {
        if (i!=0 || j!=0) {
          temppixloc=(int(y)+j)*width+int(x)+i;
          temppix=pixels[temppixloc];
          temphue=hue(temppix);//(temppix >> 16) & 0xFF;
          tempsat=saturation(temppix);//(temppix >>8) & 0xFF;
          tempbri=brightness(temppix);//temppix & 0xFF;         
          cumhue+=temphue;
          cumsat+=tempsat;
          cumbri+=tempbri;
          dx+=i*(drifthue*temphue+driftbri*tempbri+driftsat*tempsat)/2;//displacement generated by attraction for hue, sat or brightness
          dy+=j*(drifthue*temphue*i+driftbri*tempbri+driftsat*tempsat)/2;
        }
      }
    }
    dx+=random(-randompart, randompart);//a bit of noise
    dy+=random(-randompart, randompart);
    mind=min(mind, dx);
    maxd=max(maxd, dx);
    dx=map(dx, mind, maxd, -pixwidth, pixwidth);//-1,1);// -1.5,1.5);//global pixwidth is like a 'pixel size' property
    dy=map(dy, mind, maxd, -pixwidth, pixwidth);//-1,1);// -1.5,1.5);//
    float val=(sph*huemod+cumhue/8)%360;//resulting hue calculation (according to local hue bounds)
    if ((val>hhue && (sph*huemod)>0) || (val<lhue && sph*huemod<0)) {//sph is the direction of the cycle, so I can cycle continuously (not like %)
      sph=-sph;
      val+=sph*huemod;
    }
    nhue=val;
    val=sps*satmod+cumsat/8;//same for saturation
    if ((val>hsat && sps*satmod>0) || (val<lsat && sps*satmod<0)) {
      sps=-sps;
      val+=sps*huemod;
    }
    nsat=val;
    val=spb*brimod+cumbri/8;//and brightness
    if ((val>hbri && spb*brimod>0) || (val<lbri && spb*brimod<0)) {
      spb=-spb;
      val+=spb*brimod;
    }
    nbri=val;//map(sp*brimod+cumbri/8, -amplitudecolmax, 255+amplitudecolmax, 0, 255);
  }
  void move() {//moving the agent, with quick boundary check
    x=(width+x+dx)%width;//+speedx
    y=(height+y+dy)%height;//+speedy
    pixloc=int(x)+int(y)*width;//new index of the current pixel
  }
  void transformPixel() {
    pixels[pixloc]=color(nhue, nsat, nbri);//finally the current pixel is modified
  }
}



