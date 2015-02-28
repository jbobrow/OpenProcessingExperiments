

/**TORNADO2
 *
 *par Jacques Maire
 *
 *fait le 13 mai 2014
 **/
float temps;
float   rayon=880;
float  plus=720; 
Bande bande;




void setup() {
  size(600, 600, P3D);
  bande=new Bande();
}



void draw() {
  temps=0.002*millis();
  background(255);
  camera(width/2.0,0, -height / tan(PI/3.0), width/2.0, height*0.7, 200, 0, 1, 0);
  perspective(PI/3, width/height, 50, 4500);
   
     
  pushMatrix();
  noStroke();
  translate(width/2, 800, 600);
  rotateX(0.8+(mouseY-height/2)/75.0);
  rotateY(0.5+(mouseX-width/2)/75.0); 
  pointLight(255, 250, 126, 380,380,-300);
  lights();
  directionalLight(255,255,255,-200,-300,-400);
  bande.draw();
  for (int i=0;i<6;i++) {
    float t=TWO_PI/6*i;
    pushMatrix();
    translate(360*cos(temps+t), 360*sin(temps+t), 0);
    fill(255, 255, 180);
    sphere(80);
    popMatrix();
  }
  for (int i=0;i<36;i++) {
    pushMatrix(); 
    rotateZ(temps+i*TWO_PI/72.0);
    translate(rayon, 0, 0);
    rotateY(temps*0.25+i*TWO_PI/36.0);
    translate(rayon, 0, 0);
    fill( 255, 240, 160,90);
    sphere(30);
    popMatrix();
  }
  popMatrix();
}


void repere(float ll) {
  pushMatrix();
  noStroke();
  translate(ll, 0, 0);
  fill(255, 0, 0);
  box(2*ll, 50, 50);
  translate(-ll, ll, 0);
  fill(0, 255, 0);
  box(50, 2*ll, 50);
  translate(0, -ll, ll);
  fill(0, 0, 255);
  box(50, 50, 2*ll);
  popMatrix();
}
//---------------------------------------------------



//-------------------------------------------------------
PVector coorabs(float x, float y, float z) {
  pushMatrix();
  translate(x, y, z);
  float xa=modelX(0, 0, 0);
  float ya=modelY(0, 0, 0);
  float za=modelZ(0, 0, 0);
  popMatrix();
  return new PVector(xa, ya, za);
}




class Bande {

  int nbnoeud=73;
  int nbdiv=18;
  float angle=TWO_PI/72;
  PVector[][] huits, couleurs;
 
  Bande() {
    huits=new PVector[nbdiv][nbnoeud];
   couleurs=new PVector[nbdiv][nbnoeud];
    remplir();
  }

  void remplir() { 
    for (int ic=0;ic<nbdiv;ic++) {
      float  inc=PI/8.0*ic;
     // float inc1=PI/8.0+inc;
      for (int i=0;i<nbnoeud;i++) {
        pushMatrix();
        rotateZ (angle*i+inc+millis()*0.0015);
        translate(rayon, 0, 0);
        rotateY (inc/18+angle*i);
        huits[ic][i]= coorabs(plus, 0, 0);
        popMatrix();
      }
    }
  
       for (int ic=0;ic<nbdiv-1;ic++) {
      for (int i=0;i<nbnoeud-1;i++) {
       // fill(255*(ic%2));//200+25*(ic%2), 150+35*((ic+1)%2), 180+15*(ic%2));
    PVector u=PVector.sub( huits[ic][i], huits[ic][i+1]);
     PVector v=PVector.sub( huits[ic][i], huits[ic+1][i+1]); 
  
     if(u.mag()<0.0001 || v.mag()<0.0001 ) {couleurs[ic][i]=new PVector(0,0,0); }
     else {
     u.normalize();
     v.normalize();
      PVector w=u.cross(v);
     couleurs[ic][i]=PVector.mult(w,abs(255)*2.0);
     }
        
      }
    } 
    
    
  }
  void draw() {
    noStroke();
//directionalLight(255,180,255,1,1,1);
   //spotLight(251, 202, 126, 80, 20, 40, -1, 0, 0, PI/2, 200);
    // pointLight(200, 250, 126, 30,30,30);
    for (int ic=0;ic<nbdiv-1;ic++) {
      for (int i=0;i<nbnoeud-1;i++) {
      
    
        beginShape(TRIANGLES);
        fill(couleurs[ic][i].x,couleurs[ic][i].y,couleurs[ic][i].z);
        vertex( huits[ic][i].x, huits[ic][i].y, huits[ic][i].z);
        vertex( huits[ic][i+1].x, huits[ic][i+1].y, huits[ic][i+1].z);
        vertex( huits[ic+1][i+1].x, huits[ic+1][i+1].y, huits[ic+1][i+1].z);
    
        vertex( huits[ic][i].x, huits[ic][i].y, huits[ic][i].z);
        vertex( huits[ic+1][i+1].x, huits[ic+1][i+1].y, huits[ic+1][i+1].z);
        vertex( huits[ic+1][i].x, huits[ic+1][i].y, huits[ic+1][i].z);
        endShape();
      }
    }
  }
}
//------------------------------------------------------------
// Quat class
//------------------------------------------------------------
static  class Quat
{
  float w, x, y, z;

 public Quat()
  {
    reset();
  }

