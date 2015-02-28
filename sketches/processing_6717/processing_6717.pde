
class SerVivo{
  float x,y;
  float tamanho,movimento;
  boolean agressivo;//i will implements this later
  int numLado;
  int numDentro;
  SerVivo(float x,float y,float tamanho,boolean agressivo,int numLado, int numDentro){
  this.x = x;
  this.y = y;
  this.tamanho = tamanho; //diameter
  this.agressivo = agressivo; //i will implements this later
  this.numLado = numLado; //number of sizes
  this.numDentro = numDentro; //number for internals
  }
  
  void go(){
    movimento();
    render();
  }
  
  void movimento(){
    movimento = 1;
    x += noise(-movimento,movimento);
    y += 0;
    if( x < -width      ){ x = width;  } 
    if( x > width ){ x = 0;       }
    if( y < -height     ){ y = height; }
    if( y > height){ y = 0;       }
    
  }


  boolean getAgressivo(){ //i will implement this later
    return agressivo;
  }
  
  void render(){ //function to draw the beings
    float[] xpos = new float[numLado];
    float[] ypos = new float[numLado];
    float angle = 2*PI/numLado;
    for (int i = 0; i<numLado; i++){
    xpos[i] = y+tamanho*cos(angle*i);
    ypos[i] = x+tamanho*sin(angle*i);
    xpos[i] += 100*sin(ypos[i]/50);
    ypos[i] += 100*cos(xpos[i]/50);
    
    }
    beginShape(POLYGON);
    fill(0,50);
    stroke(0,100);
    for(int j = 0; j<numLado; j++){
    vertex(xpos[j],ypos[j]);
    ellipse(xpos[j],ypos[j],4,4);
    pushStyle();
    fill(0,numDentro*3);
    noStroke();
    ellipse(xpos[1],ypos[0],numDentro*1.5,numDentro*1.5); //internals
    ellipse(xpos[2],ypos[0],numDentro,numDentro); //internals
    popStyle();
   }
    endShape(CLOSE);
    }
}

