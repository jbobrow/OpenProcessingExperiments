
//import peasy.*;

//PeasyCam cam;
int cs = 40;//Tamaño del lado
int s_x= 80;//Celdas de anchura
int s_y = 80;//Celdas de altura
int tipo = 0;
HeighMap mar;

                           
PImage img;

void setup(){
  size(438,600,P3D);
  mar = new HeighMap(s_x, s_y);
  
  //cam = new PeasyCam(this,width/2 + 100, height/2,100,1800);
  //cam = new PeasyCam(this,100,100,-100,);
  noStroke();
  
  //textureMode(IMAGE);

  
}


void draw(){
  background(255);
  lights();
  camera(80, 200, 5000, 80, -200, 0, 0, 1, 0);
  
  fill(50);
  textSize(100);
  text("C.Mar en Calma / R.Olas Radiales ", -700, 1800);
  text("W.Olas Simples / G.Olas Gerstner ", -700, 2000);
  
  if(tipo == 0){
    fill(50);
    textSize(100);
    text("Mar en Calma", -400, 2200);
  }else if(tipo == 1){
    fill(50);
    textSize(100);
    text("Olas Radiales", -400, 2200);
  }else if(tipo == 2){
    fill(50);
    textSize(100);
    text("Olas Simples", -400, 2200);
  }else if(tipo == 3){
    fill(50);
    textSize(100);
    text("Olas Gerstner", -400, 2200);
  }
  

  mar.update();
  mar.display(); 
}

void keyPressed(){
  
  if(key == 'r'){ //Radial
    tipo = 1;
    mar.vWaves.add(new Wave(random(0.5,2), random(20,40), random(1,2), random(8,15), random(2,4), 0,  new PVector(1600, 1600 ,0)));
    //mar.vWaves.add(new Wave(random(1,3),random(30,45), random(1,2),random(5,12), random(2,5), 0, new PVector(cs*s_x / 2, cs*s_y / 2 ,0)));
  }
  if(key == 'w'){ //Simple wave
    tipo = 2;
    mar.vWaves.add(new Wave(random(1,1.8), random(36,40), random(1,1.8), random(5,8), random(4,5), 1, new PVector(random(0,1), random(0,1),0)));
  }
  if(key == 'g'){ //Gerstner wave
    tipo = 3;
    mar.vWaves.add(new Wave(random(1,2), random(50,70), random(1,2), random(6,15), random(3,5), 2, new PVector(0.036,0.49,0)));
  }
  if(key == 'c'){ //Reiniciar
    tipo = 0;
    mar.vWaves = new ArrayList<Wave>();
    mar = new HeighMap(s_x, s_y);
  }
    
}

class HeighMap {
  
    PVector[][] vert;
    int sx, sy;
    int m_directDistance;
    float t = 0;
    ArrayList<Wave> vWaves = new ArrayList<Wave>();
    
    HeighMap(int sxX, int syY){

      sx = sxX;
      sy = syY;
      vert = new PVector [sx][sy];
      m_directDistance = cs;
      
      for(int x = 0; x < sx; x++)
        for(int y = 0; y < sy; y++)
        {
          vert[x][y] = new PVector(y * m_directDistance, x * m_directDistance, 0);
        }
    }
    

    
    void update(){

      for(int i=0; i<sx; i++){
        for(int j=0; j<sy; j++){
          vert[i][j].z = 0;
          
          for(int k = 0; k < vWaves.size(); k++){
            Wave onda = vWaves.get(k);
            if(onda.tipo == 0)
              vert[i][j].z += onda.OndaRadial(vert[i][j].x,vert[i][j].y, t);
            else if(onda.tipo == 1)
              vert[i][j].z += onda.OndaSimple(vert[i][j].x,vert[i][j].y, t);
            else if(onda.tipo == 2)
              vert[i][j] = onda.OndaGerstner(vert[i][j].x,vert[i][j].y,i,j, t*400);
          }
        }
      }
     t += 0.00007;  
  }
    
   
    void display(){
    //2D 
    translate(-sx * m_directDistance/2, -sy * m_directDistance/2, 0);

    //3D
    //noStroke();
    stroke(0);
    strokeWeight(0.08);
    //fill(16,155,159);
    fill(71,165,247);
    smooth();
    //PImage img = loadImage("surface.jpg");
    
    for(int i=0; i<sx-1; i++){       
        beginShape(QUAD_STRIP);
        //texture(img);
        //textureMode(NORMAL);
        for(int j=0; j<sy-1; j++){
          PVector p = vert[i][j];
          PVector p1 = vert[i+1][j];
          vertex(p.x,p.y,p.z /*p.x/(sx*m_directDistance),p.y/(sy*m_directDistance)*/);
          vertex(p1.x,p1.y,p1.z /*p1.x/(sx*m_directDistance),p1.y/(sy*m_directDistance)*/);          
        }
      endShape();
     }   
    }
  }