 public  Quat(float w, float x, float y, float z)
  {
    this.w = w;
    this.x = x;
    this.y = y;
    this.z = z;
  }
   public Quat(float w, PVector v)
  {
    this.w = w;
    this.x =v. x;
    this.y = v.y;
    this.z = v.z;
  }
  Quat(Quat q)
  {
    set(q);
  }

 public  void reset()
  {
    w = 1.0f;
    x = 0.0f;
    y = 0.0f;
    z = 0.0f;
  }

  public void set(float w, PVector v)
  {
    this.w = w;
    x = v.x;
    y = v.y;
    z = v.z;
  }

  public void set(Quat q)
  {
    w = q.w;
    x = q.x;
    y = q.y;
    z = q.z;
  }
public float norme(){
  return (float)Math.sqrt(x * x + y * y + z * z + w * w);
}

 public  Quat normalize()
  {
    float square = x * x + y * y + z * z + w * w;
    float dist = (square > 0.0f) ? (1.0f / (float) Math.sqrt(square)) : 1.0f;

    x *= dist;
    y *= dist;
    z *= dist;
    w *= dist;
    return this;
  }
  public  Quat normalize(float c)
   {
     float square = x * x + y * y + z * z + w * w;
     float dist = (square > 0.0f) ? (c / (float) Math.sqrt(square)) : c;
  
     x *= dist;
     y *= dist;
     z *= dist;
     w *= dist;
     return this;
   }
 public static Quat mul(Quat q1, Quat q2)
  {
    Quat res = new Quat();
    res.w = q1.w * q2.w - q1.x * q2.x - q1.y * q2.y - q1.z * q2.z;
    res.x = q1.w * q2.x + q1.x * q2.w + q1.y * q2.z - q1.z * q2.y;
    res.y = q1.w * q2.y + q1.y * q2.w + q1.z * q2.x - q1.x * q2.z;
    res.z = q1.w * q2.z + q1.z * q2.w + q1.x * q2.y - q1.y * q2.x;
    return res;
  }
 public static Quat comb(Quat q1,float r1, Quat q2,float r2)
   {
     Quat res = new Quat();
     res.w = q1.w *r1 +  q2.w*r2;
     res.x = q1.x * r1+  q2.x * r2;
     res.y = q1.y * r1+  q2.y * r2;
     res.z = q1.z * r1+  q2.z * r2;
     return res;
   }
   public Quat ajouter(Quat q1,float r1)
     {
       Quat res = new Quat();
       res.w = q1.w *r1;
       res.x = q1.x * r1;
       res.y = q1.y * r1;
       res.z = q1.z * r1;
       return res;
     }  
   
     public   float[] getValue()
 {  
   float[] res = new float[4];
   float nq=norme();
   res[0] = (float) Math.acos(w/nq)* 2.0f;
     
   float nV= (float) Math.sqrt(x*x+y*y+z*z);
  if ( nV< 0.00001f*nq)
   {
  res[1] = x ;
  res[2] = y;
  res[3] = z ;   
   }else{
   res[1] = x /nV;
   res[2] = y/nV ;
   res[3] = z/nV;  }
   return res;
 }
 
 public   Quat conjugue(){
  return new Quat(w,-x,-y,-z);
}
public  Quat oppose(){
  return new Quat(-w,-x,-y,-z);
}
public Quat copie(){
  return new Quat(w,x,y,z);
  }
  public Quat copieNorme(){
    Quat res=new Quat(w,x,y,z);
    res.normalize();
    return res;
    }  
  public PVector tourner(PVector v){
  Quat qv=new Quat(0.0f,v.x,v.y,v.z);
  Quat qc=this.conjugue();
  Quat q1=Quat.mul(qv,qc);  
  Quat q= Quat.mul(this,q1);
  return new PVector(q.x,q.y,q.z);  
  
}
public static Quat slerp(Quat d, Quat a,float t){
  d.normalize();
  a.normalize();
  float angle=(float)Math.acos(d.x*a.x+d.y*a.y+d.z*a.z);
  float sina=(float)Math.sin(angle);
  float rd=(float)Math.sin(angle*(1-t))/sina;
  float ra=(float)Math.sin(angle*t)/sina;
  Quat res= Quat.comb(d,rd,a,ra);

  return res;

}
static Quat slerp1(Quat d, Quat a,float tt){
  d.normalize();
  a.normalize();
  float t=(tt-1)*(tt-1)*(tt-1)+1;
  float angle=(float)Math.acos(d.x*a.x+d.y*a.y+d.z*a.z);
  float sina=(float)Math.sin(angle);
  float rd=(float)Math.sin(angle*(1-t))/sina;
  float ra=(float)Math.sin(angle*t)/sina;
  Quat res= Quat.comb(d,rd,a,ra);

  return res;

}
public PVector axe(){
return new PVector(x,y,z);  
}



public static Quat euler2quat(float psi,float theta,float phi){
  /* psi      :angle de la rotation autour de 0z    :precession
   * theta   :angle de la rotation autour de 0x1  :nutation
   * phi      :angle de la rotation autoue de 0z2  : rotation propre
   */
    float w,x,y,z,th,psiMphi,psiPphi;
    th=theta/2;
    psiMphi=(psi-phi)/2;
    psiPphi=(psi+phi)/2;    
    w=(float)Math.cos(th)*(float)Math.cos(psiPphi);
    x=(float)Math.sin(th)*(float)Math.cos(psiMphi);
    y=(float)Math.sin(th)*(float)Math.sin(psiMphi);
    z=(float)Math.cos(th)*(float)Math.sin(psiPphi);    
  return new Quat(w,x,y,z);
}

}


