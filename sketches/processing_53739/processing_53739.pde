
import fisica.*; FWorld world;FBox obstacleA;FBox obstacleB;FBox obstacleC;FBox obstacleD;FBox obstacleE;
int bMax=10,  grav=2000;
float x, y, aax=100,aay=100,abx=300,aby=100,acx=300,acy=300,adx=100,ady=300,rest=0.9f;
void setup() { size(400, 400); smooth(); frameRate(24); background(0);
Fisica.init(this); world = new FWorld(); world.setGravity(0, 200); 
 obstacleA = new FBox(2, 8); obstacleA.setStaticBody(true); obstacleA.setStroke(255); obstacleA.setFill(255); obstacleA.setRestitution(rest); world.add(obstacleA);
 obstacleB = new FBox(2, 8); obstacleB.setStaticBody(true); obstacleB.setStroke(255); obstacleB.setFill(255); obstacleB.setRestitution(rest); world.add(obstacleB);
 obstacleC = new FBox(2, 8); obstacleC.setStaticBody(true); obstacleC.setStroke(255); obstacleC.setFill(255); obstacleC.setRestitution(rest); world.add(obstacleC);
 obstacleD = new FBox(2, 8); obstacleD.setStaticBody(true); obstacleD.setStroke(255); obstacleD.setFill(255); obstacleD.setRestitution(rest); world.add(obstacleD);
 obstacleE = new FBox(2, 8); obstacleE.setStaticBody(true); obstacleE.setStroke(255); obstacleE.setFill(255); obstacleE.setRestitution(rest); world.add(obstacleE);
 }
float angD, angC;
void draw() {fill(0, 100); noStroke(); rect(0, 0, width, height); fill(255,255,255,255); 
 adx=mouseX; ady=mouseY; 
FCircle b = new FCircle(22); b.setNoStroke(); b.setFill(255, 255, 255); b.setPosition(lerp(aax,abx,.5)+random(-5,5),lerp(aay,aby,.5)+22); b.setVelocity(0, 400); b.setRestitution(rest); b.setDamping(0);     
float angA = atan2(aay - aby, aax - abx); obstacleA.setRotation(angA);obstacleA.setPosition(lerp(aax,abx,.5),lerp(aay,aby,.5));obstacleA.setWidth(dist(abx, aby, aax, aay));
float angB = atan2(aby - acy, abx - acx); obstacleB.setRotation(angB);obstacleB.setPosition(lerp(abx,acx,.5),lerp(aby,acy,.5));obstacleB.setWidth(dist(acx, acy, abx, aby));
      angC = atan2(acy - ady, acx - adx); obstacleC.setRotation(angC);obstacleC.setPosition(lerp(acx,adx,.5),lerp(acy,ady,.5));obstacleC.setWidth(dist(adx, ady, acx, acy));
      angD = atan2(ady - aay, adx - aax); obstacleD.setRotation(angD);obstacleD.setPosition(lerp(aax,adx,.5),lerp(aay,ady,.5));obstacleD.setWidth(dist(adx, ady, aax, aay));
float angE = atan2(height*1.1-height*1.1, -width*2 - width*5); obstacleE.setRotation(angE); obstacleE.setPosition(width*.5,height*1.1);obstacleE.setWidth(width*5);
if (frameCount % 8 == 0) { if(world.getBodies().size()<bMax){  world.add(b);}}
world.setGravity(-grav*angC, grav*angD);
strokeWeight(1); stroke(255);  //ArrayList e = obstacleA.getContacts(); for (int i=0; i<e.size(); i++) {  FContact c = (FContact)e.get(i); }
 world.step(0.005);world.draw();}
 void contactStarted(FContact c) { FBody cuerpo1 = c.getBody1(); cuerpo1.setFill(255, 222, 222); cuerpo1.setStroke(255, 255, 255); fill(255,0,0); ellipse(c.getX(), c.getY(), 10, 10); FBody ball = null; FBody b = c.getBody1(); b.setFill(255, 255, 255); b.setStroke(255, 0, 0);  stroke(255); ellipse(c.getX(), c.getY(), 2, 2); 
 if (c.getBody1() == obstacleE) { ball = c.getBody2(); } else if (c.getBody2() == obstacleE) { ball = c.getBody1(); } if (ball == null) { return; }  world.remove(ball);noStroke();}
 void contactEnded(FContact c) { FBody cuerpo1 = c.getBody1(); cuerpo1.setFill(255, 255, 255); cuerpo1.setStroke(255);}


