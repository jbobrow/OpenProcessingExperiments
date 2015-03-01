
//import peasy.*;

//PeasyCam cam;
Malla tela ;
float dt = 0.2;
PVector gravity = new PVector(0,3.8,0);
int cs = 40;
int s_x = 10;
int s_y = 10;
int modelo = 4;

void setup(){
  
   size(800,600,P3D);
   tela = new Malla(s_y, s_y, cs); 

   //cam = new PeasyCam(this,width/2 -(s_x*cs/2)+350, height+300 -(s_y*cs/2),-400,1800);
   
}
 
 void draw(){
   camera(width/2.0, height/2.0, (height/2.0)+400 / tan(PI*30.0 / 180.0) + 300, width/2.0, height/2.0, 0, 0, 1, 0);
   background(1,62,68); 
   lights();
   tela.run();
   
   fill(255);
   textSize(40);
   text("a: Structured || b: Bend || c: Shear || d: Total", width/2 -400, height/2 - (s_y*cs/2) -150);
   
   if(modelo==1){
     fill(255);
     textSize(40);
     text("Modelo: Structured ", width-200, height/2 - (s_y*cs/2) +60);
   }
   else if(modelo==2){
     fill(255);
     textSize(40);
     text("Modelo: Bend ", width-200, height/2 - (s_y*cs/2) +60);
   }
   else if(modelo==3){
     fill(255);
     textSize(40);
     text("Modelo: Shear ", width-200, height/2 - (s_y*cs/2) +60);
   }
   else if(modelo==4){
     fill(255);
     textSize(40);
     text("Structured+Bend+Shear", width-230, height/2 - (s_y*cs/2) +60);
   }
 }
 
 void keyPressed(){
  
  if(key == 'a') //Structured
  modelo = 1;
    
  if(key == 'b') //Bend
  modelo = 2;
  
  if(key == 'c') //Shear
  modelo = 3;
  
  if(key == 'd') //Shear
  modelo = 4;

}

class Malla{
    
    PVector gravity = new PVector(0,4.0);
    int m_DirectDistance = cs;
    int m_AslantDistance = (int) sqrt(2.0)*m_DirectDistance;
    float k = 0.3;
    float m_Damping = 0.3;
    PVector vDamp = new PVector(0,0,0);
    
    PVector[][] forces;
    PVector[][] vert;
    PVector [][] a;
    PVector[][] vel;
    
    PVector VertexPos = new PVector(0,0,0);
    PVector aire = new PVector(0,0,0);
    PVector wind = new PVector(-3,5,5);
    float windEsc = 0.0;
    
    PVector vertA = new PVector (0,0,0);
    PVector vertB = new PVector (0,0,0);
    PVector windNorm = new PVector (0,0,0);
    
      
    float masa = 3.0;
    int sx, sy;
        
    Malla(int sxX, int syY, int csS){
          
      sx = sxX;
      sy = syY;
      
      forces = new PVector [sx][sy];
      vert = new PVector [sx][sy];
      vel = new PVector [sx][sy];
      a = new PVector [sx][sy];
     
      for(int x=0; x<sx; x++)
        for(int y=0; y<sy; y++)
        {
          forces[x][y] = new PVector(0,0,0);
          vert[x][y] = new PVector(x * m_DirectDistance, y * m_DirectDistance,0);
          vel[x][y] = new PVector(0,0,0);
          a[x][y] = new PVector(0,0,0);
        }    
    }
    
    void run(){
      update();
      display();
    }
    
