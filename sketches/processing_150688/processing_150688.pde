
//import peasy.*;

//PeasyCam cam;
Malla tela ;
float dt = 0.2;
PVector gravity = new PVector(0,3.8,0);
int cs = 40;
int s_x = 10;
int s_y = 10;
int modelo = 1;

void setup(){
  
   size(438,600, P3D);
   tela = new Malla(s_y, s_y, cs); 

   //cam = new PeasyCam(this,width/2 -(s_x*cs/2), height -(s_y*cs/2),0,1800);
   
}
 
 void draw(){ 
   background(255); 
   lights();
   camera(200, 400, 1300, 200, 400, 0, 0, 1, 0);
   
   tela.run();
   
   pushMatrix();
   fill(50);
   textSize(35);
   text("1.Structured / 2.Bend / 3.Shear / 4.Structured+Bend+Shear ", -300, -90);
   popMatrix();
   
   if(modelo==1){
     fill(50);
     textSize(40);
     text("Modelo: Structured ",0, -35 );
   }
   else if(modelo==2){
     fill(50);
     textSize(40);
     text("Modelo: Bend ", 30, -35);
   }
   else if(modelo==3){
     fill(50);
     textSize(40);
     text("Modelo: Shear ", 30, -35);
   }
   else if(modelo==4){
     fill(50);
     textSize(40);
     text("Structured+Bend+Shear", -40, -35);
   }
 }
 
 void keyPressed(){
  
  if(key == '1') //Structured
    modelo = 1;
    
  if(key == '2') //Bend
    modelo = 2;
  
  if(key == '3') //Shear
    modelo = 3;
  
  if(key == '4') //Shear
    modelo = 4;

}

class Malla{
    
    PVector gravity = new PVector(0,4.0);
    int m_DirectDistance = cs;
    int m_AslantDistance = (int) sqrt(2.0)*m_DirectDistance;
    float k = 0.3;
    float m_Damping = 0.2;
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
    
      
    float masa = 2.0;
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
      aire.set(0.22+random(10,20)*0.1,  0.1+random(-20,10)*0.1, 0.012+random(10,40)*0.01);
      
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
      /*vert[0][0].set(0,0,0);
      vert[0][sx-1].set((sx-1)*m_DirectDistance,0,0);
      vert[sy-1][0].set(0,0, sx*m_DirectDistance);
      vert[sy-1][sx-1].set((sx-1)*m_DirectDistance,0, sx*m_DirectDistance);*/
    }
    
    PVector getForce(int vertX, int vertY, PVector verticeV,int dist, float k){
      PVector fuerzaV = new PVector (0,0,0);
      PVector vertVecino = new PVector (0,0,0);//Vertice Vecino
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
    
    /*PVector getForce(int Vx, int Vy, PVector Vert,int distance, float ks){
      PVector force = new PVector (0,0,0);//Vector de fuerzas
      PVector vertV = new PVector (0,0,0);//Vertice Vecino
      PVector princ = new PVector (0,0,0);//Vértice principal q suma fuerzas
      PVector d = new PVector (0,0,0);
      PVector x_sup = new PVector(0,0,0);
      PVector x_tot = new PVector(0,0,0);
      float d_mod = 0;
      float dif = 0;
      
      
      if(Vx >= 0 && Vx < sx && Vy >= 0 && Vy < sy){
        vertV.set(vert[Vx][Vy]);
        princ.set(Vert);
        //Distancia entre las dos particulas cuando no estan en reposo
        d = PVector.sub(princ, vertV);
        d_mod = d.mag();
        //Sacamos la diferencia entre no reposo y reposo
        dif = d_mod - distance;
        x_sup = PVector.mult(d,dif);
        x_tot = PVector.div(x_sup,d_mod);
        force = PVector.mult(x_tot, -ks);
      }
      
      else 
        force.set(0,0,0);   
      
      return force;
   }*/
  
  void display(){
     noStroke();
     
     //2D 
     //translate(width/2 - (sx*m_DirectDistance/2),height/2 - (sy*m_DirectDistance/2),0);    
     fill(0,0,255);
     
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