class Wave {
  float c;
  float a;
  float w, wP;
  float desfase;
  float l;
  float t;
  float tipo=0;
  PVector x_ini = new PVector(0,0,0);
  float T = 1.8;
  PVector dir = new PVector(5,2);
  float ev1, ev2;

  
  Wave(float c1, float a1, float w1, float l1, float t1, int tipo1, PVector x_0){
    c = c1;
    a = a1;
    w = w1;
    l = l1;
    t = t1;
    tipo = tipo1; 
    x_ini = x_0;
    print("C= "+ c + " A= "+ a +" W= "+ w +" l= "+ l + " t= "+ t + " SRC= " +x_ini+ "\n");
  }
  
  float OndaRadial(float x, float y, float tiempo){ //diapositiva 18
  
    PVector pert = new PVector(x,y,0); //perturbación
    float s = x_ini.dist(pert);
    wP = 2 * PI / l;
    
    //ev1 = a * cos( ( (s/l)+(tiempo/T) ) * 2 * PI);
    ev1 = a * cos (wP * s * tiempo); //ev1 = a * cos ( (s * 2 * PI) / l);
    return ev1;
  
  }
  
  float OndaSimple(float x, float y, float tiempo){ //Articulo developer nvidia(1.2.1)
    
    PVector pert = new PVector(x,y,0); //perturbación
    wP = 2 * PI / l;
    desfase = c * ( (2 * PI) / l );
    float s = x_ini.dot(pert); //Dirección · (x,y)
    
    //W (x,y,t) = A * sin (D · (x,y) * w + (t * desfase) ) -> cambiamos seno por coseno y quitamos desfase
    //ev2 = a * sin ( (s * wP) + (tiempo * desfase)  );
    ev2 = a * cos(wP * s * tiempo);
    return ev2; 
  }
  
  PVector OndaGerstner(float x, float y, int i, int j,float tiempo){ //3.1 Gerstner Waves
      PVector ev3 = new PVector(0,0,0);
    wP= 2 * PI / l;
    desfase = 1;//c * ( (2 * PI) / l );
    //Punto de la malla donde no hay perturbación...
    PVector x0 = new PVector(i*cs, j*cs); //...resultado de multiplicar los coeficientes 'i' y 'j' por el tamaño de la celda
    
    PVector k_dir = new PVector(0,0,0);
    k_dir.set(x_ini);
      
    PVector kN = new PVector(0,0,0);
    kN = PVector.div(k_dir, wP); //según la fórmula, dividimos el vector de onda entre la magnitud

    //x1 = x0 - (kN * a * sin ( (k_dir.dot(x0)) - (w*tiempo) ) ); 
    PVector x1 = PVector.sub(x0, PVector.mult(kN, a * sin(k_dir.dot(x0) - (w * tiempo) + desfase ) ) );//-> vector(x,y)
    
    float y1 = a * cos ( (k_dir.dot(x0)) - (w * tiempo)); //-> escalar de la posicion z
    
    ev3.set(x1.x, x1.y, y1);
    return ev3;
  
  }
  
}


