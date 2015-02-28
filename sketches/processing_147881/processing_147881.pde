
float si=0.866f,co=0.5f;
  int tempok=0;
 
  Kiosque kiosk;
void setup(){
  size(600,600,P3D);
  
  rectMode(CENTER);
  kiosk=new Kiosque(3200,2300);
}
void draw(){
  tempok++;
 background(255);
  camera(width/2.0, -height/2.0, height / tan(PI/3.0), width/2.0, height/3.0,2000, 0, 1, 0);
 perspective(PI/3,width/height,500,10000);
  pushMatrix();
  noStroke();
  translate(width/2,3000,6000);
  rotateX(-0.3f+(mouseY-height/2)/600.0f);
  rotateY(3.147f+(mouseX-width/2)/150.0f);  

  beginShape();
  fill(65,150,40);
  vertex(-4000,10,-7000);fill(85,250,70);
  vertex(-4000,10,4000);fill(85,150,100);
  vertex(4000,10,4000);fill(95,250,100);  
  vertex(4000,10,-7000);          
  endShape();
  pushMatrix();
  rotateY(PI/4);
        beginShape();
  fill(205,200,160);  
  vertex(-2000,0,-2000);
  vertex(-2000,0,2000);  fill(180,200,120);
  vertex(2000,0,2000);  
  vertex(2000,0,-2000);          
  endShape();
  popMatrix();
  kiosk.dessiner();
  popMatrix();
  repere(400);
}
void mousePressed(){tempok=0;kiosk=new Kiosque(3200,2300);
}
void repere(float l){
         fill(255,0,0);
         box(l,50,50);
         fill(0,255,0);    
         box(50,l,50);
         fill(0,0,255);   
         box(50,50,l);          
    }

public class Charpente extends Interpolation{
  Cylindre tr;
  float la,cote,aaa,longe;
  public Charpente(float longue,float dcentre,float ho,float angle,float diedre,float cot){
    super(
    new Vecteur(0,-9000,5000),
    new Vecteur(dcentre*cos(angle),ho,dcentre*sin(angle)),
    Quat.euler2quat(PI/2,-angle,-PI/2+diedre)
    );
  cote=cot;
  la=sqrt(longue*longue+cote*tan(PI/8)*cote*tan(PI/8)/4);
        longe=longue;
  tr=new Cylindre(80,la);
  aaa=atan2(tan(PI/8),1/cos(diedre));  
  }
  void dessiner(){
    tr.set(100,la);
    pushMatrix();
    translate(0,0,cote*tan(PI/8)/4);
    rotateY(-aaa);
    tr.dessinerX();
    popMatrix();
    pushMatrix();
    translate(0,0,-cote*tan(PI/8)/4);
    rotateY(aaa);
    tr.dessinerX();
    popMatrix();
      pushMatrix();
                translate(-longe/2-50,0,0);
                rotateZ(0.57f);
                 translate(-150,0,0);  
                tr.set(50,350);  tr.dessinerX();
      popMatrix();
    for(int i=7;i>=0;i--){
    
    pushMatrix();
      tr.set(60,i*140+150);
      translate(la*(-4+i)/10+150,0,0);
      tr.dessinerZ();
    popMatrix();
    }
    
  }
  void actualiser(){
    super.actualiser();
      pushMatrix();
        translate(pt.x,pt.y,pt.z);
        appliqueQuat(Quat.slerp(q0,qb,super.temps));
        //afficherRepere(1000);fill(255,0,0);
        dessiner();
      popMatrix();
  }
}

