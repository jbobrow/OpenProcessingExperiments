
float masa = 1.0;

float delta_t = 0.2;

float ks = -1;
float kd = 0.5;

//EULER

PVector p_euler = new PVector(0,0);
PVector v_euler = new PVector(0,0);
PVector f_euler = new PVector(0,0);

//HEUN

PVector p_heun = new PVector(0,0);
PVector v_heun = new PVector(0,0);
PVector vant_heun = new PVector(0,0);
PVector f_heun = new PVector(0,0);

//RK2

PVector p_rk2= new PVector(0,0);
PVector v_rk2=new PVector(0,0);
PVector f_rk2= new PVector(0,0);

PVector gravedad = new PVector(0,9.8);

void setup() {
  size(438,600);
  smooth();
}

void draw() {
  
  background(110);
  
  fill(255,0,0);
  text("EULER",180, 500);
  fill(0,255,0);
  text("HEUN",180, 520);
  fill(0,0,255);
  text("RUNGE-KUTTA 2",180, 540);
  
  PVector f1 = new PVector(0,0);
  PVector f1_total = new PVector(0,0);
  PVector f2 = new PVector(0,0);
  PVector f2_total = new PVector(0,0);
  PVector f3 = new PVector(0,0);
  PVector f3_total = new PVector(0,0);
  
  float longitud = 50;
  float peso = 0.0;
  
  peso = masa*gravedad.y;
  
  f1.y = ks*(p_euler.y-longitud)-kd*v_euler.y;
  f1_total.y = f1.y/peso;
  
  f2.y = ks*(p_heun.y-longitud)-kd*v_heun.y;
  f2_total.y = f2.y/peso;
  
  f3.y = ks*(p_rk2.y-longitud)-kd*v_rk2.y;
  f3_total.y = f3.y/peso; 
  
  //EULER
  f_euler.y = f1_total.y;
  v_euler.y = v_euler.y + f_euler.y * delta_t;
  p_euler.y = p_euler.y + v_euler.y * delta_t;
  
  //HEUN
  f_heun.y = f2_total.y;
  v_heun.y = v_heun.y + f_heun.y * delta_t;
  p_heun.y = p_heun.y + ((v_heun.y+vant_heun.y)/2)*delta_t;
  vant_heun.y = v_heun.y; 
  
  //RK2
  f_rk2.y = f3_total.y;
  v_rk2.y = v_rk2.y + f_rk2.y*delta_t;
  p_rk2.y = p_rk2.y + v_rk2.y*delta_t;
  
  
  
  pushMatrix();
  line(0,200, 700, 200);
  popMatrix();
  
  pushMatrix();
  line(110,200,110,335+p_euler.y);
  popMatrix();
  
  pushMatrix();
  translate(0,p_euler.y);
  fill(255,0,0,80);
  ellipse(110,350,30,30);
  popMatrix();
  
  pushMatrix();
  line(220,200,220,335+p_heun.y);
  popMatrix();
  
  pushMatrix();
  translate(0,p_heun.y);
  fill(0,255,0,80);
  ellipse(220,350,30,30);
  popMatrix();
  
  pushMatrix();
  line(330,200,330,335+p_rk2.y);
  popMatrix();
  
  pushMatrix();
  translate(0,p_rk2.y);
  fill(0,0,255,80);
  ellipse(330,350,30,30);
  popMatrix();
  
  
}
void keyPressed(){
  if(key == ' '){
      ///EULER
      f_euler.set(0,0);
      p_euler.set(0,0);
      v_euler.set(0,0);
      
      ///HEUN
      f_heun.set(0,0);   
      p_heun.set(0,0);
      v_heun.set(0,0);
      vant_heun.set(0,0);
      
      ///RK2
      f_rk2.set(0,0);
      p_rk2.set(0,0);
      v_rk2.set(0,0);
  
    }else if(key == 'e'){
      ///EULER
      f_euler.set(0,0);
      p_euler.set(0,0);
      v_euler.set(0,0);
    }else if(key == 'h'){
      ///HEUN
      
      f_heun.set(0,0);   
      p_heun.set(0,0);
      v_heun.set(0,0);
      vant_heun.set(0,0);
    }else if(key == 'r'){
       ///RK2
      
      f_rk2.set(0,0);
      p_rk2.set(0,0);
      v_rk2.set(0,0);
    }
}




