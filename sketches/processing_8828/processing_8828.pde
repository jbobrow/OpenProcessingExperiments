
//Ressorts

ArrayList masses;
float dt = 0.1;

class Masse
{
boolean mobile;
float mass;
PVector pos;
PVector vit;
PVector acc;
PVector Forces;
ArrayList ressorts_att;

Masse 
(
String mobilite, 
float mass_i,
PVector pos_i,
ArrayList ressorts_attaches
)
{
if(mobilite.equals("mobile")) {mobile = true;} else {mobile = false;}
mass = mass_i;
pos = pos_i;
vit = new PVector(0, 0);
if (mobile) {rgb = color(255);} else {rgb = color(0);}
ressorts_att = ressorts_attaches;
}

Masse 
(
String mobilite, 
float mass_i,
PVector pos_i
)
{this (mobilite, mass_i, pos_i, new ArrayList());}

Masse()
{this ("mobile", 1, new PVector(0, 0));}

float ray = 15;
color rgb;

void aff()
{
ellipseMode(RADIUS);
fill(rgb);
ellipse(pos.x, pos.y, ray, ray);
}

void actu()
{
if (mobile)
{
Forces = new PVector(0, 0); //init
Forces.add(new PVector(0, 10*mass)); //Poids
Forces.add(PVector.mult(vit, -0.5)); //Frottements
for (int i = 0; i < ressorts_att.size(); i++)
{
Forces.add(((Ressort) ressorts_att.get(i)).Force);
}
acc = PVector.mult(Forces, 1/mass);
vit.add(PVector.mult(acc, dt));
pos.add(PVector.mult(vit, dt));
//println("Force : x = " + Forces.x + "; " + Forces.y + "; ");
}
}
}

ArrayList ressorts;

class Ressort
{
float k; //constante de raideur
float l0; //longueur à vide

int i_att1;
Masse att1; //attache 1
int i_att2;
Masse att2; //attache 2

PVector ur; //vect. orientation
float l; //longueur courante
PVector Force;
float delta_l; //variation l-l0

Ressort (
int i_attache1, //Masse attache1, questions de simplicité, on prend l'entier du tableau masses a la place
int i_attache2, 
float const_raideur,
float long_a_vide)
{
i_att1 = i_attache1;
att1 = (Masse) masses.get(i_att1);
i_att2 = i_attache2;
att2 = (Masse) masses.get(i_att2);
k = const_raideur;
l0 = long_a_vide;

ur = new PVector(att2.pos.x- att1.pos.x, att2.pos.y - att1.pos.y); ur.normalize(); 
l = sqrt(sq(att2.pos.x - att1.pos.x) + sq(att2.pos.y - att1.pos.y));
delta_l = l - l0;
Force = new PVector(0, 0);
}

Ressort()
{this (0, 0, 1, 1);}

void actu_att()
{
att1 = (Masse) masses.get(i_att1);
att2 = (Masse) masses.get(i_att2);
}
PVector ur()
{actu_att(); PVector ur = new PVector(att2.pos.x- att1.pos.x, att2.pos.y - att1.pos.y); ur.normalize(); return(ur);}
float l()
{return(sqrt(sq(att2.pos.x - att1.pos.x) + sq(att2.pos.y - att1.pos.y)));}
PVector force()
{PVector forces = PVector.mult(ur(), -k*(l() - l0)); return(forces);}

void actu()
{
ur = new PVector(att2.pos.x- att1.pos.x, att2.pos.y - att1.pos.y); ur.normalize();
l = sqrt(sq(att2.pos.x - att1.pos.x) + sq(att2.pos.y - att1.pos.y));
delta_l = l - l0;
Force = PVector.mult(ur, -k*delta_l);
}

void aff()
{
//strokeWeight(l0*k/l); stroke(rgb); line(att1.pos.x, att1.pos.y, att2.pos.x, att2.pos.y);
translate(att1.pos.x, att1.pos.y);
rotate(-0*HALF_PI+atan2(ur.y, ur.x));
noFill();
beginShape(); ellipseMode(CENTER);
vertex(0, 0); vertex(l/16, 0); 
for (int i = 1; i < 14; i++)
{vertex(+i*l/16 + l/16, pow(-1, i)*k*10*l0/200);}
vertex(l-l/16, 0); vertex(l, 0);
endShape();
rotate(+0*HALF_PI-atan2(ur.y, ur.x));
translate(-att1.pos.x, -att1.pos.y);
}
}

color backg = color(222);
Masse M0, M1, M2;
Ressort R0, R1;
void setup()
{
size(500, 500);
smooth();
background(backg);
pause = false;

init_ress_mass();

courbe = new float[width];
}

void init_ress_mass()
{
M0 = new Masse("immobile", 10, new PVector(width/2, 50));
M1 = new Masse("mobile", 10, new PVector(width/2, 150));
M2 = new Masse("immobile", 10, new PVector(width/2+125, 250));
i_cour = 3;
//M1 = new Masse("mobile", 10, new PVector(300, 250));

masses = new ArrayList();
masses.add(M0); masses.add(M1); masses.add(M2);

R0 = new Ressort(0, 1, 1, 100);
R1 = new Ressort(2, 1, 2, 100); //Attention, mettre la masse mobile en 2eme si on ne fait pas attention aus ens de la force....

ressorts = new ArrayList();
ressorts.add(R0); ressorts.add(R1);
associe_ressorts();
}

float [] courbe;
void aff_courbe()
{
background(backg);
noFill();
beginShape();
for (int i = 0; i < courbe.length; i++)
{
vertex(i, 1*courbe[i]);
}
endShape();
}
void stocke_courbe(Masse M)
{
if ((frameCount % 2) == 0)
{
for (int i = 0; i < courbe.length-1; i++)
{courbe[i] = courbe[i+1];}
courbe[courbe.length-1] = M.pos.y;
}
}

void draw()
{
background(backg);
//((Masse) masses.get(0)).pos = new PVector(mouseX, mouseY);

if (!pause)
{
for (int i = 0; i < ressorts.size(); i++)
{
((Ressort) ressorts.get(i)).actu();
((Ressort) ressorts.get(i)).aff();
}
for (int i = 0; i < masses.size(); i++)
{
((Masse) masses.get(i)).actu();
((Masse) masses.get(i)).aff();
}
stocke_courbe((Masse)masses.get(1));
}
else
{
aff_courbe();
}
}

void associe_ressorts()
{
for (int i = 0; i < masses.size(); i++)
{
Masse mass = (Masse) masses.get(i);
ArrayList ress_att = new ArrayList();
for (int j = 0; j < ressorts.size(); j++)
{
Ressort ress = (Ressort)ressorts.get(j);
if ((ress.i_att1 == i)|(ress.i_att2 == i))
//{ress_att.add((Ressort)ress);}
{((Masse)masses.get(i)).ressorts_att.add((Ressort)ressorts.get(j)); println(j);}
}
println(((Masse)masses.get(0)).ressorts_att.size());
}
}

boolean pause;
void keyPressed()
{
if (key == 'p') {pause = !pause;}
}

Masse M3;
Ressort R2;
int i_cour;
int i_max = 10;
void mousePressed()
{
if ((mouseButton == LEFT)&&(i_cour < i_max))
{
masses.add( new Masse("immobile", 10, new PVector(mouseX, mouseY)) );
ressorts.add(new Ressort(i_cour, 1, 1, 100));
associe_ressorts();
i_cour ++;
}
if (mouseButton == RIGHT)
{
masses = new ArrayList();
ressorts = new ArrayList();
init_ress_mass();
}
} 

