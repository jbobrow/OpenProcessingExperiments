
  int h_ax = 0;
  int h_ay = 0;
  int h_bx = 0;
  int h_by = 0;
  int h_cx = 0;
  int h_cy = 0;
  
  int s_ax = 0;
  int s_ay = 0;
  int s_bx = 0;
  int s_by = 0;
  int s_cx = 0;
  int s_cy = 0;
  
  int m_ax = 0;
  int m_ay = 0;
  int m_bx = 0;
  int m_by = 0;
  int m_cx = 0;
  int m_cy = 0;
  
  int changingred = 255;
  int changingredcolour = -1;
  int changinggreen = 255;
  int changinggreenvector = -1;
  int changinggblue = 255;
  int changingbluevector = -1;
  

  void setup() {
  size(800,600);
  smooth();
  frameRate(1);
  }

  void draw(){
  background(0);
  
  int s=second();
  int m=minute();
  int h=hour();
  
  int ran1 = int(random(255));
  int ran2 = int(random(255));
  int ran3 = int(random(255));
  
  int ran4 = int(random(255));
  int ran5 = int(random(255));
  int ran6 = int(random(255));

  int ran7 = int(random(255));
  int ran8 = int(random(255));
  int ran9 = int(random(255));


  //use the s value to set up the values of all the coordinates for the s triangle.
  
  s_ax = width/2 - (s*25)/2;
  s_ay = 950;
  s_bx = width/2;
  s_by = 182;
  s_cx = width/2 + (s*25)/2;
  s_cy = 950;
  
   changinggblue = changinggblue + changingbluevector;
  if (changinggblue == 0 || changinggblue == 256) {
    changingbluevector = -changingbluevector;
   // changinggreen = 255;
  }
  
    noStroke();
        createGradient(s_bx,s_by,20, 
      color(ran1,ran2,changinggblue,50), 
      color(0));
      
        noStroke();
        createGradient(s_bx,s_by,3, 
      color(255),
      color(ran1,ran2,changinggblue,50));
   
   
  // seconds
  stroke(ran1,ran2,changinggblue,80);
   strokeWeight(1);
  line(s_ax,s_ay,s_bx,s_by);
  line(s_ax,s_ay,s_cx,s_cy);
  line(s_bx,s_by,s_cx,s_cy);
  
 fill(ran1,ran2,changinggblue,50);
 triangle(s_ax,s_ay,s_bx,s_by,s_cx,s_cy);
 
  
  //minutes

  
  m_ax = width - (m*14)/2;
  m_ay =600;
  m_bx = (width/10)*6;
  m_by =90;
  m_cx = width  +(m*14)/2;
  m_cy = 600;
  
  changinggreen = changinggreen + changinggreenvector;
  if (changinggreen == 0 || changinggreen == 256) {
    changinggreenvector = -changinggreenvector;
   // changinggreen = 255;
  }
    noStroke();
        createGradient(m_bx,m_by,30, 
      color(ran7,changinggreen,ran9), 
      color(0));
      noStroke();
        createGradient(m_bx,m_by,4, 
      color(255),
      color(ran7,changinggreen,ran9));
    
  
 stroke(ran7,changinggreen,ran9,80);
  strokeWeight(1);
 line(m_ax,m_ay,m_bx,m_by);
 line(m_ax,m_ay,m_cx,m_cy);
 line(m_bx,m_by,m_cx,m_cy);

 fill(ran7,changinggreen,ran9,50);
 triangle(m_ax,m_ay,m_bx,m_by,m_cx,m_cy);
 
  
  //hours
 
  h_ax = (width - 801) - (h*35)/2;
  h_ay =601;
  h_bx = (width/15)*5;
  h_by =50;
  h_cx = (width - 801) +(h*35)/2;
  h_cy = 601;

    changingred = changingred + changingredcolour;
  if (changingred == 0 || changingred == 256) {
    changingredcolour = -changingredcolour;
   // changingred = 255;
  }
  noStroke();
        createGradient(h_bx,h_by,40, 
      color(changingred,ran4,ran5), 
      color(0));
      
        noStroke();
        createGradient(h_bx,h_by,5, 
      color(255),
      color(changingred,ran4,ran5));
    
  
 stroke(changingred,ran4,ran5,80);
 strokeWeight(1);
 line(h_ax,h_ay,h_bx,h_by);
 line(h_ax,h_ay,h_cx,h_cy);
 line(h_bx,h_by,h_cx,h_cy);

 fill(changingred,ran4,ran5,50);
 triangle(h_ax,h_ay,h_bx,h_by,h_cx,h_cy);
  }
 
 void createGradient (float x, float y, float radius, color c1, color c2){
  float px = 0, py = 0, angle = 0;

  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
  // hack to ensure there are no holes in gradient
  // needs to be increased, as radius increases
  float gapFiller = 8.0;

  for (int i=0; i< radius; i++){
    for (float j=0; j<360; j+=1.0/gapFiller){
      px = x+cos(radians(angle))*i;
      py = y+sin(radians(angle))*i;
      angle+=1.0/gapFiller;
      color c = color(
      (red(c1)+(i)*(deltaR/radius)),
      (green(c1)+(i)*(deltaG/radius)),
      (blue(c1)+(i)*(deltaB/radius)) 
        );
      set(int(px), int(py), c);      
    }
  }
  // adds smooth edge 
  // hack anti-aliasing
  noFill();
  strokeWeight(3);
  ellipse(x, y, radius*2, radius*2);
 }




