
/**
*Alcys_Boids3D (steering)
*fait par Jacques Maire
*le 5 juillet 2012
* merci à Matt Wetmore pour le tweak
* merci à Graig Reynolds , ses explications sontici http://www.red3d.com/cwr/boids/ 
*/




import remixlab.proscene.*;


Scene scene;
InteractiveFrame repere;
Tableau table = new Tableau();
float[][] tableSol;
  float large=550, haut=500,theta;
   float maxSpeed = 5;
void setup() {
  size(900, 900, P3D);
  scene=new Scene(this);
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  repere=new InteractiveFrame(scene);
  scene.camera().setUpVector(new PVector(0, 0, -1));
  initSol();
}


void draw() {
  background(230, 150, 190);
theta=millis()*0.00005;
  scene.camera().setPosition(new PVector(900*cos(theta), 900*sin(theta), 0));
   
  scene.camera().lookAt(  new PVector(0, 0, 0) );
  lights();
  directionalLight(0, 0, 255, -2, -1, 0);
  directionalLight(255, 255, 0, 1, 5,-2);
  directionalLight(255, 0, 0, -1, 0, 1);
  directionalLight(255, 255, 0, -1, 0.5, 1);
  directionalLight(255, 0, 0, -1, -5, 1.6);
  initSol();
  sol();

   table.run();
  }





PVector comb(float a, PVector u, float b, PVector v) {
  PVector  res=new PVector(a*u.x + b*v.x, a*u.y + b*v.y, a*u.z + b*v.z);
  return res;
}



PVector comb(float a, PVector u, float b, PVector v, float c, PVector w) {
  PVector  res=new PVector(a*u.x + b*v.x + c*w.x, a*u.y + b*v.y + c*w.y, a*u.z + b*v.z + c*w.z);
  return res;
}






void initSol() {
  tableSol=new float[41][41]; 
  for (int i=0;i<=40;i++) {
    for (int j=0;j<=40;j++) {
      tableSol[i][j]=lerp(0, 100, noise(i+millis()*0.005, j))-haut-150;
    }
  }
}




void sol() {
  float p=75, d=1500;
  for (int i=0;i<40;i++) {
    for (int j=0;j<40;j++) {
      beginShape(TRIANGLES);
      fill((haut+ 150+ tableSol[i][j])*2.5,0 ,(tableSol[i][j]+haut+150)*0.3);
      vertex(i*p-d, j*p-d, tableSol[i][j]);
      vertex(i*p+p-d, j*p-d, tableSol[i+1][j]);
      vertex(i*p+p-d, j*p+p-d, tableSol[i+1][j+1]);
      vertex(i*p-d, j*p-d, tableSol[i][j]);
      vertex(i*p-d, j*p+p-d, tableSol[i][j+1]);
      vertex(i*p+p-d, j*p+p-d, tableSol[i+1][j+1]);
      endShape();
    }
  }
}