public class Croisillon {
  Cylindre tr;
  public Croisillon(){  
  tr=new Cylindre(45,270);
  }  
  void dessiner(){
    pushMatrix();
    rotateZ(PI/4);
    tr.dessinerX();
    rotateZ(PI/2);
    tr.dessinerX();
    popMatrix();
  }

}
//*****************************************
public class Cylindre {
float d,h,d2,h2,dc,ds;
public Cylindre(float d,float h){
  set(d,h);
}
void set(float d,float h){
    this.d=d;
    this.h=h;
    d2=d/2;
    h2=h/2;
    ds=d2*si;
    dc=d2*co;  
}
void dessinerY(){
  rotateZ(PI/2);
  dessinerX();
}
void dessinerZ(){
  rotateY(PI/2);
  dessinerX();
}
void dessinerX(){  
  noStroke();

  beginShape(QUADS);
  fill(155,150,100);

  vertex(h2,d2,0);
  vertex(h2,dc,ds);
  vertex(-h2,dc,ds);  
  vertex(-h2,d2,0);
  endShape();
  beginShape(QUADS);  
  fill(250,85,80);
  
  vertex(h2,dc,ds);
  vertex(h2,-dc,ds);
  vertex(-h2,-dc,ds);  
  vertex(-h2,dc,ds);  
  endShape();
  beginShape(QUADS);  
  fill(85,30,50);
    
  vertex(h2,-dc,ds);
  vertex(h2,-d2,0);
  vertex(-h2,-d2,0);  
  vertex(-h2,-dc,ds);  
  endShape();
  beginShape(QUADS);    
  fill(100,100,25);
    
  vertex(h2,-d2,0);
  vertex(h2,-dc,-ds);
  vertex(-h2,-dc,-ds);  
  vertex(-h2,-d2,0);
  endShape();
  beginShape(QUADS);    
  fill(255,95,95);
   
  vertex(h2,-dc,-ds);
  vertex(h2,dc,-ds);
  vertex(-h2,dc,-ds);  
  vertex(-h2,-dc,-ds);
  endShape();
  beginShape(QUADS);      
  fill(200,200,120);
    
  vertex(h2,d2,0);
  vertex(h2,dc,-ds);
  vertex(-h2,dc,-ds);  
  vertex(-h2,d2,0);          
  endShape();      
  }
}
//***********************************************
  class Interpolation{
        float temps=0;
        Vecteur p0,p1,pt,dv;
        Quat q0,qb,dq;
       
      
    public  Interpolation(Vecteur pos,Vecteur but,Quat qb){
      this.p0=pos;
      pt=new Vecteur(0,0,0);
      p1=but;
      dv=p1.ajouter(p0,-1);
      this.qb=qb;
      q0=(new Quat(random(-25,25),random(-25,25),random(-25,25),random(-25,25))).normalize();
      
    }
  
    void actualiser(){
      temps+=0.015;    
      if(temps<1){      
        pt=p0.ajouter(dv,temps);        
      }else{
        temps=1;
        pt=p1.cloner();
      }  
    }

  
    void appliqueQuat(Quat q){
         float[] ro=q.getValue();
         rotate(ro[0],ro[1],ro[2],ro[3]);
      }

    

  }
public class Kiosque{
  float cote,haut,dcote,trav,dint,diedr;
  Interpolation[] inter;
    
  public Kiosque(float cote,float haut){
    this.cote=cote;
    this.haut=haut;
    dcote=550;
    diedr=PI/6f;
    trav=cote-2.0f*dcote;
    dint=(cote-dcote)*sqrt(0.5f);
    inter= new Interpolation[20];  
    for(int i=0;i<4;i++) {
      inter[i]=new Panneau(dcote*sqrt(2),haut,PI*i/2,dint);
      inter[i+4]=new Traverse(trav,cote/2,-haut+60,PI*i/2+PI/4);      
      inter[i+8]=new SupportToit(cote*sin(PI/8)+200,cote/2,-haut-20,PI*i/2);
      inter[i+12]=new Charpente(cote/(2*cos(diedr)),cote/4,-haut-cote/4*tan(diedr),PI*i/2,diedr,cote);
      inter[i+16]=new Charpente(cote/(2*cos(diedr)),cote/4,-haut-cote/4*tan(diedr),PI*i/2+PI/4,diedr,cote);    
    }
      
  }
  void dessiner(){
    float it=min(19,round(tempok/60));
    for(int i=0;i<=it;i++){      
        pushMatrix();
        inter[i].actualiser();
        popMatrix();      
    }
  }
}

public class Panneau extends Interpolation{
    Croisillon crx;
    Cylindre p1,p2,p3,t1,t2;
    float large,haut;

