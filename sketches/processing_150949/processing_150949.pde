
float masa = 1.0;
float delta_t = 0.1;
float cte = 0.1;

PVector gravedad = new PVector(0,9.8);

///EULER
PVector f_euler = new PVector(0,0);
PVector acc_euler = new PVector(0,0);
PVector roz_euler= new PVector(0,0);
PVector sum_euler= new PVector(0,0);

PVector p_euler = new PVector(0,0);
PVector v_euler = new PVector(-50,-80);

///HEUN

PVector f_heun = new PVector(0,0);
PVector acc_heun = new PVector(0,0);
PVector roz_heun= new PVector(0,0);
PVector sum_heun= new PVector(0,0);

PVector p_heun = new PVector(0,0);
PVector v_heun = new PVector(-50,-80);
PVector vant_heun = new PVector(0,0);

///RK2

PVector f_rk2 = new PVector(0,0);
PVector acc_rk2 = new PVector(0,0);
PVector roz_rk2= new PVector(0,0);
PVector sum_rk2= new PVector(0,0);

PVector p_rk2 = new PVector(0,0);
PVector v_rk2 = new PVector(-50,-80);

float angulo = 40;
PVector fuerzaTan = new PVector(0,0);



void setup() {
  size(438,600);
  smooth();  
}

void CalculosFuerzas() {
  fuerzaTan.x = masa*gravedad.x*sin(radians(angulo));
  
  ///EULER
  roz_euler.x = -cte * acc_euler.x;
  sum_euler.x= fuerzaTan.x+roz_euler.x;
  f_euler.x = sum_euler.x/masa;
  
  //HEUN
  roz_heun.x = -cte * acc_heun.x;
  sum_heun.x= fuerzaTan.x+roz_heun.x;
  f_heun.x = sum_heun.x/masa;
  
  //RK2
  roz_rk2.x = -cte * acc_rk2.x;
  sum_rk2.x= fuerzaTan.x+roz_rk2.x;
  f_rk2.x = sum_rk2.x/masa;
}

void draw(){
  
  background(110);
  
  fill(255,0,0);
  text("EULER",width-150, height-60);
  fill(0,255,0);
  text("HEUN",width-150, height-80);
  fill(0,0,255);
  text("RUNGE-KUTTA 2",width-150, height-100);
  
  CalculosFuerzas();
  
  //EULER
  v_euler.x = v_euler.x+f_euler.x*delta_t;
  p_euler.x = p_euler.x+v_euler.x*delta_t;
  
  acc_euler.x = v_euler.x;
 
  //HEUN
  v_heun.x = v_heun.x+f_heun.x*delta_t;
  p_heun.x = p_heun.x+((v_heun.x + vant_heun.x)/2)*delta_t;
  vant_heun.x = v_heun.x;
  
  acc_heun.x = v_heun.x;
  
  //RK2
  v_rk2.x = v_rk2.x+f_rk2.x*delta_t;
  p_rk2.x = p_rk2.x+v_rk2.x*delta_t;
  
  acc_rk2.x = v_rk2.x;
  
  translate(300,300);
  rotate(radians(-angulo));
  stroke(0,0,0);
  strokeWeight(5);
  line(-500,0,500,0);
  
  //Bola roja Euler
  pushMatrix();    
  translate(350,27);
  translate(p_euler.x,0);
  fill(255,0,0,100);
  noStroke();
  ellipse(0,-40,20,20);
  popMatrix();
  
  //Bola verde Heun
  pushMatrix();    
  translate(350,27);
  translate(p_heun.x,0);
  fill(0,255,0, 100);
  noStroke();
  ellipse(0,-40,20,20);
  popMatrix();
  
  //Bola azul RK2
  pushMatrix();    
  translate(350,27);
  translate(p_rk2.x,0);
  fill(0,0,255, 100);
  noStroke();
  ellipse(0,-40,20,20);
  popMatrix();
}

void keyPressed(){
  
  if(key == ' '){
    ///EULER
    f_euler.set(0,0);
    acc_euler.set(0,0);
    roz_euler.set(0,0);
    sum_euler.set(0,0);
    
    p_euler.set(0,0);
    v_euler.set(-50,-80);
    
    ///HEUN
    
    f_heun.set(0,0);
    acc_heun.set(0,0);
    roz_heun.set(0,0);
    sum_heun.set(0,0);
    
    p_heun.set(0,0);
    v_heun.set(-50,-80);
    vant_heun.set(0,0);
    
    ///RK2
    
    f_rk2.set(0,0);
    acc_rk2.set(0,0);
    roz_rk2.set(0,0);
    sum_rk2.set(0,0);
    
    p_rk2.set(0,0);
    v_rk2.set(-50,-80);

  }else if(key == 'e'){
    ///EULER
    f_euler.set(0,0);
    acc_euler.set(0,0);
    roz_euler.set(0,0);
    sum_euler.set(0,0);
    
    p_euler.set(0,0);
    v_euler.set(-50,-80);
  }else if(key == 'h'){
    ///HEUN
    
    f_heun.set(0,0);
    acc_heun.set(0,0);
    roz_heun.set(0,0);
    sum_heun.set(0,0);
    
    p_heun.set(0,0);
    v_heun.set(-50,-80);
    vant_heun.set(0,0);
  }else if(key == 'r'){
    ///RK2
    
    f_rk2.set(0,0);
    acc_rk2.set(0,0);
    roz_rk2.set(0,0);
    sum_rk2.set(0,0);
    
    p_rk2.set(0,0);
    v_rk2.set(-50,-80);
  }
  
}
  


