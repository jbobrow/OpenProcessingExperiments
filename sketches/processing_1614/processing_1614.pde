
Waves waves;

void setup(){
  size(1000, 800);
  smooth();
  noStroke();
  
  waves = new Waves();
}

void draw(){
  background(0,5,30);
  
  waves.draw();
  if( frameCount%10==0){
    waves.update(); 
  }
}

class Waves
{  
  int totalWaves = 5;
  Wave[] waves;
  int xspacing= 8;
  int w;

  Waves(){   
    w = width;    
    // create the waves
    waves = new Wave[totalWaves];
    int i; 
    float period = 10;
    for(i=0; i<totalWaves; i++){
      float phase = .1;
      waves[i] = new Wave(period, phase, 20.0, 800.0, 0.0, new float[w/xspacing]);
      waves[i].yoffset = i*50;
      waves[i].dx = (TWO_PI / waves[i].period) * xspacing;
    }
    
  }  
  
  void draw(){
    calculate();
    render();    
  } 
  
  void calculate(){
    int j, i, n;
    float x;    
    // waves
    for(j=0; j<totalWaves; j++){
      n = waves[j].yvalues.length;
      // yvals for each wave
      for(i=0; i<n; i++){        
        waves[j].theta += waves[j].phase;
        x = waves[j].theta;        
        waves[j].yvalues[i] = sin(x) * waves[j].amplitude;
        x += waves[j].dx;        
      }       
    }
    
  }
  
  void render(){
    float radius = 5;
    float x, y, h, w, oldY;
    int j, i, n;
    // waves
    for(j=0; j<totalWaves; j++){      
      n = waves[j].yvalues.length;
      // yvalues
      for(i=0; i<n; i++){  
        x = i * xspacing;        
        y = (waves[j].yoffset + (height/2)) + waves[j].yvalues[i];      
        fill(j,i,n);
        ellipse(x, y, 7, 7); 
        ellipse(x, y+10, 6, 6); 
        ellipse(x, y+20, 5, 5); 
        ellipse(x, y+30, 4, 4); 
        ellipse(x, y+40, 3, 3); 
        ellipse(x, y+50, 2, 2); 
        ellipse(x, y+60, 1, 1); 
      } // end yvals loop
    }// end waves loop
  }
  
  void update(){
    //*
    int j;
    for(j=0; j<totalWaves; j++){   
      //waves[j].amplitude = random(50)+10;
      //waves[j].phase += random(.2)-.25;
    }
    //*/
  }
  
  
}

class Wave
{
  public float phase;
  public float theta;
  public float amplitude;
  public float period;
  public float dx;
  public float yoffset = 0;
  public float[] yvalues;
  
  Wave(float theta, float phase, float amplitude, float period, float dx, float[] yvalues){
    this.phase = phase;
    this.theta = theta;
    this.amplitude = amplitude;
    this.period = period;
    this.dx = dx;
    this.yvalues = yvalues;
  } 
}

class Point
{
  public float x, y;  
  Point(float x, float y) {
    this.x=x;
    this.y=y;
  } 
}



