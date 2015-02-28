
float sqWidth = 360;
float sqHeight = 360;
int sqTotal;


int tileX = 12;
int tileY = 12;

Particle[] particles;


void setup() {
  size(600, 600);
  smooth();
  frameRate(60);
  
  sqTotal = int(tileX*tileY) ;
  particles = new Particle[sqTotal];
  initParticles();
}


void initParticles(){
  int tileWidth = int(sqWidth / tileX);
  int tileHeight = int(sqHeight / tileY);
  
  //
  int counter = 0;
  for(int j = 0; j<tileY; j++){
    for(int i = 0; i<tileX; i++){
      float _x = (tileWidth/2) + (tileHeight * i);
      float _y = (tileHeight/2) + (tileWidth * j);
      
      particles[counter] = new Particle( (((width/2) - 180) )+_x,  (((height/2) - 180) )+_y, tileWidth, tileHeight);
      counter++;
    }
  }
}



void draw() {
  background(0);
  fill(20, 20, 20, 80);
  rect(0, 0, width, height);
  
  //
  for(int i = 0; i<sqTotal; i++){
    Particle p = particles[i];
    p.update();
  }
  
  
}





class Particle{
  float x, y;
  float originX, originY;
  float _width, _height;
  float angle;
  float scale;
  float distance; float charge;
  
  boolean isAffected = false;
  
  color colorO = color(255);
  color colorT = color(0, 174, 239);
  color _color;
  
  
  //////// CONSTRUCTOR ////////
  Particle(float _x, float _y, float _width, float _height){
    this.x = this.originX = _x;
    this.y = this.originY = _y;
    
    this._width = _width;
    this._height = _height;
    this.scale = 1; this.angle = 0;
    
    this._color = colorO;
    
    this.charge = random(6, 8);
  }
  
  
  
  
  //////// CALC ANGLE ////////
  float calcAngle(float x1, float x2, float y1, float y2){
    //atan2(mouseY-height/2, mouseX-width/2);
    float calcAngle = (float) Math.atan2(y1-y2, x1-x2);
    return calcAngle;
  }
  
  
  
  
  //////// UPDATE ////////
  void update(){
    float mouseInitX =   mouseX;// - ((width/2) - (width/2)/2);
    float mouseInitY = mouseY;// - ((height/2) - (height/2)/2);
    //println(mouseInitX);
    
    float distx = mouseInitX-this.x;
    float disty = mouseInitY-this.y;
    float dist = (float)Math.sqrt((distx * distx) + (disty * disty));
    
    if(this.isAffected){
      float powerx = -(distx/dist)*this.charge;
      float powery = -(disty/dist)*this.charge;
      
      //add repulsion force from the mouse
      this.x += powerx;
      this.y += powery;
    }



    //Get distance between mouse and particle origin to see if particles should be affected by the mouse
    float distanceorx = mouseInitX-this.originX;
    float distanceory = mouseInitY-this.originY;
    float distanceor = (float)Math.sqrt((distanceorx * distanceorx) + (distanceory * distanceory));
    
    //si la distancia entre el mouse y el origen de la particula es menor a 'n'
    if(distanceor < 60){
      this.isAffected = true;
    //  
    } else if(distanceor > 120){
      this.isAffected = false;
    }
    
    
    //atraemos a la partícula a su posición original
    this.x += (this.originX - this.x) * 0.12;
    this.y += (this.originY - this.y) * 0.12;
    //this.angle = calcAngle(this.x, this.originX, this.y, this.originY);
    
    
    float r;
    float g;
    float b;
    float scaleT;
    //propiedades
    if(this.isAffected){
        
      //calculo del color
      r = lerp(red(colorO), red(colorT), this.distance/60);
      g = lerp(green(colorO), green(colorT), this.distance/60);
      b = lerp(blue(colorO), blue(colorT), this.distance/60);
      
      //escala
      scaleT = lerp(1, .7,  noise(this.distance/60));
      
    } else {
      
      //calculo del color
      r = lerp(red(this._color), red(colorO), this.distance/60);
      g = lerp(green(this._color), green(colorO), this.distance/60);
      b = lerp(blue(this._color), blue(colorO), this.distance/60);
      
      //calculo de la escala
      scaleT = lerp(this.scale, 1, this.distance/60);
    }
    
    
    
    //definición del color
    this._color = color(r, g, b);
    this.scale = scaleT;//lerp(1, .5, this.distance/60);
    
    
    //actualizamos la ubicación y distancia de la partícula con respecto al orígen
    distanceorx = this.x - this.originX;
    distanceory = this.y - this.originY;
    distanceor = (float) Math.sqrt((distanceorx * distanceorx) + (distanceory * distanceory));
    this.distance = distanceor;
    
    
    //
    draw();
  }
  
  
  
  
  //////// DRAW ////////
  void draw(){
    rectMode(CENTER);
    //println(this.originX+"  :  "+mouseX);
    pushMatrix();
    translate(this.x, this.y);
    rotate( radians(45) );
    
    //stroke(this._color);
    noStroke();
    fill(this._color);
    rect(0, 0, this._width * this.scale, this._height * this.scale);
    
    fill(100);
    ellipseMode(CENTER);
    ellipse(0, 0, 6, 6);
    
    
    popMatrix();
  }
}