    void update(){
      aire.set(0.22+random(10,20)*0.1,  0.1+random(-20,10)*0.1, 0.012+random(0,40)*0.01);
      
      for(int x=0; x<sx ; x++){
        for(int y=1; y<sy ; y++)
        {
          PVector VertexPos = vert[x][y];
          forces[x][y].set(gravity);
          wind = aire.get();
          
          if(x==(sx-1))
          {
            vertA = PVector.sub(vert[x][y-1],vert[x][y]);
            vertB = PVector.sub(vert[x-1][y],vert[x][y]);
            windNorm = vertA.cross(vertB);
          }
          else
          {
            vertA = PVector.sub(vert[x+1][y],vert[x][y]);
            vertB = PVector.sub(vert[x][y-1],vert[x][y]);
            windNorm = vertA.cross(vertB);
          }
          windNorm.normalize();
          windNorm.mult(wind.mag());
          windEsc = windNorm.dot(wind);
          windNorm.mult(windEsc);
          forces[x][y].add(windNorm);
          
          //STRUCTURED SPRINGS LAYOUT  
          if(modelo==1)
          {  
          forces[x][y] = PVector.add(forces[x][y], getForce(x-1, y, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x+1, y, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x, y-1, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x, y+1, VertexPos, m_DirectDistance,k));
          }
          
          //BEND
          if(modelo==2)
          {
          forces[x][y] = PVector.add(forces[x][y], getForce(x-1, y, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x+1, y, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x, y-1, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x, y+1, VertexPos, m_DirectDistance,k));
          
          forces[x][y] = PVector.add(forces[x][y], getForce(x-2,y,VertexPos,m_DirectDistance*2,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x+2,y,VertexPos,m_DirectDistance*2,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x,y-2,VertexPos,m_DirectDistance*2,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x,y+2,VertexPos,m_DirectDistance*2,k));
          }
          
          //SHEAR (diagonales)
          if(modelo==3)
          {
          forces[x][y] = PVector.add(forces[x][y], getForce(x-1, y, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x+1, y, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x, y-1, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x, y+1, VertexPos, m_DirectDistance,k));
          
          forces[x][y] = PVector.add(forces[x][y], getForce(x-1, y-1, VertexPos, m_AslantDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x-1, y+1, VertexPos, m_AslantDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x+1, y-1, VertexPos, m_AslantDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x+1, y+1, VertexPos, m_AslantDistance,k));
          }
          
          //Los 3 juntos
          if(modelo==4)
          {
          forces[x][y] = PVector.add(forces[x][y], getForce(x-1, y, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x+1, y, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x, y-1, VertexPos, m_DirectDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x, y+1, VertexPos, m_DirectDistance,k));
          
          forces[x][y] = PVector.add(forces[x][y], getForce(x-2,y,VertexPos,m_DirectDistance*2,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x+2,y,VertexPos,m_DirectDistance*2,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x,y-2,VertexPos,m_DirectDistance*2,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x,y+2,VertexPos,m_DirectDistance*2,k));
          
          forces[x][y] = PVector.add(forces[x][y], getForce(x-1, y-1, VertexPos, m_AslantDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x-1, y+1, VertexPos, m_AslantDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x+1, y-1, VertexPos, m_AslantDistance,k));
          forces[x][y] = PVector.add(forces[x][y], getForce(x+1, y+1, VertexPos, m_AslantDistance,k));
          }
          
              
          vDamp.set(vel[x][y].x, vel[x][y].y, vel[x][y].z);
          vDamp.mult(-m_Damping);
          forces[x][y] = PVector.add(forces[x][y], vDamp);
          
          forces[x][y].div(masa);
          a[x][y].add(forces[x][y]);
          
          vel[x][y].add(PVector.mult(a[x][y], dt));
          vert[x][y].add(PVector.mult(vel[x][y],dt));
          a[x][y].set(0,0,0);
        }
      }
    }
    
    PVector getForce(int vertX, int vertY, PVector verticeV,int dist, float k){
      PVector fuerzaV = new PVector (0,0,0);
      PVector vertVecino = new PVector (0,0,0);
      PVector vertActual = new PVector (0,0,0);
      PVector anchor = new PVector (0,0,0);
      float mod = 0.0;
      
      if( (vertX >= 0) && (vertX < sx) && (vertY >= 0) && (vertY < sy) )
      {
      vertVecino.set(vert[vertX][vertY]);
      vertActual.set(verticeV);
      anchor = PVector.sub(vertActual, vertVecino);
      mod = anchor.mag();
      anchor.normalize();
      
      fuerzaV = PVector.mult(anchor, (-k) * (mod - dist));
      return fuerzaV;
      }
      
      else
         fuerzaV.set(0,0,0);
         
      return fuerzaV;
    }

  
  void display(){
     stroke(255);
     strokeWeight(2);
     
     //2D 
     line(width/2 - (sx*m_DirectDistance/2) - 240,height/2 - (sy*m_DirectDistance/2),width+450, height/2 - (sy*m_DirectDistance/2));
     line(width/2 - (sx*m_DirectDistance/2) - 240,(height+600) - (sy*m_DirectDistance/2),width+450, (height+600) - (sy*m_DirectDistance/2));
     
     line(width/2 - (sx*m_DirectDistance/2) - 240,height/2 - (sy*m_DirectDistance/2),width/2 - (sx*m_DirectDistance/2) - 240, (height+605) - (sy*m_DirectDistance/2));
     line(width+450, height/2 - (sy*m_DirectDistance/2),width+450, (height+605) - (sy*m_DirectDistance/2));
     
     noStroke();
     translate(width/2 - (sx*m_DirectDistance/2),height/2 - (sy*m_DirectDistance/2),0);    
     fill(48,222,242);
     
     //3D
     for(int i=0; i<sx-1; i++){
       beginShape(QUAD_STRIP);
         for(int j=0; j<sy; j++){
          
           PVector p = vert[i][j];
           PVector p1 = vert[i+1][j];
           vertex(p.x, p.y, p.z);
           vertex(p1.x, p1.y, p1.z);
           
         }
       endShape();
     } 
    }

}