  public Panneau(float large,float haut,float angle,float dint){
    super(
    new Vecteur(0,random(-8000,-7000),5000),
    new Vecteur(dint*cos(angle),0,dint*sin(angle)),
    new Quat(cos(-angle/2-PI/4),0,sin(-angle/2-PI/4),0));
    
    this.large=large;
    this.haut=haut;
    p1=new Cylindre(120,haut);
    p2=new Cylindre(120,haut-300);
    t1=new Cylindre(85,large);
    crx=new Croisillon();
  }
public void actualiser(){
  super.actualiser();
  pushMatrix();
    translate(pt.x,pt.y,pt.z);
    appliqueQuat(Quat.slerp(q0,qb,super.temps));
    //afficherRepere(1000);fill(255,0,0);
    dessiner();
    
  popMatrix();
 
}
public void dessiner(){


  pushMatrix();
  translate(0,-p2.h2,0);
  p2.dessinerY();
  popMatrix();
  pushMatrix();
  translate(-large/2,-p1.h2,0);
  p1.dessinerY();
  popMatrix();
  pushMatrix();
  translate(large/2,-p1.h2,0);
  p1.dessinerY();
  popMatrix();  
  pushMatrix();
  translate(0,-haut+320,0);
  t1.dessinerX();
  translate(0,-280,0);
  t1.dessinerX();
  t1.set(130,large+150);
  translate(0,-70,-50);
  t1.dessinerX();
  translate(0,-70,-50);
  t1.dessinerX();
  popMatrix();  
  translate(-large/2+180,-haut+180,0);
  for(int i=0;i<3;i++){
    crx.dessiner();
    translate(200,0,0);
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
   public Quat(float w, Vecteur v)
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

  public void set(float w, Vecteur v)
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
  public Vecteur tourner(Vecteur v){
  Quat qv=new Quat(0.0f,v.x,v.y,v.z);
  Quat qc=this.conjugue();
  Quat q1=Quat.mul(qv,qc);  
  Quat q= Quat.mul(this,q1);
  return new Vecteur(q.x,q.y,q.z);  
  
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
public Vecteur axe(){
return new Vecteur(x,y,z);  
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

public class SupportToit extends Interpolation{
  Cylindre tr;
  float la;
  public SupportToit(float longue,float dcentre,float ho,float angle){
    super(
    new Vecteur(0,-9000,5000),
    new Vecteur(dcentre*cos(angle),ho,dcentre*sin(angle)),
    new Quat(cos(-angle/2-PI/4),0,sin(-angle/2-PI/4),0));
    
  la=longue;
  tr=new Cylindre(80,la);  
  }
  void dessiner(){
    tr.dessinerX();
  }
  void actualiser(){
    super.actualiser();
      pushMatrix();
        translate(pt.x,pt.y,pt.z);
        appliqueQuat(Quat.slerp(q0,qb,super.temps));
        //afficherRepere(1000);fill(255,0,0);
        dessiner();
      popMatrix();
  }
}



public class Traverse extends Interpolation{
  Cylindre tr;
  Croisillon crx;
  float la;
  public Traverse(float longue,float dcentre,float ho,float angle){
    super(
    new Vecteur(0,random(-8000,-7000),random(2500,3000)),
    new Vecteur(dcentre*cos(angle),ho,dcentre*sin(angle)),
    new Quat(cos(-angle/2-PI/4),0,sin(-angle/2-PI/4),0)
    );
  la=longue;
  tr=new Cylindre(80,la);  
  crx=new Croisillon();
  }
  void dessiner(){
    pushMatrix();
    tr.dessinerX();
    translate(0,260,0);
    tr.dessinerX();
    tr.set(130,la+150);
    translate(0,-330,-50);
    tr.dessinerX();
    translate(0,-70,-50);
    tr.dessinerX();
    popMatrix();
    translate(-la/2+180,130,0);
    for(int i=0;i<10;i++){
      crx.dessiner();
      translate(200,0,0);
    }
  }
  void actualiser(){
    super.actualiser();
      pushMatrix();
        translate(pt.x,pt.y,pt.z);
        appliqueQuat(Quat.slerp(q0,qb,super.temps));
        //afficherRepere(1000);fill(255,0,0);
        dessiner();
    
      popMatrix();
  }
}
//  -------------------------------------------------------------------------
//-------------------------------------------------------
static class Vecteur
{
public  float x, y, z;
 
public  Vecteur()
  {
  }

public  Vecteur(float x, float y, float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
 
  }
  
public  Vecteur(float x, float y, float z,float lon)
  { float no=(float) Math.sqrt(x * x + y * y + z * z);
    no=lon/no;
    this.x = x*no;
    this.y = y*no;
    this.z = z*no;
 
  } 
  public void place(float xx, float yy, float zz)
  {
    this.x = xx;
    this.y = yy;
    this.z = zz;
 
  }
 public Vecteur normalize()
  {
    float length = length();
    x /= length;
    y /= length;
    z /= length;
    return this;
  }
  public  Vecteur normalize(float k)
   {
     float length = length();
     x=x/ length*k;
     y =y/ length*k;
     z =z/ length*k;
     return this;
   }
   public  float length()
  {
    return (float) Math.sqrt(x * x + y * y + z * z);
  }

  public  Vecteur cross(Vecteur v2)
  {
    Vecteur res = new Vecteur();
    res.x = y * v2.z - z * v2.y;
    res.y =z * v2.x - x * v2.z;
    res.z = x * v2.y - y * v2.x;
    return res;
  }

  public  static float dot(Vecteur v1, Vecteur v2)
  {
    return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z;
  }
  public float dot(Vecteur v1)
  {
    return v1.x * x + v1.y *y + v1.z *z;
  }
  public Vecteur mul( float d)
  {
    Vecteur res = new Vecteur();
    res.x =x * d;
    res.y = y * d;
    res.z = z * d;
    return res;
  }
  public static Vecteur comb(float a,Vecteur v1,float b, Vecteur v2)
  {
   float  rx =a* v1.x + b*v2.x;
   float ry =a* v1.y + b*v2.y;
    float rz =a* v1.z + b*v2.z;
    return new Vecteur(rx,ry,rz);
  }
  public static Vecteur barycentre(float a,Vecteur v1,float b, Vecteur v2)
   {
   Vecteur res=comb(a,v1,b,v2);
   res=res.mul(1/(a+b));
     return res;
   }
  public  Vecteur ajouter(Vecteur v,float m){
    Vecteur res=new Vecteur(x+v.x*m, y+v.y*m,z+v.z*m);
    return res;
  }
  public  Vecteur ajouter(float ax,float ay,float az){
     Vecteur res=new Vecteur(x+ax, y+ay,z+az);
     return res;
   }
  
  public  void afficher(String tex,PApplet ba){
    ba.println(tex+"x= "+x+" y= "+y+" z= "+z);
  }
  public  Vecteur projete(Vecteur laxe){
    laxe.normalize();
    Vecteur res=laxe.mul(this.dot(laxe));
    return res;
  }
  public Vecteur projeteSurAxe(Vecteur laxe){
   laxe.normalize();
   Vecteur res=laxe.mul(this.dot(laxe));
   return res;
   }
   public  Vecteur projeteSurPlan(Vecteur laxe){
    laxe.normalize();
    Vecteur res=projeteSurAxe(laxe);
    res=this.ajouter(res,-1);
    return res;
    } 
    public  Vecteur symetrique(Vecteur laxe){
      laxe.normalize();
      Vecteur res=projeteSurAxe(laxe);
      res=this.ajouter(res,-2.0f);
      return res;
      }
     public float distancePointDroite(Vecteur d, Vecteur v){
    v.normalize();
         Vecteur pd=d.ajouter(this,-1);
          Vecteur hd=v.mul(v.dot(pd));
         Vecteur ph=pd.ajouter(hd,-1);
          return ph.length();
      } 
    /*projection sur le plan vectoriel de normale "laxe"
    public   Vecteur projeteSurPlan(Vecteur laxe,Vecteur unpoint){
      laxe.normalize();
      Vecteur res=projeteSurPlan(laxe);     
  return  res.ajouter(unpoint.projeteSurAxe(res),1);
     
      }*/
        
      public  float donneAngle(Vecteur vc){
   return (float) Math.acos(this.dot(vc)/(length()*vc.length()));
  }
  
  public  Vecteur tourner(Vecteur axe,float angle){//axe est normé et orthogonal à this
    Vecteur vaxe=axe.mul(this.dot(axe));
    Vecteur vx=this.ajouter(vaxe,-1);
    Vecteur ygrec=axe.cross(this);
    return vaxe.ajouter(Vecteur.comb((float)Math.cos(angle),this,(float)Math.sin(angle),ygrec),1);
  }
  public Vecteur cloner()
    {
      Vecteur res = new Vecteur();
      res.x =x ;
      res.y = y ;
      res.z = z ;
      return res;
    } 
    public  Vecteur tourner(float a,Vecteur ax){
      Quat qv=new Quat(0.0f,x,y,z);
      Quat q0=new Quat((float)Math.cos(a/2),ax.mul((float)Math.sin(a/2)));
      Quat qc=q0.conjugue();
      Quat q1=Quat.mul(qv,qc);  
      Quat q= Quat.mul(q0,q1);
      return new Vecteur(q.x,q.y,q.z);  
  
    } 
    public  Vecteur coorabs(PApplet ba) {
      float xa = ba.modelX(x,y,z);
      float ya = ba.modelY(x,y,z);
      float za = ba.modelZ(x,y,z);
      return new Vecteur(xa, ya, za);
    }
//  *******************************************
//  *******************************************
//  *******************************************
    public static  void afficherRepere(PApplet ba,float lon){
       
       ba.stroke(255,0,0);
      ba.line(0,0,0,lon,0,0);
      ba.stroke(0,255,0);    
      ba.line(0,0,0,0,lon,0);
      ba.stroke(0,0,255);   
      ba.line(0,0,0,0,0,lon);          
       } 
public static  void afficherRepere(PApplet ba){
       
   ba.stroke(255,0,0);
  ba.line(0,0,0,500,0,0);
  ba.stroke(0,255,0);    
  ba.line(0,0,0,0,500,0);
  ba.stroke(0,0,255);   
  ba.line(0,0,0,0,0,500);          
   } 
 

    public  void afficherLigne(float k,PApplet ba){
      ba.line(x*k,y*k,z*k,-x*k,-y*k,-z*k);
}

    }
//  *******************************************
//  *******************************************


