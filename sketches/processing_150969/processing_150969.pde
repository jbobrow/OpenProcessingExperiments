
float delta_t = 0.1;
float masa = 1.0;

PVector gravedad = new PVector(0,9.8);
PVector aceleracion = new PVector(0,0);

PVector p_euler = new PVector(0, 0);
PVector p_heun = new PVector(0,0);
PVector p_RK2 = new PVector(0,0);

PVector v_euler = new PVector(18, -100);
PVector v_heun = new PVector(18, -100);
PVector vant_heun = new PVector(0,0);
PVector v_RK2 = new PVector(18, -100);


void setup() {
  size(438,600);
  background(110);
  smooth();
  Aceleracion();
} 

void Aceleracion() {
  aceleracion.x = gravedad.x*masa;
  aceleracion.y = gravedad.y*masa;
}

void draw() {
  
  v_euler.x = v_euler.x+aceleracion.x*delta_t;
  v_euler.y = v_euler.y+aceleracion.y*delta_t;
  
  p_euler.x = p_euler.x+v_euler.x*delta_t;
  p_euler.y = p_euler.y+v_euler.y*delta_t;
  
  pushMatrix();
  fill(0,0,255,80);
  text("EULER",width/2-20,height-60);
  translate(p_euler.x, p_euler.y);
  ellipse( 20, height - 20 , 15,15);
  popMatrix();
  
  v_heun.x = v_heun.x+aceleracion.x*delta_t;
  v_heun.y = v_heun.y+aceleracion.y*delta_t;
  
  p_heun.x = p_heun.x+((v_heun.x+vant_heun.x)/2)*delta_t;
  p_heun.y = p_heun.y+((v_heun.y+vant_heun.y)/2)*delta_t;
  
  vant_heun.x = v_heun.x;
  vant_heun.y = v_heun.y;
  
  pushMatrix();
  fill(255,0,0,80);
  text("HEUN",width/2-20,height-40);
  translate(20+p_heun.x, p_heun.y);
  ellipse( 20, height - 20 , 15,15);
  popMatrix();
  
  v_RK2.x = v_RK2.x+aceleracion.x*delta_t;
  v_RK2.y = v_RK2.y+aceleracion.y*delta_t;
  
  p_RK2.x = p_RK2.x+v_RK2.x*delta_t;
  p_RK2.y = p_RK2.y+v_RK2.y*delta_t;
  
  pushMatrix();
  fill(0,255,0,80);
  text("RK2",width/2-20,height-20);
  translate(40+p_RK2.x, p_RK2.y);
  ellipse( 20, height - 20 , 15,15);
  popMatrix();
}

void keyPressed(){
  if(key == ' '){
    background(110);
    p_euler.set(0, 0);
    p_heun.set(0,0);
    p_RK2.set(0,0);

    v_euler.set(13.5, -100);
    v_heun.set(13.5, -100);
    vant_heun.set(0,0);
    v_RK2.set(13.5, -100);
  }
}
  
  
  



